//! Not committed: writes B5c's volumes for the upstream judge into
//! $B5_JUDGE_OUT. Copied into lib/bcachefs/src/engine/tests/ for one run.

use std::cell::{Cell, RefCell};
use std::vec::Vec;

use toyos_blockdev::executor::Executor;
use toyos_blockdev::model::Model;
use toyos_blockdev::{block_on_ready, BlockDev, Bytes};

use super::crash::{apply, mixed, Op, Watched};
use super::mount::{random, MEMORY, NOW, OWNER};
use super::*;

fn out(name: &str, image: &[u8]) {
    let dir = std::env::var("B5_JUDGE_OUT").unwrap();
    std::fs::write(format!("{dir}/{name}.img"), image).unwrap();
}

fn checked(image: &[u8]) {
    let dev = Bytes::new(image.to_vec());
    let v = block_on_ready(Volume::open(&dev)).unwrap();
    assert_eq!(block_on_ready(fsck(&v)).unwrap(), []);
}

fn replayed(image: &[u8]) -> Vec<u8> {
    let dev = Bytes::new(image.to_vec());
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    block_on_ready(m.unmount()).unwrap();
    let out = dev.into_inner();
    checked(&out);
    out
}

#[test]
#[ignore]
fn dump_b5c_judge_images() {
    // Mixed namespace operations, raw crash states and each replayed.
    let model = Model::new(formatted(64 << 20, None).into_inner(), 512);
    let requests = Cell::new(0u64);
    let taken: RefCell<Vec<(u64, Vec<u8>)>> = RefCell::default();
    let dev = Watched {
        model: &model,
        after: Box::new(|m: &Model| {
            requests.set(requests.get() + 1);
            let n = requests.get();
            if n % 9 == 0 {
                m.check(1, 0x5eed_c000 + n, |image| {
                    taken.borrow_mut().push((n, image.to_vec()));
                    Ok(())
                })
                .unwrap();
            }
        }),
    };
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    let ops = mixed(140);
    Executor::new().block_on(
        async {
            for (i, op) in ops.iter().enumerate() {
                apply(&m, op).await;
                if i % 10 == 9 {
                    m.commit().await.unwrap();
                }
            }
        },
        || panic!("stalled"),
    );
    block_on_ready(m.unmount()).unwrap();
    for (n, image) in taken.borrow().iter() {
        out(&format!("ns-{n:04}-raw"), image);
        out(&format!("ns-{n:04}-replayed"), &replayed(image));
    }
    assert!(ops.iter().any(|o| matches!(o, Op::Rmdir(_))));

    // A directory removed while a writer would hold it: the engine deletes
    // it in its removing transaction, which the commit makes durable; the
    // crash follows. Upstream reattached its own held directory (BB-A5-2).
    let dev = Bytes::new(formatted(32 << 20, None).into_inner());
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    let d = block_on_ready(m.create(m.root(), b"d", New::Dir, OWNER, NOW)).unwrap();
    block_on_ready(m.create(d.ino, b"f", New::File, OWNER, NOW)).unwrap();
    block_on_ready(m.commit()).unwrap();
    block_on_ready(m.unlink(d.ino, b"f", false, NOW)).unwrap();
    block_on_ready(m.unlink(m.root(), b"d", true, NOW)).unwrap();
    block_on_ready(m.commit()).unwrap();
    let raw = dev.get().clone();
    drop(m);
    out("rmdir-held-raw", &raw);
    out("rmdir-held-replayed", &replayed(&raw));

    // Orphans a crash leaves: an unnamed file and a file unlinked while
    // held, committed; then the next mount releases them and unmounts clean.
    let dev = Bytes::new(formatted(32 << 20, None).into_inner());
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    block_on_ready(m.create_unnamed(m.root(), OWNER, NOW)).unwrap();
    block_on_ready(m.create(m.root(), b"held", New::File, OWNER, NOW)).unwrap();
    block_on_ready(m.unlink(m.root(), b"held", false, NOW)).unwrap();
    block_on_ready(m.commit()).unwrap();
    let raw = dev.get().clone();
    drop(m);
    out("orphans-raw", &raw);
    out("orphans-released", &replayed(&raw));

    // ROOT's shape: a fitted volume, no free bucket, its journal empty.
    let mut tree = Tree::new();
    let meta = Meta { perm: 0o644, uid: 0, gid: 0 };
    let data: Vec<Vec<u8>> = (0..40).map(|i| vec![i as u8; 1000 * i + 7]).collect();
    let dir = tree.dir(Tree::ROOT, b"bin", Meta { perm: 0o755, ..meta }).unwrap();
    for (i, d) in data.iter().enumerate() {
        tree.file(dir, format!("p{i}").as_bytes(), d, meta).unwrap();
    }
    let options = Options { label: b"ROOT", time: 0, encryption: None };
    let blocks = fit(&options, &tree, &Seeded(9)).unwrap();
    let dev = Bytes::new(vec![0u8; blocks as usize * toyos_blockdev::BLOCK]);
    block_on_ready(mkfs(&dev, &options, &tree, &mut Seeded(9))).unwrap();
    checked(&dev.get());
    out("root-fit", &dev.get());
}

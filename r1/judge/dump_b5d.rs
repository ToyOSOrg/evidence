//! Not committed: writes review round 1's volumes for the upstream judge
//! into $B5_JUDGE_OUT. Copied into lib/bcachefs/src/engine/tests/ for one
//! run.

use std::cell::RefCell;
use std::vec::Vec;

use toyos_blockdev::model::Model;
use toyos_blockdev::{block_on_ready, BlockDev, Bytes};

use super::crash::Watched;
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

#[test]
#[ignore]
fn dump_b5d_judge_images() {
    // A stored accounting total of zero, clean and unclean: upstream keeps
    // such keys and compares them as absent (A7.23-A7.28).
    let mut record = vec![super::super::value::class::SNAPSHOT];
    record.extend_from_slice(&mkfs::ROOT_SNAPSHOT.to_le_bytes());
    record.extend_from_slice(&(Btree::Xattrs as u32).to_le_bytes());
    let pos = super::super::value::accounting_pos(&record);
    let dev = formatted(32 << 20, None);
    rewrite_leaf(&dev, Btree::Accounting, pos, 0, |keys| keys.push((Key::new(kind::ACCOUNTING, pos), vec![0; 24])));
    checked(&dev.get());
    out("zero-accounting-clean", &dev.get());
    // The same written read-write and left unclean, then unmounted clean.
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    block_on_ready(m.create(m.root(), b"z", New::File, OWNER, NOW)).unwrap();
    block_on_ready(m.commit()).unwrap();
    let raw = dev.get().clone();
    out("zero-accounting-unclean", &raw);
    block_on_ready(m.unmount()).unwrap();
    checked(&dev.get());
    out("zero-accounting-unmounted", &dev.get());

    // Clean volumes whose journal is empty, `clean` at 0 (mkfs's) and at 7,
    // crashed at every request of going read-write and the first commit.
    for seq in [0u64, 7] {
        let dev = formatted(32 << 20, None);
        rewrite_superblock(&dev, |_, fields| {
            let clean = fields.iter_mut().find(|f| f.kind == super::super::superblock::field_type::CLEAN).unwrap();
            clean.body[8..16].copy_from_slice(&seq.to_le_bytes());
        });
        let model = Model::new(dev.into_inner(), 512);
        let taken: RefCell<Vec<Vec<u8>>> = RefCell::default();
        let watched = Watched {
            model: &model,
            after: Box::new(|m: &Model| {
                let n = taken.borrow().len() as u64;
                m.check(1, 0x5eed_d000 + n, |image| {
                    taken.borrow_mut().push(image.to_vec());
                    Ok(())
                })
                .unwrap();
            }),
        };
        let m = block_on_ready(Mount::open(&watched, MEMORY, random())).unwrap();
        block_on_ready(m.create(m.root(), b"f", New::File, OWNER, NOW)).unwrap();
        block_on_ready(m.commit()).unwrap();
        drop(m);
        for (n, image) in taken.borrow().iter().enumerate() {
            out(&format!("empty-journal-{seq}-{n:02}"), image);
        }
    }
}

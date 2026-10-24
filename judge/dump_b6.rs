//! Not committed: writes B6's volumes for the upstream judge into
//! $B6_JUDGE_OUT. Copied into lib/bcachefs/src/engine/tests/ for one run.

use std::cell::{Cell, RefCell};
use std::io::{Seek, SeekFrom, Write};
use std::string::String;
use std::vec::Vec;

use toyos_blockdev::executor::Executor;
use toyos_blockdev::model::Model;
use toyos_blockdev::{block_on_ready, Block, BlockDev, Bytes, BLOCK};

use super::super::superblock::{Superblock, HEADER};
use super::buckets::{nearly_full, Sparse};
use super::crash::{apply, Op, PRESSED};
use super::mount::{random, MEMORY, NOW, OWNER};
use super::*;

fn dir() -> String {
    std::env::var("B6_JUDGE_OUT").unwrap()
}

fn out(name: &str, image: &[u8]) {
    std::fs::write(format!("{}/{name}.img", dir()), image).unwrap();
}

fn checked(image: &[u8], passphrase: Option<&[u8]>) {
    let dev = Bytes::new(image.to_vec());
    let v = match passphrase {
        Some(p) => block_on_ready(Volume::unlock(&dev, p, MIN_LIMITS)),
        None => block_on_ready(Volume::open(&dev)),
    }
    .unwrap();
    assert_eq!(block_on_ready(fsck(&v)).unwrap(), []);
}

const MIN_LIMITS: toyos_crypto::scrypt::Limits = toyos_crypto::scrypt::Limits { memory: 1 << 20, work: 1 << 20 };

/// The model, each write since the last flush by its byte range, and
/// `after` given both after every write and flush.
struct Tracked<'a> {
    model: &'a Model,
    pending: RefCell<Vec<(u64, u64)>>,
    after: Box<dyn Fn(&Model, &[(u64, u64)]) + 'a>,
}

impl BlockDev for Tracked<'_> {
    fn blocks(&self) -> u64 {
        self.model.blocks()
    }

    async fn read(&self, lba: u64, out: &mut [Block]) -> core::result::Result<(), toyos_blockdev::Error> {
        self.model.read(lba, out).await
    }

    async fn write(&self, lba: u64, data: &[Block]) -> core::result::Result<(), toyos_blockdev::Error> {
        self.model.write(lba, data).await?;
        let at = lba * BLOCK as u64;
        self.pending.borrow_mut().push((at, at + (data.len() * BLOCK) as u64));
        (self.after)(self.model, &self.pending.borrow());
        Ok(())
    }

    async fn flush(&self) -> core::result::Result<(), toyos_blockdev::Error> {
        self.model.flush().await?;
        self.pending.borrow_mut().clear();
        (self.after)(self.model, &[]);
        Ok(())
    }
}

fn copy_at(image: &[u8], sector: u64) -> (usize, usize) {
    let at = sector as usize * 512;
    let u64s = image.get(at + 124..at + 128).map_or(0, |b| u32::from_le_bytes(b.try_into().unwrap()) as usize);
    (at, (HEADER + 8 * u64s).min(64 << 10))
}

/// The judge's sidecar: the layout's copies, the one a pending write lies
/// inside, and those whole in `image`.
fn sidecar(image: &[u8], layout: &[u64], pending: &[(u64, u64)]) -> String {
    let inflight: Vec<u64> = layout
        .iter()
        .copied()
        .filter(|&s| {
            let at = s * 512;
            pending.iter().any(|&(a, b)| a < at + (64 << 10) && at < b)
        })
        .collect();
    let whole: Vec<u64> = layout
        .iter()
        .copied()
        .filter(|&s| {
            let (at, len) = copy_at(image, s);
            image.get(at..at + len).is_some_and(|b| Superblock::decode(b, s).is_ok())
        })
        .collect();
    let list = |v: &[u64]| v.iter().map(u64::to_string).collect::<Vec<_>>().join(" ");
    format!("copies {}\ninflight {}\nwhole {}\n", list(layout), list(&inflight), list(&whole))
}

fn renames(files: usize, rounds: usize) -> Vec<Op> {
    let mut ops: Vec<Op> = (0..files).map(|i| Op::Create(format!("a{i}").into_bytes())).collect();
    for round in 0..rounds {
        let (from, to) = if round % 2 == 0 { ("a", "b") } else { ("b", "a") };
        ops.extend((0..files).map(|i| Op::Rename(format!("{from}{i}").into_bytes(), format!("{to}{i}").into_bytes())));
    }
    ops
}

/// The crash suite under allocation pressure as the judge sees it: one
/// crash state after every request once a bucket has been taken again,
/// `keep` of them spread evenly, each raw (with its sidecar) and as ToyOS's
/// replay and clean unmount leave it.
fn pressure(name: &str, image: Vec<u8>, passphrase: Option<&[u8]>, keep: usize) {
    let layout = block_on_ready(super::super::read::read_superblock(&Bytes::new(image.clone()))).unwrap().header.layout.offsets.clone();
    let model = Model::new(image, 512);
    let reused = Cell::new(0usize);
    let taken: RefCell<Vec<(Vec<u8>, String)>> = RefCell::default();
    let tracked = Tracked {
        model: &model,
        pending: RefCell::default(),
        after: Box::new(|m: &Model, pending: &[(u64, u64)]| {
            if reused.get() == 0 {
                return;
            }
            let n = taken.borrow().len() as u64;
            m.check(1, 0xb6_0000 + n, |image| {
                taken.borrow_mut().push((image.to_vec(), sidecar(image, &layout, pending)));
                Ok(())
            })
            .unwrap();
        }),
    };
    let m = match passphrase {
        Some(p) => block_on_ready(Mount::unlock(&tracked, p, MIN_LIMITS, PRESSED, random())),
        None => block_on_ready(Mount::open(&tracked, PRESSED, random())),
    }
    .unwrap();
    Executor::new().block_on(
        async {
            for (i, op) in renames(8, 8).iter().enumerate() {
                apply(&m, op).await;
                reused.set(m.reused());
                if (i + 1) % 4 == 0 {
                    m.commit().await.unwrap();
                }
            }
        },
        || panic!("stalled"),
    );
    drop(m);
    drop(tracked);
    let states = taken.into_inner();
    assert!(states.len() > keep, "{} states after the first reuse", states.len());
    for k in 0..keep {
        let (image, side) = &states[k * states.len() / keep];
        let n = format!("{name}-{k:02}");
        out(&n, image);
        std::fs::write(format!("{}/{n}.torn", dir()), side).unwrap();
        let dev = Bytes::new(image.clone());
        let m = match passphrase {
            Some(p) => block_on_ready(Mount::unlock(&dev, p, MIN_LIMITS, MEMORY, random())),
            None => block_on_ready(Mount::open(&dev, MEMORY, random())),
        }
        .unwrap();
        block_on_ready(m.unmount()).unwrap();
        checked(&dev.get(), passphrase);
        out(&format!("{n}-replayed"), &dev.get());
    }
}

#[test]
#[ignore]
fn dump_b6_judge_images() {
    let secret = hex_secret();

    // The crash suite under allocation pressure, unencrypted on a volume a
    // file has nearly filled and encrypted.
    let mut data = Vec::new();
    pressure("pressure", nearly_full(&mut data, 400).into_inner(), None, 16);
    let enc = formatted(32 << 20, Some(Encryption { passphrase: &secret, kdf: MIN_KDF })).into_inner();
    pressure("pressure-enc", enc, Some(&secret), 12);

    // Renames past the volume's 2 048 buckets, unmounted.
    let dev = formatted(32 << 20, None);
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    Executor::new().block_on(
        async {
            let r = m.root();
            for i in 0..40 {
                m.create(r, format!("a{i}").as_bytes(), New::File, OWNER, NOW).await.unwrap();
            }
            let mut n = 0;
            while m.reused() < 4096 {
                let (i, round) = (n % 40, n / 40);
                let (from, to) = if round % 2 == 0 { ("a", "b") } else { ("b", "a") };
                m.rename((r, format!("{from}{i}").as_bytes()), (r, format!("{to}{i}").as_bytes()), Rename::NoReplace, NOW).await.unwrap();
                n += 1;
            }
        },
        || panic!("stalled"),
    );
    block_on_ready(m.unmount()).unwrap();
    checked(&dev.get(), None);
    out("renames-past-buckets", &dev.get());

    // Full: creates until NoSpace, names removed, an orphan released,
    // unmounted.
    let mut data = Vec::new();
    let dev = nearly_full(&mut data, 400);
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    Executor::new().block_on(
        async {
            let r = m.root();
            let mut n = 0;
            while m.create(r, format!("f{n}").as_bytes(), New::File, OWNER, NOW).await.is_ok() {
                n += 1;
            }
            for i in 0..20 {
                m.unlink(r, format!("f{i}").as_bytes(), false, NOW).await.unwrap();
            }
            m.commit().await.unwrap();
        },
        || panic!("stalled"),
    );
    let unclean = dev.get().clone();
    out("full-unclean", &unclean);
    block_on_ready(m.unmount()).unwrap();
    checked(&dev.get(), None);
    out("full-unmounted", &dev.get());

    // Eight 256 KiB nodes to a 2 MiB bucket, on 4 GiB, churned until four
    // buckets are taken again, unmounted; written sparse.
    let dev = Sparse::new(4 << 30);
    let options = Options { label: b"toyos", time: 1_761_177_600_000_000_000, encryption: None };
    block_on_ready(mkfs(&dev, &options, &Tree::new(), &mut Seeded(0x5eed))).unwrap();
    let m = block_on_ready(Mount::open(&dev, PRESSED, random())).unwrap();
    Executor::new().block_on(
        async {
            let r = m.root();
            for i in 0..200 {
                m.create(r, format!("a{i}").as_bytes(), New::File, OWNER, NOW).await.unwrap();
            }
            let mut n = 0;
            while m.reused() < 4 {
                let (i, round) = (n % 200, n / 200);
                let (from, to) = if round % 2 == 0 { ("a", "b") } else { ("b", "a") };
                m.rename((r, format!("{from}{i}").as_bytes()), (r, format!("{to}{i}").as_bytes()), Rename::NoReplace, NOW).await.unwrap();
                n += 1;
                if n % 50 == 0 {
                    m.commit().await.unwrap();
                }
            }
        },
        || panic!("stalled"),
    );
    block_on_ready(m.unmount()).unwrap();
    let v = block_on_ready(Volume::open(&dev)).unwrap();
    assert_eq!(block_on_ready(fsck(&v)).unwrap(), []);
    drop(v);
    let mut f = std::fs::File::create(format!("{}/eight-node-buckets.img", dir())).unwrap();
    f.set_len(4 << 30).unwrap();
    let mut block = [[0u8; BLOCK]];
    for lba in 0..dev.blocks() {
        block_on_ready(dev.read(lba, &mut block)).unwrap();
        if block[0].iter().any(|&b| b != 0) {
            f.seek(SeekFrom::Start(lba * BLOCK as u64)).unwrap();
            f.write_all(&block[0]).unwrap();
        }
    }

    // A bucket emptied by an entry not yet durable: the crash leaves the
    // medium as it is; raw, and replayed and unmounted. The negative
    // control: the same medium with the emptied bucket's old node written
    // over by one of the nodes the mount wrote since, as a reuse before the
    // emptying was durable would leave it.
    let dev = formatted(64 << 20, None);
    {
        let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
        block_on_ready(m.create(m.root(), b"a", New::File, OWNER, NOW)).unwrap();
        block_on_ready(m.commit()).unwrap();
    }
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    let bucket = u64::from(super::read::Source::superblock(&m).member.bucket_sectors);
    let node = u64::from(super::read::Source::superblock(&m).node_sectors()) as usize * SECTOR;
    let before = super::buckets::need_discard(&m);
    for i in 0..30 {
        block_on_ready(m.create(m.root(), format!("b{i}").as_bytes(), New::File, OWNER, NOW)).unwrap();
    }
    let written = super::buckets::reclaim_all(&m);
    let emptied: Vec<u64> = super::buckets::need_discard(&m).into_iter().filter(|e| !before.contains(e)).map(|(b, _)| b).collect();
    let raw = dev.get().clone();
    drop(m);
    checked(&raw, None);
    out("unwritten-emptying-raw", &raw);
    let replayed = Bytes::new(raw.clone());
    block_on_ready(block_on_ready(Mount::open(&replayed, MEMORY, random())).unwrap().unmount()).unwrap();
    checked(&replayed.get(), None);
    out("unwritten-emptying-replayed", &replayed.get());
    let mut bad = raw.clone();
    let (from, to) = (written[0] as usize * SECTOR, (emptied[0] * bucket) as usize * SECTOR);
    let new_node = raw[from..from + node].to_vec();
    bad[to..to + node].copy_from_slice(&new_node);
    assert!(block_on_ready(Volume::open(&Bytes::new(bad.clone()))).and_then(|v| block_on_ready(fsck(&v))).map_or(true, |f| !f.is_empty()), "ToyOS refuses the control");
    out("ctl-reused-before-durable", &bad);
    std::fs::write(format!("{}/pass", dir()), &secret).unwrap();
}

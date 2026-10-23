//! Not committed: writes review round 1's volumes for the upstream judge
//! into $B5_JUDGE_OUT. Copied into lib/bcachefs/src/engine/tests/ for one
//! run.

use std::cell::RefCell;
use std::string::String;
use std::vec::Vec;

use toyos_blockdev::model::Model;
use toyos_blockdev::{block_on_ready, Block, BlockDev, Bytes, BLOCK};

use super::super::superblock::{Superblock, HEADER};
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

/// The model, each write since the last flush recorded by its byte range,
/// and `after` given both after every write and flush: what a crash there
/// can tear is the writes still pending.
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

/// A superblock copy's bytes in `image`: its offset and length.
fn copy_at(image: &[u8], sector: u64) -> (usize, usize) {
    let at = sector as usize * 512;
    let u64s = image.get(at + 124..at + 128).map_or(0, |b| u32::from_le_bytes(b.try_into().unwrap()) as usize);
    (at, (HEADER + 8 * u64s).min(64 << 10))
}

/// The judge's sidecar for an image: the superblock copies by sector (the
/// layout's), the one a write `pending` at the crash lies inside, and those
/// whole in `image` by their checksum.
fn sidecar(image: &[u8], layout: &[u64], pending: &[(u64, u64)]) -> String {
    let inflight: Vec<u64> = layout
        .iter()
        .copied()
        .filter(|&s| {
            // The copy's space, as large as a superblock may be: its stored
            // length may be what the crash tore.
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

fn out_with(name: &str, image: &[u8], side: &str) {
    out(name, image);
    std::fs::write(format!("{}/{name}.torn", std::env::var("B5_JUDGE_OUT").unwrap()), side).unwrap();
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
    // crashed at every request of going read-write and the first commit,
    // and again as the next mount goes read-write.
    for seq in [0u64, 7] {
        let dev = formatted(32 << 20, None);
        rewrite_superblock(&dev, |_, fields| {
            let clean = fields.iter_mut().find(|f| f.kind == super::super::superblock::field_type::CLEAN).unwrap();
            clean.body[8..16].copy_from_slice(&seq.to_le_bytes());
        });
        let layout = block_on_ready(super::super::read::read_superblock(&dev)).unwrap().header.layout.offsets.clone();
        let model = Model::new(dev.into_inner(), 512);
        let taken: RefCell<Vec<(Vec<u8>, String)>> = RefCell::default();
        let tracked = Tracked {
            model: &model,
            pending: RefCell::default(),
            after: Box::new(|m: &Model, pending: &[(u64, u64)]| {
                let n = taken.borrow().len() as u64;
                m.check(1, 0x5eed_d000 + n, |image| {
                    let side = sidecar(image, &layout, pending);
                    taken.borrow_mut().push((image.to_vec(), side));
                    Ok(())
                })
                .unwrap();
            }),
        };
        let m = block_on_ready(Mount::open(&tracked, MEMORY, random())).unwrap();
        block_on_ready(m.create(m.root(), b"f", New::File, OWNER, NOW)).unwrap();
        block_on_ready(m.commit()).unwrap();
        drop(m);
        for (n, (image, side)) in taken.borrow().iter().enumerate() {
            out_with(&format!("empty-journal-{seq}-{n:02}"), image, side);
        }
        // A second crash: from each of the first eight states, the next
        // mount going read-write, a state after each of its requests.
        for (n, (first, _)) in taken.borrow().iter().take(8).enumerate() {
            let again = Model::new(first.clone(), 512);
            let seconds: RefCell<Vec<(Vec<u8>, String)>> = RefCell::default();
            let tracked = Tracked {
                model: &again,
                pending: RefCell::default(),
                after: Box::new(|m: &Model, pending: &[(u64, u64)]| {
                    let k = seconds.borrow().len() as u64;
                    m.check(1, 0x5eed_e000 + k, |image| {
                        let side = sidecar(image, &layout, pending);
                        seconds.borrow_mut().push((image.to_vec(), side));
                        Ok(())
                    })
                    .unwrap();
                }),
            };
            drop(block_on_ready(Mount::open(&tracked, MEMORY, random())).unwrap());
            drop(tracked);
            for (k, (image, side)) in seconds.into_inner().iter().enumerate() {
                out_with(&format!("empty-journal-{seq}-{n:02}-again-{k:02}"), image, side);
            }
        }
    }

    // The verdict's controls: a clean volume with one copy damaged. The
    // primary torn where the crash point lies passes; the second copy torn
    // while the crash point lies in the primary fails, as does a torn
    // primary no write was pending in.
    let dev = formatted(32 << 20, None);
    let layout = block_on_ready(super::super::read::read_superblock(&dev)).unwrap().header.layout.offsets.clone();
    let tear = |sector: u64| {
        let mut image = dev.get().clone();
        let (at, len) = copy_at(&image, sector);
        image[at + len - 100] ^= 0xff;
        image
    };
    let at = |sector: u64| {
        let (a, l) = copy_at(&dev.get(), sector);
        alloc::vec![(a as u64, (a + l) as u64)]
    };
    let primary = tear(layout[0]);
    out_with("ctl-torn-inflight", &primary, &sidecar(&primary, &layout, &at(layout[0])));
    let second = tear(layout[1]);
    out_with("ctl-torn-elsewhere", &second, &sidecar(&second, &layout, &at(layout[0])));
    out_with("ctl-torn-none-pending", &primary, &sidecar(&primary, &layout, &[]));
}

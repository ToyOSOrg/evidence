//! Not committed: writes B5's volumes for the upstream judge into
//! $B5_JUDGE_OUT. Copied into lib/bcachefs/src/engine/tests/ for one run.
//! Each image is also checked here, as the suite checks it.

use std::cell::{Cell, RefCell};
use std::vec::Vec;

use toyos_blockdev::model::Model;
use toyos_blockdev::{block_on_ready, BlockDev, Bytes};

use super::super::crypt::oracle;
use super::crash::Watched;
use super::mount::{random, MEMORY, NOW, OWNER};
use super::*;

const MIN_LIMITS: Limits = Limits { memory: 1 << 20, work: 1 << 20 };

fn out(name: &str, image: &[u8]) {
    let dir = std::env::var("B5_JUDGE_OUT").unwrap();
    std::fs::write(format!("{dir}/{name}.img"), image).unwrap();
}

fn open_rw<D: BlockDev>(dev: D, p: Option<&[u8]>) -> Mount<D> {
    match p {
        Some(p) => block_on_ready(Mount::unlock(dev, p, MIN_LIMITS, MEMORY, random())),
        None => block_on_ready(Mount::open(dev, MEMORY, random())),
    }
    .unwrap()
}

fn check(image: &[u8], p: Option<&[u8]>) -> Vec<Finding> {
    let dev = Bytes::new(image.to_vec());
    let v = match p {
        Some(p) => block_on_ready(Volume::unlock(&dev, p, MIN_LIMITS)),
        None => block_on_ready(Volume::open(&dev)),
    }
    .unwrap();
    block_on_ready(fsck(&v)).unwrap()
}

/// The image replayed by a read-write mount and unmounted clean.
fn replayed(image: &[u8], p: Option<&[u8]>) -> Vec<u8> {
    let dev = Bytes::new(image.to_vec());
    let m = open_rw(&dev, p);
    block_on_ready(m.unmount()).unwrap();
    dev.into_inner()
}

fn create<D: BlockDev>(m: &Mount<D>, name: &[u8], dir: bool) {
    let new = if dir { New::Dir } else { New::File };
    block_on_ready(m.create(m.root(), name, new, OWNER, NOW)).unwrap();
}

#[test]
#[ignore]
fn dump_b5_judge_images() {
    let secret = hex_secret();
    std::fs::write(format!("{}/pass", std::env::var("B5_JUDGE_OUT").unwrap()), [secret.as_slice(), b"\n"].concat()).unwrap();
    let enc = || Some(Encryption { passphrase: &secret, kdf: MIN_KDF });

    // mkfs, now with its one clean entry.
    for (name, bytes, e) in [("mkfs-32m", 32 << 20, false), ("mkfs-enc-64m", 64 << 20, true)] {
        let dev = formatted(bytes, if e { enc() } else { None });
        assert_eq!(check(&dev.get(), e.then_some(&secret[..])), []);
        out(name, &dev.get());
    }

    // Written read-write: 1500 names, leaves and roots split, clean.
    let dev = formatted(32 << 20, None);
    let m = open_rw(&dev, None);
    let mut dirs = alloc::vec![m.root()];
    for i in 0..1500 {
        let parent = dirs[i % dirs.len()];
        let new = if i % 10 == 0 { New::Dir } else { New::File };
        let made = block_on_ready(m.create(parent, format!("n{i}").as_bytes(), new, OWNER, NOW)).unwrap();
        if made.is_dir() {
            dirs.push(made.ino);
        }
        if i % 200 == 0 {
            block_on_ready(m.commit()).unwrap();
        }
    }
    block_on_ready(m.unmount()).unwrap();
    assert_eq!(check(&dev.get(), None), []);
    out("rw-1500", &dev.get());

    // Encrypted, written read-write, clean.
    let dev = formatted(64 << 20, enc());
    let m = open_rw(&dev, Some(&secret));
    for i in 0..300 {
        create(&m, format!("e{i}").as_bytes(), i % 7 == 0);
    }
    block_on_ready(m.unmount()).unwrap();
    assert_eq!(check(&dev.get(), Some(&secret)), []);
    out("rw-enc-300", &dev.get());

    // The upstream unclean fixture, mounted read-write past the skip,
    // written to and unmounted clean.
    let dev = fixture("unclean.img.gz");
    let m = open_rw(&dev, None);
    for i in 0..20 {
        create(&m, format!("toyos{i}").as_bytes(), false);
    }
    block_on_ready(m.unmount()).unwrap();
    out("fixture-rw", &dev.get());

    // Raw crash states, seeded, and each replayed.
    for (tag, e) in [("crash", false), ("crash-enc", true)] {
        let p = e.then_some(&secret[..]);
        let model = Model::new(formatted(64 << 20, if e { enc() } else { None }).into_inner(), 512);
        let requests = Cell::new(0u64);
        let taken: RefCell<Vec<(u64, Vec<u8>)>> = RefCell::default();
        let dev = Watched {
            model: &model,
            after: Box::new(|m: &Model| {
                requests.set(requests.get() + 1);
                let n = requests.get();
                if n % 7 == 0 {
                    m.check(1, 0x5eed_0000 + n, |image| {
                        taken.borrow_mut().push((n, image.to_vec()));
                        Ok(())
                    })
                    .unwrap();
                }
            }),
        };
        let m = open_rw(&dev, p);
        for i in 0..240 {
            create(&m, format!("c{i}").as_bytes(), i % 9 == 0);
            if i % 40 == 39 {
                block_on_ready(m.commit()).unwrap();
            }
        }
        block_on_ready(m.unmount()).unwrap();
        for (n, image) in taken.borrow().iter() {
            let after = replayed(image, p);
            assert_eq!(check(&after, p), [], "{tag} {n}");
            out(&format!("{tag}-{n:04}-raw"), image);
            out(&format!("{tag}-{n:04}-replayed"), &after);
        }
    }

    // The pre-crash append, encrypted: raw and replayed.
    oracle::reset();
    let dev = Bytes::new(formatted(32 << 20, enc()).into_inner());
    let m = open_rw(&dev, Some(&secret));
    create(&m, b"t1", false);
    let mut plans = Vec::new();
    loop {
        let b = block_on_ready(m.write_batch(super::super::mount::Order::OldestPin)).unwrap();
        if b.is_empty() {
            break;
        }
        plans.extend(b);
    }
    create(&m, b"t2", false);
    block_on_ready(m.commit()).unwrap();
    block_on_ready(m.point_batch(plans)).unwrap();
    let raw = dev.get().clone();
    drop(m);
    out("append-enc-raw", &raw);
    out("append-enc-replayed", &replayed(&raw, Some(&secret)));
    assert!(oracle::reused().is_empty());

    // The early pin case: a committed, its nodes written, b committed, no
    // pointer update journaled.
    let dev = Bytes::new(formatted(32 << 20, None).into_inner());
    let m = open_rw(&dev, None);
    create(&m, b"a", false);
    block_on_ready(m.commit()).unwrap();
    while !block_on_ready(m.write_batch(super::super::mount::Order::OldestPin)).unwrap().is_empty() {}
    create(&m, b"b", false);
    block_on_ready(m.commit()).unwrap();
    let raw = dev.get().clone();
    drop(m);
    out("early-pin-raw", &raw);
    out("early-pin-replayed", &replayed(&raw, None));

    // The skip: a transaction's nodes written, nothing durable, the crash,
    // then a mount that blacklists past it and writes on.
    let dev = Bytes::new(formatted(32 << 20, None).into_inner());
    let m = open_rw(&dev, None);
    create(&m, b"lost", false);
    while !block_on_ready(m.write_batch(super::super::mount::Order::OldestPin)).unwrap().is_empty() {}
    let raw = dev.get().clone();
    drop(m);
    out("skip-raw", &raw);
    let dev = Bytes::new(raw);
    let m = open_rw(&dev, None);
    create(&m, b"after", false);
    block_on_ready(m.commit()).unwrap();
    let blacklisted = dev.get().clone();
    out("skip-blacklisted-unclean", &blacklisted);
    block_on_ready(m.unmount()).unwrap();
    out("skip-blacklisted-clean", &dev.get());
}

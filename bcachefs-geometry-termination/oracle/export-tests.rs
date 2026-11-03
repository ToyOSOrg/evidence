
/// EVIDENCE EXPORT (scratch, not committed): images for upstream's fsck.
#[test]
fn export_images_for_upstream() {
    let Ok(dir) = std::env::var("BCACHEFS_EXPORT") else { return };
    let write = |name: &str, dev: &Image| std::fs::write(format!("{dir}/{name}.img"), dev.get().as_slice()).unwrap();
    for (bytes, block, node) in GEOMETRIES {
        let dev = shaped(bytes, block, node, None);
        let mut expect = Expect::default();
        for seed in [1, 2] {
            let m = open(&dev, None, MEMORY);
            Executor::new().block_on(churn(&m, seed, 600, &mut expect), || panic!("stalled"));
            block_on_ready(m.unmount()).unwrap();
        }
        holds_and_checks(&dev, None, &expect);
        write(&format!("churn-b{}k-n{}k-{}m", block / 2, node / 2, bytes >> 20), &dev);
        // Regrouped publication.
        let dev = shaped(bytes, block, node, None);
        let mut expect = Expect::default();
        let m = open(&dev, None, MEMORY);
        Executor::new().block_on(churn(&m, 4, 300, &mut expect), || panic!("stalled"));
        m.limit_publication_groups(node as usize * SECTOR / 6);
        let p = block_on_ready(m.unmount_in_one_publication()).unwrap();
        assert!(p.regrouped > 0);
        holds_and_checks(&dev, None, &expect);
        write(&format!("regrouped-b{}k-n{}k-{}m", block / 2, node / 2, bytes >> 20), &dev);
    }
    // Encrypted, a node a block and a bucket.
    let secret = hex_secret();
    let dev = shaped(64 << 20, 64, 64, Some(Encryption { passphrase: &secret, kdf: MIN_KDF }));
    let mut expect = Expect::default();
    for seed in [5, 6] {
        let m = open(&dev, Some(&secret), MEMORY);
        Executor::new().block_on(churn(&m, seed, 300, &mut expect), || panic!("stalled"));
        block_on_ready(m.unmount()).unwrap();
    }
    holds_and_checks(&dev, Some(&secret), &expect);
    write("encrypted-churn-b32k-n32k-64m", &dev);
    std::fs::write(format!("{dir}/encrypted-churn-b32k-n32k-64m.img.pass"), &secret).unwrap();
    // Every durable state a node-per-block unmount passes through.
    struct Snapping<'a> { dev: &'a Image, armed: core::cell::Cell<bool>, snaps: core::cell::RefCell<Vec<Vec<u8>>> }
    impl BlockDev for Snapping<'_> {
        fn blocks(&self) -> u64 { self.dev.blocks() }
        async fn read(&self, lba: u64, out: &mut [toyos_blockdev::Block]) -> core::result::Result<(), toyos_blockdev::Error> { self.dev.read(lba, out).await }
        async fn write(&self, lba: u64, data: &[toyos_blockdev::Block]) -> core::result::Result<(), toyos_blockdev::Error> { self.dev.write(lba, data).await }
        async fn flush(&self) -> core::result::Result<(), toyos_blockdev::Error> {
            if self.armed.get() { self.snaps.borrow_mut().push(self.dev.get().clone()); }
            self.dev.flush().await
        }
    }
    let dev = shaped(64 << 20, 64, 64, None);
    let mut expect = Expect::default();
    let snap = Snapping { dev: &dev, armed: core::cell::Cell::new(false), snaps: Default::default() };
    let m = block_on_ready(Mount::open(&snap, MEMORY, random())).unwrap();
    Executor::new().block_on(churn(&m, 7, 400, &mut expect), || panic!("stalled"));
    snap.armed.set(true);
    block_on_ready(m.unmount()).unwrap();
    let snaps = snap.snaps.into_inner();
    std::fs::write(format!("{dir}/unmount-states.txt"), format!("{} flushes during unmount; exported the last 7, each a durable state\n", snaps.len())).unwrap();
    for (i, image) in snaps.iter().enumerate().skip(snaps.len().saturating_sub(7)) {
        std::fs::write(format!("{dir}/unmount-flush{i:03}-of{:03}.img", snaps.len()), image).unwrap();
    }
}

fn probe_journal_pointers() {
    let Ok(path) = std::env::var("PROBE_IMAGE") else { return };
    let bytes = std::fs::read(&path).unwrap();
    let dev = toyos_blockdev::ReadOnlyBytes::new(&bytes).unwrap();
    let sb = block_on_ready(super::super::read::read_superblock(&dev)).unwrap();
    let scan = block_on_ready(super::super::journal::scan(&dev, &sb, None)).unwrap();
    for e in scan.entries.values() {
        let Ok(records) = super::super::journal::records(&e.area) else { continue };
        for r in records {
            if let super::super::journal::Record::Keys { btree, level, keys } = &r {
                if *level > 0 {
                    for (k, v) in keys {
                        let ptr = super::super::value::NodePtr::decode(v);
                        std::eprintln!("seq {} last {} {btree:?} level {level} kind {} pos {:?} ptr {:?}", e.seq, e.last_seq, k.kind, k.pos, ptr.map(|p| (p.min, p.written, p.ptr.sector)));
                    }
                }
            }
            if let super::super::journal::Record::Root(root) = &r { if root.btree == Btree::Accounting { std::eprintln!("seq {} root accounting level {} min {:?}", e.seq, root.level, root.ptr.min); } }
        }
    }
}

#[test]
fn probe_export_minimal() {
    let Ok(dir) = std::env::var("BCACHEFS_EXPORT") else { return };
    let dev = shaped(64 << 20, 64, 64, None);
    std::fs::write(format!("{dir}/x1-mkfs-only-b32k-n32k.img"), dev.get().as_slice()).unwrap();
    let m = open(&dev, None, MEMORY);
    block_on_ready(m.create(m.root(), b"one", New::File, OWNER, NOW)).unwrap();
    block_on_ready(m.unmount()).unwrap();
    std::fs::write(format!("{dir}/x4-one-create-b32k-n32k.img"), dev.get().as_slice()).unwrap();
}

/// EVIDENCE EXPORT 2 (scratch, not committed).
#[test]
fn export_images_for_upstream_2() {
    let Ok(dir) = std::env::var("BCACHEFS_EXPORT2") else { return };
    struct Snapping<'a> { dev: &'a Image, armed: core::cell::Cell<bool>, snaps: core::cell::RefCell<Vec<Vec<u8>>> }
    impl BlockDev for Snapping<'_> {
        fn blocks(&self) -> u64 { self.dev.blocks() }
        async fn read(&self, lba: u64, out: &mut [toyos_blockdev::Block]) -> core::result::Result<(), toyos_blockdev::Error> { self.dev.read(lba, out).await }
        async fn write(&self, lba: u64, data: &[toyos_blockdev::Block]) -> core::result::Result<(), toyos_blockdev::Error> { self.dev.write(lba, data).await }
        async fn flush(&self) -> core::result::Result<(), toyos_blockdev::Error> {
            if self.armed.get() { self.snaps.borrow_mut().push(self.dev.get().clone()); }
            self.dev.flush().await
        }
    }
    for (bytes, block, node) in [(128usize << 20, 64u64, 128u64), (128 << 20, 8, 64)] {
        let dev = shaped(bytes, block, node, None);
        let mut expect = Expect::default();
        let snap = Snapping { dev: &dev, armed: core::cell::Cell::new(false), snaps: Default::default() };
        let m = block_on_ready(Mount::open(&snap, MEMORY, random())).unwrap();
        Executor::new().block_on(churn(&m, 7, 400, &mut expect), || panic!("stalled"));
        snap.armed.set(true);
        block_on_ready(m.unmount()).unwrap();
        let snaps = snap.snaps.into_inner();
        for (i, image) in snaps.iter().enumerate().skip(snaps.len().saturating_sub(7)) {
            std::fs::write(format!("{dir}/states-b{}k-n{}k-flush{i:03}-of{:03}.img", block / 2, node / 2, snaps.len()), image).unwrap();
        }
        holds_and_checks(&dev, None, &expect);
    }
    let secret = hex_secret();
    let dev = shaped(128 << 20, 8, 64, Some(Encryption { passphrase: &secret, kdf: MIN_KDF }));
    let mut expect = Expect::default();
    for seed in [5, 6] {
        let m = open(&dev, Some(&secret), MEMORY);
        Executor::new().block_on(churn(&m, seed, 300, &mut expect), || panic!("stalled"));
        block_on_ready(m.unmount()).unwrap();
    }
    holds_and_checks(&dev, Some(&secret), &expect);
    std::fs::write(format!("{dir}/encrypted-churn-b4k-n32k-128m.img"), dev.get().as_slice()).unwrap();
    std::fs::write(format!("{dir}/encrypted-churn-b4k-n32k-128m.img.pass"), &secret).unwrap();
    let mut tree = Tree::new();
    let meta = Meta { perm: 0o644, uid: 0, gid: 0 };
    for i in 0..20_000 { tree.file(Tree::ROOT, format!("f{i:05}").as_bytes(), &[], meta).unwrap(); }
    let dev = Bytes::new(vec![0u8; 512 << 20]);
    let options = Options { label: b"toyos", time: 1_761_177_600_000_000_000, encryption: None };
    block_on_ready(mkfs_shaped(&dev, &options, &tree, &mut Seeded(0x5eed), Shape { block: 64, node: Some(128) })).unwrap();
    let v = block_on_ready(Volume::open(&dev)).unwrap();
    let inodes: Vec<u64> = (0..20_000).step_by(97).map(|i| path(&v, &format!("f{i:05}"))).collect();
    drop(v);
    let m = open(&dev, None, MountOptions { cache_nodes: 4096 });
    Executor::new().block_on(async { for &ino in &inodes { m.set_mtime(ino, NOW + 5).await.unwrap(); } }, || panic!("stalled"));
    let published = block_on_ready(m.unmount_in_one_publication()).unwrap();
    std::fs::write(format!("{dir}/large-publication-b32k-n64k-512m.txt"), format!("{published:?}\n")).unwrap();
    std::fs::write(format!("{dir}/large-publication-b32k-n64k-512m.img"), dev.get().as_slice()).unwrap();
}

/// EVIDENCE EXPORT 3 (scratch): the full-volume adversarial result per geometry.
#[test]
fn export_images_for_upstream_3() {
    let Ok(dir) = std::env::var("BCACHEFS_EXPORT3") else { return };
    for (bytes, block, node) in GEOMETRIES {
        let dev = super::buckets::full_crash_removal_and_reuse(shaped(bytes, block, node, None), 0);
        std::fs::write(format!("{dir}/fullvolume-b{}k-n{}k-{}m.img", block / 2, node / 2, bytes >> 20), dev.get().as_slice()).unwrap();
    }
}

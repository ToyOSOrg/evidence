
/// EVIDENCE EXPORT 4 (scratch): the R1 reproduction's volume, after its unmount.
#[test]
fn export_images_for_upstream_4() {
    let Ok(dir) = std::env::var("BCACHEFS_EXPORT4") else { return };
    let dev = shaped(256 << 20, 8, 64, None);
    let quarter = super::super::read::Source::superblock(&block_on_ready(Volume::open(&dev)).unwrap()).member.bucket_sectors as usize * SECTOR / 4;
    let m = open(&dev, None, MEMORY);
    let kept = Executor::new().block_on(async {
        let mut kept = Vec::new();
        for i in 0..2800usize {
            let ino = m.create(m.root(), format!("d{i}").as_bytes(), New::File, OWNER, NOW).await.unwrap().ino;
            m.write(ino, 0, &vec![i as u8; quarter], NOW).await.unwrap();
            if i % 4 == 0 { kept.push(ino); }
            if i % 64 == 63 { m.commit().await.unwrap(); }
        }
        for i in 0..2800usize {
            if i % 4 != 0 {
                let removed = m.unlink(m.root(), format!("d{i}").as_bytes(), false, NOW).await.unwrap();
                m.release(removed.node).await.unwrap();
            }
            if i % 64 == 0 { m.commit().await.unwrap(); }
        }
        m.commit().await.unwrap();
        kept
    }, || panic!("stalled"));
    block_on_ready(m.unmount()).unwrap();
    let m = open(&dev, None, MountOptions { cache_nodes: 4096 });
    for btree in [Btree::Inodes, Btree::Accounting] {
        block_on_ready(super::super::read::Source::walk(&m, btree, Bpos::MIN, |_, _| Ok(true))).unwrap();
        m.rewrite_next(btree);
    }
    block_on_ready(m.set_mtime(kept[0], NOW + 9)).unwrap();
    let published = block_on_ready(m.unmount_in_one_publication()).unwrap();
    assert!(published.idle > 0);
    std::fs::write(format!("{dir}/idle-member-b4k-n32k-256m.txt"), format!("{published:?}\n")).unwrap();
    std::fs::write(format!("{dir}/idle-member-b4k-n32k-256m.img"), dev.get().as_slice()).unwrap();
    let secret = hex_secret();
    let dev = shaped(128 << 20, 8, 64, Some(Encryption { passphrase: &secret, kdf: MIN_KDF }));
    let m = open(&dev, Some(&secret), MEMORY);
    Executor::new().block_on(async { for i in 0..400 { m.create(m.root(), format!("e{i}").as_bytes(), New::File, OWNER, NOW).await.unwrap(); if i % 50 == 49 { m.commit().await.unwrap(); } } }, || panic!("stalled"));
    let published = block_on_ready(m.unmount_published()).unwrap();
    assert!(published.appended > 0);
    std::fs::write(format!("{dir}/encrypted-appends-b4k-n32k-128m.img"), dev.get().as_slice()).unwrap();
    std::fs::write(format!("{dir}/encrypted-appends-b4k-n32k-128m.img.pass"), &secret).unwrap();
}

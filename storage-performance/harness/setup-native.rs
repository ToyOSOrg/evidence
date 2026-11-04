fn mount(m: &Model) -> Vol<'_> {
    let mut stamp = [0u8; BLOCK];
    stamp.copy_from_slice(&bcachefs::designation(T14_BLOCKS));
    block_on_ready(m.ram.write(0, &[stamp])).unwrap();
    let Probed::Mounted(mut v) = DataVolume::probe(m, 16 * 1024, &ROOTS, clock) else { panic!("format") };
    for p in 0..37 { v.mkdir(&format!("apps/pkg{p:03}")).unwrap(); }
    for i in 0..400usize {
        let len = 1 + (i * 7919) % (300 * 1024);
        put(&mut v, &format!("apps/pkg{:03}/file{i}", i % 37), &vec![(i % 200) as u8 + 1; len]);
        if i % 5 == 0 { v.sync().unwrap(); }
    }
    v.sync().unwrap();
    drop(v);
    match DataVolume::probe(m, 16 * 1024, &ROOTS, clock) { Probed::Mounted(v) => *v, _ => panic!("mount") }
}

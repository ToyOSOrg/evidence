fn mount(m: &Model) -> Vol<'_> {
    let mut v = DataVolume::format(m, 16 * 1024, &ROOTS, clock).unwrap();
    for i in 0..400usize {
        let len = 1 + (i * 7919) % (300 * 1024);
        put(&mut v, &format!("apps/pkg{:03}/file{i}", i % 37), &vec![(i % 200) as u8 + 1; len]);
        if i % 5 == 0 { v.sync().unwrap(); }
    }
    v.sync().unwrap();
    drop(v);
    match DataVolume::probe(m, 16 * 1024, &ROOTS, clock) { Probed::Mounted(v) => v, _ => panic!("mount") }
}

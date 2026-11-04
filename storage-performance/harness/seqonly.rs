
#[test]
fn seq_write_only() {
    let m = Model { ram: Ram::new(T14_BLOCKS), writes: Cell::new(0) };
    let mut v = mount(&m);
    let block = vec![3u8; MIB];
    let t = std::time::Instant::now();
    for _ in 0..20 {
        let n = v.open("home/seq", CREATE_TRUNC).unwrap();
        for i in 0..64 { v.write(n, (i * MIB) as u64, &block).unwrap(); }
        v.close(n).unwrap();
    }
    println!("SEQ {:.3} s for 20 x 64 MiB in 1 MiB calls", t.elapsed().as_secs_f64());
}

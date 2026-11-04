
#[test]
fn w4k_profile() {
    let m = Model { ram: Ram::new(T14_BLOCKS), writes: Cell::new(0), reads: Cell::new(0) };
    let mut v = mount(&m);
    let n = v.open("home/seq", CREATE_TRUNC).unwrap();
    let block = [3u8; 4096];
    let t = std::time::Instant::now();
    for i in 0..600000u64 { v.write(n, (i % 16384) * 4096, &block).unwrap(); }
    println!("W4K {:.2} us/op", t.elapsed().as_secs_f64() * 1e6 / 600000.0);
}

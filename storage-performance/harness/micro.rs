
fn per_op(name: &str, n: usize, mut f: impl FnMut(usize)) {
    for i in 0..n / 20 { f(i); }
    let r0 = READS.with(|r| r.get());
    let t = std::time::Instant::now();
    for i in 0..n { f(i); }
    let reads = READS.with(|r| r.get()) - r0;
    println!("MICRO {name:28} {:10.2} us/op {:8.3} blocks read/op", t.elapsed().as_secs_f64() * 1e6 / n as f64, reads as f64 / n as f64);
}
std::thread_local! { static READS: Cell<u64> = const { Cell::new(0) }; }

#[test]
fn osbench_rows_micro() {
    let m = Model { ram: Ram::new(T14_BLOCKS), writes: Cell::new(0), reads: Cell::new(0) };
    let mut v = mount(&m);
    let d = "home/osbench-1";
    v.mkdir(d).unwrap();
    put(&mut v, &format!("{d}/small"), &[1u8; 4096]);
    per_op("open_close", 2000, |_| { let n = v.open(&format!("{d}/small"), PLAIN).unwrap(); v.close(n).unwrap(); });
    per_op("stat", 2000, |_| { v.lstat(&format!("{d}/small")).unwrap(); });
    per_op("create_write_unlink", 1000, |_| { let n = v.open(&format!("{d}/fresh"), CREATE_TRUNC).unwrap(); v.write(n, 0, &[7u8; 100]).unwrap(); v.close(n).unwrap(); v.unlink(&format!("{d}/fresh")).unwrap(); });
    put(&mut v, &format!("{d}/big"), &vec![2u8; 16 * MIB]);
    let n = v.open(&format!("{d}/big"), PLAIN).unwrap();
    let buf = [5u8; 4096];
    per_op("write_4k_at", 2000, |i| { v.write(n, page_at(i, 4096), &buf).unwrap(); });
    v.close(n).unwrap();
    v.mkdir(&format!("{d}/listed")).unwrap();
    for i in 0..1000 { let n = v.open(&format!("{d}/listed/entry-{i:04}"), CREATE_TRUNC).unwrap(); v.close(n).unwrap(); }
    per_op("readdir.1000", 50, |_| { assert_eq!(v.list(&format!("{d}/listed")).unwrap().len(), 1000); });
    per_op("rename", 2000, |i| { let (a, b) = if i % 2 == 0 { ("a", "b") } else { ("b", "a") }; if i == 0 { put(&mut v, &format!("{d}/a"), &[]); } let _ = v.rename(&format!("{d}/{a}"), &format!("{d}/{b}")); });
    per_op("mkdir_rmdir", 1000, |_| { v.mkdir(&format!("{d}/sub")).unwrap(); v.rmdir(&format!("{d}/sub")).unwrap(); });
    let block = vec![3u8; MIB];
    for call in [4096usize, MIB] {
        per_op(&format!("seq_write64M.{call} (per MiB)"), 3 * 64, |i| {
            if i % 64 == 0 { let n = v.open(&format!("{d}/seq"), CREATE_TRUNC).unwrap(); v.close(n).unwrap(); }
            let n = v.open(&format!("{d}/seq"), PLAIN).unwrap();
            for c in 0..MIB / call { v.write(n, ((i % 64) * MIB + c * call) as u64, &block[..call]).unwrap(); }
            v.close(n).unwrap();
        });
    }
}

//! A log partition read back off a bench: what toyos-fat32-check says of it,
//! what `Fat32::recover` does to a copy, and what the checker says after.
use toyos_blockdev::{block_on_ready, Bytes};
use toyos_fat32::Fat32;

fn main() {
    let path = std::env::args().nth(1).expect("a log partition image");
    let bytes = std::fs::read(&path).expect("read the image");
    let before = toyos_fat32_check::check(&bytes);
    println!("before: {} complaint(s)\n{}", before.len(), toyos_fat32_check::describe(&before));
    println!("unexplained by a stop: {}", toyos_fat32_check::unexplained_by_a_stop(&before).len());
    let mut fs = block_on_ready(Fat32::mount(Bytes::new(bytes))).expect("mount");
    let done = block_on_ready(fs.recover()).expect("recover");
    println!("recovered: {done:?}");
    let after_bytes = fs.into_device().into_inner();
    let after = toyos_fat32_check::check(&after_bytes);
    println!("after: {} complaint(s)\n{}", after.len(), toyos_fat32_check::describe(&after));
    let mut fs = block_on_ready(Fat32::mount(Bytes::new(after_bytes))).expect("mount again");
    println!("again: {:?}", block_on_ready(fs.recover()).expect("recover again"));
    std::process::exit(if after.is_empty() { 0 } else { 1 });
}

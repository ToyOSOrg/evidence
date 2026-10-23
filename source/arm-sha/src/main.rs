use toyos_crypto::hash::{Sha256, Sha512};
fn main() {
    let n: usize = std::env::args().nth(1).map_or(4096, |s| s.parse().unwrap());
    let m = vec![0x61u8; n];
    println!("{:02x?}", Sha256::digest(&m).unwrap());
    println!("{:02x?}", Sha512::digest(&m).unwrap());
}

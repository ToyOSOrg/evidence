use std::time::Instant;
use toyos_crypto::hash::{Sha256, Sha512};
fn time(name: &str, len: usize, f: impl Fn(&[u8]) -> u8) {
    let msg = vec![0x6du8; len];
    let reps = (64 << 20) / len.max(64);
    let mut best = f64::MAX;
    for _ in 0..7 {
        let t = Instant::now();
        let mut acc = 0u8;
        for _ in 0..reps { acc ^= f(std::hint::black_box(&msg)); }
        std::hint::black_box(acc);
        best = best.min(t.elapsed().as_secs_f64());
    }
    println!("{name}/{len}: {:.0} MB/s", (reps * len) as f64 / best / 1e6);
}
fn main() {
    for len in [64, 16384, 1 << 20] {
        time("sha-256", len, |m| Sha256::digest(m).unwrap()[0]);
        time("sha-512", len, |m| Sha512::digest(m).unwrap()[0]);
    }
}

use std::hint::black_box;
use std::time::Instant;
fn main() {
    let mut s = [1u64; 25];
    let mut best = f64::MAX;
    for _ in 0..20 {
        let t = Instant::now();
        for _ in 0..100_000 { toyos_crypto::keccak::bench_permute(black_box(&mut s)) }
        best = best.min(t.elapsed().as_nanos() as f64 / 100_000.0);
    }
    println!("keccak-f[1600]: {best:.1} ns");
}

//! Same-process host throughput comparison. Run on the T14 with deployment
//! feature policy controlled separately; this program does not suppress ring's
//! AVX dispatch. A shared VM result is not a ToyOS performance acceptance gate.
use std::{hint::black_box, time::Instant};
use toyos_crypto::aead::SealingKey;
fn main() {
    let rounds = std::env::args()
        .nth(1)
        .map(|n| n.parse::<u32>().unwrap())
        .unwrap_or(2000);
    println!("algorithm,size,backend,ns_per_byte");
    for (name, algorithm) in [
        ("AES-128-GCM", &ring::aead::AES_128_GCM),
        ("AES-256-GCM", &ring::aead::AES_256_GCM),
        ("ChaCha20-Poly1305", &ring::aead::CHACHA20_POLY1305),
    ] {
        for size in [64, 1024, 16384] {
            let mut ours = match name {
                "AES-128-GCM" => SealingKey::aes128_gcm([7; 16], [0; 12]),
                "AES-256-GCM" => SealingKey::aes256_gcm([7; 32], [0; 12]),
                _ => SealingKey::chacha20_poly1305([7; 32], [0; 12]),
            };
            let mut data = vec![0; size];
            let start = Instant::now();
            for _ in 0..rounds {
                black_box(
                    ours.seal(black_box(b"benchmark"), black_box(&mut data))
                        .unwrap(),
                );
            }
            println!(
                "{name},{size},toyos,{:.3}",
                start.elapsed().as_nanos() as f64 / (f64::from(rounds) * size as f64)
            );
            let key = ring::aead::LessSafeKey::new(
                ring::aead::UnboundKey::new(algorithm, &[7; 32][..algorithm.key_len()]).unwrap(),
            );
            let start = Instant::now();
            for sequence in 0..rounds {
                let mut n = [0; 12];
                n[8..].copy_from_slice(&sequence.to_be_bytes());
                let nonce = ring::aead::Nonce::assume_unique_for_key(n);
                let _ = black_box(
                    key.seal_in_place_separate_tag(
                        nonce,
                        ring::aead::Aad::from(b"benchmark"),
                        black_box(&mut data),
                    )
                    .unwrap(),
                );
            }
            println!(
                "{name},{size},ring,{:.3}",
                start.elapsed().as_nanos() as f64 / (f64::from(rounds) * size as f64)
            );
        }
    }
}

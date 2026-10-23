//! PROBE (never lands): Curve25519 operation costs through the crate's own
//! paths, for a bench's Linux. The same file builds on main and on the
//! branch. Run with `probe_25519 --ignored --nocapture --test-threads=1`.

use super::*;
use crate::field25519::{Multiply, Tight};
use core::hint::black_box;
use std::time::Instant;
use std::vec::Vec;

fn time<T>(name: &str, iterations: u32, mut f: impl FnMut() -> T) {
    let mut samples: Vec<f64> = (0..15)
        .map(|_| {
            let start = Instant::now();
            for _ in 0..iterations {
                black_box(f());
            }
            start.elapsed().as_nanos() as f64 / f64::from(iterations)
        })
        .collect();
    samples.sort_by(f64::total_cmp);
    std::println!("probe {name} median={:.1}ns min={:.1}ns", samples[7], samples[0]);
}

#[test]
#[ignore]
fn probe_25519() {
    let seed = [0x42u8; 32];
    let message = [0x6du8; 64];
    let peer = crate::x25519::SecretKey::from_bytes([0x5a; 32]).public_key();
    let x = Tight::from_bytes(&[0x37; 32]);
    for round in 0..2 {
        std::println!("probe round {round}");
        time("f25519/mul-chain100", 2_000, || {
            let mut a = black_box(x);
            for _ in 0..100 {
                a = a.mul(&x);
            }
            a
        });
        time("f25519/square-chain100", 2_000, || {
            let mut a = black_box(x);
            for _ in 0..100 {
                a = a.square();
            }
            a
        });
        time("f25519/invert", 2_000, || black_box(x).invert());
        time("f25519/pow_p58", 2_000, || black_box(x).pow_p58());
        time("x25519/agree", 500, || crate::x25519::SecretKey::from_bytes(black_box([0x33; 32])).agree(&peer).map(|s| s.as_bytes()[0]));
        time("x25519/public", 1_000, || crate::x25519::SecretKey::from_bytes(black_box([0x33; 32])).public_key());
        time("ed25519/base_mul", 1_000, || base_mul(&black_box([0x21; 32])).x.bytes());
        let key = SigningKey::from_seed(seed);
        time("ed25519/from_seed", 1_000, || SigningKey::from_seed(black_box(seed)).public.encoded);
        time("ed25519/sign/64", 1_000, || key.sign(black_box(&message)));
        let signed = key.sign(&message).unwrap();
        let encoded = key.public.encoded;
        time("ed25519/decode", 1_000, || Point::decode(black_box(&encoded)).map(|p| p.x.bytes()[0]));
        time("ed25519/verify/64", 500, || PublicKey::from_bytes(black_box(encoded)).unwrap().verify(&message, &signed));
    }
}

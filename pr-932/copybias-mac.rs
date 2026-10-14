// Throwaway: what the open rows' restore copy costs beside an open, per size.
use std::hint::black_box;
use std::time::Instant;
use ring::aead;

fn per_op(mut f: impl FnMut()) -> f64 {
    let mut best = f64::MAX;
    for _ in 0..21 {
        let mut n = 1u64;
        loop {
            let t = Instant::now();
            for _ in 0..n { f() }
            let ns = t.elapsed().as_nanos() as f64;
            if ns >= 1e6 { best = best.min(ns / n as f64); break; }
            n *= 2;
        }
    }
    best
}

fn main() {
    let aad = [0x17u8, 3, 3, 0x40, 0x11];
    for (name, alg, klen) in [("aes-128-gcm", &aead::AES_128_GCM, 16), ("chacha20-poly1305", &aead::CHACHA20_POLY1305, 32)] {
        for len in [0usize, 64, 1024, 16384] {
            let key = aead::LessSafeKey::new(aead::UnboundKey::new(alg, &[0x42; 32][..klen]).unwrap());
            let mut sealed = vec![0x70; len];
            let tag = key.seal_in_place_separate_tag(aead::Nonce::assume_unique_for_key([0; 12]), aead::Aad::from(aad), &mut sealed).unwrap();
            let mut work = sealed.clone();
            let copy = per_op(|| { work.copy_from_slice(black_box(&sealed)); black_box(&work); });
            let ring_open = per_op(|| {
                work.copy_from_slice(&sealed);
                key.open_in_place_separate_tag(aead::Nonce::assume_unique_for_key([0; 12]), aead::Aad::from(aad), tag, &mut work, 0..).unwrap();
            });
            let ours_key = if klen == 16 { toyos_crypto::aead::OpeningKey::aes128_gcm([0x42; 16]) } else { toyos_crypto::aead::OpeningKey::chacha20_poly1305([0x42; 32]) };
            let mut s2 = vec![0x70; len];
            let (n2, t2) = if klen == 16 { toyos_crypto::aead::SealingKey::aes128_gcm([0x42; 16], [0; 12]) } else { toyos_crypto::aead::SealingKey::chacha20_poly1305([0x42; 32], [0; 12]) }.seal(&aad, &mut s2).unwrap();
            let mut w2 = s2.clone();
            let ours_open = per_op(|| { w2.copy_from_slice(&s2); ours_key.open(&n2, &aad, &mut w2, &t2).unwrap(); });
            println!("{name}/open/{len}: copy {copy:.1} ns; ring open+copy {ring_open:.1} ns ({:.1}% copy); ours open+copy {ours_open:.1} ns ({:.1}% copy); ratio with copy {:.3}, without {:.3}",
                100.0 * copy / ring_open, 100.0 * copy / ours_open, ours_open / ring_open, (ours_open - copy) / (ring_open - copy));
        }
    }
}

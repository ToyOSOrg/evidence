//! Native-host comparison, with warmup and interleaved repeated samples.
//! Opening buffers are prepared before timing. Key setup includes drop erasure.
//! Stock ring retains its runtime dispatch; this is not a no-AVX comparison.
use std::{hint::black_box, time::Instant};
use toyos_crypto::aead::{OpeningKey, SealingKey};
const AAD: &[u8] = b"benchmark";
const KEY: [u8; 32] = [7; 32];
const SAMPLES: usize = 7;
fn sealer(alg: usize, iv: [u8; 12]) -> SealingKey {
    match alg {
        0 => SealingKey::aes128_gcm(KEY[..16].try_into().unwrap(), iv),
        1 => SealingKey::aes256_gcm(KEY, iv),
        _ => SealingKey::chacha20_poly1305(KEY, iv),
    }
}
fn opener(alg: usize) -> OpeningKey {
    match alg {
        0 => OpeningKey::aes128_gcm(KEY[..16].try_into().unwrap()),
        1 => OpeningKey::aes256_gcm(KEY),
        _ => OpeningKey::chacha20_poly1305(KEY),
    }
}
fn ring_key(algorithm: &'static ring::aead::Algorithm) -> ring::aead::LessSafeKey {
    ring::aead::LessSafeKey::new(
        ring::aead::UnboundKey::new(algorithm, &KEY[..algorithm.key_len()]).unwrap(),
    )
}
fn main() {
    let iterations = std::env::args()
        .nth(1)
        .map_or(1024, |n| n.parse::<usize>().unwrap());
    assert!((1..=65536).contains(&iterations));
    let profile = std::env::args().nth(2).unwrap_or_else(|| "standard".into());
    assert!(std::env::args().len() <= 3);
    let sizes: &[usize] = match profile.as_str() {
        "standard" => &[0, 1, 15, 16, 17, 64, 1024, 16384],
        "edges" => &[
            0, 63, 64, 65, 127, 128, 129, 255, 256, 257, 511, 512, 513, 1024, 16384,
        ],
        _ => panic!("unknown size profile"),
    };
    println!("# size-profile={profile}");
    println!(
        "# arch={} os={} ring=0.17.14 dispatch=stock timing=native-host frequency=uncontrolled affinity=uncontrolled",
        std::env::consts::ARCH,
        std::env::consts::OS
    );
    println!(
        "# warmup=one-full-sample samples={SAMPLES} opening-restoration=outside-timing key-setup=includes-drop"
    );
    println!("algorithm,size,operation,backend,sample,iterations,ns_per_op,ns_per_byte");
    for (alg, (name, algorithm)) in [
        ("AES-128-GCM", &ring::aead::AES_128_GCM),
        ("AES-256-GCM", &ring::aead::AES_256_GCM),
        ("ChaCha20-Poly1305", &ring::aead::CHACHA20_POLY1305),
    ]
    .into_iter()
    .enumerate()
    {
        for &size in sizes {
            let count = iterations.min((16 * 1024 * 1024 / size.max(1)).max(1));
            let mut ciphertext = vec![0x5a; size];
            let (nonce, tag) = sealer(alg, [0; 12]).seal(AAD, &mut ciphertext).unwrap();
            let mut reference = vec![0x5a; size];
            let rk = ring_key(algorithm);
            let reference_tag = rk
                .seal_in_place_separate_tag(
                    ring::aead::Nonce::assume_unique_for_key(nonce),
                    ring::aead::Aad::from(AAD),
                    &mut reference,
                )
                .unwrap();
            assert_eq!(ciphertext, reference);
            assert_eq!(tag.as_slice(), reference_tag.as_ref());
            for operation in ["seal", "open", "reject", "key-setup"] {
                if operation == "key-setup" && size != 0 {
                    continue;
                }
                for sample in 0..=SAMPLES {
                    for turn in 0..2 {
                        let ours = (sample + turn) % 2 == 0;
                        let mut iv = [0; 12];
                        iv[0] = sample as u8 + 1;
                        let mut sk = sealer(alg, iv);
                        let ok = opener(alg);
                        let rk = ring_key(algorithm);
                        let mut buffers = vec![ciphertext.clone(); count];
                        let mut tag = tag;
                        if operation == "reject" {
                            tag[0] ^= 1;
                        }
                        let start = Instant::now();
                        for (sequence, data) in buffers.iter_mut().enumerate() {
                            match (operation, ours) {
                                ("seal", true) => {
                                    black_box(sk.seal(black_box(AAD), black_box(data)).unwrap());
                                }
                                ("seal", false) => {
                                    let mut n = iv;
                                    n[4..].copy_from_slice(&(sequence as u64).to_be_bytes());
                                    let _ = black_box(
                                        rk.seal_in_place_separate_tag(
                                            ring::aead::Nonce::assume_unique_for_key(n),
                                            ring::aead::Aad::from(black_box(AAD)),
                                            black_box(data),
                                        )
                                        .unwrap(),
                                    );
                                }
                                ("open", true) | ("reject", true) => {
                                    let result = ok.open(
                                        &nonce,
                                        black_box(AAD),
                                        black_box(data),
                                        black_box(&tag),
                                    );
                                    assert_eq!(black_box(result).is_ok(), operation == "open");
                                }
                                ("open", false) | ("reject", false) => {
                                    let result = rk.open_in_place_separate_tag(
                                        ring::aead::Nonce::assume_unique_for_key(nonce),
                                        ring::aead::Aad::from(black_box(AAD)),
                                        ring::aead::Tag::from(tag),
                                        black_box(data),
                                        0..,
                                    );
                                    assert_eq!(black_box(result).is_ok(), operation == "open");
                                }
                                ("key-setup", true) => {
                                    drop(black_box(sealer(black_box(alg), black_box(iv))));
                                }
                                ("key-setup", false) => {
                                    let _ = black_box(ring_key(black_box(algorithm)));
                                }
                                _ => unreachable!(),
                            }
                        }
                        let ns = start.elapsed().as_nanos() as f64 / count as f64;
                        if sample != 0 {
                            println!(
                                "{name},{size},{operation},{},{sample},{count},{ns:.3},{:.3}",
                                if ours { "toyos" } else { "ring" },
                                ns / size.max(1) as f64
                            );
                        }
                    }
                }
            }
        }
    }
}

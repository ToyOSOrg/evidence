//! Dudect-style randomized two-class Welch test. The fixture PRNG is not an
//! entropy source for deployment. Pin to one real CPU, control frequency and
//! repeat with different compilers and inputs. Neither a low t score nor a VM
//! run proves constant time; a repeatable high score requires investigation.
use std::{hint::black_box, time::Instant};
use toyos_crypto::{
    Error, Random,
    hash::{Sha256, Sha512},
    kdf::{Hkdf, Hmac},
};
struct Fixture(u64);
impl Fixture {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0
    }
}
impl Random for Fixture {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), Error> {
        for b in out {
            *b = self.next() as u8
        }
        Ok(())
    }
}
struct Fixed([u8; 64]);
impl Random for Fixed {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), Error> {
        out.copy_from_slice(&self.0[..out.len()]);
        Ok(())
    }
}
#[derive(Default)]
struct Stats {
    n: u64,
    mean: f64,
    m2: f64,
}
impl Stats {
    fn add(&mut self, value: f64) {
        self.n += 1;
        let d = value - self.mean;
        self.mean += d / self.n as f64;
        self.m2 += d * (value - self.mean)
    }
    fn variance(&self) -> f64 {
        self.m2 / (self.n - 1) as f64
    }
}
fn main() {
    let count = std::env::args()
        .nth(1)
        .map(|n| n.parse::<usize>().unwrap())
        .unwrap_or(100_000);
    assert!(count >= 100);
    let mut fixture = Fixture(0x9e3779b97f4a7c15);
    let kem = toyos_crypto::mlkem::DecapsulationKey::generate(&mut Fixed([7; 64])).unwrap();
    let (ct, _) = kem.public_key().encapsulate(&mut Fixed([13; 64])).unwrap();
    let mut wrong = ct;
    wrong[0] ^= 1;
    println!("routine,class0_samples,class1_samples,welch_t,no_verdict");
    for routine in [
        "sha512",
        "hmac",
        "hkdf",
        "aes128",
        "aes256",
        "chacha",
        "ssh",
        "x25519",
        "p256",
        "p384",
        "ed25519_sign",
        "mlkem_decaps",
        "wpa2_pmk",
        "wpa2_hmac",
        "wpa2_prf",
    ] {
        let mut stats = [Stats::default(), Stats::default()];
        for sample in 0..count + 100 {
            let class = (fixture.next() & 1) as usize;
            let mut key = [0; 64];
            if class == 1 {
                fixture.fill(&mut key).unwrap()
            }
            key[0] &= 127;
            key[31] |= 1;
            key[47] |= 1;
            let kem = if routine == "mlkem_decaps" {
                Some(toyos_crypto::mlkem::DecapsulationKey::generate(&mut Fixed([7; 64])).unwrap())
            } else {
                None
            };
            let mut data = [0; 1024];
            let start = Instant::now();
            match routine {
                "sha512" => {
                    let _ = black_box(Sha512::digest(&key).unwrap());
                }
                "hmac" => {
                    Hmac::<Sha256>::authenticate(&key[..32], b"timing", &mut data[..32]).unwrap();
                    black_box(&data);
                }
                "hkdf" => {
                    Hkdf::<Sha256>::extract(b"salt", &key[..32])
                        .unwrap()
                        .expand(&[b"timing"], &mut data[..64])
                        .unwrap();
                    black_box(&data);
                }
                "aes128" => {
                    let mut k = toyos_crypto::aead::SealingKey::aes128_gcm(
                        key[..16].try_into().unwrap(),
                        [0; 12],
                    );
                    black_box(k.seal(&[], &mut data).unwrap());
                }
                "aes256" => {
                    let mut k = toyos_crypto::aead::SealingKey::aes256_gcm(
                        key[..32].try_into().unwrap(),
                        [0; 12],
                    );
                    black_box(k.seal(&[], &mut data).unwrap());
                }
                "chacha" => {
                    let mut k = toyos_crypto::aead::SealingKey::chacha20_poly1305(
                        key[..32].try_into().unwrap(),
                        [0; 12],
                    );
                    black_box(k.seal(&[], &mut data).unwrap());
                }
                "ssh" => {
                    let mut k = toyos_crypto::ssh::SealingKey::new(key, 0);
                    black_box(k.seal(&mut [0; 4], &mut data).unwrap());
                }
                "x25519" => {
                    black_box(
                        toyos_crypto::x25519::SecretKey::from_bytes(key[..32].try_into().unwrap())
                            .public_key(),
                    );
                }
                "p256" => {
                    black_box(
                        toyos_crypto::ecc::p256::SecretKey::from_bytes(
                            key[..32].try_into().unwrap(),
                        )
                        .unwrap()
                        .public_key(),
                    );
                }
                "p384" => {
                    black_box(
                        toyos_crypto::ecc::p384::SecretKey::from_bytes(
                            key[..48].try_into().unwrap(),
                        )
                        .unwrap()
                        .public_key(),
                    );
                }
                "ed25519_sign" => {
                    let k =
                        toyos_crypto::ed25519::SigningKey::from_seed(key[..32].try_into().unwrap());
                    black_box(k.sign(b"timing").unwrap());
                }
                "mlkem_decaps" => {
                    black_box(
                        kem.unwrap()
                            .decapsulate(if class == 0 { &ct } else { &wrong })
                            .unwrap(),
                    );
                }
                "wpa2_pmk" => {
                    black_box(toyos_crypto::wpa2::derive_pmk(&key[..8], b"timing").unwrap());
                }
                "wpa2_hmac" => {
                    black_box(toyos_crypto::wpa2::hmac_sha1(&key[..32], &[b"timing"]).unwrap());
                }
                "wpa2_prf" => {
                    toyos_crypto::wpa2::prf(
                        &key[..32],
                        b"Pairwise key expansion",
                        b"timing",
                        &mut data[..64],
                    )
                    .unwrap();
                    black_box(&data);
                }
                _ => unreachable!(),
            }
            let elapsed = start.elapsed().as_nanos() as f64;
            if sample >= 100 {
                stats[class].add(elapsed)
            }
        }
        let t = (stats[0].mean - stats[1].mean)
            / (stats[0].variance() / stats[0].n as f64 + stats[1].variance() / stats[1].n as f64)
                .sqrt();
        println!("{routine},{},{},{t:.3},true", stats[0].n, stats[1].n);
    }
}

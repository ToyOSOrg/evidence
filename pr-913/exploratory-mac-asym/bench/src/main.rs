//! Exploratory: ToyOS crypto at 2b3f92c against stock ring 0.17.14 on primitives
//! the AEAD comparator does not cover. Interleaved samples, median ns/op.
use std::{hint::black_box, time::Instant};
use ring::signature::{self as rs, KeyPair};
use toyos_crypto as tc;

const SAMPLES: usize = 9;

fn time(iters: usize, mut f: impl FnMut()) -> f64 {
    let start = Instant::now();
    for _ in 0..iters { f() }
    start.elapsed().as_nanos() as f64 / iters as f64
}
fn median(mut v: Vec<f64>) -> f64 { v.sort_by(|a, b| a.partial_cmp(b).unwrap()); v[v.len() / 2] }
fn compare(name: &str, iters: usize, mut ours: impl FnMut(), mut theirs: impl FnMut()) {
    time(iters / 4 + 1, &mut ours); time(iters / 4 + 1, &mut theirs);
    let (mut a, mut b) = (vec![], vec![]);
    for _ in 0..SAMPLES { a.push(time(iters, &mut ours)); b.push(time(iters, &mut theirs)); }
    let (a, b) = (median(a), median(b));
    println!("{name},{iters},{a:.1},{b:.1},{:.3}", a / b);
}
fn unhex(s: &str) -> Vec<u8> { (0..s.len()).step_by(2).map(|i| u8::from_str_radix(&s[i..i + 2], 16).unwrap()).collect() }

struct Fixed;
impl tc::Random for Fixed { fn fill(&mut self, d: &mut [u8]) -> Result<(), tc::Error> { for (i, b) in d.iter_mut().enumerate() { *b = (i as u8).wrapping_mul(31).wrapping_add(7) } Ok(()) } }

fn main() {
    let rsa_json = std::env::args().nth(1).expect("path to rsa_signature_2048_sha256_test.json");
    println!("# arch={} os={} ring=0.17.14 timing=native-host frequency=uncontrolled affinity=uncontrolled samples={SAMPLES}", std::env::consts::ARCH, std::env::consts::OS);
    println!("operation,iterations,ours_ns,ring_ns,ours_over_ring");
    let rng = ring::rand::SystemRandom::new();
    let msg = vec![0x5au8; 16384];

    compare("sha256-16KiB", 2000, || { black_box(tc::hash::Sha256::digest(black_box(&msg)).unwrap()); }, || { black_box(ring::digest::digest(&ring::digest::SHA256, black_box(&msg))); });
    compare("sha512-16KiB", 2000, || { black_box(tc::hash::Sha512::digest(black_box(&msg)).unwrap()); }, || { black_box(ring::digest::digest(&ring::digest::SHA512, black_box(&msg))); });
    compare("sha256-64B", 200000, || { black_box(tc::hash::Sha256::digest(black_box(&msg[..64])).unwrap()); }, || { black_box(ring::digest::digest(&ring::digest::SHA256, black_box(&msg[..64]))); });

    let peer = tc::x25519::SecretKey::from_bytes([3; 32]).public_key();
    let rpeer_bytes = peer.0;
    compare("x25519-keygen+agree", 2000,
        || { let s = tc::x25519::SecretKey::from_bytes(black_box([9; 32])); black_box(s.public_key()); black_box(s.agree(&peer).unwrap().as_bytes()[0]); },
        || { let s = ring::agreement::EphemeralPrivateKey::generate(&ring::agreement::X25519, &rng).unwrap(); black_box(s.compute_public_key().unwrap()); ring::agreement::agree_ephemeral(s, &ring::agreement::UnparsedPublicKey::new(&ring::agreement::X25519, &rpeer_bytes), |k| black_box(k[0])).unwrap(); });

    let p_peer_secret = tc::ecc::p256::SecretKey::from_bytes([5; 32]).unwrap();
    let p_peer = p_peer_secret.public_key();
    let p_peer_bytes = *p_peer.as_sec1();
    compare("p256-keygen+agree", 500,
        || { let s = tc::ecc::p256::SecretKey::from_bytes(black_box([9; 32])).unwrap(); black_box(s.public_key()); black_box(s.agree(&p_peer).unwrap().as_bytes()[0]); },
        || { let s = ring::agreement::EphemeralPrivateKey::generate(&ring::agreement::ECDH_P256, &rng).unwrap(); black_box(s.compute_public_key().unwrap()); ring::agreement::agree_ephemeral(s, &ring::agreement::UnparsedPublicKey::new(&ring::agreement::ECDH_P256, &p_peer_bytes), |k| black_box(k[0])).unwrap(); });

    let seed = [11u8; 32];
    let ours_ed = tc::ed25519::SigningKey::from_seed(seed);
    let ring_ed = rs::Ed25519KeyPair::from_seed_unchecked(&seed).unwrap();
    let sig = ours_ed.sign(&msg[..256]).unwrap();
    assert_eq!(&sig[..], ring_ed.sign(&msg[..256]).as_ref());
    let pk = *ours_ed.public_key().as_bytes();
    compare("ed25519-sign-256B", 2000, || { black_box(ours_ed.sign(black_box(&msg[..256])).unwrap()); }, || { black_box(ring_ed.sign(black_box(&msg[..256]))); });
    compare("ed25519-verify-256B", 2000,
        || { tc::ed25519::PublicKey::from_bytes(pk).unwrap().verify(black_box(&msg[..256]), &sig).unwrap(); },
        || { rs::UnparsedPublicKey::new(&rs::ED25519, &pk).verify(black_box(&msg[..256]), &sig).unwrap(); });

    let ecdsa_pkcs8 = rs::EcdsaKeyPair::generate_pkcs8(&rs::ECDSA_P256_SHA256_ASN1_SIGNING, &rng).unwrap();
    let ecdsa = rs::EcdsaKeyPair::from_pkcs8(&rs::ECDSA_P256_SHA256_ASN1_SIGNING, ecdsa_pkcs8.as_ref(), &rng).unwrap();
    let esig = ecdsa.sign(&rng, &msg[..256]).unwrap();
    let epk = ecdsa.public_key().as_ref().to_vec();
    compare("ecdsa-p256-verify-256B", 500,
        || { tc::ecc::p256::PublicKey::from_sec1(&epk).unwrap().verify(black_box(&msg[..256]), esig.as_ref()).unwrap(); },
        || { rs::UnparsedPublicKey::new(&rs::ECDSA_P256_SHA256_ASN1, &epk).verify(black_box(&msg[..256]), esig.as_ref()).unwrap(); });

    let v: serde_json::Value = serde_json::from_str(&std::fs::read_to_string(rsa_json).unwrap()).unwrap();
    let g = &v["testGroups"][0];
    let mut n = unhex(g["publicKey"]["modulus"].as_str().unwrap()); while n[0] == 0 { n.remove(0); }
    let mut e = unhex(g["publicKey"]["publicExponent"].as_str().unwrap()); while e[0] == 0 { e.remove(0); }
    let t = g["testGroups"].as_array().map(|_| unreachable!()).unwrap_or(&g["tests"][0]);
    assert_eq!(t["result"], "valid");
    let rmsg = unhex(t["msg"].as_str().unwrap());
    let rsig = unhex(t["sig"].as_str().unwrap());
    compare("rsa2048-pkcs1-sha256-verify", 1000,
        || { tc::rsa::PublicKey::from_components(&n, &e).unwrap().verify_pkcs1_v1_5(tc::rsa::Hash::Sha256, black_box(&rmsg), &rsig).unwrap(); },
        || { rs::RsaPublicKeyComponents { n: &n, e: &e }.verify(&rs::RSA_PKCS1_2048_8192_SHA256, black_box(&rmsg), &rsig).unwrap(); });

    let (mut prk, mut prk2) = ([0u8; 32], [0u8; 32]);
    compare("hkdf-sha256-extract+expand32", 50000,
        || { tc::kdf::Hkdf::<tc::hash::Sha256>::extract(b"salt", black_box(&seed)).map(|h| h.expand(&[b"info"], &mut prk).unwrap()).unwrap(); },
        || { let s = ring::hkdf::Salt::new(ring::hkdf::HKDF_SHA256, b"salt"); let p = s.extract(black_box(&seed)); p.expand(&[b"info"], ring::hkdf::HKDF_SHA256).unwrap().fill(&mut prk2).unwrap(); });
    let _ = Fixed;
}

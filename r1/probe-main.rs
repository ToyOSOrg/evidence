//! toyos-crypto beside ring, OpenSSL and AWS-LC on Linux, on the rows of
//! `tests/guest/rust-tests/src/bin/crypto_parity.rs` (plus 64 KiB AEAD and
//! 1 MiB SHA-256 rows). Scratch probe; never lands.
//!
//! Every backend of a row does the same work from the same inputs. Before any
//! row is timed, each library is held to toyos-crypto's answer on that row's
//! inputs (and on every AEAD, OpenSSH, SHA-2 and HMAC length up to 1153 B); a
//! mismatch panics before timing starts.

mod ossl;
mod sampler;

use std::hint::black_box;

use aws_lc_rs as awslc;
use openssl::md::Md;
use openssl::md_ctx::MdCtx;
use openssl::pkey::{Id, PKey};
use sampler::{looped, Op, Row, BACKENDS};
use toyos_crypto::hash::{Sha256, Sha384, Sha512};
use toyos_crypto::kdf::{Hkdf, Hmac};

const KEY: [u8; 64] = [0x42; 64];
const IV: [u8; 12] = [0x24; 12];
const AAD: [u8; 5] = [0x17, 0x03, 0x03, 0x40, 0x11];
const SIZES: [usize; 5] = [0, 64, 1024, 16384, 65536];
const SSH_SIZES: [usize; 5] = [0, 64, 1024, 16384, 32768];
const MESSAGE: [u8; 64] = [0x6d; 64];
const SEED: [u8; 32] = [0x5e; 32];

fn keep<T>(value: T) {
    drop(black_box(value));
}

struct System;

impl toyos_crypto::Random for System {
    fn fill(&mut self, destination: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        getrandom::getrandom(destination).map_err(|_| toyos_crypto::Error::Entropy)
    }
}

struct Fixed(&'static [u8]);

impl toyos_crypto::Random for Fixed {
    fn fill(&mut self, destination: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        destination.copy_from_slice(&self.0[..destination.len()]);
        Ok(())
    }
}

/// A row: toyos-crypto twice (A and B, each from its own `ours()`), then
/// ring, OpenSSL and AWS-LC where each has the operation.
fn row<F: FnMut() + 'static>(
    name: impl Into<String>,
    ours: impl Fn() -> F,
    ring: Option<Op>,
    openssl: Option<Op>,
    awslc: Option<Op>,
) -> Row {
    Row { name: name.into(), run: [Some(looped(ours())), Some(looped(ours())), ring, openssl, awslc] }
}

fn nonce(sequence: u64) -> [u8; 12] {
    let mut nonce = IV;
    for (n, s) in nonce[4..].iter_mut().zip(sequence.to_be_bytes()) {
        *n ^= s;
    }
    nonce
}

#[derive(Clone, Copy)]
enum Tls {
    Aes128,
    Aes256,
    ChaCha,
}

impl Tls {
    fn name(self) -> &'static str {
        match self {
            Tls::Aes128 => "aes-128-gcm",
            Tls::Aes256 => "aes-256-gcm",
            Tls::ChaCha => "chacha20-poly1305",
        }
    }
    fn key(self) -> &'static [u8] {
        match self {
            Tls::Aes128 => &KEY[..16],
            _ => &KEY[..32],
        }
    }
    fn openssl_name(self) -> &'static str {
        match self {
            Tls::Aes128 => "AES-128-GCM",
            Tls::Aes256 => "AES-256-GCM",
            Tls::ChaCha => "ChaCha20-Poly1305",
        }
    }
    fn sealing(self) -> toyos_crypto::aead::SealingKey {
        use toyos_crypto::aead::SealingKey;
        match self {
            Tls::Aes128 => SealingKey::aes128_gcm(KEY[..16].try_into().unwrap(), IV),
            Tls::Aes256 => SealingKey::aes256_gcm(KEY[..32].try_into().unwrap(), IV),
            Tls::ChaCha => SealingKey::chacha20_poly1305(KEY[..32].try_into().unwrap(), IV),
        }
    }
    fn opening(self) -> toyos_crypto::aead::OpeningKey {
        use toyos_crypto::aead::OpeningKey;
        match self {
            Tls::Aes128 => OpeningKey::aes128_gcm(KEY[..16].try_into().unwrap()),
            Tls::Aes256 => OpeningKey::aes256_gcm(KEY[..32].try_into().unwrap()),
            Tls::ChaCha => OpeningKey::chacha20_poly1305(KEY[..32].try_into().unwrap()),
        }
    }
    fn ring(self) -> ring::aead::LessSafeKey {
        use ring::aead;
        let alg = match self {
            Tls::Aes128 => &aead::AES_128_GCM,
            Tls::Aes256 => &aead::AES_256_GCM,
            Tls::ChaCha => &aead::CHACHA20_POLY1305,
        };
        aead::LessSafeKey::new(aead::UnboundKey::new(alg, self.key()).unwrap())
    }
    fn awslc(self) -> awslc::aead::LessSafeKey {
        use awslc::aead;
        let alg = match self {
            Tls::Aes128 => &aead::AES_128_GCM,
            Tls::Aes256 => &aead::AES_256_GCM,
            Tls::ChaCha => &aead::CHACHA20_POLY1305,
        };
        aead::LessSafeKey::new(aead::UnboundKey::new(alg, self.key()).unwrap())
    }
    fn openssl(self) -> ossl::Aead {
        ossl::Aead::new(self.openssl_name(), self.key(), &IV)
    }
}

fn ring_seal(key: &ring::aead::LessSafeKey, n: [u8; 12], aad: &[u8], buf: &mut [u8]) -> [u8; 16] {
    use ring::aead::{Aad, Nonce};
    let tag = key.seal_in_place_separate_tag(Nonce::assume_unique_for_key(n), Aad::from(aad), buf).unwrap();
    tag.as_ref().try_into().unwrap()
}

fn ring_open(key: &ring::aead::LessSafeKey, n: [u8; 12], aad: &[u8], buf: &mut [u8], tag: &[u8; 16]) -> bool {
    use ring::aead::{Aad, Nonce, Tag};
    let tag = Tag::from(*tag);
    key.open_in_place_separate_tag(Nonce::assume_unique_for_key(n), Aad::from(aad), tag, buf, 0..).is_ok()
}

fn awslc_seal(key: &awslc::aead::LessSafeKey, n: [u8; 12], aad: &[u8], buf: &mut [u8]) -> [u8; 16] {
    use awslc::aead::{Aad, Nonce};
    let tag = key.seal_in_place_separate_tag(Nonce::assume_unique_for_key(n), Aad::from(aad), buf).unwrap();
    tag.as_ref().try_into().unwrap()
}

fn awslc_open(key: &awslc::aead::LessSafeKey, n: [u8; 12], aad: &[u8], buf: &mut [u8], tag: &[u8; 16]) -> bool {
    use awslc::aead::{Aad, Nonce};
    // aws-lc-rs takes the tag appended to the ciphertext.
    let mut joined = Vec::with_capacity(buf.len() + 16);
    joined.extend_from_slice(buf);
    joined.extend_from_slice(tag);
    match key.open_in_place(Nonce::assume_unique_for_key(n), Aad::from(aad), &mut joined) {
        Ok(plain) => {
            buf.copy_from_slice(plain);
            true
        }
        Err(_) => false,
    }
}

/// Each library seals `plain` at sequence 0 as ours does, opens ours's record
/// to `plain`, and refuses it with one tag bit flipped, as ours does.
fn aead_agrees(alg: Tls, aad: &[u8], plain: &[u8]) {
    let name = alg.name();
    let len = plain.len();
    let mut ours = plain.to_vec();
    let (n, tag) = alg.sealing().seal(aad, &mut ours).unwrap();
    assert_eq!(n, IV);
    let tag: [u8; 16] = tag[..].try_into().unwrap();
    let mut forged = tag;
    forged[len % 16] ^= 1;
    let opener = alg.opening();
    let mut opened = ours.clone();
    opener.open(&IV, aad, &mut opened, &tag).expect("ours opens its own record");
    assert_eq!(opened, plain);
    // A refusal releases no plaintext: the buffer is zeroed or left as it was
    // (this branch zeroes AES-GCM's; main leaves both).
    let mut refused = ours.clone();
    assert!(opener.open(&IV, aad, &mut refused, &forged).is_err());
    assert!(refused == ours || refused.iter().all(|&b| b == 0), "ours's refusal of {name} {len} B leaves plaintext");

    let (ring_key, aws_key, mut ossl_key) = (alg.ring(), alg.awslc(), alg.openssl());
    let mut theirs = plain.to_vec();
    assert_eq!((ring_seal(&ring_key, IV, aad, &mut theirs), &theirs), (tag, &ours), "ring seals {name} {len} B as ours");
    let mut theirs = plain.to_vec();
    assert_eq!((ossl_key.seal(&IV, aad, &mut theirs), &theirs), (tag, &ours), "openssl seals {name} {len} B as ours");
    let mut theirs = plain.to_vec();
    assert_eq!((awslc_seal(&aws_key, IV, aad, &mut theirs), &theirs), (tag, &ours), "aws-lc seals {name} {len} B as ours");

    let mut buf = ours.clone();
    assert!(ring_open(&ring_key, IV, aad, &mut buf, &tag) && buf == plain, "ring opens ours's {name} {len} B");
    let mut buf = ours.clone();
    assert!(ossl_key.open(&IV, aad, &mut buf, &tag) && buf == plain, "openssl opens ours's {name} {len} B");
    let mut buf = ours.clone();
    assert!(awslc_open(&aws_key, IV, aad, &mut buf, &tag) && buf == plain, "aws-lc opens ours's {name} {len} B");
    assert!(!ring_open(&ring_key, IV, aad, &mut ours.clone(), &forged), "ring refuses a forged {name} {len} B");
    assert!(!ossl_key.open(&IV, aad, &mut ours.clone(), &forged), "openssl refuses a forged {name} {len} B");
    assert!(!awslc_open(&aws_key, IV, aad, &mut ours.clone(), &forged), "aws-lc refuses a forged {name} {len} B");
}

fn tls_rows(alg: Tls, rows: &mut Vec<Row>) {
    let name = alg.name();
    let cipher = openssl::cipher::Cipher::fetch(None, alg.openssl_name(), None).unwrap();
    rows.push(row(
        format!("{name}/key"),
        || move || keep(alg.sealing()),
        Some(looped(move || keep(alg.ring()))),
        Some(looped(move || {
            let mut ctx = openssl::cipher_ctx::CipherCtx::new().unwrap();
            ctx.encrypt_init(Some(&cipher), Some(alg.key()), Some(&IV)).unwrap();
            keep(ctx);
        })),
        Some(looped(move || keep(alg.awslc()))),
    ));
    for len in SIZES {
        aead_agrees(alg, &AAD, &vec![0x70; len]);
        let (ring_key, aws_key, mut ossl_key) = (alg.ring(), alg.awslc(), alg.openssl());
        let (mut rb, mut ab, mut ob, mut rs, mut as_, mut os) = (vec![0x70; len], vec![0x70; len], vec![0x70; len], 0, 0, 0);
        rows.push(row(
            format!("{name}/seal/{len}"),
            || {
                let (mut key, mut buf) = (alg.sealing(), vec![0x70; len]);
                move || keep(key.seal(&AAD, &mut buf).unwrap())
            },
            Some(looped(move || {
                keep(ring_seal(&ring_key, nonce(rs), &AAD, &mut rb));
                rs += 1;
            })),
            Some(looped(move || {
                keep(ossl_key.seal(&nonce(os), &AAD, &mut ob));
                os += 1;
            })),
            Some(looped(move || {
                keep(awslc_seal(&aws_key, nonce(as_), &AAD, &mut ab));
                as_ += 1;
            })),
        ));
        let mut sealed = vec![0x70; len];
        let (_, tag) = alg.sealing().seal(&AAD, &mut sealed).unwrap();
        let tag: [u8; 16] = tag[..].try_into().unwrap();
        for forged in [false, true] {
            let op = if forged { "reject" } else { "open" };
            let mut tag = tag;
            tag[0] ^= u8::from(forged);
            // An open restores its ciphertext first, in every backend.
            fn opener(sealed: &[u8], forged: bool, mut open: impl FnMut(&mut [u8]) -> bool + 'static) -> Op {
                let (sealed, mut work) = (sealed.to_vec(), sealed.to_vec());
                looped(move || {
                    if !forged {
                        work.copy_from_slice(&sealed);
                    }
                    assert_eq!(open(&mut work), !forged);
                })
            }
            let (ring_key, aws_key, mut ossl_key) = (alg.ring(), alg.awslc(), alg.openssl());
            let s = sealed.clone();
            rows.push(row(
                format!("{name}/{op}/{len}"),
                move || {
                    let (key, sealed, mut work) = (alg.opening(), s.clone(), s.clone());
                    move || {
                        if !forged {
                            work.copy_from_slice(&sealed);
                        }
                        assert_eq!(key.open(&IV, &AAD, &mut work, &tag).is_ok(), !forged);
                    }
                },
                Some(opener(&sealed, forged, move |w| ring_open(&ring_key, IV, &AAD, w, &tag))),
                Some(opener(&sealed, forged, move |w| ossl_key.open(&IV, &AAD, w, &tag))),
                Some({
                    // aws-lc-rs opens in place a record with its tag appended.
                    use awslc::aead::{Aad, Nonce};
                    let joined = [&sealed[..], &tag[..]].concat();
                    let mut work = joined.clone();
                    looped(move || {
                        if !forged {
                            work.copy_from_slice(&joined);
                        }
                        let opened = aws_key.open_in_place(Nonce::assume_unique_for_key(IV), Aad::from(&AAD), &mut work);
                        assert_eq!(opened.is_ok(), !forged);
                    })
                }),
            ));
        }
    }
}


/// Each library seals the packet at `sequence` as ours does, decrypts its
/// length, opens ours's packet and refuses it with a tag bit flipped.
fn ssh_agrees(sequence: u32, plain: &[u8]) {
    use awslc::aead::chacha20_poly1305_openssh as aws_ssh;
    use ring::aead::chacha20_poly1305_openssh as ring_ssh;
    use toyos_crypto::ssh;
    let len = plain.len();
    let length = u32::try_from(len).unwrap().to_be_bytes();
    let (mut header, mut payload) = (length, plain.to_vec());
    let (_, tag) = ssh::SealingKey::new(KEY, sequence).seal(&mut header, &mut payload).unwrap();
    let ours = [&header[..], &payload].concat();
    let mut forged = tag;
    forged[len % 16] ^= 1;
    let opener = ssh::OpeningKey::new(KEY);
    assert_eq!(opener.packet_length(sequence, header), len as u32);
    let clear = [&length[..], plain].concat();

    let (mut packet, mut t) = (clear.clone(), [0; 16]);
    ring_ssh::SealingKey::new(&KEY).seal_in_place(sequence, &mut packet, &mut t);
    assert_eq!((&packet, t), (&ours, tag), "ring seals OpenSSH {len} B as ours");
    let (mut packet, mut t) = (clear.clone(), [0; 16]);
    aws_ssh::SealingKey::new(&KEY).seal_in_place(sequence, &mut packet, &mut t);
    assert_eq!((&packet, t), (&ours, tag), "aws-lc seals OpenSSH {len} B as ours");
    let mut o = ossl::Ssh::new(&KEY);
    let (mut packet, mut t) = (clear.clone(), [0; 16]);
    o.seal(sequence, &mut packet, &mut t);
    assert_eq!((&packet, t), (&ours, tag), "openssl seals OpenSSH {len} B as ours");

    let header: [u8; 4] = ours[..4].try_into().unwrap();
    let r = ring_ssh::OpeningKey::new(&KEY);
    let a = aws_ssh::OpeningKey::new(&KEY);
    assert_eq!(r.decrypt_packet_length(sequence, header), length);
    assert_eq!(a.decrypt_packet_length(sequence, header), length);
    assert_eq!(o.packet_length(sequence, header), length);
    let mut w = ours.clone();
    assert_eq!(r.open_in_place(sequence, &mut w, &tag).expect("ring opens ours's packet"), plain);
    let mut w = ours.clone();
    assert_eq!(a.open_in_place(sequence, &mut w, &tag).expect("aws-lc opens ours's packet"), plain);
    let mut w = ours.clone();
    assert!(o.open(sequence, &mut w, &tag) && &w[4..] == plain, "openssl opens ours's packet");
    let (mut h, mut p) = (header, ours[4..].to_vec());
    assert!(opener.open(sequence, &mut h, &mut p, &forged).is_err());
    assert!(r.open_in_place(sequence, &mut ours.clone(), &forged).is_err());
    assert!(a.open_in_place(sequence, &mut ours.clone(), &forged).is_err());
    assert!(!o.open(sequence, &mut ours.clone(), &forged));
}

fn ssh_rows(rows: &mut Vec<Row>) {
    use awslc::aead::chacha20_poly1305_openssh as aws_ssh;
    use ring::aead::chacha20_poly1305_openssh as ring_ssh;
    use toyos_crypto::ssh;
    const NAME: &str = "chacha20-poly1305-openssh";
    // OpenSSL has no such construction; its row would time OpenSSH's own
    // context set-up, not a library's, so it is left out.
    rows.push(row(
        format!("{NAME}/key"),
        || || keep(ssh::SealingKey::new(KEY, 0)),
        Some(looped(|| keep(ring_ssh::SealingKey::new(&KEY)))),
        None,
        Some(looped(|| keep(aws_ssh::SealingKey::new(&KEY)))),
    ));
    let encrypted = [0x12, 0x34, 0x56, 0x78];
    let (r, a, mut o) = (ring_ssh::OpeningKey::new(&KEY), aws_ssh::OpeningKey::new(&KEY), ossl::Ssh::new(&KEY));
    let ours = ssh::OpeningKey::new(KEY).packet_length(7, encrypted).to_be_bytes();
    assert_eq!(r.decrypt_packet_length(7, encrypted), ours);
    assert_eq!(a.decrypt_packet_length(7, encrypted), ours);
    assert_eq!(o.packet_length(7, encrypted), ours);
    rows.push(row(
        format!("{NAME}/length"),
        || {
            let key = ssh::OpeningKey::new(KEY);
            move || keep(key.packet_length(7, black_box(encrypted)))
        },
        Some(looped(move || keep(r.decrypt_packet_length(7, black_box(encrypted))))),
        Some(looped(move || keep(o.packet_length(7, black_box(encrypted))))),
        Some(looped(move || keep(a.decrypt_packet_length(7, black_box(encrypted))))),
    ));
    for len in SSH_SIZES {
        ssh_agrees(0, &vec![0x70; len]);
        let length = u32::try_from(len).unwrap().to_be_bytes();
        let clear = [&length[..], &vec![0x70; len]].concat();
        let (rk, ak, mut ok) = (ring_ssh::SealingKey::new(&KEY), aws_ssh::SealingKey::new(&KEY), ossl::Ssh::new(&KEY));
        let (mut rp, mut ap, mut op, mut tags, mut seq) = (clear.clone(), clear.clone(), clear.clone(), [[0u8; 16]; 3], [0u32; 3]);
        rows.push(row(
            format!("{NAME}/seal/{len}"),
            || {
                let (mut key, mut header, mut payload) = (ssh::SealingKey::new(KEY, 0), length, vec![0x70; len]);
                move || keep(key.seal(&mut header, &mut payload).unwrap())
            },
            Some(looped(move || {
                rk.seal_in_place(seq[0], &mut rp, &mut tags[0]);
                keep(&tags[0]);
                seq[0] = seq[0].wrapping_add(1);
            })),
            Some(looped(move || {
                ok.seal(seq[1], &mut op, &mut tags[1]);
                keep(&tags[1]);
                seq[1] = seq[1].wrapping_add(1);
            })),
            Some(looped(move || {
                ak.seal_in_place(seq[2], &mut ap, &mut tags[2]);
                keep(&tags[2]);
                seq[2] = seq[2].wrapping_add(1);
            })),
        ));
        let (mut header, mut payload) = (length, vec![0x70; len]);
        let (_, tag) = ssh::SealingKey::new(KEY, 0).seal(&mut header, &mut payload).unwrap();
        let sealed = [&header[..], &payload].concat();
        for forged in [false, true] {
            let op = if forged { "reject" } else { "open" };
            let mut tag = tag;
            tag[0] ^= u8::from(forged);
            // An open restores the packet first and decrypts its length, in
            // every backend.
            fn opener(sealed: &[u8], forged: bool, mut open: impl FnMut(&mut [u8]) -> bool + 'static) -> Op {
                let (sealed, mut work) = (sealed.to_vec(), sealed.to_vec());
                looped(move || {
                    if !forged {
                        work.copy_from_slice(&sealed);
                    }
                    assert_eq!(open(&mut work), !forged);
                })
            }
            let (r, a, mut o) = (ring_ssh::OpeningKey::new(&KEY), aws_ssh::OpeningKey::new(&KEY), ossl::Ssh::new(&KEY));
            let s = sealed.clone();
            rows.push(row(
                format!("{NAME}/{op}/{len}"),
                move || {
                    let (key, sealed_header) = (ssh::OpeningKey::new(KEY), <[u8; 4]>::try_from(&s[..4]).unwrap());
                    let (sealed, mut header, mut work) = (s[4..].to_vec(), sealed_header, s[4..].to_vec());
                    move || {
                        if !forged {
                            header = sealed_header;
                            work.copy_from_slice(&sealed);
                        }
                        keep(key.packet_length(0, header));
                        assert_eq!(key.open(0, &mut header, &mut work, &tag).is_ok(), !forged);
                    }
                },
                Some(opener(&sealed, forged, move |w| {
                    keep(r.decrypt_packet_length(0, w[..4].try_into().unwrap()));
                    r.open_in_place(0, w, &tag).is_ok()
                })),
                Some(opener(&sealed, forged, move |w| {
                    keep(o.packet_length(0, w[..4].try_into().unwrap()));
                    o.open(0, w, &tag)
                })),
                Some(opener(&sealed, forged, move |w| {
                    keep(a.decrypt_packet_length(0, w[..4].try_into().unwrap()));
                    a.open_in_place(0, w, &tag).is_ok()
                })),
            ));
        }
    }
}

fn hashes_agree(data: &[u8], short_key: &[u8], long_key: &[u8]) {
    use awslc::{digest as ad, hmac as ah};
    use ring::{digest as rd, hmac as rh};
    let len = data.len();
    let (mut o256, mut o384, mut o512) = (ossl::Digest::new("SHA256"), ossl::Digest::new("SHA384"), ossl::Digest::new("SHA512"));
    let ours256 = Sha256::digest(data).unwrap();
    let ours384 = Sha384::digest(data).unwrap();
    let ours512 = Sha512::digest(data).unwrap();
    assert_eq!(rd::digest(&rd::SHA256, data).as_ref(), &ours256[..], "ring SHA-256 of {len} B");
    assert_eq!(ad::digest(&ad::SHA256, data).as_ref(), &ours256[..], "aws-lc SHA-256 of {len} B");
    let mut out = [0; 32];
    o256.digest(data, &mut out);
    assert_eq!(out, ours256, "openssl SHA-256 of {len} B");
    assert_eq!(rd::digest(&rd::SHA384, data).as_ref(), &ours384[..], "ring SHA-384 of {len} B");
    assert_eq!(ad::digest(&ad::SHA384, data).as_ref(), &ours384[..], "aws-lc SHA-384 of {len} B");
    let mut out = [0; 48];
    o384.digest(data, &mut out);
    assert_eq!(out, ours384, "openssl SHA-384 of {len} B");
    assert_eq!(rd::digest(&rd::SHA512, data).as_ref(), &ours512[..], "ring SHA-512 of {len} B");
    assert_eq!(ad::digest(&ad::SHA512, data).as_ref(), &ours512[..], "aws-lc SHA-512 of {len} B");
    let mut out = [0; 64];
    o512.digest(data, &mut out);
    assert_eq!(out, ours512, "openssl SHA-512 of {len} B");
    let (mut m256, mut m384) = (ossl::Mac::new(c"HMAC", Some(c"SHA256")), ossl::Mac::new(c"HMAC", Some(c"SHA384")));
    for key in [short_key, long_key] {
        let (mut t256, mut t384) = ([0; 32], [0; 48]);
        Hmac::<Sha256>::authenticate(key, data, &mut t256).unwrap();
        Hmac::<Sha384>::authenticate(key, data, &mut t384).unwrap();
        assert_eq!(rh::sign(&rh::Key::new(rh::HMAC_SHA256, key), data).as_ref(), &t256[..], "ring HMAC-SHA-256 of {len} B");
        assert_eq!(ah::sign(&ah::Key::new(ah::HMAC_SHA256, key), data).as_ref(), &t256[..], "aws-lc HMAC-SHA-256 of {len} B");
        assert_eq!(rh::sign(&rh::Key::new(rh::HMAC_SHA384, key), data).as_ref(), &t384[..], "ring HMAC-SHA-384 of {len} B");
        assert_eq!(ah::sign(&ah::Key::new(ah::HMAC_SHA384, key), data).as_ref(), &t384[..], "aws-lc HMAC-SHA-384 of {len} B");
        let (mut o, mut p) = ([0; 32], [0; 48]);
        m256.mac(key, &[data], &mut o);
        m384.mac(key, &[data], &mut p);
        assert_eq!((o, p), (t256, t384), "openssl HMAC of {len} B");
    }
}

fn hkdf_agrees() {
    use awslc::hkdf as ak;
    use ring::hkdf as rk;
    let info = &MESSAGE[..16];
    let (mut ours256, mut ours384) = ([0; 32], [0; 48]);
    Hkdf::<Sha256>::extract(&IV, &KEY[..32]).unwrap().expand(&[info], &mut ours256).unwrap();
    Hkdf::<Sha384>::extract(&IV, &KEY[..48]).unwrap().expand(&[info], &mut ours384).unwrap();
    let (mut r256, mut r384, mut a256, mut a384, mut o256, mut o384) = ([0; 32], [0; 48], [0; 32], [0; 48], [0; 32], [0; 48]);
    rk::Salt::new(rk::HKDF_SHA256, &IV).extract(&KEY[..32]).expand(&[info], rk::HKDF_SHA256).unwrap().fill(&mut r256).unwrap();
    rk::Salt::new(rk::HKDF_SHA384, &IV).extract(&KEY[..48]).expand(&[info], rk::HKDF_SHA384).unwrap().fill(&mut r384).unwrap();
    ak::Salt::new(ak::HKDF_SHA256, &IV).extract(&KEY[..32]).expand(&[info], ak::HKDF_SHA256).unwrap().fill(&mut a256).unwrap();
    ak::Salt::new(ak::HKDF_SHA384, &IV).extract(&KEY[..48]).expand(&[info], ak::HKDF_SHA384).unwrap().fill(&mut a384).unwrap();
    ossl::Hkdf::new(c"SHA256").derive(&IV, &KEY[..32], info, &mut o256);
    ossl::Hkdf::new(c"SHA384").derive(&IV, &KEY[..48], info, &mut o384);
    assert_eq!((r256, r384), (ours256, ours384), "ring HKDF");
    assert_eq!((a256, a384), (ours256, ours384), "aws-lc HKDF");
    assert_eq!((o256, o384), (ours256, ours384), "openssl HKDF");
}

fn hash_rows(rows: &mut Vec<Row>) {
    use awslc::{digest as ad, hkdf as ak, hmac as ah};
    use ring::{digest as rd, hkdf as rk, hmac as rh};
    for len in [64, 16384, 1 << 20] {
        hashes_agree(&vec![0x6d; len], &KEY[..32], &[0x5a; 200]);
    }
    hkdf_agrees();
    for (name, lens, ring_alg, aws_alg, ossl_name) in [
        ("sha-256", &[64usize, 16384, 1 << 20][..], &rd::SHA256, &ad::SHA256, "SHA256"),
        ("sha-512", &[64, 16384][..], &rd::SHA512, &ad::SHA512, "SHA512"),
    ] {
        for &len in lens {
            let (m1, m2, m3) = (vec![0x6d; len], vec![0x6d; len], vec![0x6d; len]);
            let mut o = ossl::Digest::new(ossl_name);
            let mut out = [0u8; 64];
            let width = if name == "sha-256" { 32 } else { 64 };
            let sha256 = name == "sha-256";
            rows.push(row(
                format!("{name}/{len}"),
                || {
                    let m = vec![0x6d; len];
                    move || {
                        if sha256 {
                            keep(Sha256::digest(&m).unwrap())
                        } else {
                            keep(Sha512::digest(&m).unwrap())
                        }
                    }
                },
                Some(looped(move || keep(rd::digest(ring_alg, &m1)))),
                Some(looped(move || {
                    o.digest(&m2, &mut out[..width]);
                    keep(&out);
                })),
                Some(looped(move || keep(ad::digest(aws_alg, &m3)))),
            ));
        }
    }
    let mut m = ossl::Mac::new(c"HMAC", Some(c"SHA256"));
    rows.push(row(
        "hmac-sha-256/64",
        || {
            || {
                let mut tag = [0; 32];
                Hmac::<Sha256>::authenticate(&KEY[..32], &MESSAGE, &mut tag).unwrap();
                keep(tag);
            }
        },
        Some(looped(|| keep(rh::sign(&rh::Key::new(rh::HMAC_SHA256, &KEY[..32]), &MESSAGE)))),
        Some(looped(move || {
            let mut tag = [0; 32];
            m.mac(&KEY[..32], &[&MESSAGE], &mut tag);
            keep(tag);
        })),
        Some(looped(|| keep(ah::sign(&ah::Key::new(ah::HMAC_SHA256, &KEY[..32]), &MESSAGE)))),
    ));
    let mut m = ossl::Mac::new(c"HMAC", Some(c"SHA384"));
    rows.push(row(
        "hmac-sha-384/64",
        || {
            || {
                let mut tag = [0; 48];
                Hmac::<Sha384>::authenticate(&KEY[..48], &MESSAGE, &mut tag).unwrap();
                keep(tag);
            }
        },
        Some(looped(|| keep(rh::sign(&rh::Key::new(rh::HMAC_SHA384, &KEY[..48]), &MESSAGE)))),
        Some(looped(move || {
            let mut tag = [0; 48];
            m.mac(&KEY[..48], &[&MESSAGE], &mut tag);
            keep(tag);
        })),
        Some(looped(|| keep(ah::sign(&ah::Key::new(ah::HMAC_SHA384, &KEY[..48]), &MESSAGE)))),
    ));
    let info = &MESSAGE[..16];
    let mut h = ossl::Hkdf::new(c"SHA256");
    rows.push(row(
        "hkdf-sha-256/32",
        || {
            || {
                let mut out = [0; 32];
                Hkdf::<Sha256>::extract(&IV, &KEY[..32]).unwrap().expand(&[&MESSAGE[..16]], &mut out).unwrap();
                keep(out);
            }
        },
        Some(looped(move || {
            let mut out = [0; 32];
            let prk = rk::Salt::new(rk::HKDF_SHA256, &IV).extract(&KEY[..32]);
            prk.expand(&[info], rk::HKDF_SHA256).unwrap().fill(&mut out).unwrap();
            keep(out);
        })),
        Some(looped(move || {
            let mut out = [0; 32];
            h.derive(&IV, &KEY[..32], info, &mut out);
            keep(out);
        })),
        Some(looped(move || {
            let mut out = [0; 32];
            let prk = ak::Salt::new(ak::HKDF_SHA256, &IV).extract(&KEY[..32]);
            prk.expand(&[info], ak::HKDF_SHA256).unwrap().fill(&mut out).unwrap();
            keep(out);
        })),
    ));
    let mut h = ossl::Hkdf::new(c"SHA384");
    rows.push(row(
        "hkdf-sha-384/48",
        || {
            || {
                let mut out = [0; 48];
                Hkdf::<Sha384>::extract(&IV, &KEY[..48]).unwrap().expand(&[&MESSAGE[..16]], &mut out).unwrap();
                keep(out);
            }
        },
        Some(looped(move || {
            let mut out = [0; 48];
            let prk = rk::Salt::new(rk::HKDF_SHA384, &IV).extract(&KEY[..48]);
            prk.expand(&[info], rk::HKDF_SHA384).unwrap().fill(&mut out).unwrap();
            keep(out);
        })),
        Some(looped(move || {
            let mut out = [0; 48];
            h.derive(&IV, &KEY[..48], info, &mut out);
            keep(out);
        })),
        Some(looped(move || {
            let mut out = [0; 48];
            let prk = ak::Salt::new(ak::HKDF_SHA384, &IV).extract(&KEY[..48]);
            prk.expand(&[info], ak::HKDF_SHA384).unwrap().fill(&mut out).unwrap();
            keep(out);
        })),
    ));
}

#[derive(Clone, Copy)]
enum Curve {
    X25519,
    P256,
    P384,
}

impl Curve {
    fn name(self) -> &'static str {
        match self {
            Curve::X25519 => "x25519",
            Curve::P256 => "p-256",
            Curve::P384 => "p-384",
        }
    }
    fn ring(self) -> &'static ring::agreement::Algorithm {
        match self {
            Curve::X25519 => &ring::agreement::X25519,
            Curve::P256 => &ring::agreement::ECDH_P256,
            Curve::P384 => &ring::agreement::ECDH_P384,
        }
    }
    fn awslc(self) -> &'static awslc::agreement::Algorithm {
        match self {
            Curve::X25519 => &awslc::agreement::X25519,
            Curve::P256 => &awslc::agreement::ECDH_P256,
            Curve::P384 => &awslc::agreement::ECDH_P384,
        }
    }
    fn group(self) -> Option<&'static std::ffi::CStr> {
        match self {
            Curve::X25519 => None,
            Curve::P256 => Some(c"P-256"),
            Curve::P384 => Some(c"P-384"),
        }
    }
    fn nid(self) -> openssl::nid::Nid {
        match self {
            Curve::P256 => openssl::nid::Nid::X9_62_PRIME256V1,
            Curve::P384 => openssl::nid::Nid::SECP384R1,
            Curve::X25519 => unreachable!(),
        }
    }
    /// A fixed private key, below each group order.
    fn fixed(self) -> Vec<u8> {
        match self {
            Curve::P384 => vec![0x11; 48],
            _ => vec![0x11; 32],
        }
    }
    /// Ours: (public key, secret shared with `peer`) for private key `secret`.
    fn ours(self, secret: Option<&[u8]>, peer: &[u8]) -> (Vec<u8>, Vec<u8>) {
        use toyos_crypto::{ecc, x25519};
        match self {
            Curve::X25519 => {
                let key = match secret {
                    Some(s) => x25519::SecretKey::from_bytes(s.try_into().unwrap()),
                    None => x25519::SecretKey::generate(&mut System).unwrap(),
                };
                let public = key.public_key().0.to_vec();
                let shared = key.agree(&x25519::PublicKey(peer.try_into().unwrap())).unwrap().as_bytes().to_vec();
                (public, shared)
            }
            Curve::P256 => {
                let key = match secret {
                    Some(s) => ecc::p256::SecretKey::from_bytes(s.try_into().unwrap()).unwrap(),
                    None => ecc::p256::SecretKey::generate(&mut System).unwrap(),
                };
                let public = key.public_key().as_sec1().to_vec();
                let peer = ecc::p256::PublicKey::from_sec1(peer).unwrap();
                (public, key.agree(&peer).unwrap().as_bytes().to_vec())
            }
            Curve::P384 => {
                let key = match secret {
                    Some(s) => ecc::p384::SecretKey::from_bytes(s.try_into().unwrap()).unwrap(),
                    None => ecc::p384::SecretKey::generate(&mut System).unwrap(),
                };
                let public = key.public_key().as_sec1().to_vec();
                let peer = ecc::p384::PublicKey::from_sec1(peer).unwrap();
                (public, key.agree(&peer).unwrap().as_bytes().to_vec())
            }
        }
    }
    /// OpenSSL through the openssl crate, for the fixed-key check alone.
    fn openssl_fixed(self, secret: &[u8], peer: &[u8]) -> (Vec<u8>, Vec<u8>) {
        use openssl::bn::{BigNum, BigNumContext};
        use openssl::ec::{EcGroup, EcKey, EcPoint, PointConversionForm};
        let (key, public, peer) = match self {
            Curve::X25519 => {
                let key = PKey::private_key_from_raw_bytes(secret, Id::X25519).unwrap();
                let public = key.raw_public_key().unwrap();
                (key, public, PKey::public_key_from_raw_bytes(peer, Id::X25519).unwrap())
            }
            _ => {
                let group = EcGroup::from_curve_name(self.nid()).unwrap();
                let mut ctx = BigNumContext::new().unwrap();
                let d = BigNum::from_slice(secret).unwrap();
                let mut point = EcPoint::new(&group).unwrap();
                point.mul_generator2(&group, &d, &mut ctx).unwrap();
                let public = point.to_bytes(&group, PointConversionForm::UNCOMPRESSED, &mut ctx).unwrap();
                let key = PKey::from_ec_key(EcKey::from_private_components(&group, &d, &point).unwrap()).unwrap();
                let p = EcPoint::from_bytes(&group, peer, &mut ctx).unwrap();
                (key, public, PKey::from_ec_key(EcKey::from_public_key(&group, &p).unwrap()).unwrap())
            }
        };
        let mut deriver = openssl::derive::Deriver::new(&key).unwrap();
        deriver.set_peer(&peer).unwrap();
        (public, deriver.derive_to_vec().unwrap())
    }
}

/// Fixed keys: OpenSSL and AWS-LC derive ours's public key and shared secret
/// from the same private key and peer. Ephemeral keys: every library and ours
/// agree on one secret, each with the other's public key.
fn agreement_agrees(curve: Curve) {
    use awslc::agreement as aa;
    use ring::agreement as ra;
    let name = curve.name();
    let ring_peer = ra::EphemeralPrivateKey::generate(curve.ring(), &ring::rand::SystemRandom::new()).unwrap();
    let peer = ring_peer.compute_public_key().unwrap().as_ref().to_vec();
    let s = curve.fixed();
    let ours = curve.ours(Some(&s), &peer);
    assert_eq!(curve.openssl_fixed(&s, &peer), ours, "openssl {name}: public key and secret from a fixed key");
    let key = aa::PrivateKey::from_private_key(curve.awslc(), &s).unwrap();
    let public = key.compute_public_key().unwrap().as_ref().to_vec();
    let shared = aa::agree(&key, &aa::UnparsedPublicKey::new(curve.awslc(), &peer[..]), (), |k| Ok(k.to_vec())).unwrap();
    assert_eq!((public, shared), ours, "aws-lc {name}: public key and secret from a fixed key");

    // ring with ours, ephemeral both sides.
    let ring_public = ring_peer.compute_public_key().unwrap().as_ref().to_vec();
    let (ours_public, ours_shared) = curve.ours(None, &ring_public);
    let theirs = ra::agree_ephemeral(ring_peer, &ra::UnparsedPublicKey::new(curve.ring(), &ours_public), |k| k.to_vec()).unwrap();
    assert_eq!(theirs, ours_shared, "ring and ours agree on {name}");
    let aws = aa::EphemeralPrivateKey::generate(curve.awslc(), &awslc::rand::SystemRandom::new()).unwrap();
    let aws_public = aws.compute_public_key().unwrap().as_ref().to_vec();
    let (ours_public, ours_shared) = curve.ours(None, &aws_public);
    let theirs = aa::agree_ephemeral(aws, &aa::UnparsedPublicKey::new(curve.awslc(), &ours_public), (), |k| Ok(k.to_vec())).unwrap();
    assert_eq!(theirs, ours_shared, "aws-lc and ours agree on {name}");
    // The timed OpenSSL path itself.
    let o = ossl::Agreement::new(curve.group());
    let key = o.generate();
    let o_public = ossl::Agreement::public(&key);
    let (ours_public, ours_shared) = curve.ours(None, &o_public);
    let theirs = ossl::Agreement::derive(&key, &ossl::Agreement::peer(&key, &ours_public));
    assert_eq!(theirs, ours_shared, "openssl and ours agree on {name}");
    let (o_public, theirs) = o.agree(&ours.0);
    assert_eq!(curve.ours(Some(&s), &o_public).1, theirs, "openssl's whole agreement with ours's fixed key on {name}");
}

/// A key agreement as TLS and SSH make one: an ephemeral key, its public
/// key, and the secret shared with the peer's.
fn agreement_rows(rows: &mut Vec<Row>) {
    use awslc::agreement as aa;
    use ring::agreement as ra;
    for curve in [Curve::X25519, Curve::P256, Curve::P384] {
        agreement_agrees(curve);
        let key = ra::EphemeralPrivateKey::generate(curve.ring(), &ring::rand::SystemRandom::new()).unwrap();
        let peer = key.compute_public_key().unwrap().as_ref().to_vec();
        let (p1, p2, p3, p4) = (peer.clone(), peer.clone(), peer.clone(), peer.clone());
        let rng = ring::rand::SystemRandom::new();
        let arng = awslc::rand::SystemRandom::new();
        let o = ossl::Agreement::new(curve.group());
        rows.push(row(
            format!("{}/ecdh", curve.name()),
            || {
                let p = p1.clone();
                move || keep(curve.ours(None, &p).1[0])
            },
            Some(looped(move || {
                let key = ra::EphemeralPrivateKey::generate(curve.ring(), &rng).unwrap();
                keep(key.compute_public_key().unwrap());
                ra::agree_ephemeral(key, &ra::UnparsedPublicKey::new(curve.ring(), &p2), |s| black_box(s[0])).unwrap();
            })),
            Some(looped(move || keep(o.agree(&p3)))),
            Some(looped(move || {
                let key = aa::EphemeralPrivateKey::generate(curve.awslc(), &arng).unwrap();
                keep(key.compute_public_key().unwrap());
                aa::agree_ephemeral(key, &aa::UnparsedPublicKey::new(curve.awslc(), &p4[..]), (), |s| Ok(black_box(s[0]))).unwrap();
            })),
        ));
    }
}

/// OpenSSL's public key for a verification, parsed from its encoding.
enum OsslPublic {
    Ed25519,
    Ec(ossl::Key),
    Rsa,
}

fn ossl_public(kind: &OsslPublic, encoded: &[u8], e: &[u8]) -> PKey<openssl::pkey::Public> {
    use foreign_types::ForeignType;
    match kind {
        OsslPublic::Ed25519 => PKey::public_key_from_raw_bytes(encoded, Id::ED25519).unwrap(),
        OsslPublic::Ec(template) => {
            let key = ossl::Agreement::peer(template, encoded);
            let raw = key.0;
            std::mem::forget(key);
            unsafe { PKey::from_ptr(raw) }
        }
        OsslPublic::Rsa => {
            use openssl::bn::BigNum;
            let rsa = openssl::rsa::Rsa::from_public_components(BigNum::from_slice(encoded).unwrap(), BigNum::from_slice(e).unwrap()).unwrap();
            PKey::from_rsa(rsa).unwrap()
        }
    }
}

/// OpenSSL's verdict on `sig` over MESSAGE, with a reused digest context.
struct OsslVerify {
    kind: OsslPublic,
    md: Option<Md>,
    pss: bool,
    ctx: MdCtx,
}

impl OsslVerify {
    fn new(kind: OsslPublic, md: Option<&str>, pss: bool) -> OsslVerify {
        OsslVerify { kind, md: md.map(|m| Md::fetch(None, m, None).unwrap()), pss, ctx: MdCtx::new().unwrap() }
    }
    fn verify(&mut self, encoded: &[u8], e: &[u8], sig: &[u8]) -> bool {
        let key = ossl_public(&self.kind, encoded, e);
        let pctx = self.ctx.digest_verify_init(self.md.as_deref(), &key).unwrap();
        if self.pss {
            pctx.set_rsa_padding(openssl::rsa::Padding::PKCS1_PSS).unwrap();
            pctx.set_rsa_pss_saltlen(openssl::sign::RsaPssSaltlen::DIGEST_LENGTH).unwrap();
        }
        self.ctx.digest_verify(&MESSAGE, sig).unwrap_or(false)
    }
}

fn signature_rows(rows: &mut Vec<Row>) {
    use awslc::signature as asig;
    use ring::signature as rsig;
    use ring::signature::KeyPair;
    use toyos_crypto::{ecc, ed25519, rsa};
    let rng = ring::rand::SystemRandom::new();

    // Ed25519 signing: every library signs as ours from the same seed.
    let key = ed25519::SigningKey::from_seed(SEED);
    let ours_sig = key.sign(&MESSAGE).unwrap();
    let rpair = rsig::Ed25519KeyPair::from_seed_unchecked(&SEED).unwrap();
    let apair = asig::Ed25519KeyPair::from_seed_unchecked(&SEED).unwrap();
    let opkey = PKey::private_key_from_raw_bytes(&SEED, Id::ED25519).unwrap();
    let public = rpair.public_key().as_ref().to_vec();
    let mut octx = MdCtx::new().unwrap();
    let osign = |ctx: &mut MdCtx, key: &PKey<openssl::pkey::Private>| {
        let mut sig = [0u8; 64];
        ctx.digest_sign_init(None, key).unwrap();
        ctx.digest_sign(&MESSAGE, Some(&mut sig)).unwrap();
        sig
    };
    assert_eq!(rpair.sign(&MESSAGE).as_ref(), &ours_sig[..], "ring signs Ed25519 as ours");
    assert_eq!(apair.sign(&MESSAGE).as_ref(), &ours_sig[..], "aws-lc signs Ed25519 as ours");
    assert_eq!(osign(&mut octx, &opkey), ours_sig, "openssl signs Ed25519 as ours");
    rows.push(row(
        "ed25519/sign/64",
        || {
            let key = ed25519::SigningKey::from_seed(SEED);
            move || keep(key.sign(&MESSAGE).unwrap())
        },
        Some(looped(move || keep(rpair.sign(&MESSAGE)))),
        Some(looped(move || keep(osign(&mut octx, &opkey)))),
        Some(looped(move || keep(apair.sign(&MESSAGE)))),
    ));

    // A verification parses its public key, as a peer's arrives. Every
    // library gives ours's verdict on the signature and on it with one bit
    // flipped.
    fn verify_row(
        rows: &mut Vec<Row>,
        name: String,
        sig: Vec<u8>,
        ours: impl Fn(&[u8]) -> bool + Clone + 'static,
        ring: impl Fn(&[u8]) -> bool + 'static,
        mut openssl: impl FnMut(&[u8]) -> bool + 'static,
        aws: impl Fn(&[u8]) -> bool + 'static,
    ) {
        let mut forged = sig.clone();
        *forged.last_mut().unwrap() ^= 1;
        for (s, valid) in [(&sig, true), (&forged, false)] {
            assert_eq!(ours(s), valid, "{name}: ours");
            assert_eq!(ring(s), valid, "{name}: ring gives ours's verdict");
            assert_eq!(openssl(s), valid, "{name}: openssl gives ours's verdict");
            assert_eq!(aws(s), valid, "{name}: aws-lc gives ours's verdict");
        }
        let (s1, s2, s3, s4) = (sig.clone(), sig.clone(), sig.clone(), sig);
        rows.push(row(
            name,
            || {
                let (ours, s) = (ours.clone(), s1.clone());
                move || assert!(ours(&s))
            },
            Some(looped(move || assert!(ring(&s2)))),
            Some(looped(move || assert!(openssl(&s3)))),
            Some(looped(move || assert!(aws(&s4)))),
        ));
    }

    let encoded: [u8; 32] = public.clone().try_into().unwrap();
    let (p2, p3, p4) = (public.clone(), public.clone(), public.clone());
    let mut ov = OsslVerify::new(OsslPublic::Ed25519, None, false);
    verify_row(
        rows,
        "ed25519/verify/64".into(),
        ours_sig.to_vec(),
        move |s| ed25519::PublicKey::from_bytes(encoded).unwrap().verify(&MESSAGE, s).is_ok(),
        move |s| rsig::UnparsedPublicKey::new(&rsig::ED25519, &p2).verify(&MESSAGE, s).is_ok(),
        move |s| ov.verify(&p3, &[], s),
        move |s| asig::UnparsedPublicKey::new(&asig::ED25519, &p4).verify(&MESSAGE, s).is_ok(),
    );

    for (name, ring_sign, ring_verify, aws_verify, curve, md) in [
        (
            "ecdsa-p-256-sha-256/verify/64",
            &rsig::ECDSA_P256_SHA256_ASN1_SIGNING,
            &rsig::ECDSA_P256_SHA256_ASN1,
            &asig::ECDSA_P256_SHA256_ASN1,
            Curve::P256,
            "SHA256",
        ),
        (
            "ecdsa-p-384-sha-384/verify/64",
            &rsig::ECDSA_P384_SHA384_ASN1_SIGNING,
            &rsig::ECDSA_P384_SHA384_ASN1,
            &asig::ECDSA_P384_SHA384_ASN1,
            Curve::P384,
            "SHA384",
        ),
    ] {
        let pkcs8 = rsig::EcdsaKeyPair::generate_pkcs8(ring_sign, &rng).unwrap();
        let pair = rsig::EcdsaKeyPair::from_pkcs8(ring_sign, pkcs8.as_ref(), &rng).unwrap();
        let public = pair.public_key().as_ref().to_vec();
        let sig = pair.sign(&rng, &MESSAGE).unwrap().as_ref().to_vec();
        let (p1, p2, p3, p4) = (public.clone(), public.clone(), public.clone(), public);
        let template = ossl::Agreement::new(curve.group()).generate();
        let mut ov = OsslVerify::new(OsslPublic::Ec(template), Some(md), false);
        let p256 = matches!(curve, Curve::P256);
        verify_row(
            rows,
            name.into(),
            sig,
            move |s| {
                if p256 {
                    ecc::p256::PublicKey::from_sec1(&p1).unwrap().verify(&MESSAGE, s).is_ok()
                } else {
                    ecc::p384::PublicKey::from_sec1(&p1).unwrap().verify(&MESSAGE, s).is_ok()
                }
            },
            move |s| rsig::UnparsedPublicKey::new(ring_verify, &p2).verify(&MESSAGE, s).is_ok(),
            move |s| ov.verify(&p3, &[], s),
            move |s| asig::UnparsedPublicKey::new(aws_verify, &p4).verify(&MESSAGE, s).is_ok(),
        );
    }

    let keys: [(usize, &[u8]); 2] = [
        (2048, include_bytes!("../lib/crypto/tests/keys/rsa-2048.pk8")),
        (4096, include_bytes!("../lib/crypto/tests/keys/rsa-4096.pk8")),
    ];
    for (bits, pkcs8) in keys {
        let pair = rsig::RsaKeyPair::from_pkcs8(pkcs8).unwrap();
        let public: rsig::RsaPublicKeyComponents<Vec<u8>> = pair.public().into();
        for (scheme, padding, rv, av, pss) in [
            ("pkcs1", &rsig::RSA_PKCS1_SHA256 as &'static dyn rsig::RsaEncoding, &rsig::RSA_PKCS1_2048_8192_SHA256, &asig::RSA_PKCS1_2048_8192_SHA256, false),
            ("pss", &rsig::RSA_PSS_SHA256, &rsig::RSA_PSS_2048_8192_SHA256, &asig::RSA_PSS_2048_8192_SHA256, true),
        ] {
            let mut sig = vec![0; pair.public().modulus_len()];
            pair.sign(padding, &rng, &MESSAGE, &mut sig).unwrap();
            let (n, e) = (public.n.clone(), public.e.clone());
            let (n2, e2, n3, e3, n4, e4) = (n.clone(), e.clone(), n.clone(), e.clone(), n.clone(), e.clone());
            let mut ov = OsslVerify::new(OsslPublic::Rsa, Some("SHA256"), pss);
            verify_row(
                rows,
                format!("rsa-{bits}-{scheme}-sha-256/verify/64"),
                sig,
                move |s| {
                    let key = rsa::PublicKey::from_components(&n, &e).unwrap();
                    if pss {
                        key.verify_pss(rsa::Hash::Sha256, &MESSAGE, s).is_ok()
                    } else {
                        key.verify_pkcs1_v1_5(rsa::Hash::Sha256, &MESSAGE, s).is_ok()
                    }
                },
                move |s| rsig::RsaPublicKeyComponents { n: &n2, e: &e2 }.verify(rv, &MESSAGE, s).is_ok(),
                move |s| ov.verify(&n3, &e3, s),
                move |s| asig::RsaPublicKeyComponents { n: &n4, e: &e4 }.verify(av, &MESSAGE, s).is_ok(),
            );
        }
    }
}

/// ML-KEM-768, which ring lacks. Ours consumes its decapsulation key, so a
/// decapsulation includes the key's generation in every backend. OpenSSL's
/// and AWS-LC's keys are random, and their decapsulation takes ours's
/// ciphertext, which (being for another key) takes ML-KEM's implicit
/// rejection: constant-time, the same work.
fn ml_kem_rows(rows: &mut Vec<Row>) {
    use awslc::kem;
    use toyos_crypto::mlkem;
    const SEEDS: [u8; 64] = [0x3d; 64];
    const M: [u8; 32] = [0x4e; 32];
    let key = mlkem::DecapsulationKey::generate(&mut Fixed(&SEEDS)).unwrap();
    let public = key.public_key().as_bytes().to_vec();
    // Both libraries encapsulate to ours, ours decapsulates; ours
    // encapsulates to each, each decapsulates.
    let aws_to_ours = kem::EncapsulationKey::new(&kem::ML_KEM_768, &public).unwrap();
    let (ct, ss) = aws_to_ours.encapsulate().unwrap();
    assert_eq!(mlkem::DecapsulationKey::generate(&mut Fixed(&SEEDS)).unwrap().decapsulate(ct.as_ref()).unwrap().as_bytes(), ss.as_ref(), "aws-lc encapsulates to ours");
    let o_to_ours = ossl::kem::from_public(&public);
    let (ct, ss) = ossl::kem::encapsulate(&o_to_ours);
    assert_eq!(mlkem::DecapsulationKey::generate(&mut Fixed(&SEEDS)).unwrap().decapsulate(&ct).unwrap().as_bytes(), &ss, "openssl encapsulates to ours");
    let aws_key = kem::DecapsulationKey::generate(&kem::ML_KEM_768).unwrap();
    let aws_public = aws_key.encapsulation_key().unwrap().key_bytes().unwrap().as_ref().to_vec();
    let (ct, ss) = mlkem::EncapsulationKey::from_bytes(&aws_public).unwrap().encapsulate(&mut Fixed(&M)).unwrap();
    assert_eq!(aws_key.decapsulate(kem::Ciphertext::from(&ct[..])).unwrap().as_ref(), ss.as_bytes(), "ours encapsulates to aws-lc");
    let o_key = ossl::kem::generate();
    let (ct, ss) = mlkem::EncapsulationKey::from_bytes(&ossl::kem::public(&o_key)).unwrap().encapsulate(&mut Fixed(&M)).unwrap();
    assert_eq!(&ossl::kem::decapsulate(&o_key, &ct), ss.as_bytes(), "ours encapsulates to openssl");

    rows.push(row(
        "ml-kem-768/keygen",
        || || keep(mlkem::DecapsulationKey::generate(&mut Fixed(&SEEDS)).unwrap()),
        None,
        Some(looped(|| keep(ossl::kem::generate()))),
        Some(looped(|| keep(kem::DecapsulationKey::generate(&kem::ML_KEM_768).unwrap()))),
    ));
    let (pa, pb) = (public.clone(), public.clone());
    let o_to_ours = ossl::kem::from_public(&public);
    rows.push(row(
        "ml-kem-768/encapsulate",
        || {
            let public = mlkem::EncapsulationKey::from_bytes(&pa).unwrap();
            move || keep(public.encapsulate(&mut Fixed(&M)).unwrap())
        },
        None,
        Some(looped(move || keep(ossl::kem::encapsulate(&o_to_ours)))),
        Some({
            let key = kem::EncapsulationKey::new(&kem::ML_KEM_768, &pb).unwrap();
            looped(move || keep(key.encapsulate().unwrap()))
        }),
    ));
    let (ciphertext, _) = mlkem::EncapsulationKey::from_bytes(&public).unwrap().encapsulate(&mut Fixed(&M)).unwrap();
    rows.push(row(
        "ml-kem-768/keygen+decapsulate",
        move || {
            move || {
                let key = mlkem::DecapsulationKey::generate(&mut Fixed(&SEEDS)).unwrap();
                keep(key.decapsulate(&ciphertext).unwrap().as_bytes()[0]);
            }
        },
        None,
        Some(looped(move || {
            let key = ossl::kem::generate();
            keep(ossl::kem::decapsulate(&key, &ciphertext));
        })),
        Some(looped(move || {
            let key = kem::DecapsulationKey::generate(&kem::ML_KEM_768).unwrap();
            keep(key.decapsulate(kem::Ciphertext::from(&ciphertext[..])).unwrap());
        })),
    ));
}

/// Every library computes ours's answer at every length up to 1153 B: AEAD
/// seal, open and rejection with AAD of 0, 5 and 17 B, the OpenSSH packet,
/// SHA-2 and HMAC (keys shorter and longer than a block).
fn agree_at_every_length() {
    const MAX: usize = 1153;
    let source: Vec<u8> = (0..MAX + 256).map(|i| (i * 167 + 13) as u8).collect();
    let message = |len: usize| source[len % 61..][..len].to_vec();
    for alg in [Tls::Aes128, Tls::Aes256, Tls::ChaCha] {
        for aad_len in [0usize, 5, 17] {
            for len in 0..=MAX {
                aead_agrees(alg, &source[7..7 + aad_len], &message(len));
            }
        }
    }
    for len in 0..=MAX {
        ssh_agrees(len as u32 * 7919, &message(len));
        hashes_agree(&message(len), &source[..32], &source[..200]);
    }
    aes_gcm_agrees_past_its_steps();
}

/// AES-GCM at every length to 4200 B (up to 16 of the 512-bit path's 256-byte
/// steps, every way three to a reduction divides them, every tail), then
/// past its counter's carries out of the low byte (block 254) and the next
/// byte (block 65534), with AAD of 0, 5, 17, 256 and 800 B (the last two on
/// the 512-bit GHASH alone).
fn aes_gcm_agrees_past_its_steps() {
    const LONG: [usize; 6] = [16383, 16401, 65536, 65553, (1 << 20) + 17, (1 << 20) + 4096];
    let source: Vec<u8> = (0..LONG[5] + 1024).map(|i| (i * 167 + 13 + i / 251) as u8).collect();
    let message = |len: usize| &source[len % 61..][..len];
    for alg in [Tls::Aes128, Tls::Aes256] {
        for aad_len in [0usize, 5, 17, 256, 800] {
            let aad = &source[7..7 + aad_len];
            let lengths: Vec<usize> = if aad_len < 256 { (1154..=4200).chain(LONG).collect() } else { (0..=1100).step_by(13).chain(LONG).collect() };
            for len in lengths {
                aead_agrees(alg, aad, message(len));
            }
        }
    }
    println!("oracles: every library computes ours's AES-GCM answer to 4200 B and at {LONG:?} B");
}

fn isa() -> Vec<&'static str> {
    macro_rules! detected {
        ($($feature:tt),*) => {
            [$(($feature, std::is_x86_feature_detected!($feature))),*]
        };
    }
    let all = detected!(
        "aes", "pclmulqdq", "sha", "movbe", "bmi2", "adx", "avx", "avx2", "vaes", "vpclmulqdq", "avx512f", "avx512vl",
        "avx512bw", "avx512dq", "avx512ifma"
    );
    all.into_iter().filter(|(_, on)| *on).map(|(name, _)| name).collect()
}

fn main() {
    let build = if cfg!(feature = "unasserted") { "unasserted" } else { "shipped" };
    let filters: Vec<String> = std::env::args().skip(1).collect();
    println!("oracles: build={build} toyos-crypto={} ring=0.17.14 aws-lc-rs=1.18.2 aws-lc-sys=0.46.0(AWS-LC 5.11.0)", env!("TOYOS_REV"));
    println!("oracles: openssl={}", openssl::version::version());
    println!("oracles: isa={}", isa().join(","));
    agree_at_every_length();
    println!("oracles: every library computes ours's answer at every length to 1153 B");
    let mut rows = Vec::new();
    for alg in [Tls::Aes128, Tls::Aes256, Tls::ChaCha] {
        tls_rows(alg, &mut rows);
    }
    ssh_rows(&mut rows);
    hash_rows(&mut rows);
    agreement_rows(&mut rows);
    signature_rows(&mut rows);
    ml_kem_rows(&mut rows);
    println!("oracles: every row's inputs checked against ours ({} rows)", rows.len());
    if !filters.is_empty() {
        rows.retain(|r| filters.iter().any(|f| r.name.contains(f.as_str())));
    }
    let times = sampler::measure(&mut rows);
    for (row, t) in rows.iter().zip(&times) {
        for (b, samples) in t.iter().enumerate() {
            if !samples.is_empty() {
                let s: Vec<String> = samples.iter().map(|x| format!("{x:.2}")).collect();
                println!("samples: {} {} {}", row.name, BACKENDS[b], s.join(" "));
            }
        }
    }
    println!("oracles: row | toyos ns | ring ns | openssl ns | aws-lc ns | spread | toyos/ring | toyos/openssl | toyos/aws-lc");
    for (row, t) in rows.iter().zip(&times) {
        let ours: Vec<f64> = t[0].iter().zip(&t[1]).map(|(a, b)| (a + b) / 2.0).collect();
        let spread = sampler::quantile(t[0].iter().zip(&t[1]).map(|(a, b)| (a / b - 1.0).abs()), 9, 10);
        let median = |v: &[f64]| if v.is_empty() { "-".to_string() } else { format!("{:.1}", sampler::quantile(v.iter().copied(), 1, 2)) };
        let ratio = |r: &[f64]| {
            if r.is_empty() {
                "-".to_string()
            } else {
                format!("{:.3}", sampler::quantile(ours.iter().zip(r).map(|(o, r)| o / r), 1, 2))
            }
        };
        println!(
            "oracle: {} | {} | {} | {} | {} | {:.3} | {} | {} | {}",
            row.name,
            median(&ours),
            median(&t[2]),
            median(&t[3]),
            median(&t[4]),
            spread,
            ratio(&t[2]),
            ratio(&t[3]),
            ratio(&t[4])
        );
    }
    println!("oracles: end, {} rows", rows.len());
}

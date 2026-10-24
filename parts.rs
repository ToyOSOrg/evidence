//! chacha-avx2 additions (scratch): the AEAD's two halves alone, ChaCha20's
//! keystream and Poly1305, ours beside OpenSSL and AWS-LC, so a change to one
//! half is read without the other; and the core clock, from a chain of
//! dependent adds (one cycle each on Zen 2 and Tiger Lake), to read ns as cycles.

use crate::sampler::{looped, Row};
use crate::{keep, KEY};
use openssl::cipher::Cipher;
use openssl::cipher_ctx::CipherCtx;

const NONCE: [u8; 12] = [0x24; 12];

fn ossl_xor(ctx: &mut CipherCtx, buf: &mut [u8]) {
    // OpenSSL's ChaCha20 IV: the 32-bit little-endian counter, then the nonce.
    let mut iv = [0u8; 16];
    iv[0] = 1;
    iv[4..].copy_from_slice(&NONCE);
    ctx.encrypt_init(None, None, Some(&iv)).unwrap();
    let len = buf.len();
    ctx.cipher_update_inplace(buf, len).unwrap();
}

fn ossl_ctx() -> CipherCtx {
    let cipher = Cipher::fetch(None, "ChaCha20", None).unwrap();
    let mut ctx = CipherCtx::new().unwrap();
    ctx.encrypt_init(Some(&cipher), Some(&KEY[..32]), Some(&[0; 16])).unwrap();
    ctx
}

fn aws_xor(buf: &mut [u8]) {
    unsafe { aws_lc_sys::CRYPTO_chacha_20(buf.as_mut_ptr(), buf.as_ptr(), buf.len(), KEY.as_ptr(), NONCE.as_ptr(), 1) }
}

fn aws_poly(data: &[u8]) -> [u8; 16] {
    let mut state = [0u8; 512];
    let mut tag = [0u8; 16];
    unsafe {
        aws_lc_sys::CRYPTO_poly1305_init(&mut state, KEY.as_ptr());
        aws_lc_sys::CRYPTO_poly1305_update(&mut state, data.as_ptr(), data.len());
        aws_lc_sys::CRYPTO_poly1305_finish(&mut state, tag.as_mut_ptr());
    }
    tag
}

pub fn rows(rows: &mut Vec<Row>) {
    for len in [1024usize, 16384, 65536] {
        let data: Vec<u8> = (0..len).map(|i| (i * 31 + 7) as u8).collect();
        let mut ours = data.clone();
        toyos_crypto::chacha::xor(KEY[..32].try_into().unwrap(), &NONCE, 1, &mut ours).unwrap();
        let mut theirs = data.clone();
        ossl_xor(&mut ossl_ctx(), &mut theirs);
        assert!(theirs == ours, "openssl's chacha20 is ours at {len} B");
        let mut theirs = data.clone();
        aws_xor(&mut theirs);
        assert!(theirs == ours, "aws-lc's chacha20 is ours at {len} B");
        let ours_row = || {
            let mut buf = vec![0x70u8; len];
            move || toyos_crypto::chacha::xor(KEY[..32].try_into().unwrap(), &NONCE, 1, &mut buf).unwrap()
        };
        let (mut ob, mut ab, mut ctx) = (vec![0x70u8; len], vec![0x70u8; len], ossl_ctx());
        rows.push(Row {
            name: format!("chacha20/xor/{len}"),
            run: [
                Some(looped(ours_row())),
                Some(looped(ours_row())),
                None,
                Some(looped(move || ossl_xor(&mut ctx, &mut ob))),
                Some(looped(move || aws_xor(&mut ab))),
            ],
        });
        let key: [u8; 32] = KEY[..32].try_into().unwrap();
        assert_eq!(toyos_crypto::poly1305::tag(&key, &data), aws_poly(&data), "aws-lc's poly1305 is ours at {len} B");
        let mut mac = crate::ossl::Mac::new(c"POLY1305", None);
        let mut tag = [0u8; 16];
        mac.mac(&key, &[&data], &mut tag);
        assert_eq!(toyos_crypto::poly1305::tag(&key, &data), tag, "openssl's poly1305 is ours at {len} B");
        let ours_row = || {
            let data = data.clone();
            move || keep(toyos_crypto::poly1305::tag(&key, &data))
        };
        let (d1, d2) = (data.clone(), data.clone());
        rows.push(Row {
            name: format!("poly1305/{len}"),
            run: [
                Some(looped(ours_row())),
                Some(looped(ours_row())),
                None,
                Some(looped(move || {
                    let mut tag = [0u8; 16];
                    mac.mac(&key, &[&d1], &mut tag);
                    keep(tag)
                })),
                Some(looped(move || keep(aws_poly(&d2)))),
            ],
        });
    }
}

/// Nanoseconds per cycle, from 2^28 dependent adds, best of five.
pub fn clock() -> f64 {
    let mut best = f64::MAX;
    for _ in 0..5 {
        let start = std::time::Instant::now();
        let mut x = 0u64;
        unsafe {
            core::arch::asm!(
                "2:",
                ".rept 64", "add {x}, 1", ".endr",
                "dec {n}", "jnz 2b",
                x = inout(reg) x, n = inout(reg) (1u64 << 22) => _,
                options(nomem, nostack)
            );
        }
        keep(x);
        best = best.min(start.elapsed().as_nanos() as f64 / (64.0 * (1u64 << 22) as f64));
    }
    best
}

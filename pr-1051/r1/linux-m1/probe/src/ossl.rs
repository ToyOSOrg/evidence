//! OpenSSL 3 on its cheapest documented paths: algorithms fetched once,
//! contexts reused, keys scheduled once, as libssl itself holds them.

use std::ffi::{c_char, c_int, c_void, CStr};
use std::ptr;

use openssl::cipher::Cipher;
use openssl::cipher_ctx::CipherCtx;
use openssl::md::Md;
use openssl::md_ctx::MdCtx;
use openssl_sys as ffi;

unsafe extern "C" {
    fn OSSL_PARAM_construct_utf8_string(key: *const c_char, buf: *mut c_char, bsize: usize) -> ffi::OSSL_PARAM;
    fn EVP_PKEY_CTX_new_from_pkey(libctx: *mut c_void, pkey: *mut ffi::EVP_PKEY, propq: *const c_char) -> *mut ffi::EVP_PKEY_CTX;
    fn EVP_PKEY_CTX_set_group_name(ctx: *mut ffi::EVP_PKEY_CTX, name: *const c_char) -> c_int;
    fn EVP_PKEY_get1_encoded_public_key(pkey: *mut ffi::EVP_PKEY, out: *mut *mut u8) -> usize;
    fn EVP_PKEY_set1_encoded_public_key(pkey: *mut ffi::EVP_PKEY, public: *const u8, len: usize) -> c_int;
}

fn check(r: c_int, what: &str) {
    assert!(r > 0, "openssl: {what} failed: {:?}", openssl::error::ErrorStack::get());
}

fn nonnull<T>(p: *mut T, what: &str) -> *mut T {
    assert!(!p.is_null(), "openssl: {what} failed: {:?}", openssl::error::ErrorStack::get());
    p
}

/// A TLS record AEAD: the key scheduled once, each record re-initialised with
/// its nonce alone.
pub struct Aead {
    seal: CipherCtx,
    open: CipherCtx,
}

impl Aead {
    pub fn new(name: &str, key: &[u8], iv: &[u8; 12]) -> Aead {
        let cipher = Cipher::fetch(None, name, None).expect("fetch cipher");
        let mut seal = CipherCtx::new().unwrap();
        seal.encrypt_init(Some(&cipher), Some(key), Some(iv)).unwrap();
        let mut open = CipherCtx::new().unwrap();
        open.decrypt_init(Some(&cipher), Some(key), Some(iv)).unwrap();
        Aead { seal, open }
    }

    pub fn seal(&mut self, nonce: &[u8; 12], aad: &[u8], buf: &mut [u8]) -> [u8; 16] {
        let c = &mut self.seal;
        c.encrypt_init(None, None, Some(nonce)).unwrap();
        c.cipher_update(aad, None).unwrap();
        if !buf.is_empty() {
            let len = buf.len();
            c.cipher_update_inplace(buf, len).unwrap();
        }
        c.cipher_final(&mut []).unwrap();
        let mut tag = [0; 16];
        c.tag(&mut tag).unwrap();
        tag
    }

    pub fn open(&mut self, nonce: &[u8; 12], aad: &[u8], buf: &mut [u8], tag: &[u8; 16]) -> bool {
        let c = &mut self.open;
        c.decrypt_init(None, None, Some(nonce)).unwrap();
        c.set_tag(tag).unwrap();
        c.cipher_update(aad, None).unwrap();
        if !buf.is_empty() {
            let len = buf.len();
            c.cipher_update_inplace(buf, len).unwrap();
        }
        c.cipher_final(&mut []).is_ok()
    }
}

/// A reused digest context on a fetched digest.
pub struct Digest {
    md: Md,
    ctx: MdCtx,
}

impl Digest {
    pub fn new(name: &str) -> Digest {
        Digest { md: Md::fetch(None, name, None).expect("fetch digest"), ctx: MdCtx::new().unwrap() }
    }

    pub fn digest(&mut self, data: &[u8], out: &mut [u8]) {
        self.ctx.digest_init(&self.md).unwrap();
        self.ctx.digest_update(data).unwrap();
        self.ctx.digest_final(out).unwrap();
    }
}

/// An EVP_MAC context, fetched once and re-keyed per message.
pub struct Mac(*mut ffi::EVP_MAC_CTX);

impl Mac {
    /// `name` is "HMAC" with `digest`, or "POLY1305" without.
    pub fn new(name: &CStr, digest: Option<&CStr>) -> Mac {
        unsafe {
            let mac = nonnull(ffi::EVP_MAC_fetch(ptr::null_mut(), name.as_ptr(), ptr::null()), "EVP_MAC_fetch");
            let ctx = nonnull(ffi::EVP_MAC_CTX_new(mac), "EVP_MAC_CTX_new");
            ffi::EVP_MAC_free(mac);
            if let Some(digest) = digest {
                let params = [
                    OSSL_PARAM_construct_utf8_string(c"digest".as_ptr(), digest.as_ptr() as *mut c_char, 0),
                    ffi::OSSL_PARAM_construct_end(),
                ];
                check(ffi::EVP_MAC_CTX_set_params(ctx, params.as_ptr()), "EVP_MAC_CTX_set_params");
            }
            Mac(ctx)
        }
    }

    pub fn mac(&mut self, key: &[u8], parts: &[&[u8]], out: &mut [u8]) {
        unsafe {
            check(ffi::EVP_MAC_init(self.0, key.as_ptr(), key.len(), ptr::null()), "EVP_MAC_init");
            for part in parts {
                check(ffi::EVP_MAC_update(self.0, part.as_ptr(), part.len()), "EVP_MAC_update");
            }
            let mut len = 0;
            check(ffi::EVP_MAC_final(self.0, out.as_mut_ptr(), &mut len, out.len()), "EVP_MAC_final");
            assert_eq!(len, out.len());
        }
    }
}

/// HKDF extract-and-expand on a fetched KDF and a reused context.
pub struct Hkdf {
    ctx: *mut ffi::EVP_KDF_CTX,
    digest: &'static CStr,
}

impl Hkdf {
    pub fn new(digest: &'static CStr) -> Hkdf {
        unsafe {
            let kdf = nonnull(ffi::EVP_KDF_fetch(ptr::null_mut(), c"HKDF".as_ptr(), ptr::null()), "EVP_KDF_fetch");
            let ctx = nonnull(ffi::EVP_KDF_CTX_new(kdf), "EVP_KDF_CTX_new");
            ffi::EVP_KDF_free(kdf);
            Hkdf { ctx, digest }
        }
    }

    pub fn derive(&mut self, salt: &[u8], ikm: &[u8], info: &[u8], out: &mut [u8]) {
        unsafe {
            let params = [
                OSSL_PARAM_construct_utf8_string(c"digest".as_ptr(), self.digest.as_ptr() as *mut c_char, 0),
                ffi::OSSL_PARAM_construct_octet_string(c"key".as_ptr(), ikm.as_ptr() as *mut c_void, ikm.len()),
                ffi::OSSL_PARAM_construct_octet_string(c"salt".as_ptr(), salt.as_ptr() as *mut c_void, salt.len()),
                ffi::OSSL_PARAM_construct_octet_string(c"info".as_ptr(), info.as_ptr() as *mut c_void, info.len()),
                ffi::OSSL_PARAM_construct_end(),
            ];
            check(ffi::EVP_KDF_derive(self.ctx, out.as_mut_ptr(), out.len(), params.as_ptr()), "EVP_KDF_derive");
        }
    }
}

/// `chacha20-poly1305@openssh.com` as OpenSSH composes it on libcrypto
/// (PROTOCOL.chacha20poly1305): EVP ChaCha20 with a 16-byte IV of block
/// counter (32-bit little-endian) and the sequence number (64-bit big-endian
/// in the last eight bytes), and libcrypto's Poly1305 MAC.
pub struct Ssh {
    main: CipherCtx,
    header: CipherCtx,
    poly: Mac,
}

impl Ssh {
    pub fn new(key: &[u8; 64]) -> Ssh {
        let cipher = Cipher::fetch(None, "ChaCha20", None).expect("fetch chacha20");
        let mut main = CipherCtx::new().unwrap();
        main.encrypt_init(Some(&cipher), Some(&key[..32]), Some(&[0; 16])).unwrap();
        let mut header = CipherCtx::new().unwrap();
        header.encrypt_init(Some(&cipher), Some(&key[32..]), Some(&[0; 16])).unwrap();
        Ssh { main, header, poly: Mac::new(c"POLY1305", None) }
    }

    fn iv(sequence: u32, counter: u8) -> [u8; 16] {
        let mut iv = [0; 16];
        iv[0] = counter;
        iv[8..].copy_from_slice(&u64::from(sequence).to_be_bytes());
        iv
    }

    fn xor(ctx: &mut CipherCtx, iv: &[u8; 16], buf: &mut [u8]) {
        ctx.encrypt_init(None, None, Some(iv)).unwrap();
        if !buf.is_empty() {
            let len = buf.len();
            ctx.cipher_update_inplace(buf, len).unwrap();
        }
    }

    fn poly_key(&mut self, sequence: u32) -> [u8; 32] {
        let mut key = [0; 32];
        Self::xor(&mut self.main, &Self::iv(sequence, 0), &mut key);
        key
    }

    /// `packet` is the length field, then the payload.
    pub fn seal(&mut self, sequence: u32, packet: &mut [u8], tag: &mut [u8; 16]) {
        let poly_key = self.poly_key(sequence);
        Self::xor(&mut self.header, &Self::iv(sequence, 0), &mut packet[..4]);
        Self::xor(&mut self.main, &Self::iv(sequence, 1), &mut packet[4..]);
        self.poly.mac(&poly_key, &[packet], tag);
    }

    pub fn packet_length(&mut self, sequence: u32, mut encrypted: [u8; 4]) -> [u8; 4] {
        Self::xor(&mut self.header, &Self::iv(sequence, 0), &mut encrypted);
        encrypted
    }

    /// Authenticates, then decrypts the payload in place.
    pub fn open(&mut self, sequence: u32, packet: &mut [u8], tag: &[u8; 16]) -> bool {
        let poly_key = self.poly_key(sequence);
        let mut expected = [0; 16];
        self.poly.mac(&poly_key, &[packet], &mut expected);
        if !openssl::memcmp::eq(&expected, tag) {
            return false;
        }
        Self::xor(&mut self.main, &Self::iv(sequence, 1), &mut packet[4..]);
        true
    }
}

/// A key agreement on X25519 or a NIST group, as libssl makes one: a key
/// generated from a context prepared once, its encoded public key, the
/// peer's key from its encoding by the parameters of ours, and the derive.
pub struct Agreement {
    keygen: *mut ffi::EVP_PKEY_CTX,
}

pub struct Key(pub *mut ffi::EVP_PKEY);

impl Drop for Key {
    fn drop(&mut self) {
        unsafe { ffi::EVP_PKEY_free(self.0) }
    }
}

impl Agreement {
    /// `group` is None for X25519, or "P-256" or "P-384".
    pub fn new(group: Option<&CStr>) -> Agreement {
        unsafe {
            let name = if group.is_some() { c"EC" } else { c"X25519" };
            let keygen = nonnull(ffi::EVP_PKEY_CTX_new_from_name(ptr::null_mut(), name.as_ptr(), ptr::null()), "CTX_new_from_name");
            check(ffi::EVP_PKEY_keygen_init(keygen), "keygen_init");
            if let Some(group) = group {
                check(EVP_PKEY_CTX_set_group_name(keygen, group.as_ptr()), "set_group_name");
            }
            Agreement { keygen }
        }
    }

    pub fn generate(&self) -> Key {
        let mut key = ptr::null_mut();
        unsafe { check(ffi::EVP_PKEY_keygen(self.keygen, &mut key), "keygen") };
        Key(key)
    }

    pub fn public(key: &Key) -> Vec<u8> {
        unsafe {
            let mut out = ptr::null_mut();
            let len = EVP_PKEY_get1_encoded_public_key(key.0, &mut out);
            assert!(len > 0, "get1_encoded_public_key");
            let public = std::slice::from_raw_parts(out, len).to_vec();
            ffi::CRYPTO_free(out.cast(), c"".as_ptr(), 0);
            public
        }
    }

    pub fn peer(ours: &Key, encoded: &[u8]) -> Key {
        unsafe {
            let peer = Key(nonnull(ffi::EVP_PKEY_new(), "EVP_PKEY_new"));
            check(ffi::EVP_PKEY_copy_parameters(peer.0, ours.0), "copy_parameters");
            check(EVP_PKEY_set1_encoded_public_key(peer.0, encoded.as_ptr(), encoded.len()), "set1_encoded_public_key");
            peer
        }
    }

    pub fn derive(ours: &Key, peer: &Key) -> Vec<u8> {
        unsafe {
            let ctx = nonnull(EVP_PKEY_CTX_new_from_pkey(ptr::null_mut(), ours.0, ptr::null()), "CTX_new_from_pkey");
            check(ffi::EVP_PKEY_derive_init(ctx), "derive_init");
            check(ffi::EVP_PKEY_derive_set_peer(ctx, peer.0), "derive_set_peer");
            let mut len = 0;
            check(ffi::EVP_PKEY_derive(ctx, ptr::null_mut(), &mut len), "derive length");
            let mut secret = vec![0; len];
            check(ffi::EVP_PKEY_derive(ctx, secret.as_mut_ptr(), &mut len), "derive");
            secret.truncate(len);
            ffi::EVP_PKEY_CTX_free(ctx);
            secret
        }
    }

    /// The whole agreement a handshake makes: generate, encode, parse the
    /// peer, derive.
    pub fn agree(&self, peer_encoded: &[u8]) -> (Vec<u8>, Vec<u8>) {
        let key = self.generate();
        let public = Self::public(&key);
        let peer = Self::peer(&key, peer_encoded);
        (public, Self::derive(&key, &peer))
    }
}

/// ML-KEM-768 through EVP_PKEY.
pub mod kem {
    use super::*;

    pub fn generate() -> Key {
        unsafe {
            let ctx = nonnull(ffi::EVP_PKEY_CTX_new_from_name(ptr::null_mut(), c"ML-KEM-768".as_ptr(), ptr::null()), "CTX_new_from_name");
            check(ffi::EVP_PKEY_keygen_init(ctx), "keygen_init");
            let mut key = ptr::null_mut();
            check(ffi::EVP_PKEY_keygen(ctx, &mut key), "keygen");
            ffi::EVP_PKEY_CTX_free(ctx);
            Key(key)
        }
    }

    pub fn public(key: &Key) -> Vec<u8> {
        Agreement::public(key)
    }

    pub fn from_public(encoded: &[u8]) -> Key {
        unsafe {
            Key(nonnull(
                ffi::EVP_PKEY_new_raw_public_key_ex(ptr::null_mut(), c"ML-KEM-768".as_ptr(), ptr::null(), encoded.as_ptr(), encoded.len()),
                "new_raw_public_key_ex",
            ))
        }
    }

    /// (ciphertext, shared secret)
    pub fn encapsulate(key: &Key) -> (Vec<u8>, [u8; 32]) {
        unsafe {
            let ctx = nonnull(EVP_PKEY_CTX_new_from_pkey(ptr::null_mut(), key.0, ptr::null()), "CTX_new_from_pkey");
            check(ffi::EVP_PKEY_encapsulate_init(ctx, ptr::null()), "encapsulate_init");
            let (mut ct, mut ss) = (vec![0u8; 1088], [0u8; 32]);
            let (mut ctlen, mut sslen) = (ct.len(), ss.len());
            check(ffi::EVP_PKEY_encapsulate(ctx, ct.as_mut_ptr(), &mut ctlen, ss.as_mut_ptr(), &mut sslen), "encapsulate");
            assert_eq!((ctlen, sslen), (1088, 32));
            ffi::EVP_PKEY_CTX_free(ctx);
            (ct, ss)
        }
    }

    pub fn decapsulate(key: &Key, ciphertext: &[u8]) -> [u8; 32] {
        unsafe {
            let ctx = nonnull(EVP_PKEY_CTX_new_from_pkey(ptr::null_mut(), key.0, ptr::null()), "CTX_new_from_pkey");
            check(ffi::EVP_PKEY_decapsulate_init(ctx, ptr::null()), "decapsulate_init");
            let mut ss = [0u8; 32];
            let mut sslen = ss.len();
            check(ffi::EVP_PKEY_decapsulate(ctx, ss.as_mut_ptr(), &mut sslen, ciphertext.as_ptr(), ciphertext.len()), "decapsulate");
            assert_eq!(sslen, 32);
            ffi::EVP_PKEY_CTX_free(ctx);
            ss
        }
    }
}

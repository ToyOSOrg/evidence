//! SP 800-38D GCM, restricted to the 96-bit nonces TLS uses. GHASH is a fixed
//! 128-step portable multiply or a CLMUL/PMULL path, without data-indexed tables.
//! Content does not affect addresses or branches. Authentication precedes
//! plaintext release.

use crate::{Error, aes::Aes, secret::Secret};

fn multiply(a: u128, mut b: u128) -> u128 {
    let mut product = 0;
    for bit in (0..128).rev() {
        let mask = 0u128.wrapping_sub(u128::from(crate::ct::opaque(((a >> bit) & 1) as u64)));
        product ^= b & mask;
        let reduce = 0u128.wrapping_sub(u128::from(crate::ct::opaque((b & 1) as u64)));
        b = (b >> 1) ^ (0xe1000000000000000000000000000000 & reduce);
    }
    product
}

pub(crate) struct Gcm {
    aes: Aes,
    h: Secret<16>,
    hardware: bool,
}
impl Gcm {
    pub(crate) fn aes128(key: &[u8; 16]) -> Self {
        Self::new(Aes::aes128(key))
    }
    pub(crate) fn aes256(key: &[u8; 32]) -> Self {
        Self::new(Aes::aes256(key))
    }
    fn new(aes: Aes) -> Self {
        let mut h = Secret([0; 16]);
        aes.encrypt(&mut h.0);
        Self {
            aes,
            h,
            hardware: crate::arch::clmul_available(),
        }
    }
    fn multiply(&self, a: u128, b: u128) -> u128 {
        if self.hardware {
            crate::arch::ghash(a, b)
        } else {
            multiply(a, b)
        }
    }
    fn check(aad: usize, data: usize) -> Result<(), Error> {
        if data as u128 > (1u128 << 36) - 32 || aad as u128 > u64::MAX as u128 / 8 {
            Err(Error::Length)
        } else {
            Ok(())
        }
    }
    fn tag(&self, nonce: &[u8; 12], aad: &[u8], data: &[u8]) -> [u8; 16] {
        let mut state = Secret([0u8; 16]);
        for input in [aad, data] {
            for chunk in input.chunks(16) {
                for (s, &b) in state.0.iter_mut().zip(chunk) {
                    *s ^= b;
                }
                state.0 = self
                    .multiply(u128::from_be_bytes(state.0), u128::from_be_bytes(self.h.0))
                    .to_be_bytes();
            }
        }
        let lengths = ((aad.len() as u128 * 8) << 64) | (data.len() as u128 * 8);
        state.0 = self
            .multiply(
                u128::from_be_bytes(state.0) ^ lengths,
                u128::from_be_bytes(self.h.0),
            )
            .to_be_bytes();
        let mut j = Secret([0u8; 16]);
        j.0[..12].copy_from_slice(nonce);
        j.0[15] = 1;
        self.aes.encrypt(&mut j.0);
        core::array::from_fn(|i| state.0[i] ^ j.0[i])
    }
    fn xor(&self, nonce: &[u8; 12], data: &mut [u8]) {
        let mut stream = Secret([0; 16]);
        stream.0[..12].copy_from_slice(nonce);
        for (i, chunk) in data.chunks_mut(16).enumerate() {
            stream.0[..12].copy_from_slice(nonce);
            stream.0[12..].copy_from_slice(&(i as u32 + 2).to_be_bytes());
            self.aes.encrypt(&mut stream.0);
            for (b, &s) in chunk.iter_mut().zip(&stream.0) {
                *b ^= s;
            }
        }
    }
    pub(crate) fn seal(
        &self,
        nonce: &[u8; 12],
        aad: &[u8],
        data: &mut [u8],
    ) -> Result<[u8; 16], Error> {
        Self::check(aad.len(), data.len())?;
        self.xor(nonce, data);
        Ok(self.tag(nonce, aad, data))
    }
    pub(crate) fn open(
        &self,
        nonce: &[u8; 12],
        aad: &[u8],
        data: &mut [u8],
        tag: &[u8],
    ) -> Result<(), Error> {
        Self::check(aad.len(), data.len())?;
        if !crate::ct::equal(&self.tag(nonce, aad, data), tag) {
            return Err(Error::Authentication);
        }
        self.xor(nonce, data);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn clmul_matches_portable_field_and_reports_dispatch() {
        let admitted = crate::arch::clmul_available();
        std::println!("GHASH acceleration admitted: {admitted}");
        if admitted {
            for i in 0..256 {
                let a = (i as u128).wrapping_mul(0x9e3779b97f4a7c15fedcba9876543210);
                let b = !a.rotate_left(i % 128);
                assert_eq!(crate::arch::ghash(a, b), multiply(a, b));
            }
        }
        assert_eq!(Gcm::check(0, usize::MAX), Err(Error::Length));
    }
}

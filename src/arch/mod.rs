//! Instruction dispatch is public. UEFI assembly saves and restores every used
//! XMM register; ordinary hosts use the target's ABI. No AVX instruction is used.
//! Callers must arrange OS permission to execute SIMD and homogeneous features
//! on every CPU to which an imported key can migrate.

#[cfg(target_arch = "aarch64")]
mod aarch64;
#[cfg(target_arch = "x86_64")]
mod x86_64;

#[cfg(target_arch = "aarch64")]
pub use aarch64::cpu;
#[cfg(not(target_arch = "aarch64"))]
pub mod cpu {
    //! CPU permission bridges. x86-64 detects capabilities through CPUID.
}

pub(crate) fn aes_available() -> bool {
    #[cfg(target_arch = "x86_64")]
    {
        x86_64::aes_available()
    }
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::aes_available()
    }
    #[cfg(not(any(target_arch = "x86_64", target_arch = "aarch64")))]
    {
        false
    }
}

pub(crate) fn clmul_available() -> bool {
    #[cfg(target_arch = "x86_64")]
    {
        x86_64::clmul_available()
    }
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::clmul_available()
    }
    #[cfg(not(any(target_arch = "x86_64", target_arch = "aarch64")))]
    {
        false
    }
}
pub(crate) fn ghash(a: u128, b: u128) -> u128 {
    #[cfg(target_arch = "x86_64")]
    {
        x86_64::ghash(a, b)
    }
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::ghash(a, b)
    }
    #[cfg(not(any(target_arch = "x86_64", target_arch = "aarch64")))]
    {
        let _ = (a, b);
        unreachable!("CLMUL dispatch")
    }
}

pub(crate) fn ghash_blocks(h: &[u8; 16], state: &mut [u8; 16], blocks: &[[u8; 16]]) {
    #[cfg(target_arch = "aarch64")]
    aarch64::ghash_blocks(h, state, blocks);
    #[cfg(not(target_arch = "aarch64"))]
    for block in blocks {
        *state = ghash(
            u128::from_be_bytes(*state) ^ u128::from_be_bytes(*block),
            u128::from_be_bytes(*h),
        )
        .to_be_bytes();
    }
}
pub(crate) fn aes_encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    #[cfg(target_arch = "x86_64")]
    {
        x86_64::aes_encrypt(keys, rounds, block);
    }
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::aes_encrypt(keys, rounds, block);
    }
    #[cfg(not(any(target_arch = "x86_64", target_arch = "aarch64")))]
    {
        let _ = (keys, rounds, block);
        unreachable!("instruction dispatch");
    }
}

pub(crate) fn aes_ctr(keys: &[u8; 240], rounds: usize, nonce: &[u8; 12], data: &mut [u8]) -> bool {
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::aes_ctr(keys, rounds, nonce, data);
        true
    }
    #[cfg(not(target_arch = "aarch64"))]
    {
        let _ = (keys, rounds, nonce, data);
        false
    }
}

pub(crate) fn aes_subword(word: &mut [u8; 4]) -> bool {
    #[cfg(target_arch = "aarch64")]
    {
        aarch64::aes_subword(word);
        true
    }
    #[cfg(not(target_arch = "aarch64"))]
    {
        let _ = word;
        false
    }
}

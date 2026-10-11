//! Instruction dispatch is public. UEFI assembly saves and restores every used
//! XMM register; ordinary hosts use the target's ABI. No AVX instruction is used.
//! Callers must arrange OS permission to execute SIMD and homogeneous features
//! on every CPU to which an imported key can migrate.

#[cfg(target_arch = "aarch64")]
mod aarch64;
#[cfg(target_arch = "x86_64")]
mod x86_64;

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

//! Instruction dispatch is public. UEFI assembly saves and restores every used
//! XMM register; ordinary hosts use the target's ABI. No AVX instruction is used.
//! Callers must arrange OS permission to execute SIMD and homogeneous features
//! on every CPU to which an imported key can migrate. Bare-metal x86 and
//! soft-float ARM exclude SIMD implementations: interrupted task state is not
//! owned by the kernel, and vector intrinsics violate the soft-float ABI.
//! Those targets are outside this crate's consumer scope and fail compilation.

#[cfg(any(
    all(target_arch = "x86_64", target_os = "none"),
    all(target_arch = "aarch64", target_abi = "softfloat")
))]
compile_error!(
    "toyos-crypto supports userland and the UEFI loader; bare-metal kernel targets are unsupported"
);

#[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
mod aarch64;
#[cfg(all(target_arch = "x86_64", not(target_os = "none")))]
mod x86_64;

#[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
pub use aarch64::cpu;
#[cfg(not(all(target_arch = "aarch64", not(target_abi = "softfloat"))))]
pub mod cpu {
    //! CPU permission bridges. Bare-metal x86 and soft-float ARM stay portable;
    //! ordinary x86 hosts detect capabilities through CPUID.
}

pub(crate) fn aes_available() -> bool {
    #[cfg(all(target_arch = "x86_64", not(target_os = "none")))]
    {
        x86_64::aes_available()
    }
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::aes_available()
    }
    #[cfg(not(any(
        all(target_arch = "x86_64", not(target_os = "none")),
        all(target_arch = "aarch64", not(target_abi = "softfloat"))
    )))]
    {
        false
    }
}

pub(crate) fn clmul_available() -> bool {
    #[cfg(all(target_arch = "x86_64", not(target_os = "none")))]
    {
        x86_64::clmul_available()
    }
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::clmul_available()
    }
    #[cfg(not(any(
        all(target_arch = "x86_64", not(target_os = "none")),
        all(target_arch = "aarch64", not(target_abi = "softfloat"))
    )))]
    {
        false
    }
}
pub(crate) fn ghash(a: u128, b: u128) -> u128 {
    #[cfg(all(target_arch = "x86_64", not(target_os = "none")))]
    {
        x86_64::ghash(a, b)
    }
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::ghash(a, b)
    }
    #[cfg(not(any(
        all(target_arch = "x86_64", not(target_os = "none")),
        all(target_arch = "aarch64", not(target_abi = "softfloat"))
    )))]
    {
        let _ = (a, b);
        unreachable!("CLMUL dispatch")
    }
}

pub(crate) fn ghash_blocks(h: &[u8; 16], state: &mut [u8; 16], blocks: &[[u8; 16]]) {
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    aarch64::ghash_blocks(h, state, blocks);
    #[cfg(not(all(target_arch = "aarch64", not(target_abi = "softfloat"))))]
    for block in blocks {
        *state = ghash(
            u128::from_be_bytes(*state) ^ u128::from_be_bytes(*block),
            u128::from_be_bytes(*h),
        )
        .to_be_bytes();
    }
}
pub(crate) fn aes_encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    #[cfg(all(target_arch = "x86_64", not(target_os = "none")))]
    {
        x86_64::aes_encrypt(keys, rounds, block);
    }
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::aes_encrypt(keys, rounds, block);
    }
    #[cfg(not(any(
        all(target_arch = "x86_64", not(target_os = "none")),
        all(target_arch = "aarch64", not(target_abi = "softfloat"))
    )))]
    {
        let _ = (keys, rounds, block);
        unreachable!("instruction dispatch");
    }
}

pub(crate) fn aes_ctr(keys: &[u8; 240], rounds: usize, nonce: &[u8; 12], data: &mut [u8]) -> bool {
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::aes_ctr(keys, rounds, nonce, data);
        true
    }
    #[cfg(not(all(target_arch = "aarch64", not(target_abi = "softfloat"))))]
    {
        let _ = (keys, rounds, nonce, data);
        false
    }
}

pub(crate) fn aes_subword(word: &mut [u8; 4]) -> bool {
    #[cfg(all(target_arch = "aarch64", not(target_abi = "softfloat")))]
    {
        aarch64::aes_subword(word);
        true
    }
    #[cfg(not(all(target_arch = "aarch64", not(target_abi = "softfloat"))))]
    {
        let _ = word;
        false
    }
}

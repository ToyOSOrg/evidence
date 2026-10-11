//! ARMv8 AES/PMULL through Rust intrinsics. Host `std` reads OS capability
//! metadata. Without std, the OS admits features through the ID-register bridge;
//! blindly reading an EL1 ID register at EL0 can trap, so the default is portable.
use core::arch::aarch64::*;
pub(super) fn aes_available() -> bool {
    if cfg!(feature = "portable") {
        return false;
    }
    if let Some(flags) = crate::cpu::arm_features() {
        return flags & 1 != 0;
    }
    #[cfg(feature = "std")]
    {
        !cfg!(feature = "portable") && std::arch::is_aarch64_feature_detected!("aes")
    }
    #[cfg(not(feature = "std"))]
    {
        false
    }
}
pub(super) fn clmul_available() -> bool {
    if cfg!(feature = "portable") {
        return false;
    }
    if let Some(flags) = crate::cpu::arm_features() {
        return flags & 2 != 0;
    }
    #[cfg(feature = "std")]
    {
        !cfg!(feature = "portable") && std::arch::is_aarch64_feature_detected!("pmull")
    }
    #[cfg(not(feature = "std"))]
    {
        false
    }
}
#[target_feature(enable = "aes,neon")]
unsafe fn encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    // Each unaligned vector load/store stays within its fixed-size array.
    unsafe {
        let mut state = vld1q_u8(block.as_ptr());
        for i in 0..rounds - 1 {
            state = vaesmcq_u8(vaeseq_u8(state, vld1q_u8(keys.as_ptr().add(16 * i))))
        }
        state = vaeseq_u8(state, vld1q_u8(keys.as_ptr().add(16 * (rounds - 1))));
        state = veorq_u8(state, vld1q_u8(keys.as_ptr().add(16 * rounds)));
        vst1q_u8(block.as_mut_ptr(), state)
    }
}
pub(super) fn aes_encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    // The dispatch guard admitted AES and the AArch64 ABI preserves its registers.
    unsafe { encrypt(keys, rounds, block) }
}
#[target_feature(enable = "aes,neon")]
unsafe fn product(a: u128, b: u128) -> (u128, u128) {
    let lo = vmull_p64(a as u64, b as u64);
    let hi = vmull_p64((a >> 64) as u64, (b >> 64) as u64);
    let mid = vmull_p64(
        (a as u64) ^ ((a >> 64) as u64),
        (b as u64) ^ ((b >> 64) as u64),
    ) ^ lo
        ^ hi;
    (lo ^ (mid << 64), hi ^ (mid >> 64))
}
pub(super) fn ghash(a: u128, b: u128) -> u128 {
    // The dispatch guard admitted PMULL; the operands are reflected coefficients.
    let (low, high) = unsafe { product(a.reverse_bits(), b.reverse_bits()) };
    let carry = (high >> 127) ^ (high >> 126) ^ (high >> 121);
    (low ^ high
        ^ (high << 1)
        ^ (high << 2)
        ^ (high << 7)
        ^ carry
        ^ (carry << 1)
        ^ (carry << 2)
        ^ (carry << 7))
        .reverse_bits()
}

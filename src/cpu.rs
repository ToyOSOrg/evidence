//! CPU permission boundary for a kernel or OS without std capability metadata.
//! Ordinary hosts detect through CPUID or std's OS metadata. AArch64 without
//! std stays portable until its OS initializes this bridge at a permitted EL.

#[cfg(target_arch = "aarch64")]
use core::sync::atomic::{AtomicU8, Ordering};
#[cfg(target_arch = "aarch64")]
static ARM: AtomicU8 = AtomicU8::new(0);

/// Admits ARMv8 AES/PMULL from ID_AA64ISAR0_EL1 for subsequent key imports.
///
/// # Safety
/// The current exception level must permit this ID register read and SIMD use.
/// Every CPU on which keys may subsequently run must support the admitted
/// features. The OS must preserve the AArch64 ABI's SIMD state across context
/// switches and exceptions. Call during OS initialization, before importing keys.
#[cfg(target_arch = "aarch64")]
pub unsafe fn initialize_aarch64() {
    let id: u64;
    // The caller established ID-register permission at this exception level.
    unsafe {
        core::arch::asm!("mrs {id}, ID_AA64ISAR0_EL1",id=out(reg) id,options(nomem,nostack,preserves_flags))
    }
    let aes = (id >> 4) & 15;
    let flags = 4 | u8::from(aes == 1 || aes == 2) | (u8::from(aes == 2) << 1);
    ARM.store(flags, Ordering::Release);
}
#[cfg(target_arch = "aarch64")]
pub(crate) fn arm_features() -> Option<u8> {
    let flags = ARM.load(Ordering::Acquire);
    if flags & 4 == 0 { None } else { Some(flags) }
}

//! ARMv8 AES/PMULL through Rust intrinsics. Host `std` reads OS capability
//! metadata. Without std, the OS admits features through the ID-register bridge;
//! blindly reading an EL1 ID register at EL0 can trap, so the default is portable.
use core::arch::aarch64::*;

pub mod cpu {
    //! CPU permission boundary for an OS without std capability metadata.
    //! Hosts use std's OS metadata; no_std stays portable until initialization.
    use core::sync::atomic::{AtomicU8, Ordering};
    static ARM: AtomicU8 = AtomicU8::new(0);

    /// Admits ARMv8 AES/PMULL from ID_AA64ISAR0_EL1 for subsequent key imports.
    ///
    /// # Safety
    /// The current exception level must permit this ID register read and SIMD use.
    /// Every CPU on which keys may subsequently run must support the admitted
    /// features. The OS must preserve SIMD state across context switches and
    /// exceptions. Call during OS initialization, before importing keys.
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
    pub(super) fn arm_features() -> Option<u8> {
        let flags = ARM.load(Ordering::Acquire);
        if flags & 4 == 0 { None } else { Some(flags) }
    }
}
pub(super) fn aes_available() -> bool {
    if cfg!(feature = "portable") {
        return false;
    }
    if let Some(flags) = cpu::arm_features() {
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
    if let Some(flags) = cpu::arm_features() {
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
unsafe fn encrypt_four(keys: &[u8; 240], rounds: usize, blocks: &mut [[u8; 16]; 4]) {
    // Every vector access is contained in one block or one schedule round.
    unsafe {
        let mut a = vld1q_u8(blocks[0].as_ptr());
        let mut b = vld1q_u8(blocks[1].as_ptr());
        let mut c = vld1q_u8(blocks[2].as_ptr());
        let mut d = vld1q_u8(blocks[3].as_ptr());
        for i in 0..rounds - 1 {
            let key = vld1q_u8(keys.as_ptr().add(16 * i));
            a = vaesmcq_u8(vaeseq_u8(a, key));
            b = vaesmcq_u8(vaeseq_u8(b, key));
            c = vaesmcq_u8(vaeseq_u8(c, key));
            d = vaesmcq_u8(vaeseq_u8(d, key));
        }
        let key = vld1q_u8(keys.as_ptr().add(16 * (rounds - 1)));
        let last = vld1q_u8(keys.as_ptr().add(16 * rounds));
        vst1q_u8(blocks[0].as_mut_ptr(), veorq_u8(vaeseq_u8(a, key), last));
        vst1q_u8(blocks[1].as_mut_ptr(), veorq_u8(vaeseq_u8(b, key), last));
        vst1q_u8(blocks[2].as_mut_ptr(), veorq_u8(vaeseq_u8(c, key), last));
        vst1q_u8(blocks[3].as_mut_ptr(), veorq_u8(vaeseq_u8(d, key), last));
    }
}
pub(super) fn aes_encrypt_four(keys: &[u8; 240], rounds: usize, blocks: &mut [[u8; 16]; 4]) {
    // Dispatch admitted AES and the OS preserves SIMD state.
    unsafe { encrypt_four(keys, rounds, blocks) }
}
#[target_feature(enable = "aes,neon")]
unsafe fn hash_value(a: u128, b: u128) -> u128 {
    // Each vector's byte lanes hold the wire encoding before bit reflection.
    unsafe {
        let a = vreinterpretq_u64_u8(vrbitq_u8(core::mem::transmute::<[u8; 16], uint8x16_t>(
            a.to_be_bytes(),
        )));
        let b = vreinterpretq_u64_u8(vrbitq_u8(core::mem::transmute::<[u8; 16], uint8x16_t>(
            b.to_be_bytes(),
        )));
        let out = vrbitq_u8(vreinterpretq_u8_u64(multiply_vector(a, b)));
        u128::from_be_bytes(core::mem::transmute::<uint8x16_t, [u8; 16]>(out))
    }
}
pub(super) fn ghash(a: u128, b: u128) -> u128 {
    // Dispatch admitted PMULL and the OS preserves SIMD state.
    unsafe { hash_value(a, b) }
}

#[target_feature(enable = "aes,neon")]
unsafe fn product_vector(a: uint64x2_t, b: uint64x2_t) -> (uint64x2_t, uint64x2_t) {
    // GCM's first transmitted bit is coefficient x^0; each byte was reflected.
    unsafe {
        let lo: uint64x2_t =
            core::mem::transmute(vmull_p64(vgetq_lane_u64::<0>(a), vgetq_lane_u64::<0>(b)));
        let hi: uint64x2_t =
            core::mem::transmute(vmull_p64(vgetq_lane_u64::<1>(a), vgetq_lane_u64::<1>(b)));
        let middle: uint64x2_t = core::mem::transmute(vmull_p64(
            vgetq_lane_u64::<0>(a) ^ vgetq_lane_u64::<1>(a),
            vgetq_lane_u64::<0>(b) ^ vgetq_lane_u64::<1>(b),
        ));
        let middle = veorq_u64(veorq_u64(middle, lo), hi);
        let zero = vdupq_n_u64(0);
        let low = veorq_u64(lo, vextq_u64::<1>(zero, middle));
        let high = veorq_u64(hi, vextq_u64::<1>(middle, zero));
        (low, high)
    }
}

#[target_feature(enable = "aes,neon")]
fn reduce_vector(low: uint64x2_t, high: uint64x2_t) -> uint64x2_t {
    let zero = vdupq_n_u64(0);
    let shifted1 = veorq_u64(
        vshlq_n_u64::<1>(high),
        vextq_u64::<1>(zero, vshrq_n_u64::<63>(high)),
    );
    let shifted2 = veorq_u64(
        vshlq_n_u64::<2>(high),
        vextq_u64::<1>(zero, vshrq_n_u64::<62>(high)),
    );
    let shifted7 = veorq_u64(
        vshlq_n_u64::<7>(high),
        vextq_u64::<1>(zero, vshrq_n_u64::<57>(high)),
    );
    let carry = vextq_u64::<1>(
        veorq_u64(
            veorq_u64(vshrq_n_u64::<63>(high), vshrq_n_u64::<62>(high)),
            vshrq_n_u64::<57>(high),
        ),
        zero,
    );
    // x^128 = x^7 + x^2 + x + 1; the first fold overflows by at most 7 bits.
    let folded = veorq_u64(
        veorq_u64(low, high),
        veorq_u64(shifted1, veorq_u64(shifted2, shifted7)),
    );
    veorq_u64(
        folded,
        veorq_u64(
            carry,
            veorq_u64(
                vshlq_n_u64::<1>(carry),
                veorq_u64(vshlq_n_u64::<2>(carry), vshlq_n_u64::<7>(carry)),
            ),
        ),
    )
}

#[target_feature(enable = "aes,neon")]
unsafe fn multiply_vector(a: uint64x2_t, b: uint64x2_t) -> uint64x2_t {
    // Both operands already use polynomial coefficient order.
    let (low, high) = unsafe { product_vector(a, b) };
    reduce_vector(low, high)
}

#[target_feature(enable = "aes,neon")]
unsafe fn hash_blocks(h: &[u8; 16], state: &mut [u8; 16], blocks: &[[u8; 16]]) {
    // PMULL is admitted; each unaligned access stays within its block array.
    unsafe {
        let h = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(h.as_ptr())));
        let mut y = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(state.as_ptr())));
        let (batches, tail) = blocks.as_chunks::<4>();
        if !batches.is_empty() {
            let h2 = multiply_vector(h, h);
            let h3 = multiply_vector(h2, h);
            let h4 = multiply_vector(h2, h2);
            for batch in batches {
                let x0 = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(batch[0].as_ptr())));
                let x1 = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(batch[1].as_ptr())));
                let x2 = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(batch[2].as_ptr())));
                let x3 = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(batch[3].as_ptr())));
                // Four GHASH steps expand to (y+x0)H^4+x1H^3+x2H^2+x3H.
                let (l0, u0) = product_vector(veorq_u64(y, x0), h4);
                let (l1, u1) = product_vector(x1, h3);
                let (l2, u2) = product_vector(x2, h2);
                let (l3, u3) = product_vector(x3, h);
                y = reduce_vector(
                    veorq_u64(veorq_u64(l0, l1), veorq_u64(l2, l3)),
                    veorq_u64(veorq_u64(u0, u1), veorq_u64(u2, u3)),
                );
            }
        }
        for block in tail {
            let x = vreinterpretq_u64_u8(vrbitq_u8(vld1q_u8(block.as_ptr())));
            y = multiply_vector(veorq_u64(y, x), h);
        }
        vst1q_u8(state.as_mut_ptr(), vrbitq_u8(vreinterpretq_u8_u64(y)));
    }
}
pub(super) fn ghash_blocks(h: &[u8; 16], state: &mut [u8; 16], blocks: &[[u8; 16]]) {
    // Dispatch admitted PMULL and the OS preserves SIMD state.
    unsafe { hash_blocks(h, state, blocks) }
}

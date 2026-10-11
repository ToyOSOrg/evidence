//! Intel SDM AESENC/AESENCLAST, gated by CPUID. Legacy SSE encodings only.
//! UEFI preserves every used register inside each assembly block. Ordinary
//! hosts use Rust intrinsics and the ABI. Unaligned loads admit byte-aligned keys.

#[cfg(target_os = "uefi")]
use core::arch::asm;
use core::arch::x86_64::*;

#[allow(unused_unsafe, reason = "CPUID is unsafe on the supported Rust 1.89")]
fn capabilities() -> u32 {
    // CPUID leaf 1 exists on every x86-64 CPU.
    unsafe { __cpuid(1).ecx }
}
pub(super) fn aes_available() -> bool {
    !cfg!(feature = "portable") && capabilities() & (1 << 25) != 0
}
pub(super) fn clmul_available() -> bool {
    !cfg!(feature = "portable") && capabilities() & (1 << 1) != 0
}

#[cfg(target_os = "uefi")]
pub(super) fn ghash(a: u128, b: u128) -> u128 {
    let a = crate::secret::Secret(a.reverse_bits().to_le_bytes());
    let b = crate::secret::Secret(b.reverse_bits().to_le_bytes());
    let mut products = crate::secret::Secret([0; 48]);
    let mut saved = crate::secret::Secret([0; 80]);
    // CPUID admitted CLMUL. All five used registers are restored; each memory
    // operand refers to a distinct live array of the required size.
    unsafe {
        asm!(
            "movdqu [{saved}], xmm0","movdqu [{saved}+16], xmm1","movdqu [{saved}+32], xmm2","movdqu [{saved}+48], xmm3","movdqu [{saved}+64], xmm4",
            "movdqu xmm0, [{a}]","movdqu xmm1, [{b}]",
            "movdqa xmm2, xmm0","pclmulqdq xmm2, xmm1, 0x00","movdqu [{out}], xmm2",
            "movdqa xmm3, xmm0","pclmulqdq xmm3, xmm1, 0x11","movdqu [{out}+16], xmm3",
            "pshufd xmm4, xmm0, 0x4e","pxor xmm0, xmm4","pshufd xmm4, xmm1, 0x4e","pxor xmm1, xmm4",
            "pclmulqdq xmm0, xmm1, 0x00","pxor xmm0, xmm2","pxor xmm0, xmm3","movdqu [{out}+32], xmm0",
            "movdqu xmm0, [{saved}]","movdqu xmm1, [{saved}+16]","movdqu xmm2, [{saved}+32]","movdqu xmm3, [{saved}+48]","movdqu xmm4, [{saved}+64]",
            saved=in(reg) saved.0.as_mut_ptr(),a=in(reg) a.0.as_ptr(),b=in(reg) b.0.as_ptr(),out=in(reg) products.0.as_mut_ptr(),options(nostack),
        )
    }
    let low = u128::from_le_bytes(products.0[..16].try_into().unwrap());
    let high = u128::from_le_bytes(products.0[16..32].try_into().unwrap());
    let middle = u128::from_le_bytes(products.0[32..].try_into().unwrap());
    let low = low ^ (middle << 64);
    let high = high ^ (middle >> 64);
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

#[cfg(target_os = "uefi")]
pub(super) fn aes_encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    let mut saved = crate::secret::Secret([0u8; 32]);
    // CPUID admitted AES. The schedule contains every round, `block` and
    // `saved` are exclusive, and both XMM registers are restored before return.
    unsafe {
        asm!(
            "movdqu [{saved}], xmm0","movdqu [{saved}+16], xmm1",
            "movdqu xmm0, [{block}]","movdqu xmm1, [{keys}]","pxor xmm0, xmm1",
            "add {keys}, 16","2:","movdqu xmm1, [{keys}]","aesenc xmm0, xmm1",
            "add {keys}, 16","dec {left}","jnz 2b",
            "movdqu xmm1, [{keys}]","aesenclast xmm0, xmm1","movdqu [{block}], xmm0",
            "movdqu xmm0, [{saved}]","movdqu xmm1, [{saved}+16]",
            saved=in(reg) saved.0.as_mut_ptr(),block=in(reg) block.as_mut_ptr(),
            keys=inout(reg) keys.as_ptr()=>_,left=inout(reg) rounds-1=>_,options(nostack),
        );
    }
}

#[cfg(not(target_os = "uefi"))]
#[target_feature(enable = "aes,sse2")]
unsafe fn encrypt_native(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    // Every unaligned access stays within a schedule or block array.
    unsafe {
        let mut v = _mm_xor_si128(
            _mm_loadu_si128(block.as_ptr().cast()),
            _mm_loadu_si128(keys.as_ptr().cast()),
        );
        for i in 1..rounds {
            v = _mm_aesenc_si128(v, _mm_loadu_si128(keys.as_ptr().add(i * 16).cast()))
        }
        v = _mm_aesenclast_si128(v, _mm_loadu_si128(keys.as_ptr().add(rounds * 16).cast()));
        _mm_storeu_si128(block.as_mut_ptr().cast(), v)
    }
}
#[cfg(not(target_os = "uefi"))]
pub(super) fn aes_encrypt(keys: &[u8; 240], rounds: usize, block: &mut [u8; 16]) {
    // CPUID admitted AES; the ordinary ABI owns SIMD register preservation.
    unsafe { encrypt_native(keys, rounds, block) }
}
#[cfg(not(target_os = "uefi"))]
#[target_feature(enable = "pclmulqdq,sse2")]
unsafe fn product_native(a: u128, b: u128) -> (u128, u128) {
    let a = _mm_set_epi64x((a >> 64) as i64, a as i64);
    let b = _mm_set_epi64x((b >> 64) as i64, b as i64);
    let lo = _mm_clmulepi64_si128::<0>(a, b);
    let hi = _mm_clmulepi64_si128::<0x11>(a, b);
    let ax = _mm_xor_si128(a, _mm_shuffle_epi32::<0x4e>(a));
    let bx = _mm_xor_si128(b, _mm_shuffle_epi32::<0x4e>(b));
    let middle = _mm_xor_si128(_mm_xor_si128(_mm_clmulepi64_si128::<0>(ax, bx), lo), hi);
    let lo = u128::from(_mm_cvtsi128_si64(lo) as u64)
        | (u128::from(_mm_cvtsi128_si64(_mm_unpackhi_epi64(lo, lo)) as u64) << 64);
    let hi = u128::from(_mm_cvtsi128_si64(hi) as u64)
        | (u128::from(_mm_cvtsi128_si64(_mm_unpackhi_epi64(hi, hi)) as u64) << 64);
    let mid = u128::from(_mm_cvtsi128_si64(middle) as u64)
        | (u128::from(_mm_cvtsi128_si64(_mm_unpackhi_epi64(middle, middle)) as u64) << 64);
    (lo ^ (mid << 64), hi ^ (mid >> 64))
}
#[cfg(not(target_os = "uefi"))]
pub(super) fn ghash(a: u128, b: u128) -> u128 {
    // CPUID admitted CLMUL; reflection maps GCM's bit order to polynomial order.
    let (low, high) = unsafe { product_native(a.reverse_bits(), b.reverse_bits()) };
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

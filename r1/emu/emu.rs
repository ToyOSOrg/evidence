//! Scratch only: the 512- and 256-bit intrinsics `vaes512` uses, each as its
//! 128-bit instruction on every lane (Intel SDM: VAESENC, VPCLMULQDQ,
//! VPSHUFB, VPSLLDQ, VPSRLDQ, VPSHUFD and VPADDD act per 128-bit lane), so
//! that the module's logic runs under Rosetta, which has AES-NI and PCLMULQDQ
//! but no AVX.
#![allow(non_camel_case_types, dead_code)]
pub use core::arch::x86_64::*;
use core::arch::x86_64 as real;

#[derive(Clone, Copy)]
#[repr(transparent)]
pub struct __m512i(pub [__m128i; 4]);
#[derive(Clone, Copy)]
#[repr(transparent)]
pub struct __m256i(pub [__m128i; 2]);

fn map(a: __m512i, f: impl Fn(__m128i) -> __m128i) -> __m512i {
    __m512i([f(a.0[0]), f(a.0[1]), f(a.0[2]), f(a.0[3])])
}
fn map2(a: __m512i, b: __m512i, f: impl Fn(__m128i, __m128i) -> __m128i) -> __m512i {
    __m512i([f(a.0[0], b.0[0]), f(a.0[1], b.0[1]), f(a.0[2], b.0[2]), f(a.0[3], b.0[3])])
}
pub fn _mm512_setzero_si512() -> __m512i { unsafe { __m512i([real::_mm_setzero_si128(); 4]) } }
pub fn _mm512_broadcast_i32x4(a: __m128i) -> __m512i { __m512i([a; 4]) }
pub fn _mm512_shuffle_epi8(a: __m512i, b: __m512i) -> __m512i { map2(a, b, |x, y| unsafe { real::_mm_shuffle_epi8(x, y) }) }
pub fn _mm512_ternarylogic_epi64<const IMM: i32>(a: __m512i, b: __m512i, c: __m512i) -> __m512i {
    assert_eq!(IMM, 0x96);
    _mm512_xor_si512(_mm512_xor_si512(a, b), c)
}
pub fn _mm512_xor_si512(a: __m512i, b: __m512i) -> __m512i { map2(a, b, |x, y| unsafe { real::_mm_xor_si128(x, y) }) }
pub fn _mm512_or_si512(a: __m512i, b: __m512i) -> __m512i { map2(a, b, |x, y| unsafe { real::_mm_or_si128(x, y) }) }
pub fn _mm512_clmulepi64_epi128<const IMM: i32>(a: __m512i, b: __m512i) -> __m512i {
    map2(a, b, |x, y| unsafe { real::_mm_clmulepi64_si128::<IMM>(x, y) })
}
pub fn _mm512_bslli_epi128<const IMM: i32>(a: __m512i) -> __m512i { map(a, |x| unsafe { real::_mm_slli_si128::<IMM>(x) }) }
pub fn _mm512_bsrli_epi128<const IMM: i32>(a: __m512i) -> __m512i { map(a, |x| unsafe { real::_mm_srli_si128::<IMM>(x) }) }
pub fn _mm512_set1_epi64(a: i64) -> __m512i { unsafe { __m512i([real::_mm_set1_epi64x(a); 4]) } }
pub fn _mm512_shuffle_epi32<const MASK: i32>(a: __m512i) -> __m512i { map(a, |x| unsafe { real::_mm_shuffle_epi32::<MASK>(x) }) }
pub fn _mm512_zextsi128_si512(a: __m128i) -> __m512i { unsafe { __m512i([a, real::_mm_setzero_si128(), real::_mm_setzero_si128(), real::_mm_setzero_si128()]) } }
pub fn _mm512_castsi512_si128(a: __m512i) -> __m128i { a.0[0] }
pub fn _mm512_castsi512_si256(a: __m512i) -> __m256i { __m256i([a.0[0], a.0[1]]) }
pub fn _mm512_extracti64x4_epi64<const IMM: i32>(a: __m512i) -> __m256i {
    assert_eq!(IMM, 1);
    __m256i([a.0[2], a.0[3]])
}
pub fn _mm256_xor_si256(a: __m256i, b: __m256i) -> __m256i { unsafe { __m256i([real::_mm_xor_si128(a.0[0], b.0[0]), real::_mm_xor_si128(a.0[1], b.0[1])]) } }
pub fn _mm256_castsi256_si128(a: __m256i) -> __m128i { a.0[0] }
pub fn _mm256_extracti128_si256<const IMM: i32>(a: __m256i) -> __m128i {
    assert_eq!(IMM, 1);
    a.0[1]
}
pub fn _mm512_add_epi32(a: __m512i, b: __m512i) -> __m512i { map2(a, b, |x, y| unsafe { real::_mm_add_epi32(x, y) }) }
pub fn _mm512_set1_epi32(a: i32) -> __m512i { unsafe { __m512i([real::_mm_set1_epi32(a); 4]) } }
#[allow(clippy::too_many_arguments)]
pub fn _mm512_set_epi32(
    e15: i32, e14: i32, e13: i32, e12: i32, e11: i32, e10: i32, e9: i32, e8: i32,
    e7: i32, e6: i32, e5: i32, e4: i32, e3: i32, e2: i32, e1: i32, e0: i32,
) -> __m512i {
    unsafe {
        __m512i([
            real::_mm_set_epi32(e3, e2, e1, e0),
            real::_mm_set_epi32(e7, e6, e5, e4),
            real::_mm_set_epi32(e11, e10, e9, e8),
            real::_mm_set_epi32(e15, e14, e13, e12),
        ])
    }
}
pub fn _mm512_aesenc_epi128(a: __m512i, k: __m512i) -> __m512i { map2(a, k, |x, y| unsafe { real::_mm_aesenc_si128(x, y) }) }
pub fn _mm512_aesenclast_epi128(a: __m512i, k: __m512i) -> __m512i { map2(a, k, |x, y| unsafe { real::_mm_aesenclast_si128(x, y) }) }
pub fn _mm512_castsi128_si512(a: __m128i) -> __m512i { _mm512_zextsi128_si512(a) }
pub fn _mm512_inserti32x4<const IMM: i32>(a: __m512i, b: __m128i) -> __m512i {
    let mut out = a;
    out.0[IMM as usize] = b;
    out
}

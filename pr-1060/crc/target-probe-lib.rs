#![no_std]
#[cfg(target_arch = "x86_64")]
#[target_feature(enable = "sse4.2")]
pub fn update(mut crc: u32, data: &[u8]) -> u32 {
    use core::arch::x86_64::{_mm_crc32_u64, _mm_crc32_u8};
    let (words, rest) = data.as_chunks::<8>();
    let mut c = crc as u64;
    for w in words { c = _mm_crc32_u64(c, u64::from_le_bytes(*w)); }
    crc = c as u32;
    for &b in rest { crc = _mm_crc32_u8(crc, b); }
    crc
}
#[cfg(target_arch = "aarch64")]
#[target_feature(enable = "crc")]
pub fn update(mut crc: u32, data: &[u8]) -> u32 {
    use core::arch::aarch64::{__crc32cd, __crc32cb};
    let (words, rest) = data.as_chunks::<8>();
    for w in words { crc = __crc32cd(crc, u64::from_le_bytes(*w)); }
    for &b in rest { crc = __crc32cb(crc, b); }
    crc
}
pub fn crc32c(data: &[u8]) -> u32 { unsafe { update(!0, data) ^ !0 } }

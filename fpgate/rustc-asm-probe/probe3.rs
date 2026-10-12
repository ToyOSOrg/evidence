#![feature(no_core, lang_items, rustc_attrs, decl_macro)]
#![no_core]
#![crate_type = "lib"]
#[lang = "pointee_sized"] pub trait PointeeSized {}
#[lang = "meta_sized"] pub trait MetaSized: PointeeSized {}
#[lang = "sized"] pub trait Sized: MetaSized {}
#[lang = "copy"] pub trait Copy {}
impl Copy for u64 {}
#[no_mangle]
#[target_feature(enable = "avx2")]
pub unsafe fn probe3(d: *mut [u64; 8], s: *const [u64; 8]) { *d = *s; }

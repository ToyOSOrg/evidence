#![feature(no_core, lang_items, rustc_attrs, decl_macro)]
#![no_core]
#![crate_type = "lib"]
#[lang = "pointee_sized"] pub trait PointeeSized {}
#[lang = "meta_sized"] pub trait MetaSized: PointeeSized {}
#[lang = "sized"] pub trait Sized: MetaSized {}
#[lang = "copy"] pub trait Copy {}
impl Copy for u64 {}
#[rustc_builtin_macro]
pub macro asm("assembly template", $(operands,)* $(options($(option),*))?) { /* compiler built-in */ }
#[no_mangle]
pub unsafe fn probe2(x: u64) {
    asm!("/* {} */", in(xmm_reg) x);
}

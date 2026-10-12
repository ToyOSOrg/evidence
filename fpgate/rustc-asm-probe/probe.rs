#![feature(no_core, lang_items, rustc_attrs, decl_macro)]
#![no_core]
#![crate_type = "lib"]
#[lang = "pointee_sized"] pub trait PointeeSized {}
#[lang = "meta_sized"] pub trait MetaSized: PointeeSized {}
#[lang = "sized"] pub trait Sized: MetaSized {}
#[rustc_builtin_macro]
pub macro asm("assembly template", $(operands,)* $(options($(option),*))?) { /* compiler built-in */ }
#[no_mangle]
pub unsafe fn probe() {
    asm!("movaps xmm0, xmm1", "vpaddd ymm0, ymm1, ymm2", "vpaddd zmm0, zmm1, zmm2", "fld qword ptr [rax]", "paddb mm0, mm1", "xsaveopt64 [rax]", "ldmxcsr [rax]");
}

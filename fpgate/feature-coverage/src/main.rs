use iced_x86::*;
// `vector_feature`, verbatim from build/fpgate.rs at bbe8df088.
fn vector_feature(feature: CpuidFeature) -> bool {
    use CpuidFeature::*;
    matches!(
        feature,
        FPU | FPU287
            | FPU287XL_ONLY
            | FPU387
            | FPU387SL_ONLY
            | CYRIX_FPU
            | MMX
            | D3NOW
            | D3NOWEXT
            | CYRIX_D3NOW
            | SSE
            | SSE2
            | SSE3
            | SSSE3
            | SSE4_1
            | SSE4_2
            | SSE4A
            | AVX
            | AVX2
            | AVX_VNNI
            | AVX_IFMA
            | AVX_NE_CONVERT
            | AVX_VNNI_INT8
            | AVX512F
            | AVX512VL
            | AVX512BW
            | AVX512CD
            | AVX512DQ
            | AVX512ER
            | AVX512PF
            | AVX512_4FMAPS
            | AVX512_4VNNIW
            | AVX512_BF16
            | AVX512_BITALG
            | AVX512_FP16
            | AVX512_IFMA
            | AVX512_VBMI
            | AVX512_VBMI2
            | AVX512_VNNI
            | AVX512_VP2INTERSECT
            | AVX512_VPOPCNTDQ
            | FMA
            | FMA4
            | F16C
            | XOP
            | AVX_VNNI_INT16
            | KNC
            | AMX_TILE
            | AMX_INT8
            | AMX_BF16
            | AMX_FP16
            | AMX_COMPLEX
            | CYRIX_EMMI
            | AES
            | VAES
            | PCLMULQDQ
            | VPCLMULQDQ
            | GFNI
            | SHA
            | SHA512
            | SM3
            | SM4
            | KL
            | AESKLE
            | WIDE_KL
    )
}
fn main() {
    let mut factory = InstructionInfoFactory::new();
    for code in Code::values() {
        let info = code.op_code();
        if !info.mode64() { continue; }
        let mut i = Instruction::default();
        i.set_code(code);
        let feats = i.cpuid_features();
        if feats.iter().any(|&f| vector_feature(f)) { continue; }
        // operand kinds that are vector registers
        let mut vecop = false;
        for k in 0..info.op_count() {
            let kind = info.op_kind(k);
            let s = format!("{:?}", kind);
            if s.starts_with("xmm") || s.starts_with("ymm") || s.starts_with("zmm") || s.starts_with("mm_") || s.starts_with("st") || s.starts_with("k_") || s.starts_with("tmm") { vecop = true; }
        }
        let used = factory.info(&i).used_registers().iter().any(|u| { let r = u.register(); r.is_st() || r.is_mm() || r.is_xmm() || r.is_ymm() || r.is_zmm() || r.is_k() || r.is_tmm() });
        let m = format!("{:?}", code.mnemonic());
        let fpish = m.starts_with('F') || m.contains("mxcsr") || m.contains("Mxcsr") || m.contains("Emms") || m.contains("Xsave") || m.contains("Xrstor") || m.contains("Fx") || m == "Wait" || m.contains("Tile") || m.contains("Ldtilecfg") || m.contains("Sttilecfg") || m.contains("Vzero");
        let save = m.starts_with("Xsave") || m.starts_with("Xrstor") || m.starts_with("Fxsave") || m.starts_with("Fxrstor");
        let free = m == "Lfence" || m == "Mfence" || m == "Sfence";
        if (vecop || fpish) && !used && !save && !free {
            println!("{:?} mnemonic={} feats={:?} vecop={} used={}", code, m, feats, vecop, used);
        }
    }
}

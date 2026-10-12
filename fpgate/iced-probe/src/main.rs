use iced_x86::*;
use std::collections::BTreeMap;

fn u16_(d: &[u8], o: usize) -> u16 { u16::from_le_bytes(d[o..o+2].try_into().unwrap()) }
fn u32_(d: &[u8], o: usize) -> u32 { u32::from_le_bytes(d[o..o+4].try_into().unwrap()) }
fn u64_(d: &[u8], o: usize) -> u64 { u64::from_le_bytes(d[o..o+8].try_into().unwrap()) }
fn cstr(d: &[u8], o: usize) -> &str { let e = d[o..].iter().position(|&b| b == 0).unwrap(); std::str::from_utf8(&d[o..o+e]).unwrap() }

struct Sh { name: String, kind: u32, flags: u64, addr: u64, off: u64, size: u64, link: u32 }

fn main() {
    let path = std::env::args().nth(1).unwrap();
    let d = std::fs::read(&path).unwrap();
    let shoff = u64_(&d, 0x28) as usize; let shentsize = u16_(&d, 0x3a) as usize; let shnum = u16_(&d, 0x3c) as usize; let shstrndx = u16_(&d, 0x3e) as usize;
    let raw: Vec<_> = (0..shnum).map(|i| { let o = shoff + i*shentsize; (u32_(&d,o), u32_(&d,o+4), u64_(&d,o+8), u64_(&d,o+16), u64_(&d,o+24), u64_(&d,o+32), u32_(&d,o+40)) }).collect();
    let stro = raw[shstrndx].4 as usize;
    let shs: Vec<Sh> = raw.iter().map(|r| Sh { name: cstr(&d, stro + r.0 as usize).to_string(), kind: r.1, flags: r.2, addr: r.3, off: r.4, size: r.5, link: r.6 }).collect();
    for s in &shs { println!("section {:24} kind={} flags={:#x} addr={:#x} size={:#x}", s.name, s.kind, s.flags, s.addr, s.size); }
    // symbols
    let symtab = shs.iter().find(|s| s.kind == 2).unwrap();
    let strtab = &shs[symtab.link as usize];
    let mut syms: Vec<(u64, u64, String, u8)> = Vec::new();
    for i in 0..(symtab.size as usize / 24) {
        let o = symtab.off as usize + i*24;
        let name = cstr(&d, strtab.off as usize + u32_(&d,o) as usize).to_string();
        let info = d[o+4]; let shndx = u16_(&d, o+6); let value = u64_(&d, o+8); let size = u64_(&d, o+16);
        if shndx != 0 && !name.is_empty() { syms.push((value, size, name, info & 0xf)); }
    }
    syms.sort();
    let find = |ip: u64| -> String {
        let i = syms.partition_point(|s| s.0 <= ip);
        if i == 0 { return "?".into() }
        let s = &syms[i-1];
        format!("{:#}+{:#x}", rustc_demangle::demangle(&s.2), ip - s.0)
    };
    let mut factory = InstructionInfoFactory::new();
    let mut hist: BTreeMap<String, usize> = BTreeMap::new();
    let mut fmt = IntelFormatter::new();
    for s in shs.iter().filter(|s| s.flags & 0x4 != 0 && s.kind == 1) {
        let bytes = &d[s.off as usize..(s.off + s.size) as usize];
        let mut dec = Decoder::with_ip(64, bytes, s.addr, DecoderOptions::NONE);
        let mut instr = Instruction::default();
        let mut invalid = 0;
        let mut count = 0;
        let starts: Vec<u64> = syms.iter().filter(|x| x.0 >= s.addr && x.0 < s.addr + s.size).map(|x| x.0).collect();
        let kinds: BTreeMap<u8, usize> = syms.iter().filter(|x| x.0 >= s.addr && x.0 < s.addr + s.size).fold(BTreeMap::new(), |mut m, x| { *m.entry(x.3).or_default() += 1; m });
        println!("symbol kinds in {}: {:?}", s.name, kinds);
        let mut straddles = 0;
        while dec.can_decode() {
            dec.decode_out(&mut instr);
            count += 1;
            let (a, b) = (instr.ip(), instr.ip() + instr.len() as u64);
            let k = starts.partition_point(|&x| x <= a);
            if k < starts.len() && starts[k] < b { straddles += 1; println!("STRADDLE {:#x}..{:#x} over {:#x} {}", a, b, starts[k], find(starts[k])); }
            if instr.is_invalid() { invalid += 1; println!("INVALID at {:#x} {}", instr.ip(), find(instr.ip())); continue; }
            let feats = instr.cpuid_features();
            let info = factory.info(&instr);
            let vecreg = info.used_registers().iter().any(|u| { let r = u.register(); r.is_xmm() || r.is_ymm() || r.is_zmm() || r.is_k() || r.is_mm() || r.is_st() || r.is_tmm() });
            let plain = feats.iter().all(|f| matches!(f, CpuidFeature::INTEL8086 | CpuidFeature::INTEL186 | CpuidFeature::INTEL286 | CpuidFeature::INTEL386 | CpuidFeature::INTEL486 | CpuidFeature::X64 | CpuidFeature::CMOV | CpuidFeature::CX8 | CpuidFeature::CMPXCHG16B | CpuidFeature::MULTIBYTENOP | CpuidFeature::PAUSE | CpuidFeature::TSC | CpuidFeature::MSR | CpuidFeature::CPUID | CpuidFeature::SYSCALL | CpuidFeature::BMI1 | CpuidFeature::BMI2 | CpuidFeature::POPCNT | CpuidFeature::LZCNT | CpuidFeature::RDRAND | CpuidFeature::RDSEED | CpuidFeature::FSGSBASE | CpuidFeature::INVPCID | CpuidFeature::SMAP));
            if vecreg || !plain {
                let mut out = String::new(); fmt.format(&instr, &mut out);
                *hist.entry(format!("{:?} {:?} vecreg={}", instr.mnemonic(), feats, vecreg)).or_default() += 1;
                println!("NOTE {:#x} {:50} {:?} vecreg={} in {}", instr.ip(), out, feats, vecreg, find(instr.ip()));
            }
        }
        println!("section {} decoded {} instructions, {} invalid, {} straddles", s.name, count, invalid, straddles);
    }
    for (k, v) in hist { println!("HIST {v:6} {k}"); }
}

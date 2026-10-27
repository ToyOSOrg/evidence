use std::hint::black_box;
use std::time::Instant;

#[inline(never)]
fn plain(src: *const u8, dst: &mut [u8]) { unsafe { std::ptr::copy_nonoverlapping(src, dst.as_mut_ptr(), dst.len()) } }

#[inline(never)]
fn asm64(src: *const u8, dst: &mut [u8]) {
    unsafe {
        core::arch::asm!(
            "2:",
            "cmp {len}, #64",
            "b.lo 3f",
            "ldp q0, q1, [{src}]",
            "ldp q2, q3, [{src}, #32]",
            "add {src}, {src}, #64",
            "stp q0, q1, [{dst}]",
            "stp q2, q3, [{dst}, #32]",
            "add {dst}, {dst}, #64",
            "sub {len}, {len}, #64",
            "b 2b",
            "3:",
            "cbz {len}, 4f",
            "ldrb {b:w}, [{src}], #1",
            "strb {b:w}, [{dst}], #1",
            "sub {len}, {len}, #1",
            "b 3b",
            "4:",
            src = inout(reg) src => _, dst = inout(reg) dst.as_mut_ptr() => _, len = inout(reg) dst.len() => _,
            b = out(reg) _, out("v0") _, out("v1") _, out("v2") _, out("v3") _,
            options(nostack),
        );
    }
}

fn main() {
    for &len in &[256usize, 4096, 65536, 8 << 20] {
        let src = vec![0x5au64; len / 8 + 1];
        let mut dst = vec![0u8; len];
        let reps = (1usize << 31) / len;
        for (name, f) in [("memcpy", plain as fn(*const u8, &mut [u8])), ("asm 64B", asm64)] {
            let mut best = f64::MAX;
            for _ in 0..5 {
                let t = Instant::now();
                for _ in 0..reps { f(black_box(src.as_ptr() as *const u8), black_box(&mut dst)); }
                best = best.min(t.elapsed().as_secs_f64());
            }
            println!("{len:>8} B  {name:<9} {:>7.1} GB/s", (len * reps) as f64 / best / 1e9);
        }
        let mut chk = vec![0u8; len]; let s: Vec<u8> = (0..len).map(|i| i as u8).collect();
        asm64(s.as_ptr(), &mut chk); assert_eq!(chk, s);
    }
}

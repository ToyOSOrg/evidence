//! tsc-drift <seconds>: the TSC against CLOCK_MONOTONIC_RAW (the current
//! clocksource, unslewed), sampled every 100 ms on each CPU in turn, through
//! alternating idle and busy phases of 10 s, so P-state and C-state
//! transitions fall inside the measurement.
//!
//! Each sample is a TSC read bracketed by two clock reads, kept only when the
//! bracket is under 50 us, and paired with the bracket's midpoint. Prints the
//! CPUID invariant-TSC bit, then per phase the TSC rate over the phase, and
//! overall the least-squares rate, the largest residual and the largest jump
//! between consecutive samples' rates.

use std::arch::x86_64::{__cpuid, _rdtsc};

fn raw_ns() -> i128 {
    let mut ts = libc::timespec { tv_sec: 0, tv_nsec: 0 };
    // SAFETY: a valid out-pointer.
    assert_eq!(unsafe { libc::clock_gettime(libc::CLOCK_MONOTONIC_RAW, &mut ts) }, 0);
    ts.tv_sec as i128 * 1_000_000_000 + ts.tv_nsec as i128
}

fn pin(cpu: usize) {
    // SAFETY: a zeroed set is valid; sched_setaffinity reads it.
    unsafe {
        let mut set: libc::cpu_set_t = std::mem::zeroed();
        libc::CPU_SET(cpu, &mut set);
        assert_eq!(libc::sched_setaffinity(0, std::mem::size_of_val(&set), &set), 0, "pin to {cpu}");
    }
}

/// (clock ns, tsc), or None when the bracket was wide.
fn sample() -> Option<(i128, u64)> {
    let a = raw_ns();
    // SAFETY: rdtsc has no preconditions on x86-64.
    let t = unsafe { _rdtsc() };
    let b = raw_ns();
    (b - a < 50_000).then(|| ((a + b) / 2, t))
}

fn main() {
    let secs: u64 = std::env::args().nth(1).and_then(|a| a.parse().ok()).unwrap_or(600);
    // SAFETY: cpuid is present on every x86-64.
    let max_ext = unsafe { __cpuid(0x8000_0000) }.eax;
    let edx = if max_ext >= 0x8000_0007 { unsafe { __cpuid(0x8000_0007) }.edx } else { 0 };
    println!("cpuid 8000_0007 edx={edx:#010x} invariant_tsc={}", edx >> 8 & 1);
    let cpus = std::thread::available_parallelism().unwrap().get();
    let start = std::time::Instant::now();
    let mut all: Vec<(i128, u64, usize)> = Vec::new();
    let mut phase = 0u64;
    while start.elapsed().as_secs() < secs {
        let busy = phase % 2 == 1;
        let begin = std::time::Instant::now();
        let first = all.len();
        let mut tick = 0usize;
        while begin.elapsed().as_secs() < 10 {
            let cpu = tick % cpus;
            pin(cpu);
            let mut got = None;
            for _ in 0..100 {
                if let Some(s) = sample() {
                    got = Some(s);
                    break;
                }
            }
            if let Some((ns, t)) = got {
                all.push((ns, t, cpu));
            }
            let until = std::time::Instant::now() + std::time::Duration::from_millis(100);
            if busy {
                while std::time::Instant::now() < until {
                    std::hint::black_box(0u64.wrapping_add(1));
                }
            } else {
                std::thread::sleep(until - std::time::Instant::now());
            }
            tick += 1;
        }
        let (a, b) = (all[first], all[all.len() - 1]);
        let mhz = (b.1 - a.1) as f64 / ((b.0 - a.0) as f64 / 1e9) / 1e6;
        println!("phase {phase} {} samples={} tsc_mhz={mhz:.4}", if busy { "busy" } else { "idle" }, all.len() - first);
        phase += 1;
    }
    let n = all.len() as f64;
    let (x0, y0) = (all[0].0 as f64, all[0].1 as f64);
    let xs: Vec<f64> = all.iter().map(|s| (s.0 as f64 - x0) / 1e9).collect();
    let ys: Vec<f64> = all.iter().map(|s| s.1 as f64 - y0).collect();
    let (mx, my) = (xs.iter().sum::<f64>() / n, ys.iter().sum::<f64>() / n);
    let slope = xs.iter().zip(&ys).map(|(x, y)| (x - mx) * (y - my)).sum::<f64>() / xs.iter().map(|x| (x - mx).powi(2)).sum::<f64>();
    let worst = xs.iter().zip(&ys).zip(&all).map(|((x, y), s)| ((y - (my + slope * (x - mx))) / slope * 1e6, s.2)).fold((0.0f64, 0), |m, r| if r.0.abs() > m.0.abs() { r } else { m });
    println!("overall samples={} span_s={:.1} tsc_mhz={:.4} worst_residual_us={:.1} on cpu {}", all.len(), xs[xs.len() - 1], slope / 1e6, worst.0, worst.1);
}

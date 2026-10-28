//! tsc-probe: the TSC's behaviour across CPUs and idle, against the current
//! clocksource (CLOCK_MONOTONIC_RAW), for evidence; not repository code.
//!
//! `tsc-probe warp <rounds>`: for CPU 0 and each other CPU, two threads pinned
//! there take turns: each reads its TSC after seeing the other's last read
//! and records how far its own reading fell behind (a cross-core offset, or
//! a TSC that went back). After a burst both sleep 1 ms, 100 ms or 1 s, so the
//! pair also crosses deep idle. Prints per pair the most negative step seen
//! (cycles) and the median turn's length, the offset's resolution.
//!
//! `tsc-probe jumps <seconds>`: one CPU at a time, a (clock, TSC) pair taken
//! with the clock read on both sides of the TSC read, kept under a 5 us
//! bracket, after idle gaps of 0, 1 ms, 10 ms, 100 ms and 1 s in turn. Each
//! pair is compared with the CPU's previous one at the rate fitted over the
//! whole run: the largest step, its CPU, the gap before it and its bracket.

use std::arch::x86_64::{__rdtscp, _mm_lfence, _rdtsc};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::Arc;
use std::time::{Duration, Instant};

fn tsc() -> u64 {
    // SAFETY: lfence and rdtsc have no preconditions on x86-64; the fence
    // keeps the read from passing earlier loads.
    unsafe {
        _mm_lfence();
        let t = _rdtsc();
        _mm_lfence();
        t
    }
}

fn tsc_cpu() -> (u64, u32) {
    let mut aux = 0u32;
    // SAFETY: rdtscp writes the CPU's TSC_AUX into `aux`.
    let t = unsafe { __rdtscp(&mut aux) };
    (t, aux & 0xfff)
}

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

fn cpus() -> usize {
    std::thread::available_parallelism().unwrap().get()
}

fn warp(rounds: usize) {
    const GAPS: [Duration; 3] = [Duration::from_millis(1), Duration::from_millis(100), Duration::from_secs(1)];
    for other in 1..cpus() {
        let turn = Arc::new(AtomicU64::new(0));
        let last = Arc::new(AtomicU64::new(0));
        let side = |me: u64, cpu: usize, turn: Arc<AtomicU64>, last: Arc<AtomicU64>| {
            std::thread::spawn(move || {
                pin(cpu);
                let mut worst = i64::MAX;
                let mut turns = Vec::new();
                let mut n = 0u64;
                for (burst, gap) in (0..rounds).zip(GAPS.iter().cycle()) {
                    let _ = burst;
                    for _ in 0..2000 {
                        while turn.load(Ordering::Acquire) % 2 != me {
                            std::hint::spin_loop();
                        }
                        let before = last.load(Ordering::Acquire);
                        let now = tsc();
                        if before != 0 {
                            worst = worst.min(now as i64 - before as i64);
                            if n % 64 == 0 {
                                turns.push(now - before);
                            }
                        }
                        n += 1;
                        last.store(now, Ordering::Release);
                        turn.fetch_add(1, Ordering::AcqRel);
                    }
                    std::thread::sleep(*gap);
                }
                turns.sort_unstable();
                (worst, turns.get(turns.len() / 2).copied().unwrap_or(0))
            })
        };
        let a = side(0, 0, turn.clone(), last.clone());
        let b = side(1, other, turn, last);
        let (wa, ta) = a.join().unwrap();
        let (wb, tb) = b.join().unwrap();
        println!("warp cpu0<->cpu{other}: cpu0 worst step {wa} cycles, cpu{other} worst step {wb} cycles, median turn {ta}/{tb} cycles");
    }
}

fn jumps(secs: u64) {
    const GAPS: [Duration; 5] =
        [Duration::ZERO, Duration::from_millis(1), Duration::from_millis(10), Duration::from_millis(100), Duration::from_secs(1)];
    let n = cpus();
    // (clock ns, tsc, cpu, gap before, bracket ns)
    let mut all: Vec<(i128, u64, usize, Duration, i128)> = Vec::new();
    let start = Instant::now();
    let mut i = 0usize;
    let mut misplaced = 0u64;
    while start.elapsed().as_secs() < secs {
        let cpu = (i / GAPS.len()) % n;
        let gap = GAPS[i % GAPS.len()];
        pin(cpu);
        std::thread::sleep(gap);
        let mut best: Option<(i128, u64, i128)> = None;
        for _ in 0..50 {
            let a = raw_ns();
            let (t, on) = tsc_cpu();
            let b = raw_ns();
            if on as usize != cpu {
                misplaced += 1;
                continue;
            }
            if best.is_none_or(|(_, _, w)| b - a < w) {
                best = Some(((a + b) / 2, t, b - a));
            }
        }
        if let Some((ns, t, w)) = best.filter(|(_, _, w)| *w < 5_000) {
            all.push((ns, t, cpu, gap, w));
        }
        i += 1;
    }
    let (x0, y0) = (all[0].0 as f64, all[0].1 as f64);
    let fit: Vec<(f64, f64)> = all.iter().map(|s| ((s.0 as f64 - x0) / 1e9, s.1 as f64 - y0)).collect();
    let m = fit.len() as f64;
    let (mx, my) = (fit.iter().map(|p| p.0).sum::<f64>() / m, fit.iter().map(|p| p.1).sum::<f64>() / m);
    let rate = fit.iter().map(|(x, y)| (x - mx) * (y - my)).sum::<f64>() / fit.iter().map(|(x, _)| (x - mx).powi(2)).sum::<f64>();
    println!("jumps samples={} span_s={:.1} tsc_mhz={:.4} rdtscp_on_another_cpu={misplaced}", all.len(), fit[fit.len() - 1].0, rate / 1e6);
    let mut prev: Vec<Option<usize>> = vec![None; n];
    let mut steps: Vec<(f64, usize, Duration, i128)> = Vec::new();
    for (k, s) in all.iter().enumerate() {
        if let Some(p) = prev[s.2] {
            let q = &all[p];
            let tsc_ns = (s.1 as f64 - q.1 as f64) / rate * 1e9;
            let clock_ns = (s.0 - q.0) as f64;
            steps.push((tsc_ns - clock_ns, s.2, s.3, s.4.max(q.4)));
        }
        prev[s.2] = Some(k);
    }
    steps.sort_by(|a, b| b.0.abs().partial_cmp(&a.0.abs()).unwrap());
    for (d, cpu, gap, w) in steps.iter().take(10) {
        println!("step {:.1} us on cpu{cpu} after a {gap:?} gap, bracket {:.1} us", d / 1000.0, *w as f64 / 1000.0);
    }
    for gap in GAPS {
        let of: Vec<f64> = steps.iter().filter(|s| s.2 == gap).map(|s| s.0.abs()).collect();
        let worst = of.iter().cloned().fold(0.0, f64::max);
        println!("gap {gap:?}: {} steps, worst |step| {:.1} us", of.len(), worst / 1000.0);
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    match (args.get(1).map(String::as_str), args.get(2).and_then(|a| a.parse::<u64>().ok())) {
        (Some("warp"), Some(rounds)) => warp(rounds as usize),
        (Some("jumps"), Some(secs)) => jumps(secs),
        _ => {
            eprintln!("usage: tsc-probe warp <bursts> | tsc-probe jumps <seconds>");
            std::process::exit(2);
        }
    }
}

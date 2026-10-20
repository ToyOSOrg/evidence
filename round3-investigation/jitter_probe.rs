use super::sim::*;
use super::*;
use std::println;

#[test]
fn jitter_probe() {
    for jitter in [0u64, 1] {
        let mut sim = Sim::new(flat(4), Params::DEFAULT);
        let s = sim.job(WEIGHT_UNIT);
        let h = sim.job(WEIGHT_UNIT);
        for i in 0..4u64 { sim.thread(s, Work::Duty { run: MS, sleep: 100 * US + jitter * i * US }, CpuId(i as u32), false); }
        for i in 0..8 { sim.thread(h, Work::Hog, CpuId(i % 4), false); }
        sim.run_until(Nanos(10_000 * MS));
        println!("JITTER {jitter} us/thread: err@8s {:.1} got {:.4} fluid {:.4}", sim.window_error(0, 8000 * MS, Nanos::ZERO),
            sim.got[&s].0 as f64 / sim.now.0 as f64, sim.ideal[&s] / sim.now.0 as f64);
    }
}

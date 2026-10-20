use super::sim::*;
use super::*;
use std::println;

#[test]
fn bisect_dip() {
    let mut sim = Sim::new(flat(4), Params::DEFAULT);
    let s = sim.job(WEIGHT_UNIT);
    let h = sim.job(WEIGHT_UNIT);
    for i in 0..4 { sim.thread(s, Work::Duty { run: MS, sleep: 100 * US }, CpuId(i), false); }
    for i in 0..8 { sim.thread(h, Work::Hog, CpuId(i % 4), false); }
    sim.run_until(Nanos(10_000 * MS));
    let e = sim.window_error(0, 8000 * MS, Nanos::ZERO);
    println!("BISECT err@8s {e:.1} got {:.4} fluid {:.4}", (sim.got[&s].0 + sim.got[&s].1) as f64 / sim.now.0 as f64, sim.ideal[&s] / sim.now.0 as f64);
}

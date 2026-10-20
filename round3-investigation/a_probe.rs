use super::sim::*;
use super::*;
use std::println;

#[test]
fn a_probe() {
    for (name, topo) in [("flat4", flat(4)), ("t14", t14()), ("amd", amd())] {
        let m = topo.cpus() as u32;
        let mut sim = Sim::new(topo, Params::DEFAULT);
        for c in 0..=m {
            let j = sim.job(WEIGHT_UNIT);
            sim.thread(j, Work::Duty { run: 20 * MS, sleep: 10 * US }, CpuId(c % m), false);
        }
        sim.run_until(Nanos(10_000 * MS));
        let e = (0..=m as usize).map(|j| sim.window_error(j, 8000 * MS, Nanos::ZERO)).fold(0.0, f64::max);
        println!("APROBE {name} m+1 20ms/10us err@8s {e:.1} moves {}", sim.fairness_moves);
    }
}

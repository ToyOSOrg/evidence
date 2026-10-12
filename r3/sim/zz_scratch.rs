//! Scratch, never committed: PR #874 round 3's simulator measurements.
use kernel::sched::cpu::Balance;
use kernel::sched::fair::QUANTUM_NS;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::{run, Outcome};
use kernel_sim::scenarios;
use kernel_sim::topology::Shape;
use kernel_sim::workload::Scenario;

const MS: u64 = 1_000_000;

fn stream(scenario: &Scenario, seed: u64) -> ChoiceStream {
    if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, scenario.cpus(), 3) }
}
fn sweep(scenario: &Scenario, seeds: u64) -> Vec<Outcome> {
    (0..seeds).map(|seed| run(scenario.clone(), &mut stream(scenario, seed))).collect()
}

/// The lopsided machine's worst stretch of an idle CPU beside stealable work,
/// over 200 seeds, against I15's bound.
#[test]
fn zz_tightness() {
    for shape in [Shape::t14(), Shape::amd_bench()] {
        let s = scenarios::lopsided_placement(shape.cpus(), 2 * shape.cpus(), 60 * MS).with_topology(shape.clone());
        let mut hist = std::collections::BTreeMap::new();
        let mut failed = 0;
        for o in sweep(&s, 200) {
            failed += usize::from(!o.passed());
            *hist.entry(o.wc_rounds).or_insert(0) += 1;
        }
        println!("{} lopsided(2n) over 200 seeds: failed {failed}, worst-stretch histogram {:?}, bound {}", shape.name, hist, shape.cpus() + 2);
    }
}

/// The re-arm policy's probe gap at two CPUs and eight threads, per seed.
#[test]
fn zz_rearm_gap() {
    let balance = Balance::PullWithRearm { every_ns: QUANTUM_NS, times: 1 };
    let s = scenarios::lopsided_placement(2, 8, 60 * MS).with_balance(balance);
    let gaps: Vec<u64> = sweep(&s, 20).iter().map(|o| o.probe_gap_ns).collect();
    println!("re-arm x1 cpus=2 threads=8 probe gap per seed (ns): {gaps:?}, worst {}", gaps.iter().max().unwrap());
}

/// I5's worst spread on interactive_mix, allowance lifted, as the issue measures it.
#[test]
fn zz_i5() {
    for (cpus, hogs) in [(1usize, 1usize), (1, 4), (1, 16), (2, 4), (2, 16)] {
        let scenario = scenarios::interactive_mix(cpus, hogs).with_fair_allowance(u64::MAX);
        let (mut worst, mut worst_bound, mut over, mut crossing_runs) = (0u64, 0u64, 0u64, 0u64);
        for seed in 0..2000u64 {
            let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) };
            let o = run(scenario.clone(), &mut choices);
            assert!(o.passed(), "{}", o.report());
            if o.fair_spread > worst { worst = o.fair_spread; worst_bound = o.fair_bound; }
            over = over.max(o.fair_over_bound);
            crossing_runs += u64::from(o.fair_over_bound > 0);
        }
        println!("zz i5 ({cpus},{hogs}) over 2000: worst spread {worst} at bound {worst_bound}, worst crossing {over}, runs crossing {crossing_runs}");
    }
}

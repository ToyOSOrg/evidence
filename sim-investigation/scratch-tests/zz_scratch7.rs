// Scratch, never committed.
use std::collections::BTreeMap;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
use kernel_sim::workload::{Op, ParkShape, Scenario};
fn count(name: &str, scenario: Scenario, n: u64) {
    let mut kinds: BTreeMap<String, usize> = BTreeMap::new();
    let mut caught = 0;
    for seed in 0..n {
        let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, scenario.cpus, 3) };
        let o = run(scenario.clone(), &mut choices);
        if o.passed() { continue; }
        caught += 1;
        for v in &o.violations { *kinds.entry(v.split(':').next().unwrap_or("?").to_string()).or_default() += 1; }
    }
    println!("zz {name} over {n}: caught {caught} {kinds:?}");
}
#[test]
fn variants() {
    for run_ms in [1u64, 4] {
        let mut s = scenarios::lend_then_block();
        s.procs[2].templates[0].ops[0] = Op::Run(run_ms * 1_000_000);
        count(&format!("lend control run={run_ms}"), s.clone(), 500);
        count(&format!("lend gate run={run_ms}"), s.with_park(ParkShape::KeepLapsedLend), 500);
    }
}

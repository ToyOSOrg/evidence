// Scratch, never committed: what the restaged gates catch with and without their restaging, at the head.
use std::collections::BTreeMap;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
use kernel_sim::workload::{Op, Protocol, Scenario};
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
fn restage() {
    let restaged = scenarios::old_steal_port();
    let mut unrestaged = scenarios::double_drop_exit_race();
    let ops = &mut unrestaged.procs[0].templates[0].ops;
    let at = ops.iter().position(|op| matches!(op, Op::Spawn { .. })).expect("the restaged spawn");
    ops.remove(at);
    let unrestaged = unrestaged.with_protocol(Protocol::OldSteal);
    count("old_steal_port as restaged", restaged, 2000);
    count("old_steal_port without the spawn", unrestaged, 2000);
    let lend = scenarios::old_park_kept_the_lend();
    let mut lend_1ms = lend.clone();
    lend_1ms.procs[2].templates[0].ops[0] = Op::Run(1_000_000);
    count("old_park_kept_the_lend as restaged", lend, 2000);
    count("old_park_kept_the_lend with the renewer at 1 ms", lend_1ms, 2000);
}

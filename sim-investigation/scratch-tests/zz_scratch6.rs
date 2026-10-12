// Scratch, never committed.
use std::collections::BTreeMap;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
#[test]
fn gates() {
    let n: u64 = std::env::var("ZZ_SEEDS").map(|v| v.parse().unwrap()).unwrap_or(500);
    for name in ["old_steal_port", "old_park_kept_the_lend"] {
        let scenario = scenarios::by_name(name).unwrap();
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
}

// Scratch, never committed: re-cut the corpus's negative traces.
use std::collections::BTreeSet;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
use kernel_sim::shrink;
#[test]
fn regen() {
    for (name, file, want) in [
        ("old_steal_port", "old_steal_port_i8", vec!["I8"]),
        ("old_steal_port", "old_steal_port_i1", vec!["I1", "I6"]),
        ("old_migrate_kept_the_corpse", "old_migrate_kept_the_corpse_i14", vec!["I14"]),
    ] {
        let scenario = scenarios::by_name(name).unwrap();
        let want: BTreeSet<String> = want.into_iter().map(String::from).collect();
        'seeds: for seed in 0..5000u64 {
            for pct in [false, true] {
                let mut choices = if pct { ChoiceStream::pct(seed, scenario.cpus, 3) } else { ChoiceStream::from_seed(seed) };
                let o = run(scenario.clone(), &mut choices);
                if o.passed() { continue; }
                let kinds: BTreeSet<String> = o.violations.iter().map(|v| v.split(':').next().unwrap().to_string()).collect();
                if kinds != want { continue; }
                let min = shrink::shrink(&scenario, o.decisions.clone());
                let text = shrink::encode(scenario.name, true, &min);
                println!("zz {file} from seed {seed} pct={pct}: {} -> {} decisions", o.decisions.len(), min.len());
                std::fs::write(format!("{}/corpus/{file}.trace", env!("CARGO_MANIFEST_DIR")), &text).unwrap();
                break 'seeds;
            }
        }
    }
}

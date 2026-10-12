//! Throwaway measurement, not committed: worst rounds a CPU spends idle beside
//! stealable work (I15's quantity) on workloads with one victim and with many.
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
use kernel_sim::topology::{self};

#[test]
fn measure() {
    const MS: u64 = 1_000_000;
    for shape in topology::shapes() {
        let n = shape.cpus();
        if n > 64 { continue; }
        let mut cases = vec![
            ("storm n,4n", scenarios::wakeup_storm(n, 4 * n)),
            ("interactive n,4n", scenarios::interactive_mix(n, 4 * n)),
        ];
        if n <= 16 {
            cases.push(("lopsided n x 2n", scenarios::lopsided_placement(n, 2 * n, 60 * MS)));
        }
        for (label, scenario) in cases {
            let scenario = scenario.with_topology(shape.clone());
            let (mut worst, mut fails) = (0, 0);
            for seed in 0..20u64 {
                let mut c = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, n, 3) };
                let o = run(scenario.clone(), &mut c);
                if !o.passed() { fails += 1; println!("  FAIL {}", o.report()); }
                worst = worst.max(o.wc_rounds);
            }
            println!("{} {label}: worst idle beside stealable work {worst} rounds, bound {}, failed runs {fails}", shape.name, n + 2);
        }
    }
}

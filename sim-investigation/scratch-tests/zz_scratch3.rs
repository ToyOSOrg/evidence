// Scratch, never committed: I5's worst spread on interactive_mix, allowance lifted.
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;

#[test]
fn i5() {
    let seeds: u64 = std::env::var("ZZ_SEEDS").map(|v| v.parse().unwrap()).unwrap_or(2000);
    for (cpus, hogs) in [(1usize, 1usize), (1, 4), (1, 16), (2, 4), (2, 16)] {
        let scenario = scenarios::interactive_mix(cpus, hogs).with_fair_allowance(u64::MAX);
        let (mut worst, mut worst_bound, mut over, mut crossing_runs) = (0u64, 0u64, 0u64, 0u64);
        for seed in 0..seeds {
            let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) };
            let o = run(scenario.clone(), &mut choices);
            assert!(o.passed(), "{}", o.report());
            if o.fair_spread > worst {
                worst = o.fair_spread;
                worst_bound = o.fair_bound;
            }
            over = over.max(o.fair_over_bound);
            crossing_runs += u64::from(o.fair_over_bound > 0);
        }
        println!("zz i5 ({cpus},{hogs}) over {seeds}: worst spread {worst} at bound {worst_bound}, worst crossing {over}, runs crossing {crossing_runs}");
    }
}

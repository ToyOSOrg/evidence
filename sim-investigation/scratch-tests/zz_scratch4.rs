// Scratch, never committed.
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::latency::ReadyCause;
use kernel_sim::scenarios;
#[test]
fn which() {
    let scenario = scenarios::interactive_mix(1, 1);
    for seed in 0..40u64 {
        let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, 1, 3) };
        let o = run(scenario.clone(), &mut choices);
        let w = o.wait(0, ReadyCause::Woken);
        println!("zz seed {seed}: {}", w.summary());
    }
}

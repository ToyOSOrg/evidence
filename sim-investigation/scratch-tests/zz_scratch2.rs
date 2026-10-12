// Scratch, never committed: storm makespan and waits, per seed.
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::latency::{Latency, ReadyCause};
use kernel_sim::scenarios;

#[test]
fn storm() {
    for (cpus, waiters) in [(4usize, 16usize), (4, 64), (8, 64)] {
        let scenario = scenarios::wakeup_storm(cpus, waiters);
        let w = scenario.process_index("waiters").unwrap();
        let mut merged = Latency::default();
        let (mut elapsed, mut finish, mut svc) = (0u64, 0u64, 0u64);
        let seeds = 200u64;
        for seed in 0..seeds {
            let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) };
            let o = run(scenario.clone(), &mut choices);
            assert!(o.passed(), "{}", o.report());
            merged.merge(o.wait(w, ReadyCause::Woken));
            elapsed += o.elapsed;
            finish += o.process_finish_ns[w].unwrap_or(o.elapsed);
            svc += o.process_service_ns[w];
        }
        println!(
            "zz storm({cpus},{waiters}) mean elapsed {} us, waiters finish {} us, waiters svc {} us, woken {}",
            elapsed / seeds / 1000,
            finish / seeds / 1000,
            svc / seeds / 1000,
            merged.summary()
        );
    }
}

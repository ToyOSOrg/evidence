// Scratch, never committed.
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::scenarios;
use kernel::sched::cpu::Balance;
#[test]
fn lop() {
    for bal in [Balance::Pull, Balance::PushOnSurplus { threshold: kernel::sched::cpu::PUSH_THRESHOLD }] {
    for (cpus, threads) in [(2usize, 8usize), (4, 16), (4, 64), (8, 64)] {
        let scenario = scenarios::lopsided_placement(cpus, threads, 60_000_000).with_balance(bal);
        let (mut best, mut worst, mut full) = (0, u64::MAX, 0);
        for seed in 0..20u64 {
            let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) };
            let o = run(scenario.clone(), &mut choices);
            assert!(o.passed(), "{}", o.report());
            best = best.max(o.migrations);
            worst = worst.min(o.migrations);
            full += usize::from(o.cpus_reached() == cpus);
        }
        println!("zz {bal:?} ({cpus},{threads}): migrations best {best} worst {worst}, full {full}/20");
    }
    }
}

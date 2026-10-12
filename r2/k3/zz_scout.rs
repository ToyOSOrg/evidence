//! Scratch, never committed: the scout's phases 2 and 3 as a simulator scenario.
//! One process: main spawns `spinners` spinners and a partner, sleeps 50 ms,
//! then ping-pongs with the partner. Reports the pair's woken waits per seed.

use kernel::sched::cpu::Balance;
use kernel::sched::task::WaitClass;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::latency::{Latency, ReadyCause};
use kernel_sim::scenarios;
use kernel_sim::workload::{Op, ProcSpec, QueueSpec, Scenario, Script};

const MS: u64 = 1_000_000;
const ROUNDS: usize = 40;

fn scout(cpus: usize, spinners: usize) -> Scenario {
    let mut s = scenarios::busy_home();
    s.name = "scout";
    s.cpus = cpus;
    s.irqs.clear();
    s.balance = Balance::PushOnSurplus { threshold: kernel::sched::cpu::PUSH_THRESHOLD };
    s.placement = kernel_sim::workload::PlacementShape::LeastLoadedRotating;
    s.queues = vec![
        QueueSpec { class: WaitClass::Other }, // 0: main's sleep, never posted
        QueueSpec { class: WaitClass::Futex }, // 1: partner's turn
        QueueSpec { class: WaitClass::Futex }, // 2: main's turn
    ];
    let mut main = Vec::new();
    for _ in 0..spinners {
        main.push(Op::Spawn { template: 1 });
    }
    main.push(Op::Spawn { template: 2 });
    main.push(Op::Block { queue: 0, deadline: Some(50 * MS) });
    for _ in 0..ROUNDS {
        main.push(Op::Wake { queue: 1, all: false, boost: None });
        main.push(Op::Block { queue: 2, deadline: None });
    }
    s.procs = vec![ProcSpec {
        name: "scout",
        initial: vec![0],
        templates: vec![
            Script::new(main),
            Script::new(vec![Op::Run(spin_ns(spinners))]),
            Script::looping(
                vec![
                    Op::Block { queue: 1, deadline: None },
                    Op::Wake { queue: 2, all: false, boost: None },
                ],
                ROUNDS,
            ),
        ],
        rt: false,
    }];
    s.max_steps = 400_000;
    s.max_tasks = 64;
    s.fair_allowance_ns = u64::MAX / 4;
    s.thread_allowance_ns = u64::MAX / 4;
    s
}

fn spin_ns(spinners: usize) -> u64 {
    std::env::var("SPIN_MS").ok().and_then(|v| v.parse().ok()).unwrap_or(60 * spinners as u64) * MS
}

fn stream(cpus: usize, seed: u64) -> ChoiceStream {
    if seed.is_multiple_of(2) {
        ChoiceStream::from_seed(seed)
    } else {
        ChoiceStream::pct(seed, cpus, 3)
    }
}

fn sweep(cpus: usize, spinners: usize, seeds: u64) {
    let scenario = scout(cpus, spinners);
    let mut merged = Latency::default();
    let mut regimes = [0u32; 3];
    for seed in 0..seeds {
        let mut choices = stream(cpus, seed);
        let outcome = run(scenario.clone(), &mut choices);
        let woken = outcome.wait(0, ReadyCause::Woken);
        let mean = woken.mean_ns();
        let regime = if mean < MS { 0 } else if mean < 7 * MS { 1 } else { 2 };
        regimes[regime] += 1;
        println!(
            "cpus={cpus} spinners={spinners} seed={seed} passed={} migrations={} woken[{}] elapsed={}",
            outcome.passed(),
            outcome.migrations,
            woken.summary(),
            outcome.elapsed,
        );
        if !outcome.passed() {
            println!("{}", outcome.report());
        }
        merged.merge(woken);
    }
    println!(
        "SUMMARY cpus={cpus} spinners={spinners} seeds={seeds}: mean<1ms {} / 1-7ms {} / >=7ms {}; all [{}]",
        regimes[0],
        regimes[1],
        regimes[2],
        merged.summary()
    );
}

#[test]
fn zz_scout_phase2() {
    let seeds = std::env::var("SEEDS").ok().and_then(|v| v.parse().ok()).unwrap_or(20);
    let cpus = std::env::var("CPUS").ok().and_then(|v| v.parse().ok()).unwrap_or(8);
    sweep(cpus, cpus, seeds);
}

#[test]
fn zz_scout_phase3() {
    let seeds = std::env::var("SEEDS").ok().and_then(|v| v.parse().ok()).unwrap_or(20);
    let cpus = std::env::var("CPUS").ok().and_then(|v| v.parse().ok()).unwrap_or(8);
    sweep(cpus, 2 * cpus, seeds);
}

#[test]
fn zz_scout_phase1() {
    let seeds = std::env::var("SEEDS").ok().and_then(|v| v.parse().ok()).unwrap_or(20);
    let cpus = std::env::var("CPUS").ok().and_then(|v| v.parse().ok()).unwrap_or(8);
    sweep(cpus, cpus - 1, seeds);
}

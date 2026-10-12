//! Scratch, never committed: one arrangement, two kernels. A ping-pong pair
//! and a spinner of their own process on one CPU (the trio the metal judgement
//! read in phase 2), and the pair apart on two CPUs each beside one spinner of
//! their process (base's phase-2 arrangement). Reports the pair's woken waits.

use kernel::sched::cpu::Balance;
use kernel::sched::task::WaitClass;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::run;
use kernel_sim::latency::{Latency, ReadyCause};
use kernel_sim::scenarios;
use kernel_sim::workload::{Op, PlacementShape, ProcSpec, QueueSpec, Scenario, Script};

const MS: u64 = 1_000_000;
const ROUNDS: usize = 30;

/// `cpus` CPUs, all spawns on cpu0, the balance path off: with one CPU this is
/// the trio exactly.
fn trio() -> Scenario {
    let mut s = scenarios::busy_home();
    s.name = "trio";
    s.cpus = 1;
    s.irqs.clear();
    s.balance = Balance::None;
    s.placement = PlacementShape::AllOn(0);
    s.queues = vec![QueueSpec { class: WaitClass::Futex }, QueueSpec { class: WaitClass::Futex }];
    let mut waker = Vec::new();
    for _ in 0..ROUNDS {
        waker.push(Op::Wake { queue: 0, all: false, boost: None });
        waker.push(Op::Block { queue: 1, deadline: None });
    }
    s.procs = vec![ProcSpec {
        name: "trio",
        initial: vec![0, 1, 2],
        templates: vec![
            Script::new(vec![Op::Run(2_000 * MS)]),
            Script::new(waker),
            Script::looping(
                vec![Op::Block { queue: 0, deadline: None }, Op::Wake { queue: 1, all: false, boost: None }],
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

#[test]
fn zz_trio() {
    let scenario = trio();
    let mut merged = Latency::default();
    for seed in 0..8u64 {
        let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, 1, 3) };
        let outcome = run(scenario.clone(), &mut choices);
        let woken = outcome.wait(0, ReadyCause::Woken);
        println!("trio seed={seed} passed={} woken[{}]", outcome.passed(), woken.summary());
        merged.merge(woken);
    }
    println!("TRIO all [{}]", merged.summary());
}

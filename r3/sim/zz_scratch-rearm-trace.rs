//! Scratch, never committed: where the re-arm's probe gap comes from.
use kernel::sched::cpu::Balance;
use kernel::sched::fair::QUANTUM_NS;
use kernel::sched::hw::{TraceKind};
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::{actor, run};
use kernel_sim::invariants;
use kernel_sim::scenarios;
use kernel_sim::vm::{build_queues, Vm};

const MS: u64 = 1_000_000;

fn stream(seed: u64, cpus: usize) -> ChoiceStream {
    if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) }
}

#[test]
fn zz_rearm_gap() {
    let balance = Balance::PullWithRearm { every_ns: QUANTUM_NS, times: 1 };
    let scenario = scenarios::lopsided_placement(2, 8, 60 * MS).with_balance(balance);
    let mut worst = (0, 0u64);
    for seed in 0..20 {
        let o = run(scenario.clone(), &mut stream(seed, 2));
        println!("seed {seed}: gap {} migrations {}", o.probe_gap_ns, o.migrations);
        if o.probe_gap_ns > worst.1 { worst = (seed, o.probe_gap_ns); }
    }
    println!("worst seed {} gap {}", worst.0, worst.1);
    let seed = worst.0;
    let queues = build_queues(&scenario);
    let mut vm = Vm::new(scenario.clone(), &queues);
    let mut choices = stream(seed, 2);
    loop {
        let steps = vm.enabled();
        if steps.is_empty() { break; }
        let actors: Vec<Option<usize>> = steps.iter().map(actor).collect();
        let c = choices.choose_step(&actors);
        let step = steps[c];
        vm.execute(step, &mut choices);
        vm.reap_released();
        vm.collect_dead_processes();
        invariants::check_all(&mut vm);
        let (halted, trace_kicks) = vm.hw.with(|s| (s.halted.clone(), s.kicks));
        let c0 = &vm.cpus[0];
        let c1 = &vm.cpus[1];
        let events: Vec<String> = vm.step_trace.iter().filter_map(|e| match e.kind {
            TraceKind::Migrate { to, .. } => Some(format!("migrate->{}", to.0)),
            _ => None,
        }).collect();
        println!(
            "t={:>9} {:?} c0 fair={} surplus={} run={:?} | c1 fair={} run={:?} halted={} probe={} surplus1={} | kicks={} {:?}",
            vm.clock.0, step, c0.rq().fair_len(), vm.handles.get(kernel::sched::hw::CpuId(0)).surplus(),
            c0.running().map(|t| t.key().0), c1.rq().fair_len(), c1.running().map(|t| t.key().0),
            halted[1], c1.probe_outstanding(), vm.handles.get(kernel::sched::hw::CpuId(1)).surplus(), trace_kicks, events,
        );
        if vm.failed() { break; }
    }
    std::mem::forget(vm);
}

// Scratch, never committed: a generic timeline.
use kernel::sched::hw::TraceKind;
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::actor;
use kernel_sim::invariants;
use kernel_sim::scenarios;
use kernel_sim::vm::{build_queues, Vm};
#[test]
fn timeline() {
    let name = std::env::var("ZZ_NAME").unwrap();
    let seed: u64 = std::env::var("ZZ_SEED").unwrap().parse().unwrap();
    let pct = std::env::var("ZZ_PCT").is_ok();
    let scenario = scenarios::by_name(&name).unwrap();
    let cpus = scenario.cpus;
    let queues = build_queues(&scenario);
    let mut vm = Vm::new(scenario.clone(), &queues);
    let mut choices = if pct { ChoiceStream::pct(seed, cpus, 3) } else { ChoiceStream::from_seed(seed) };
    let mut cursor = 0;
    for _ in 0..400 {
        let steps = vm.enabled();
        if steps.is_empty() { break; }
        let actors: Vec<Option<usize>> = steps.iter().map(actor).collect();
        let choice = choices.choose_step(&actors);
        let step = steps[choice];
        vm.execute(step, &mut choices);
        vm.reap_released();
        vm.collect_dead_processes();
        invariants::check_all(&mut vm);
        let running: Vec<String> = (0..cpus).map(|c| vm.cpus[c].running().map_or("-".into(), |t| t.key().0.to_string())).collect();
        let rq: Vec<String> = (0..cpus).map(|c| vm.cpus[c].rq().keys().map(|k| k.0.to_string()).collect::<Vec<_>>().join(",")).collect();
        let transit: Vec<String> = (0..cpus).map(|c| vm.transit[c].as_ref().map_or("-".into(), |t| t.key().0.to_string())).collect();
        let halted = vm.hw.with(|s| s.halted.clone());
        let events: Vec<String> = vm.hw.with(|s| { let ev = s.trace[cursor..].iter().filter(|e| !matches!(e.kind, TraceKind::IdleEnter)).map(|e| format!("c{}:{:?}", e.cpu.0, e.kind)).collect(); cursor = s.trace.len(); ev });
        println!("t={:>6}us {:?} of {:?} run={:?} rq={:?} transit={:?} halted={:?} {}", vm.clock.0/1000, step, steps, running, rq, transit, halted, events.join(" "));
        if vm.failed() { println!("{:?}", vm.all_violations()); break; }
    }
}

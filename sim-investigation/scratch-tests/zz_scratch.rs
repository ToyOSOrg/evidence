// Scratch, never committed: a timeline of one failing seed.
use kernel::sched::hw::{CpuId, TraceKind};
use kernel_sim::choice::ChoiceStream;
use kernel_sim::explore::actor;
use kernel_sim::invariants;
use kernel_sim::scenarios;
use kernel_sim::vm::{build_queues, Vm};

#[test]
fn timeline() {
    let cpus: usize = std::env::var("ZZ_CPUS").map(|v| v.parse().unwrap()).unwrap_or(2);
    let hogs: usize = std::env::var("ZZ_HOGS").map(|v| v.parse().unwrap()).unwrap_or(16);
    let seed: u64 = std::env::var("ZZ_SEED").map(|v| v.parse().unwrap()).unwrap_or(24);
    let scenario = scenarios::interactive_mix(cpus, hogs);
    let queues = build_queues(&scenario);
    let mut vm = Vm::new(scenario.clone(), &queues);
    let mut choices = if seed % 2 == 0 { ChoiceStream::from_seed(seed) } else { ChoiceStream::pct(seed, cpus, 3) };
    let mut cursor = 0;
    loop {
        let steps = vm.enabled();
        if steps.is_empty() {
            break;
        }
        let actors: Vec<Option<usize>> = steps.iter().map(actor).collect();
        let choice = choices.choose_step(&actors);
        let step = steps[choice];
        vm.execute(step, &mut choices);
        vm.reap_released();
        vm.collect_dead_processes();
        invariants::check_all(&mut vm);
        let running: Vec<String> = (0..cpus)
            .map(|c| match vm.cpus[c].running() {
                Some(t) => format!("{}{}", if t.ext().process == 0 { "S" } else { "h" }, t.key().0),
                None => "-".into(),
            })
            .collect();
        let rq: Vec<String> = (0..cpus)
            .map(|c| vm.cpus[c].rq().keys().map(|k| k.0.to_string()).collect::<Vec<_>>().join(","))
            .collect();
        let events: Vec<String> = vm.hw.with(|s| {
            let ev = s.trace[cursor..]
                .iter()
                .filter(|e| !matches!(e.kind, TraceKind::IdleEnter))
                .map(|e| format!("c{}:{:?}", e.cpu.0, e.kind))
                .collect();
            cursor = s.trace.len();
            ev
        });
        let qe: Vec<u64> = (0..cpus).map(|c| vm.cpus[c].quantum_end().0 / 1000).collect();
        println!(
            "t={:>8}us {:?} run={:?} qe={:?} rq={:?} svc={:?} {}",
            vm.clock.0 / 1000,
            step,
            running,
            qe,
            rq,
            vm.service_ns.iter().map(|n| n / 1000).collect::<Vec<_>>(),
            events.join(" ")
        );
        let _ = CpuId(0);
        if vm.failed() {
            println!("{:?}", vm.all_violations());
            break;
        }
    }
}

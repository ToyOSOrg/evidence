
    /// SCRATCH, never committed: the same-CPU pingpong cycle, timed.
    #[test]
    #[ignore]
    fn bench_pingpong_same_cpu() {
        for background in [16usize] {
            let mut w = World::new(1);
            let mut bg = Vec::new();
            for _ in 0..background {
                let (_, shared) = w.spawn(C0);
                w.run_a_pass(C0);
                w.park_running(C0);
                bg.push(shared);
            }
            let (a, a_shared) = w.spawn(C0);
            w.run_a_pass(C0);
            assert_eq!(w.cpus[0].running().map(|t| t.key()), Some(a));
            let (_b, b_shared) = w.spawn_sibling(C0, a);
            // b is queued: run a, then park a so b runs, then b parks... set up: park b first.
            w.run_a_pass(C0);
            // Whoever runs now: park it, so the other runs; then we have one running, one parked.
            w.park_running(C0);
            let mut sides = [a_shared.clone(), b_shared.clone()];
            // sides[1] must be the parked one.
            if sides[0].state() != TaskState::Blocked(C0) { sides.swap(0, 1); }
            sides.swap(0, 1);
            assert!(matches!(sides[1].state(), TaskState::Blocked(_)), "{:?}", sides[1].state());
            let mut now = Nanos(10_000);
            let n: u64 = std::env::var("BENCH_N").ok().and_then(|v| v.parse().ok()).unwrap_or(400_000);
            let mut run = |w: &mut World, now: &mut Nanos, i: u64| {
                let parked = &sides[((i + 1) % 2) as usize];
                wake(w, C0, parked);
                *now = now.after(1_000);
                let (cpus, env) = w.split();
                let sched = &mut cpus[0];
                let current = CurrentTask::new(sched.running().expect("running").shared(), C0);
                let ticket = crate::sched::park::prepare(&current, crate::sched::park::Cancel::Answers, WaitClass::Other).expect("prepared");
                let committed = match ticket.commit() {
                    crate::sched::park::Commit::Parked(c) => c,
                    _ => panic!("refused"),
                };
                let pass = SchedPass::begin(sched, env, *now);
                let _ = pass.dispose_block(committed, None).finish();
                if i % 1024 == 0 {
                    let mut s = w.hw.state();
                    s.timers.clear();
                    s.switches.clear();
                    s.need_resched.clear();
                    s.kicks.clear();
                }
            };
            for i in 0..20_000 { run(&mut w, &mut now, i); }
            let mut best = f64::MAX;
            let mut all = Vec::new();
            for rep in 0..7u64 {
                let t = std::time::Instant::now();
                for i in 0..n { run(&mut w, &mut now, 20_000 + rep * n + i); }
                let ns = t.elapsed().as_nanos() as f64 / n as f64;
                best = best.min(ns);
                all.push(ns);
            }
            std::println!("BENCH background={background}: best {best:.1} ns per block+wake cycle; all {all:.0?}");
            w.abandon();
        }
    }
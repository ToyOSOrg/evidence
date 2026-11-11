
#[cfg(test)]
mod scratch_bench {
    extern crate std;
    use super::*;
    use crate::sched::hw::CpuId;
    use crate::sched::task::{RtState, TaskBuilder};
    use alloc::vec::Vec;

    struct P;
    impl SchedPayload for P {
        type Ctx = ();
        fn name(&self) -> u64 { 0 }
    }

    fn task(key: u64, job: &Arc<Job>) -> ReadyTask<P> {
        TaskBuilder { key: TaskKey(key), job: job.clone(), ctx: (), ext: P, rt: RtState::default(), mask: CpuMask::ANY }
            .build(CpuId(0), Nanos(0))
            .adopt(CpuId(0), Nanos(0))
    }

    /// SCRATCH: the same-CPU pingpong's run-queue operations alone.
    #[test]
    #[ignore]
    fn bench_rq_pingpong() {
        for others in [0u64] {
            let job = Arc::new(Job::new(JobKey(1)));
            let mut rq: RunQueue<P> = RunQueue::new();
            let mut keep = Vec::new();
            for k in 0..others {
                let j = Arc::new(Job::new(JobKey(100 + k)));
                rq.insert(task(100 + k, &j));
                keep.push(j);
            }
            let mut out = Some(task(2, &job));
            rq.insert(task(1, &job));
            let mut running = rq.pop_next().unwrap();
            let n: u64 = std::env::var("BENCH_N").ok().and_then(|v| v.parse().ok()).unwrap_or(1_000_000);
            let mut best = f64::MAX;
            for _ in 0..7 {
                let t = std::time::Instant::now();
                for _ in 0..n {
                    rq.charge_running(1_000);
                    let key = running.key();
                    rq.leave_running(key, running.standing_mut());
                    rq.insert(out.take().unwrap());
                    let mut next = rq.pop_next().unwrap();
                    while next.key().0 >= 100 {
                        rq.charge_running(1_000);
                        rq.put_back(next, false);
                        next = rq.pop_next().unwrap();
                    }
                    out = Some(running);
                    running = next;
                }
                best = best.min(t.elapsed().as_nanos() as f64 / n as f64);
            }
            std::println!("BENCHRQ others={others}: best {best:.1} ns per cycle");
            core::mem::forget(rq);
            core::mem::forget(running);
            core::mem::forget(out);
        }
    }
}

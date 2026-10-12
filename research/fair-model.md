# Fairness and latency model: research notes (scheduler design round)

Gathered 2026-10-12. Every claim carries its URL and one tag:

- **[PROVED by X]**: a theorem or derivation that X states and proves, or cites as proved.
- **[MEASURED by X]**: a number X obtained by running something.
- **[CLAIMED by X]**: X asserts it without proof or data in the cited text.
- **[CODE]**: read directly from source code (the code is the evidence for what the system does, not for whether it is good).
- **[INFERENCE - mine]**: my reasoning, not any source's.

Extraction caveats:

- The RTSS'96 EEVDF PDF lost every digit in text extraction (a font-encoding problem). Theorem *statements* below are taken from the surviving prose and cross-checked against the Linux source comment that restates them. The 1995 TR (ODU TR-95-22) was not fetchable: the Berkeley copy returns 404 and CiteSeerX redirects to an archive I cannot reach.
- Linux source was read from `torvalds/linux` master `kernel/sched/fair.c` and `features.h`, fetched 2026-10-12: https://raw.githubusercontent.com/torvalds/linux/master/kernel/sched/fair.c and https://raw.githubusercontent.com/torvalds/linux/master/kernel/sched/features.h
- lore.kernel.org returned 403. Mailing-list posts are cited from the lkml.iu.edu mirror and patchew.

---

## 1. EEVDF: the original papers

Primary source: I. Stoica, H. Abdel-Wahab, K. Jeffay, S. Baruah, J. Gehrke, C. G. Plaxton, "A Proportional Share Resource Allocation Algorithm for Real-Time, Time-Shared Systems", RTSS 1996. UNC TR 96-038: https://www.cs.unc.edu/techreports/96-038.pdf. The 1995 TR "Earliest Eligible Virtual Deadline First: A Flexible and Accurate Mechanism for Proportional Share Resource Allocation" (ODU TR-95-22) is cited by the kernel doc as https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564 and was not reachable.

### Model and definitions (all from 96-038.pdf)

- **Clients, quanta and weights.** Clients are active or passive. The resource is handed out in quanta of size at most q, and a client may release before the quantum ends. Each client has a weight w_i, and its share is f_i(t) = w_i / Σ_{j∈A(t)} w_j. [definition]
- **Fluid service.** The ideal service is S_i(t0,t1) = ∫ f_i dτ.
- **Lag.** lag_i(t) = S_i(t0^i, t) − s_i(t0^i, t), where s_i is the service actually received. [definition]
- **Virtual time.** V(t) = ∫_0^t 1/Σ_{j∈A(τ)} w_j dτ, which gives S_i(t1,t2) = w_i·(V(t2) − V(t1)). "virtual-time increases at a rate inversely proportional to the sum of the weights of all active clients." [definition]
- **Requests.** A client issues a request of length r. Its virtual eligible time is ve = V(t0) + s_i/w_i, and its virtual deadline is vd = ve + r/w_i. If the client used only u ≤ r of the request, the next request has ve(k+1) = ve(k) + u(k)/w_i. [definition]
- **The algorithm**, verbatim: "A new quantum is allocated to the client which has the eligible request with the earliest virtual deadline." A client with negative lag has ve > now and waits. A client with positive lag is immediately eligible. [definition]
- **Request size is decoupled from quantum size.** In the paper's words, "shorter requests guarantee better allocation accuracy, while longer requests decrease system overhead", which gives a client "the possibility of trading between allocation accuracy and scheduling overhead". [CLAIMED by Stoica et al.; the accuracy half follows from the theorems below]
- **Lag is conserved.** "at any time the sum of the lags of all active clients is zero". The paper cites a lemma in its TR. [PROVED by Stoica et al., in the TR]

### Joining and leaving (the part Linux later rediscovered)

- **Restricted systems.** The proofs cover two kinds of system. An **S-system** is one where "the lag of any client that joins, or leaves the competition is zero". A **PS-system** is one where a client joins with zero lag, may leave with *positive* lag, and "the value of virtual-time is updated" when it leaves. https://www.cs.unc.edu/techreports/96-038.pdf [definition]
- **Leaving with negative lag.** "when a client with negative lag wants to leave, we can simply delay that client (without allocating any service time to it) until its lag becomes zero. This can be simply accomplished by generating a dummy request of zero length." Because a request cannot run before it is eligible, the dummy request completes exactly at its eligible time, which is the zero-lag point. [CLAIMED by Stoica et al. as the mechanism; it reduces this case to the positive-lag case]
- **Leaving with positive lag.** There are two options. The client can stay "delayed, while continuing to receive service time, until its lag becomes zero" (Fig. 2a). Or it can leave at once, with V adjusted so that the gain is distributed among the remaining clients "in proportion to the clients' weights" (Fig. 2b, PS-system). [CLAIMED by Stoica et al.]
- **Weight change.** "changing a client's weight can be easily implemented as a leave followed by a rejoin". [CLAIMED by Stoica et al.]
- **Joining with nonzero lag is outside the proved model.** The paper assumes "all the clients that join the competition are assumed to have zero lag". Remembering lag across sleep, which Linux's PLACE_LAG does, is therefore not covered by these theorems. [INFERENCE - mine, from Definitions 1–2]
- **Cost.** Insert, delete and "finding the eligible request with the earliest deadline can be implemented in O(log n)". In the worst case O(n) dummy-request deletions can coincide. [PROVED by Stoica et al., in the TR]

### Theorems (all from 96-038.pdf)

- **Theorem 1 (S-system, quantum q).** A request with deadline d is fulfilled at f < d + q. If f > d, then lag_k(t) < q for t ∈ [d, f). This is the real-time latency guarantee: a request finishes within one quantum of its fluid-system deadline. [PROVED by Stoica et al.]
- **Theorem 2 (S-system).** The paper gives tight bounds on a client's lag while a request of size r is pending. The digits were lost in extraction. Linux restates the bound as "EEVDF gives the following limit for a steady state system: -r_max < lag < max(r_max, q)" (`entity_lag()` comment, fair.c). [PROVED by Stoica et al.; restated by Zijlstra in code]
- **Theorem 3.** Theorem 3 gives the analogous tight bounds for a PS-system. [PROVED by Stoica et al.]
- **Corollary.** "in a dynamic system in which no client request is larger than the maximum size q of a time quantum the lag of any client is bounded by q. Moreover, this result is optimal with respect to any proportional share algorithm." [PROVED by Stoica et al.]

### Comparisons the paper makes (all from 96-038.pdf; [CLAIMED by Stoica et al.])

| Algorithm | What the paper says about it |
|---|---|
| PFQ/WFQ | Lag "can be as large as O(n)". Virtual time is updated in the ideal system, which needs an event queue. |
| SCFQ | Lag bounds are a factor of two worse. |
| Stride | Lag is O(n). Hierarchical stride gets this down to O(log n). |
| SFQ | The delay bound "increases linearly with the number of clients". |
| Lottery | Gives no tight bounds. |
| Pfair PD (Baruah, Gehrke, Plaxton) | Has constant bounds in a static system only. |

The paper describes Bennett and Zhang's WF2Q and Baruah et al.'s work as independently developed parallel work that also introduces eligible times.

### What was measured (FreeBSD prototype; [MEASURED by Stoica et al.]; https://www.cs.unc.edu/techreports/96-038.pdf)

- **Setup.** A CPU-loop program whose iterations take roughly a few ms each (the digit was lost). Three clients ran with different weights. Kernel processes were scheduled by the stock FreeBSD scheduler, above the proportional-share class.
- **Results.** Cumulative iterations tracked the ideal. Lags stayed "between -[q] and [q] ms" (digits lost; the text says "consistent with the bounds given by the corollary"). A second experiment with a delayed joiner and clients leaving after a fixed number of iterations also stayed within the bounds.
- **Not covered.** No I/O-bound clients, no SMP, no comparison against a production scheduler. The paper says nothing about multiprocessors. [INFERENCE - mine from absence]

---

## 2. Linux EEVDF (Zijlstra; 6.6 through 7.x)

### Status and history

- **Kernel documentation.** The doc says EEVDF arrived "in version 6.6 (as a new option in 2024)". It also says "There are ongoing discussions on how to manage lag, especially for sleeping tasks", and that a sleeping task "remains on the run queue but marked for 'deferred dequeue,' allowing its lag to decay over VRT. Hence, long-sleeping tasks eventually have their lag reset." https://docs.kernel.org/scheduler/sched-eevdf.html (raw text: https://kernel.org/doc/html/v6.15/_sources/scheduler/sched-eevdf.rst.txt) [CLAIMED by kernel doc]
- **LWN, 2023 ("An EEVDF CPU scheduler for Linux").** https://lwn.net/Articles/925371/
  - The article quotes Zijlstra's goals: to "delete a whole [bunch] of icky heuristics code", and to rework "the base scheduler, placement, preemption, picking -- everything".
  - Early results: "there's a bunch of wins and losses, but nothing that indicates a total fail", and EEVDF "schedules a lot more consistently than CFS and has a bunch of latency wins". No numbers or workloads were given.
  - Tag: [CLAIMED by Zijlstra]
- **Cover letter for the 15-patch series, 2023.** "lots of people ran them and found no major performance issues"; "better latency and smaller variance". Patch 15 swapped latency-nice for `sched_attr::sched_runtime` as the slice knob. https://patchew.org/linux/20230531115839.089944915@infradead.org [CLAIMED by Zijlstra]
- **LWN, 2024 ("Completing the EEVDF scheduler").** https://lwn.net/Articles/969062/ [CLAIMED by LWN/Zijlstra]
  - Lag is decayed "over virtual run time", because wall-clock decay fails: virtual time "passes at a different (and varying) rate".
  - A positive lag "is, instead, retained indefinitely until the task runs again".
  - Custom slices range from 100 µs to 100 ms. With a short slice, a task "will run slower overall".
  - "the interaction with control groups has not yet been investigated".
- **"Complete EEVDF" v final, July 2024.** The changes were: delay-dequeue split up, PLACE_REL_DEADLINE, SCHED_BATCH treated as RESPECT_SLICE, min_slice propagated up cgroups, and cfs-bandwidth fixes. Luis Machado tested on a Pixel 6 and found no significant power or frame-metric difference against 6.8+EEVDF (no numbers). https://lkml.iu.edu/hypermail/linux/kernel/2408.0/00595.html [CLAIMED by Zijlstra; MEASURED by Machado, unquantified]

### Mechanism, as the code stands (fair.c / features.h master, 2026-10-12)

- **V is the weighted average of vruntimes.** V = Σ w_i v_i / Σ w_i, derived in the comment from "Fair schedulers conserve lag: \Sum lag_i = 0", with "lag_i = S - s_i = w_i * (V - v_i)". The comment adds a caveat: "this is only equal to the ideal scheduler under the condition that join/leave operations happen at lag_i = 0, otherwise the virtual time has non-contiguous motion equivalent to: V +-= lag_i / W". [CODE; derivation by Zijlstra]
- **Overflow handling.** Sums are kept relative to `zero_vruntime` (v0), so each term is about one lag bound in size. Eligibility is tested without dividing, as `avg >= (__int128)key * load`. A `PARANOID_AVG` feature reduces weights by `sum_shift` when it detects overflow. [CODE]
- **Eligibility.** lag ≥ 0, which is V ≥ v_i. The comment notes that "using 'avg_vruntime() > se->vruntime' is inaccurate due to the loss in precision caused by the division." [CODE]
- **Pick.** An augmented RB-tree is sorted by deadline and carries a min-vruntime heap annotation, so the pick takes "O(log n) time" with "tree pruning through eligibility". [CODE]
- **Deadline.** vd_i = ve_i + r_i/w_i (`se->deadline = se->vruntime + calc_delta_fair(se->slice, se)`). It is renewed when vruntime passes the deadline. [CODE]
- **Slices.** The default `sysctl_sched_base_slice` is "0.70 msec * (1 + ilog(ncpus))". A custom slice comes from `sched_attr.sched_runtime`, clamped to [0.1 ms, 100 ms]. The latency-nice approach was dropped. [CODE]
- **PLACE_LAG.** It does "preserve lag across sleep+wake cycles". On enqueue, the remembered lag is inflated as vl_i = (W + w_i)·vl'_i / W, so that after the newcomer moves V the effective lag equals the lag recorded at dequeue. The comment explains why: "adding tasks with positive lag, or removing tasks with negative lag will move 'time' backwards, this can screw around with the lag of other tasks." [CODE]
- **Lag clamp.** `entity_lag()` clamps to ±calc_delta_fair(max_slice_on_rq + TICK_NSEC). Its comment still says "double the slice length with a minimum of TICK_NSEC", which the code no longer matches. [CODE]
- **DELAY_DEQUEUE + DELAY_ZERO.** "By delaying the dequeue for non-eligible tasks, they remain in the competition and can burn off their negative lag. When they get selected they'll have positive lag by definition. DELAY_ZERO clips the lag on dequeue (or wakeup) to 0." Only a sleep of an *ineligible* task is delayed. [CODE]
  - The patch changelog: "lag is fundamentally a temporal measure. It should not be carried around indefinitely", and "a wall-time based decay is also insufficient, notably competition is required", so the task is kept "on the runqueue, competing until they are eligible". https://lkml.iu.edu/hypermail/linux/kernel/2404.2/07230.html [CLAIMED by Zijlstra]
  - This is exactly the RTSS'96 rule for a negative-lag leave (the zero-length dummy request). Linux re-derived the paper's own leave rule. [INFERENCE - mine]
- **PLACE_DEADLINE_INITIAL.** New tasks get half a slice: "existing tasks will be, on average, halfway through their slice". **PLACE_REL_DEADLINE** keeps the relative deadline across migration. [CODE]
- **RUN_TO_PARITY / PREEMPT_SHORT.** Wakeup preemption is held off "until the current task has either matched the 0-lag point or until is has exhausted it's slice". The protected window uses the shortest slice queued. A woken task with a shorter slice can cancel the protection. [CODE]
- **Cross-CPU placement.** Lag, not vruntime, moves between runqueues. Patch 07/15, "sched/smp: Use lag to simplify cross-runqueue placement", says: "Using lag is both more correct and simpler when moving between runqueues. Notable, min_vruntime() was invented as a cheap approximation of avg_vruntime() for this very purpose (SMP migration). Since we now have the real thing; use it." https://lkml.iu.edu/hypermail/linux/kernel/2305.3/08689.html [CLAIMED by Zijlstra]
  - The load balancer refuses to migrate a task that is ineligible at the source, since it "will also be ineligible when it is migrated" (`task_is_ineligible_on_dst_cpu`). [CODE]
- **Flattening the pick (2026).** The motivation is that a cgroup's weight is split across CPUs. At 64 CPUs the per-CPU group weight is worth about 19 nice-level tasks, and intermediate group entities "obscure which tasks are actually runnable", which costs latency.
  - The design keeps the hierarchy for load tracking. EEVDF picks from one per-CPU runqueue of *tasks* only, each with an effective weight `se->h_load` = its hierarchical share, recomputed on enqueue, pick and tick.
  - Sources: RFC cover letter https://lkml.iu.edu/hypermail/linux/kernel/2603.2/03103.html; patch 8/8 https://lkml.iu.edu/hypermail/linux/kernel/2603.2/03097.html; v3 https://lkml.iu.edu/2606.2/07167.html; Phoronix (secondary) says it is slated for 7.3 with default `cgroup_mode` "concur": https://phoronix.com/news/Linux-7.3-Flattens-The-Pick. [CLAIMED by Zijlstra; no measurements posted]
  - Master's avg_vruntime sums already use `se->h_load.weight`, and a comment refers to "when flat pick patches get merged". [CODE; INFERENCE - mine that it has partly landed]

### Measured problems and regressions (who measured what)

- **Input latency vs slice length (Youssef Esmat, UI-heavy workload with Chrome on the critical path).** Input latency was 226 ms with a 1.5 ms slice and 178 ms with a 6 ms slice; maximum scheduler latency was 408 ms vs 354 ms. https://lkml.iu.edu/hypermail/linux/kernel/2310.1/01999.html and https://lkml.iu.edu/hypermail/linux/kernel/2310.0/01202.html. The numbers come from a search summary of these posts; only Zijlstra's reply was fetched directly. [MEASURED by Esmat]
  - Zijlstra's reading: something on the critical path has "more than 3ms of compute in a single activation". His guidance: "once you know the 95% length of the longest activation on your critical path, you can indeed set your slice to that." https://lkml.iu.edu/hypermail/linux/kernel/2310.2/01116.html [CLAIMED by Zijlstra]
  - **Lesson:** a slice shorter than the work's activation length makes latency worse. [INFERENCE - mine]
- **Lag-based placement starving a kworker (Tobias Huschle, IBM s390, vhost/uperf).** Throughput fell from 78 to 29 Gb/s at commit 86bfbb7ce4f6, "sched/fair: Add lag based placement". Maximum scheduler wait rose from ~3 ms to 366 ms. The kworker's vruntime was ~20× the vhost thread's, so the kworker sat ineligible until it migrated. https://lkml.iu.edu/hypermail/linux/kernel/2311.2/00801.html [MEASURED by Huschle]
- **Database regressions.** Cristian Prundeanu proposed disabling PLACE_LAG and RUN_TO_PARITY. He reported "a large performance degradation" "in multiple database tests" "across multiple architectures", and posted no numbers in the patch. https://lkml.rescloud.iu.edu/2410.2/01976.html [CLAIMED by Prundeanu]
  - Gautham Shenoy measured sysbench+MySQL read-only at −9 to −12% and MongoDB+YCSB-C at ~−17%. SCHED_BATCH roughly halved the regression, but only with WAKEUP_PREEMPTION on. The RESPECT_SLICE feature (no preemption of a running slice by a woken task) removed the regressions. https://lkml.iu.edu/hypermail/linux/kernel/2411.0/02871.html [MEASURED by Shenoy/Prundeanu]
  - The regression was still reported in May 2025: https://lkml.rescloud.iu.edu/2505.0/01096.html (seen via search summary, not fetched). [CLAIMED by thread participants]
  - **Lesson:** EEVDF's wakeup preemption trades throughput for latency, and the trade needs a per-task protection rule. [INFERENCE - mine]
- **Cgroup starvation (Doug Smythies, January 2025).** turbostat in one cgroup was starved by a group of `yes` processes. Zijlstra diagnosed "wild vruntime divergence" from `reweight_entity()` shooting a group entity with negative lag "out to the right". https://lkml.iu.edu/hypermail/linux/kernel/2501.1/00692.html [MEASURED by Smythies (observed starvation); diagnosis CLAIMED by Zijlstra]
- **Lost CFS-style accumulated bonus.** Huschle pointed out that recomputing lag from scratch at every dequeue throws away the bonus CFS gave a task that runs less than its peers. One long run then makes the task ineligible on its next wake. https://lkml.iu.edu/hypermail/linux/kernel/2404.2/07230.html [CLAIMED by Huschle]
- **OSPM 2026 (Vincent Guittot).** https://lwn.net/Articles/1078696/ [MEASURED by Guittot]
  - Setup: cyclictest with 8 ms slices, hackbench/rt-app with 20 ms slices.
  - Before: under overload, short-task latency reached ~9 ms, and "the 99.9th percentile of latency often exceeds 4ms".
  - After his fixes, "the 99.9th percentile of latency moves below 700µs, except for one case". The fixes were: cap negative lag on re-enqueue; clear next-buddy when EEVDF would pick another task; dequeue delayed tasks when checking wakeup preemption; choose CPUs by min slice.
  - Listed as open: newly enqueued entities shift avg vruntime, "permanent positive lag gives unfair advantage", and disabling RUN_TO_PARITY improves maximum latency at a throughput cost.
- **Measured in the same report (OSPM 2026, Changwoo Min).** EEVDF's cpu.max overhead grew from roughly two to roughly five CPU-equivalents as cgroup depth went from 1 to 32. Min noted his baseline predates a September 2025 cpu.max rework. Same LWN URL. [MEASURED by Min]

---

## 3. Other proportional-share models: does any beat EEVDF?

**WF2Q (Bennett & Zhang, INFOCOM'96).** https://chunk.cc.gatech.edu/AY2015/cs7260_fall/wf2q.pdf

- "contrary to popular belief, there could be large discrepancies between the services provided by the packet WFQ system and the fluid GPS system".
- WF2Q serves only eligible packets (those whose start time has passed in GPS), and its service "is almost identical to that of GPS, differing by no more than one maximum size packet".
- Tag: [PROVED by Bennett & Zhang]
- This is EEVDF's eligibility test, in the network setting. [INFERENCE - mine]

**WF2Q+ (Bennett & Zhang, "Hierarchical Packet Fair Queueing Algorithms", SIGCOMM'96 / ToN'97).** https://www.cs.albany.edu/~mariya/courses/csi516F17/papers/TON-97-Oct.pdf

- **Properties.** WF2Q+ is "the first to have all the following three properties: (a) providing the tightest delay bound among all PFQ algorithms, (b) having the smallest WFI among all PFQ algorithms, and (c) having a relatively low asymptotic complexity of O(log N)". [PROVED by Bennett & Zhang]
- **System virtual time** is V(t+τ) = max(V(t) + W(t,t+τ), min_i S_i) over backlogged sessions, the "max over min operation". It guarantees the scheduler stays work-conserving and that "a newly backlogged session has a virtual start time at least as large as one of the existing backlogged sessions". [PROVED by Bennett & Zhang]
- **Per-session tags.** S_i = F_i if the session is still backlogged, otherwise max(F_i, V(a)); F_i = S_i + L/r_i. This is a principled sleep rule: a session that re-backlogs forfeits credit (positive lag), but its debt (F_i > V) survives. Unlike Linux, there is no indefinitely retained positive lag. [INFERENCE - mine]
- **Where it differs from EEVDF.** V is not the weighted average of the clients' virtual times, so it is not the exact fluid clock. It is cheaper, and V never runs backwards. [INFERENCE - mine]

**Stride scheduling (Waldspurger & Weihl, MIT TM-528, 1995).** https://read.seas.harvard.edu/~kohler/class/aosref/waldspurger95stride.pdf

- **Error bounds.** "the relative error for any pair of clients is never greater than one", but "for skewed ticket distributions it is still possible for a client to have O(n_c) absolute error". Hierarchical stride gives O(log n_c). [PROVED by Waldspurger & Weihl]
- **Lag preserved in both signs across sleep.** On leave, "remain is computed as the difference between the client's pass and the global pass". On rejoin, pass = global_pass + remain. A client "is effectively given credit" or "penalized" accordingly. [CLAIMED/defined by Waldspurger & Weihl]
- **The authors' own caveat.** This "makes an implicit assumption that a partial quantum now is equivalent to a partial quantum later", and "may not be appropriate if the total number of tickets competing for a resource varies significantly between the time that a client leaves and rejoins". This is the same problem Linux's lag inflation and lag clamp patch around. [CLAIMED by Waldspurger & Weihl; INFERENCE - mine for the link]
- **Evaluation.** Simulations plus Linux prototypes. [MEASURED by Waldspurger & Weihl]

**Start-time Fair Queuing (Goyal, Guo, Vin, OSDI'96).** https://static.usenix.org/publications/library/proceedings/osdi96/full_papers/vin/html/index.html

- **Algorithm.** Threads are ordered by start tag. v(t) is the start tag of the thread in service. The quantum length is needed only when the quantum ends, which suits threads that block early.
- **Robustness.** It stays fair when capacity fluctuates, for example when interrupts steal time, which the authors say WFQ does not. The fairness bound is proved in their SIGCOMM'96 companion paper. [PROVED by Goyal et al., cited]
- **Solaris 2.4 results.** Aggregate throughput was within 1% of the unmodified kernel for 1–20 threads. With 0–30 intermediate hierarchy nodes, throughput varied by 0.2%. Hierarchical 1:3 shares held under a fluctuating SVR4 load. [MEASURED by Goyal et al.]
- **Cost.** Its delay bound grows with the number of clients (see EEVDF's critique in §1). [CLAIMED by Stoica et al.]

**Borrowed Virtual Time (Duda & Cheriton, SOSP'99).** https://read.seas.harvard.edu/~kohler/class/aosref/duda99borrowed.pdf

- **Algorithm.** The effective virtual time is EVT = AVT − (warp ? W : 0), and the scheduler dispatches the lowest EVT. Warp is bounded by a warp time limit L and an unwarp requirement U.
- **Wake rule.** On wakeup, AVT = max(AVT, SVT), where "scheduler virtual time (SVT) is a scheduler variable indicating the minimum [AVT] of any runnable thread". Positive lag is forgiven down to the minimum, so "a thread gets the same share of the CPU on wakeup as if it has been runnable but not dispatched to this point." [CLAIMED by Duda & Cheriton]
- **Error claim.** "the error between fair share and actual allocation is never greater than the context switch allowance plus one [mcu] if the threads are all runnable". [CLAIMED by Duda & Cheriton]
- **Multiprocessor.** "each processor runs the earliest EVT thread of all the runnable threads, but adds a migration penalty". This is a global queue. [CLAIMED by Duda & Cheriton]
- **Results (Linux 2.3.17, PIII-500).**
  - Scheduler overhead was "less than 0.3%".
  - An MPEG player with an interactive task: under BVT, 1198 frames and 0 late. Under stock Linux, 904 frames, 273 "very late" and 41 late.
  - Maximum interactive latency was 15.7 ms under BVT vs 13.0 ms under Linux.
  - Tag: [MEASURED by Duda & Cheriton]
- **How warp compares to an EEVDF slice.** Warp is a latency knob that "is borrowing from its future allocation which it has to pay back", much like EEVDF's short slice. But it is a separate absolute offset with its own budget (L, U), not a property of the request. [CLAIMED by Duda & Cheriton; comparison is INFERENCE - mine]

**FreeBSD ULE (Roberson, BSDCon 2003).** Paper: https://www.cs.ucdavis.edu/~roper/ecs150/ULE.pdf (USENIX page: https://www.usenix.org/conference/bsdcon-2003/ule-modern-scheduler-freebsd)

- **Design.** Each CPU has its own kseq. Fairness comes from a current and a next queue, which "guarantees that each thread will be given use of its slice once every two queue switches regardless of priority".
- **Interactivity score.** The score is "the ratio of sleep to run time scaled to half the interactive score range", or the inverse in the upper half. A thread that scores below a threshold is interactive and goes to the current queue. History decays when its sum hits a limit.
- Tag: [CLAIMED by Roberson]
- **Measured starvation (Bouron et al., "The Battle of the Schedulers", USENIX ATC 2018).** https://www.usenix.org/system/files/conference/atc18/atc18-bouron.pdf [MEASURED by Bouron et al.]
  - fibo plus sysbench (80 mostly sleeping threads) on one core: fibo starves for the whole sysbench run, and "the starvation time is not bounded by ULE".
  - sysbench finished in 143 s under ULE vs 235 s under CFS.
  - In a single application, late-forked sysbench threads "may starve forever".
- **Verdict.** Interactivity classification gives no bounded guarantee and can be defeated by many sleepy threads. [INFERENCE - mine]

**XNU Clutch / Edge.** https://github.com/apple-oss-distributions/xnu/blob/main/doc/scheduler/sched_clutch_edge.md

- **Three levels.**
  - Root buckets are QoS classes, chosen by EDF with a worst-case execution latency (WCEL) per bucket: FG 0, IN 37.5 ms, DF 75 ms, UT 150 ms, BG 250 ms. Warp allowances are FG 8, IN 4, DF 2, UT 1 and BG 0 ms, with starvation avoidance on top.
  - Clutch buckets are thread groups, ordered by base priority plus an interactivity score (the blocked-to-CPU time ratio of the whole group).
  - Threads are ordered by Mach timeshare decay.
- **Quanta.** FG 10, IN 8, DF 6, UT 4, BG 2 ms.
- **Rationale.** Thread-level accounting rewards creating more threads, and batch bursts decay UI priority. "Thread groups represent a collection of threads working on behalf of a specific workload."
- **Edge.** Per cluster, with a CLPC-recommended cluster per thread group, steal and rebalance. The document gives no measurements.
- Tag: [CLAIMED by Apple]
- **Where EDF sits.** EDF is used across QoS classes. It is not proportional share inside a class. [INFERENCE - mine]

**Fuchsia / Zircon fair scheduler.**

- **Doc.** https://fuchsia.dev/fuchsia-src/concepts/kernel/fair_scheduler — threads, not processes, are the unit. The run queue is ordered by virtual finish time, each CPU has its own run queue, and the cost is O(log n). The doc does not mention lag. [CLAIMED by Fuchsia]
- **Code.** https://fuchsia.googlesource.com/fuchsia/+/refs/heads/main/zircon/kernel/kernel/scheduler.cc and `include/kernel/scheduler.h`, `scheduler_state.h`. [CODE]
  - Fair threads have "start and finish times on the variable timeline", an affine transform from monotonic time. A thread is eligible when `start_time <= now`, and the scheduler "Select[s] the eligible fair thread with the earliest finish time". This is EEVDF-shaped.
  - If no fair thread is eligible, the timeline is snapped forward, and the same happens on steal.
  - Default fair period 10 ms (`SchedDefaultFairPeriod = SchedMs(10)`). Minimum fair capacity 1 ms with "period expansion": s = C_min/T_default · w_total/w_min. Slice = period · w/W.
  - `AdjustFairBandwidth` recomputes the remaining slice "such that lag is conserved, keeping the same finish time".
  - On unblock it currently *resets* start and finish to now: "TODO(https://fxbug.dev/322207536): Stop resetting start and finish times when unblocking once we solve races higher in the stack", unless `EnableNewWakeupAccounting()` is set.
  - Steal order is critical-deadline, then deadline, then fair. Cross-cluster stealing needs at least 2 ms of queued runtime. The early-exit placement threshold is 25 µs.

**Does anything beat EEVDF?** [INFERENCE - mine]

- No model in this survey offers a better proved per-client bound on one CPU. EEVDF's −r < lag < max(r, q) is optimal per the corollary.
- WF2Q+ matches it in the packet setting, with a cheaper monotone V and a clean re-backlog rule (forfeit credit, keep debt).
- SFQ is more robust to unknown request lengths and fluctuating capacity, but its delay bound is O(n).
- BVT, ULE and XNU add explicit latency channels (warp, interactivity, QoS EDF), but warp needs extra per-thread budgets, and the heuristic classifiers starve (measured for ULE).
- EEVDF's two orthogonal knobs (weight = share, request size = latency) are the cleanest proved model available.

---

## 4. Multiprocessor proportional share

**Infeasible weights (Surplus Fair Scheduling; Chandra, Adler, Goyal, Shenoy, OSDI 2000).** https://static.usenix.org/events/osdi2000/full_papers/chandra/chandra_html/index.html

- **Feasibility.** A weight is feasible iff w_i/Σ w_j ≤ 1/p. One thread cannot use more than one CPU.
- **Starvation example.** On a dual CPU under SFQ, threads with weights 1 and 10 run for 1000 quanta. A new weight-1 thread then makes the original weight-1 thread "starve for 900 quanta". The paper says stride, WFQ and BVT share the flaw.
- Tag: [CLAIMED/demonstrated by Chandra et al.]
- **Weight readjustment.** Infeasible weights are capped at a 1/p share, recursively, in O(p). The paper calls it "optimal" without a formal proof. [CLAIMED by Chandra et al.]
- **Surplus.** α_i = φ_i(S_i − v), and the thread with the least surplus is picked. SFS uses global queues of all runnable threads and gives no fairness proof: the authors were "currently analyzing SFS". [CLAIMED by Chandra et al.]
- **Overhead (lmbench, Linux 2.2.14, dual PIII-500).** Context switch with 2 processes went from 1 µs to 4 µs. A simulated heuristic that scans 20 threads per queue achieved ">99%" accuracy. [MEASURED by Chandra et al.]

**Distributed Weighted Round-Robin (Li, Baumberger, Hahn, Intel, PPoPP 2009).** https://www.cs.rice.edu/~vs3/PDF/ppopp.09/p65-li.pdf

- **Design.** Per-CPU round-active and round-expired queues. Each thread's round slice is w·B. A CPU whose active queue drains pulls same-round threads before it advances its round, so CPUs stay within one round of each other.
- **Theorem 1.** "−3 w_max B < lag_i(t) < 2 w_max B" for any continuously runnable thread with a fixed feasible weight. This is independent of the number of threads and CPUs. [PROVED by Li et al.]
- **Shared state.** The global `highest` round variable is read without a lock. The paper argues the race "affects only thread placement, not correctness" and that the bound still holds. [CLAIMED by Li et al.]
- **Measurements.**
  - "CFS obtains accurate fairness within a CPU, but unbounded lag across CPUs". With 16 threads on 8 CPUs (5 at nice 1), CFS 2.6.24's lag "increases linearly with no bound" as the sampling window grows, while DWRR's lag is "bounded by 0.5 seconds for all sampling intervals".
  - Migration (cache refill) costs were measured as a function of working set.
  - Tag: [MEASURED by Li et al.]
- Tong Li's 2007 LKML RFC, DWRR on CFS: https://lkml.iu.edu/hypermail/linux/kernel/0707.2/4102.html [CLAIMED by Li]

**Pfair / PD2 (Baruah et al.; Srinivasan, Holman, Anderson, Baruah, "The Case for Fair Multiprocessor Scheduling", 2002/03).** https://www.cs.unc.edu/~anderson/papers/wpdrts03a.pdf

- **Definition.** A schedule is Pfair iff ∀T,t: −1 < lag(T,t) < 1 quantum. Pfair algorithms "are currently the only known method for optimally scheduling periodic, sporadic, and 'rate-based' task systems on multiprocessors". [PROVED by the cited Pfair literature]
- **Leaving with negative lag.** "if a task with negative lag is allowed to leave, and if it re-joins immediately, then it can effectively execute at a rate higher than its prescribed rate." This is the same hazard that EEVDF's delayed leave and Linux's DELAY_DEQUEUE address. [CLAIMED by Srinivasan et al.]
- **Overheads.** PD2's per-invocation scheduling cost was "less than 8µs", and "less than 3µs" for ≤100 tasks. That cost is paid "at the beginning of every quantum in which it is scheduled", and Pfair migrates frequently. [MEASURED by Srinivasan et al.]
- **Aligned quanta.** Calandrino/Anderson (OSPERT'06) note that optimal Pfair needs "perfectly aligned quanta": https://www.cs.unc.edu/~anderson/papers/ospert06.pdf [CLAIMED; summary via search, not fetched in full]
- **Why not in a general-purpose OS.**
  - Pfair needs synchronized, quantum-aligned decisions on all CPUs and a per-quantum global decision.
  - It migrates and preempts constantly, which is hostile to caches.
  - It assumes weights are known and tasks are periodic or sporadic. It has no answer for blocking-heavy interactive threads, whose demand is unknown.
  - Its "global queue" is the opposite of message-only per-CPU state.
  - Tag: [INFERENCE - mine, from the overheads above]

**Per-CPU queues break work conservation in practice (Lozi et al., "The Linux Scheduler: a Decade of Wasted Cores", EuroSys 2016).** https://people.ece.ubc.ca/~sasha/papers/eurosys16-final29.pdf

- **The invariant.** "make sure that ready threads are scheduled on available cores." The authors found that it "is often broken in Linux".
- **Cost.** "many-fold" slowdowns, "13% higher latency for kernel make, and a 14-23% decrease in TPC-H throughput".
- **Group Imbalance bug.** Autogroup divides a thread's load by its group's thread count, and the hierarchical balancer compares group *averages*, so idle cores did not steal.
- Tag: [MEASURED by Lozi et al.]

**Provable work conservation (Ipanema; Lepers et al., EuroSys 2020).** This is a DSL plus theorem provers that proves "concurrent work conservation" for CFS- and ULE-like policies. The abstract says performance matches the production schedulers. https://hal.archives-ouvertes.fr/hal-02554342, DOI https://dx.doi.org/10.1145/3342195.3387544 [CLAIMED by Lepers et al., abstract only; full text not fetched]

**Recent (2018–2026) work on virtual time across CPUs.**

- **Linux (2023).** Lag replaces min_vruntime normalization for migration (above). [CODE/CLAIMED by Zijlstra]
- **Linux (2026).** The flat pick fixes the per-CPU dilution of group weight (above). [CLAIMED by Zijlstra]
- **Fuchsia.** Snaps each CPU's variable timeline forward when it steals. [CODE]
- **scx_lavd (Changwoo Min, sched_ext).** Virtual deadlines are derived from inferred latency criticality, along waker/wakee chains. https://lwn.net/Articles/1051430/
  - The LWN article gives no fairness model and no LAVD numbers. LWN's 2024 sched_ext coverage reportedly carries Min's claim of higher frame rates than EEVDF with less power: https://lwn.net/Articles/991205/ (seen via search summary, not fetched).
  - Tag: [CLAIMED by Min]
- **"Progress balancing" (J. Systems & Software, ~2016/17).** It reportedly bounds the vruntime difference between any pair of tasks across cores by a constant. https://www.sciencedirect.com/science/article/abs/pii/S0164121216302412 [CLAIMED; abstract seen only in search results; the page returned 403]
- **Gap.** I found no 2018–2026 paper that proves global lag bounds for per-CPU EEVDF with lag-carrying migration. DWRR (2009) remains the strongest proved per-CPU-queue result I found. [INFERENCE - mine; absence after two targeted searches]

---

## 5. Hierarchical / group fairness

- **H-PFQ (Bennett & Zhang).** H-GPS is approximated by nesting one-level PFQ servers. "in order to provide tight delay bounds with an H-PFQ server, it is essential for the one-level PFQ servers to have small Worst-case Fair Indices". https://www.cs.albany.edu/~mariya/courses/csi516F17/papers/TON-97-Oct.pdf [PROVED by Bennett & Zhang]
- **Hierarchical SFQ (Goyal et al.).** Composable guarantees hold through the tree, with 0–30 intermediate nodes costing 0.2% throughput. https://static.usenix.org/publications/library/proceedings/osdi96/full_papers/vin/html/index.html [PROVED (cited) / MEASURED by Goyal et al.]
- **Linux cgroups.**
  - **Per-CPU weight split.** The per-CPU group entity weight is tg->w · (local cfs_rq load)/Σ(per-CPU loads). At 64 CPUs that is "about 19 nice-level tasks" per CPU, and inflating the group weight fails when load concentrates on one CPU. https://lkml.iu.edu/hypermail/linux/kernel/2603.2/03103.html [CLAIMED by Zijlstra]
  - **Depth overhead.** cpu.max overhead grew with depth, from 2 to 5 CPU-equivalents at depth 1→32 (baseline pre-Sept-2025). https://lwn.net/Articles/1078696/ [MEASURED by Min]
  - **Group Imbalance bug** (Wasted Cores, above). [MEASURED by Lozi et al.]
  - **Smythies cgroup starvation** (above). [MEASURED by Smythies]
- **XNU.** The thread group (per workload) is the unit of fairness inside a QoS bucket. QoS buckets are chosen by EDF with WCEL. URL in §3. [CLAIMED by Apple]
- **Fuchsia.** Per-thread fairness only, with no process or group level. URL in §3. [CODE]
- **BVT.** Multi-level BVT is "similar to hierarchical SFQ". URL in §3. [CLAIMED by Duda & Cheriton]
- **Process-level fairness on SMP has a structural cost.** Per-process fairness means a process's threads, running on several CPUs at once, must share one budget. Either the budget is global shared state, which costs cross-CPU traffic, or it is split per CPU from current runnable counts, which is Linux's approach. That split is approximate, and its error grows with CPU count, as the dilution figure shows. [INFERENCE - mine]

---

## 6. How each model is verified

| Model | Proof | Measurement | Tooling / oracle |
|---|---|---|---|
| EEVDF (paper) | Lag bounds −r < lag < max(r,q); f < d+q; Σlag = 0; optimality corollary (S- and PS-systems, zero-lag joins) [PROVED] | FreeBSD prototype, 3 CPU-loop clients, lags within ±q [MEASURED] | Fluid GPS model as the oracle |
| Linux EEVDF | Only derivations in comments (avg_vruntime, lag inflation, reweight COROLLARY in `rescale_entity`) [CODE]; no formal model found | Maintainers' and reporters' benchmarks: schbench, hackbench, cyclictest, rt-app, sysbench/MySQL, YCSB, uperf, Pixel frame metrics (see §2) | No simulator or invariant checker in-tree beyond WARN_ONs (`sum_w_vruntime` overflow, delayed-state checks) [CODE] |
| WF2Q/WF2Q+ | Delay bound, WFI, work conservation [PROVED] | Simulations of H-WF2Q+ vs H-WFQ/H-SFQ/H-SCFQ [MEASURED by source] | — |
| Stride | Pairwise error ≤ 1, absolute O(n), hierarchical O(log n) [PROVED] | Simulations, Linux prototypes [MEASURED] | — |
| SFQ | Fairness and delay (SIGCOMM'96 companion) [PROVED] | Solaris 2.4 [MEASURED] | — |
| BVT | Error claims [CLAIMED] | Linux 2.3.17 logs (frames, dispatch latency) [MEASURED] | In-kernel event log |
| SFS | No proof [CLAIMED pending] | Linux 2.2.14, lmbench, simulation for the heuristic [MEASURED] | — |
| DWRR | −3w_max·B < lag < 2w_max·B [PROVED] | Linux 2.6.22/2.6.24: lag vs sampling window, SPECjbb, migration cost [MEASURED] | GPS lag as the oracle |
| Pfair/PD2 | −1 < lag < 1 per task; optimality [PROVED] | Scheduling overhead µs; schedulability with overheads [MEASURED] | — |
| ULE vs CFS | None | 37 applications, starvation traces [MEASURED by Bouron et al.] | ULE ported into Linux for a same-kernel A/B |
| Work conservation | Ipanema proofs [CLAIMED from abstract] | Wasted Cores online invariant checker [MEASURED] | Invariant checker, visualizer |

---

## Merits for ToyOS [INFERENCE - mine, throughout this section]

ToyOS today, per the brief:

- per-CPU state machines that exchange messages;
- one vruntime per *process*;
- one global monotonic frontier;
- lag = frontier − vruntime, clamped to ±50 ms;
- a fixed 10 ms quantum;
- pick = least vruntime;
- steal when idle, push when busy, wake on the last CPU.

The open issue (an editor waits behind hogs) follows from the model, not from a bug. With pick = least vruntime, latency comes *only* through positive lag. An editor that ran recently has lag ≤ 0, and it is placed at the frontier behind every hog whose vruntime trails it. It then waits up to one 10 ms quantum per such hog. Worse, an editor thread shares its process's vruntime with that process's busy worker threads, so its interactivity is spent by its siblings.

### 1. Adopt EEVDF on each CPU, exactly as specified: eligibility plus a virtual deadline

- **It is the only proved model with two separate knobs.** Weight is the long-run share. Request size r_i is the latency.
- **Its bounds are the property ToyOS can test.** In a steady system, −r_i < lag_i < max(r_i, q), and every request finishes before vd + q. These are optimal for proportional share.
- **It fixes the open issue without heuristics.** A woken editor with a short r gets vd = V + r/w, ahead of the hogs' vd = ve + r_hog/w. If it is eligible (lag ≥ 0), it runs next, and it still cannot take more than its share. Linux, Zircon (start ≤ now, earliest finish) and WF2Q+ all converged on eligible-earliest-finish.
- **Keep no interactivity score.** ULE's score is measured to starve without bound (Battle of the Schedulers), and XNU's lives inside QoS EDF only.
- **Keep the strict real-time band above the fair band.** EEVDF's own pitch is that it subsumes RT, but the paper's real-time bound needs admission control, which the RT band already provides.

### 2. Express latency as the request size (slice), never as weight or a latency-nice integer

- **What the slice should be.** The right value is "the 95% length of the longest activation on the critical path" (Zijlstra). A slice shorter than the activation hurts, as Esmat measured: 1.5 ms gave 226 ms of input latency, 6 ms gave 178 ms.
- **Who sets it.** Make r_i a per-program attribute that the supervisor sets from `system.toml`, with a per-thread override behind a capability. Clamp it to a range such as Linux's [0.1 ms, 100 ms].
- **Default.** Take the default from measurement, not doctrine. Linux uses 0.7 ms·(1 + log2 ncpus), and Zircon uses a 10 ms period with a 1 ms minimum capacity.
- **Decouple the request from the tick/quantum q.** Preempt at the deadline with a one-shot timer, not a fixed 10 ms tick, so the "+q" term in the bounds becomes timer resolution.
- **Wakeup preemption needs a protection rule.** The database regressions (Shenoy: −9 to −12% MySQL, −17% YCSB) and their RESPECT_SLICE fix are measured evidence. Prefer the protection rule that follows from the model: the current task keeps the CPU until its own vd, or until an eligible task with an *earlier* vd arrives, the PREEMPT_SHORT shape. Do not use RUN_TO_PARITY-style tuning flags. Whichever rule is chosen, verify the throughput side on metal.

### 3. Virtual time and lag: per-CPU V as the weighted average, not one global frontier

- **Drop the global frontier.** A single global monotonic frontier is either shared mutable state, which conflicts with message-only per-CPU state machines, or it is not the fluid clock of any queue. Lag measured against it is not the EEVDF lag, so the bounds do not apply.
- **Keep V per CPU** as Σw_i·v_i/Σw_i, relative to a per-queue base (Linux's `zero_vruntime`). Compare eligibility in 128-bit without dividing; Rust's i128 makes this cheap and exact.
- **Across CPUs, carry lag, not vruntime.** A migration or remote-wake message carries (lag_i, remaining relative deadline, r_i, w_i). The receiver places the task at its own V − lag·(W+w)/W, which is Linux's inflation that keeps lag invariant at placement.
- **Clamp lag to the paper's bound,** (−r_i, max(r_i, q)) in virtual units scaled by weight. Do not clamp to a fixed ±50 ms, which is unrelated to any task's r.
- **Across sleep:**
  - **Negative lag.** Implement the paper's leave rule, which Linux re-derived as DELAY_DEQUEUE. A sleeper with negative lag stays counted in its CPU's W, unrunnable, until its lag reaches 0, and only then leaves. This keeps every leave at zero lag, so Σlag = 0 and the S-system bounds hold. It also defeats micro-sleep gaming, a hazard Pfair notes too. In a message model this is a per-CPU "delayed" set, with no cross-CPU state.
  - **Positive lag.** Do not keep it indefinitely. OSPM 2026 lists "permanent positive lag gives unfair advantage" as open. Use the paper's PS-system rule (leave at once, with V jumping to redistribute the credit) or WF2Q+'s re-backlog rule (S = max(F, V): credit forfeited, debt kept). Both are principled. The difference is that WF2Q+ forgives credit at wake, while PS forgives it at sleep. Choose by simulation.
  - **Expect a wake-latency cost.** Re-test the Huschle and Guittot cases. A task with stale negative lag must not become ineligible for seconds: the 78→29 Gb/s and 366 ms waits came from placement with divergent vruntime. The clamp plus delayed leave is the defence. Verify it with the simulator invariant below.

### 4. Per-thread scheduling entities, with program-level weight

- **Why not per-process vruntime.** Every source that schedules on SMP schedules threads (Linux, Zircon, XNU at the thread level inside groups, DWRR, SFS). One vruntime per process shared by threads on several CPUs needs either cross-CPU writes to a shared counter, which breaks the message-only design, or a per-CPU split of the process weight, which is Linux's cgroup approach and dilutes as CPUs grow ("~19 nice levels at 64 CPUs").
- **What to do instead.** Schedule threads as EEVDF entities with effective weight w_t = W_program · (1/n_runnable_threads_of_program). This is the flat-pick shape that Linux moved to in 2026: one flat queue per CPU, hierarchical weights computed on enqueue, pick and tick. A per-CPU runnable count per program, exchanged by message on the balancing cadence, keeps the cost off the pick path.
- **What this keeps.** It preserves what ToyOS wants from per-process fairness: isolation per program, and no reward for spawning threads, which was XNU's stated motivation. It also restores per-thread latency: an editor thread's r and lag are its own.
- **Weight feasibility.** Cap any w_t whose share exceeds 1/p of the machine using SFS's O(p) readjustment. Otherwise a single-threaded program with a large weight starves others on SMP (SFS demonstrated starvation for 900 quanta).

### 5. Cross-CPU fairness

- **Per-CPU EEVDF alone gives no global bound.** DWRR measured CFS's cross-CPU lag growing linearly without bound.
- **Two credible designs fit message passing.**
  - **(a) DWRR-style epochs.** Each CPU advances an epoch only after it has offered its round-expired work to peers. This gives a proved −3w_max·B < lag < 2w_max·B, at the price of migrations.
  - **(b) Lag-carrying migration** plus a balancer whose objective is equal *virtual-time rate* per CPU, Σw/capacity, rather than equal task counts or load averages.
  - Option (b) has no proof in the literature I found. Option (a) does.
- **Recommendation.** Make (b) the mechanism and prove or measure a global bound for it in the host simulator. Adopt (a)'s epoch invariant only if the simulator shows unbounded drift.
- **Work conservation.** Keep it as a hard invariant: no idle CPU while another CPU has a stealable runnable task beyond the migration threshold. The Wasted Cores bugs show that heuristics silently break it.

### 6. What the host simulator should check

Run the real per-CPU scheduler state machines, as host-built Rust with a virtual clock, against an exact fluid GPS/GMS oracle:

1. **Σ lag_i = 0** per CPU queue at every event, given zero-lag leaves. Checks the paper's lemma.
2. **Steady-system lag bound:** −r_i < lag_i < max(r_i, q) for every task at every event (Theorem 2). With mixed slices, −r_max < lag < max(r_max, q).
3. **Deadline bound:** each request finishes before vd + q (Theorem 1). Convert it to a real-time wake-to-run bound for an eligible woken task, and assert it.
4. **V consistency:** V equals Σw·v/Σw, recomputed from scratch. Lag is invariant across placement, through the (W+w)/W inflation. No overflow at extreme weights and vruntime spreads; property-test with i128 as the reference.
5. **Leave rules:** a negative-lag sleeper receives no service and leaves exactly at lag 0. Micro-sleep at slice end gains nothing over the long run (gaming test). A sleep/wake loop gains nothing from positive-lag retention beyond the clamp.
6. **Cross-CPU:** max |S_i − S_i^GMS| over windows of 5, 30, 60 and 120 s (DWRR's method) stays bounded, and does not grow with the window, for feasible weights and for random arrivals, sleeps and migrations.
7. **Infeasible weights:** no task starves when one task's weight exceeds 1/p (the SFS example as a regression test).
8. **Starvation freedom:** every runnable task runs within a bound computed from (r, w, W). Include the ULE counterexample, many sleepy threads against one CPU hog, and Huschle's divergent-vruntime kworker case.
9. **Work conservation:** no CPU idles while a stealable task waits. This is checked at every simulated event, as Wasted Cores did online.
10. **Group weights:** a program with n threads gets its program share regardless of n (thread-count gaming), and per-thread latency is not consumed by siblings.
11. **Differential oracles:** compare against a WF2Q+ implementation and the fluid model on identical traces, as an independent oracle. Replay recorded metal traces.

**Metal-only verdicts** (per CLAUDE.md, timing comes only from metal):

- wake-to-run latency of a short-r task against N hogs, as percentiles (schbench / cyclictest shape);
- throughput loss from wakeup preemption on a sysbench-like many-thread request workload (the regression class Shenoy measured);
- hackbench-style overload tail latency (Guittot's cases).

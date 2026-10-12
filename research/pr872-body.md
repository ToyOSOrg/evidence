**Design round. Nothing is built.** The branch holds one empty commit (`c7261039c`) on `177e72a9e`. This body replaces the first design, which the owner sent back with the ruling "state of the art from the beginning. the best current scheduler theory has to offer." His earlier ruling on order stands (https://github.com/ToyOSOrg/ToyOS/pull/865#issuecomment-6119548506): **topology first, then #865 lifts the CPU cap.** Everything below is the agent's design; the owner has ruled only on those two points.

The design rests on five research surveys of primary sources: papers, specifications, maintainers' patches and design documents. Every claim from a source carries its URL and a tag:
- **[M]** the source measured it;
- **[P]** the source proved it;
- **[C]** the source claims it;
- **[I]** it is my inference.

No choice below is made because another system makes it. Where Linux appears, it appears as a measurement or a failure, not as a precedent.

## 1. The scheduler at `177e72a9e`, and what it costs

- **The fair band** (`kernel/pure/sched/fair.rs`, `queue.rs`) works as follows:
  - Each process has one vruntime pot, and all its threads charge it.
  - A queued thread's key is frozen at insertion.
  - One global `Frontier` is `fetch_max`ed on every pick (`fair.rs:29`, `cpu.rs:1827`).
  - Lag is clamped to ±50 ms (`fair.rs:13`). The quantum is a fixed 10 ms (`fair.rs:16`).
  - The pick takes the least key. There are no weights, and a fair wake never preempts.
- **What that costs, measured in the simulator.**
  - An interactive wake waits out every rival queued ahead of it: 637 ms behind 64 hogs on one CPU (`kernel/sim/tests/policy.rs:399`).
  - The per-process split (invariant I5) reaches 418 ms at 8 CPUs. It crosses its own derived bound at 4 of 10 widths (`issues/granularity-bound-crossed-at-four-widths.md`).
- **What it costs on metal.** `Frontier` is a line every CPU writes on every pick. A line hop measured 100–101 ns on the T14 (https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119513916).
- **The real-time band** is a strict FIFO that is lent through pipes (`task.rs:686`, `pipe.rs:120`). Its measured cost is 93.3 ms of audio starvation behind a fair storm (`issues/cpu-time-is-a-band-and-not-a-reservation.md`).
- **Placement** is four flat scans by dense id: `idle_sibling` (`cpu.rs:916`), `best_victim` (`:2082`), `push_on_surplus` (`:2105`) and `CpuHandles::place` (`:2332`). A wake goes to the CPU the task parked on (`park.rs:109-128`).
  - A wake to a busy CPU waits up to a quantum: busy-target p99 is ≤10.49 ms on both benches, against ≤2.30 µs (T14) and ≤2.56 µs (AMD) when the target sleeps (https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119438569).
  - #874, accepted and being built, fixes this one defect.
- **The machines** (https://github.com/ToyOSOrg/ToyOS/pull/865#issuecomment-6119427274):
  - **T14:** 4 cores × 2 threads with one 8 MiB L3. SMT siblings are dense ids 4 apart.
  - **AMD bench:** Zen 2, 8 cores × 2 threads in two CCXs, each with its own 4 MiB L3. Siblings are adjacent ids. One CCX is up today.
  - Neither is hybrid; the T14's leaf 0x1A reads 0.

## 2. What the research settles

| Question | What the sources show | Source |
|---|---|---|
| Fair model | EEVDF serves the eligible request (lag ≥ 0) with the earliest virtual deadline. Its bounds: lag stays within −r < lag < max(r, q), each request finishes before vd + q, and Σlag = 0. The bound is optimal for proportional share. It is proved only for joins at zero lag (S-system) and positive-lag leaves (PS-system). | [P] https://www.cs.unc.edu/techreports/96-038.pdf |
| The two knobs | Weight sets the share and request size sets the latency. "Think of it as if a task has to save up for it's slice. Shorter slice means a shorter time to save up". Zijlstra's guidance: set the slice to the 95th-percentile length of the longest activation on the critical path. | [C] https://lkml.iu.edu/hypermail/linux/kernel/2309.2/03442.html, https://lkml.iu.edu/hypermail/linux/kernel/2310.2/01116.html |
| Leaving with negative lag | The paper's rule: a zero-length dummy request delays the leave until lag is zero. Linux re-derived this as DELAY_DEQUEUE. Pfair names the hazard it prevents: leave and rejoin to run faster than your rate. | [P] 96-038; [C] https://lkml.iu.edu/hypermail/linux/kernel/2404.2/07230.html; https://www.cs.unc.edu/~anderson/papers/wpdrts03a.pdf |
| Keeping positive lag across sleep | Keeping it (Linux PLACE_LAG) is outside the proofs. It is still listed as open: "the positive lag lasts forever and gives an unfair advantage" (OSPM 2026). | [C] https://lwn.net/Articles/1078696/ |
| Migration | "Using lag is both more correct and simpler when moving between runqueues." | [C] https://lkml.iu.edu/hypermail/linux/kernel/2305.3/08689.html |
| Unprotected wakeup preemption | sysbench+MySQL lost 9–12% and YCSB about 17%. A rule that respects the running slice removed the loss. | [M] https://lkml.iu.edu/hypermail/linux/kernel/2411.0/02871.html |
| Lag-based placement gone wrong | Throughput fell 78 → 29 Gb/s and a worker waited 366 ms from divergent vruntimes. | [M] https://lkml.iu.edu/hypermail/linux/kernel/2311.2/00801.html |
| Per-process weight on SMP | Splitting a group's weight per CPU dilutes it: at 64 CPUs a group is worth about a nice-19 task per CPU. The fix flattens the pick to one per-CPU queue of threads, each with an effective hierarchical weight recomputed at enqueue, pick and tick. | [C] https://lkml.iu.edu/hypermail/linux/kernel/2603.2/03103.html |
| Global fairness with per-CPU queues | CFS's cross-CPU lag grew linearly without bound [M]. DWRR's round epochs give −3·w_max·B < lag < 2·w_max·B [P]. I found no proof for per-CPU EEVDF with lag-carrying migration [I]. | https://www.cs.rice.edu/~vs3/PDF/ppopp.09/p65-li.pdf |
| Interactivity heuristics | ULE's interactivity score starves without bound. | [M] https://www.usenix.org/system/files/conference/atc18/atc18-bouron.pdf |
| Locality heuristics against work conservation | Every documented placement failure was a locality heuristic overriding work conservation. Examples: group averages that hid idle cores, wakes confined to the waker's node, 14–23% lost on TPC-H. A runtime checker caught them. | [M] https://people.ece.ubc.ca/~sasha/papers/eurosys16-final29.pdf |
| Proving work conservation | Proved in Why3 with a message-shaped concurrency model: single-writer published state, overestimated by at most one thread. It took 1.3 person-years. A flat balancer was no worse than a hierarchical one at 160 threads. | [P][M] https://hal.science/hal-02554342/document |
| Picking a victim from stale load | Sending work to the least-loaded CPU on stale information herds everyone onto it; the better of two random choices stays robust. | [P] https://www.eecs.harvard.edu/~michaelm/abstracts/tpds2000.html |
| Stealing as the balancer | Stealing beats placement-time choice across loads and service-time distributions. Adding choice at enqueue on top of stealing does not help. | [M, simulation with measured overheads] https://cseweb.ucsd.edu/~aousterhout/papers/scheduling_policies_nsdi22.pdf |
| Cross-LLC wake search | On Zen 3, hackbench went −34% and tbench +20%; the search was removed. | [M] https://lkml.iu.edu/hypermail/linux/kernel/2306.1/05961.html |
| Aggregating a process into one LLC | About +30% on hackbench on Sapphire Rapids, and −44% time on Genoa only at the maximum setting. "No obvious difference" on Milan. It needed four guard limits. | [M] https://lwn.net/Articles/1041668/ |
| Warm cores | +20–80% on fork-heavy configure runs on a Zen 2 Ryzen 4650G. hackbench went from 22.5 s to 76–380 s. | [M] https://hal.science/hal-03612592/document |
| Migration cost on Zen 2 | A line from another core in the same CCX costs 36–39 ns. From the other CCX it costs 102–126 ns. | [M] https://arxiv.org/abs/2204.03290 |
| Microsecond core allocation | Shenango reallocates in 5 µs and Caladan works at 10 µs, each with a spinning dedicated core and with C-states and turbo off. ghOSt's userland agent costs 888 ns per local schedule, against 599 ns for a CFS context switch. | [M] https://www.usenix.org/system/files/nsdi19-ousterhout.pdf, https://www.usenix.org/system/files/osdi20-fried.pdf, https://storage.googleapis.com/gweb-research2023-media/pubtools/6413.pdf |
| Time as a capability | A scheduling context (budget, period, core) is a kernel object reached by a capability. Only a holder of a per-core control capability can give one budget. A passive server bills its caller. Call +1% and replyRecv +4% on x86 [M]. The proofs are still in progress [C]. | https://trustworthy.systems/publications/full_text/Lyons_MAH_18.pdf, https://docs.sel4.systems/projects/sel4/verified-configurations.html |
| Real time without budgets | Each RT class without a budget that I read grew a policer [I]. Linux's grew RT throttling, then a fair deadline server, and that server stalled RT threads "100ms to *multi-second*" by charging capacity-scaled time on big.LITTLE [M]. | https://lkml.rescloud.iu.edu/2506.1/09834.html, https://patchew.org/linux/175162039765.406.4702062609825995302.tip-bot2@tip-bot2/ |
| Reservations | A hard CBS bounds service delay at 2(P−Q). Partitioned EDF is exact at ΣU ≤ 1 per CPU; global EDF guarantees only bounded tardiness. | [P] https://retis.santannapisa.it/~tommaso/publications/RTNS-2017.pdf, https://docs.kernel.org/scheduler/sched-deadline.html |
| Audio on reservations | Glitch-free at 2.67 ms with about 40% less CPU energy than SCHED_FIFO pinned at maximum frequency. | [M] https://retis.santannapisa.it/~tommaso/publications/Elsevier-JSS-2019.pdf |
| Time across asynchronous calls | Fuchsia made channel calls force bandwidth inheritance in January 2026, "including all user space fair threads". | [C] https://fuchsia.googlesource.com/integration/+/ba88d6219a28ce5d9ed1b9e8dcab7b5d29507a86 |
| Hybrid hints | Thread Director's speedup prediction correlated below 0.1 with measurement on an i9-12900K. Hybrid capacity is "a rough approximation" and is refused under SMT: "the capacity of SMT threads is not deterministic even approximately". | [M] https://docta.ucm.es/entities/publication/39718b81-76c7-4f07-8532-338c120ab67c; [C] https://lkml.rescloud.iu.edu/2408.3/05034.html |
| Energy-aware placement | "no significant savings on SMP platforms have been observed yet" | [C] https://docs.kernel.org/scheduler/sched-energy.html |

## 3. The design

The frame has two parts:
- **A checked core.** Work conservation, fairness bounds and reservation guarantees are stated as invariants and checked.
- **Locality and energy are hints.** A hint may delay a decision by a bounded patience, and may never break the core.

Every documented failure in §2's locality rows is a hint that broke the core.

### 3.1 Topology: the machine's cache tree, with capacity carried as data (stage S1)

- **Each CPU reads its own facts at bring-up**, into its own arch per-CPU block; only a CPU can execute its own CPUID.
- **x86 sources:**
  - **Levels:** leaf 0x1F where present, else 0xB, give the SMT and package shifts.
  - **Caches:** the deterministic cache leaf (4 on Intel, 0x8000001D on AMD; one format). Every data or unified cache that more than one core shares becomes a level, keyed `x2apic_id >> ceil_log2(sharing)`. That covers the LLC, plus an Intel E-core module's shared L2 where one exists.
  - **Core kind:** leaf 0x1A, kept as an opaque value.
  - **Capacity:** `IA32_HWP_CAPABILITIES` highest performance, an MSR the kernel already programs, or AMD's CPPC MSR where the part has one.
- **AArch64 sources:** a PPTT decoder in `lib/acpi` gives the processor hierarchy and the cache owned by each node. The MADT GICC gives each CPU's efficiency class.
- **The tree.** The levels are core → each shared cache → package. A level identical to its parent collapses.
  - The T14 is {core, LLC}. The AMD bench is {core, LLC (CCX), package}.
  - Each level partitions the CPUs into **domains that are lists of dense ids, never ranges**, as #865 §6 requires.
- **Built from each CPU's own keys.** The second Wasted Cores bug came from groups built from core 0's viewpoint [M].
  - A key set that is not a tree is refused by name: for example, a core whose threads carry two LLC keys. Firmware and hypervisors are trusted for nothing.
  - A CPU without 0xB, or without a cache leaf, is refused at boot by name. So is an AArch64 machine without a PPTT.
- **Each level carries a patience in nanoseconds.** It is how long a queued task may wait before a CPU across that level must take it: the principled form of "running cold beats waiting" [I]. It is 0 inside an LLC. Across LLCs it is set from metal row R5, not from a constant.
- **Capacity facts are data.**
  - `capacity` is 0..1024 against the fastest CPU; `efficiency_class` is ordinal; the core kind is opaque.
  - SMT never enters capacity.
  - Idle-state exit latencies join the record when #870 lands.
  - Nothing consumes capacity until a bench shows unequal values (§3.7).
- **Where it lives.** It is pure, in `kernel/pure/sched/topology.rs`, host-tested. The x86 word decoding is pure arithmetic over recorded CPUID words; only `cpuid` and `rdmsr` stay in `arch`.
- **One boot line per CPU:** `topo: cpuN core=… llc=… pkg=… cap=… class=…`.

### 3.2 Work conservation is the invariant every placement rule answers to (S0, S2)

**WC.** A CPU that is parked, with no probe outstanding and nothing in flight to it, never coexists with a stealable task that has waited longer than the patience of the level between them, unless that task's CPU has rung a parked CPU for it or published it in a summary the parked CPU re-read after parking.

**Bounded response.** An idle CPU that can see stealable work runs a task within K protocol rounds. K is derived from the tree's depth.

- This is Ipanema's concurrent work conservation [P], restated for messages.
- The simulator checks it at every step. Its negative control replays Wasted Cores' group-average bug and must turn red.
- A `sched-check` kernel monitors it on idle CPUs, so the monitor is charged to idle time.

### 3.3 Placement and balancing (S2)

- **Published state stays single-writer, and errs only in the safe direction** (Ipanema's model).
  - Each CPU's handle publishes: running, idle or parked; `stealable`, the eligible fair tasks queued other than the loaded one (#874's count); and its last-busy stamp. Σw joins in S4.
  - **Per LLC**, on one padded line per 64 members: a parked-CPU word and a stealable-CPU word. A whole idle core is computed by the reader from the parked word and the static sibling masks, so no third word is written.
  - **Machine-wide**, one bit per LLC: "has a parked CPU" and "has stealable work". A CPU that makes its LLC's word non-zero sets the bit. A CPU that clears the bit re-reads the LLC word and sets the bit again if the word is non-zero.
  - These words record existence only, never averages: Wasted Cores' worst bug was an average hiding an idle core [M].
  - The words are written only on transitions.
- **The handshake is today's `balance_fence` Dekker pair, widened from one word to two.**
  - The pusher sets its stealable bit, fences, then reads the parked bits.
  - The parker sets its parked bit, fences, then re-reads the stealable bits.
  - `loom_push.rs` models the pair, and its relaxed-fence control must still turn red.
- **Steal: the idle pass, so no kernel thread.**
  - It escalates sibling → own LLC → other LLCs.
  - Within a level, the victim is the better of **two random** CPUs whose stealable bit is set; across LLCs, the better of two random LLCs. This replaces "most surplus", which herds on stale data [P, Mitzenmacher].
  - The victim answers with up to half its stealable tasks, furthest-from-running first, never the loaded one (`cpu.rs:1838-1880`'s rule, kept).
  - A thief across an LLC takes only tasks that have waited at least that level's patience.
- **Push.** A pass that publishes `stealable > 0` rings one parked CPU, nearest first: a parked whole core in its LLC, then any parked CPU there, then another LLC after its patience. The two-choice rule picks among candidates, and the rung CPU pulls, so binding happens late.
- **Spawn.**
  - A thread of a running program goes to a whole idle core in the spawner's LLC, else any idle CPU there. It shares the address space the spawner just warmed.
  - A new program goes to the LLC with the most whole idle cores, onto a whole idle core.
  - Otherwise it goes to the two-choice least-loaded CPU. `ROTATE` (`driver.rs:388`) goes: two random choices already break the boot tie.
- **Fairness balancing between busy CPUs comes in S4**, because its quantity is Σw. It runs at a slice end on a CPU that has waiting work, against two random CPUs at the nearest level that also have waiting work. It moves at most half the difference and only eligible tasks, and it runs on no idle CPU. It is not part of WC.
- **Not built until a bench shows the gain:**
  - warm-first idle choice (Nest) [M both ways];
  - aggregating a process into one LLC [M neutral on 8-CPU CCXs];
  - core compaction.

### 3.4 The wake path, and what becomes of #874

The parked record is the home CPU's, so home decides at its drain, as #874 accepted. The order is:

1. **Home is idle:** the task runs there, one hop, ≤2.30 µs (T14) and ≤2.56 µs (AMD) measured.
2. **Home is busy:** `idle_near(home)` picks a whole idle core in home's LLC, else any idle CPU in it, with one word read. Then `hand_off`, which is #874's forward.
3. **Across LLCs (S3):** a proven 1:1 pair, where the waker equals `last_waker` (record-local, no new shared word), moves to an idle CPU in the waker's LLC. Row R3 judges it.
4. **No cross-LLC search at wake time.** A task that waits past the cross-LLC patience is taken by a stealer under WC. That is the measured lesson of the removed Zen 3 search [M].
5. **Nothing is idle:** the task queues at home under #874's kick, compare and M.

**#874 is kept, lands first, and stays the wake path's "whether and when".**
- **Arm 1** (kick a busy target) and **arm 3** (one queued task is stealable; `PUSH_THRESHOLD = 1`) stand unchanged.
- **Arm 2's forward** gets its CPU from `idle_near` in S2. The body of `idle_sibling` is the only thing replaced.
- **Arm 2's compare** ("W's key < T's") is replaced in S4 by the EEVDF rule in §3.5, as #874's own roast 9 foresaw.
- **Arm 4's M = 1 ms** stays as the protection window.

**The sync handoff is recorded, not designed.** Moving a wakee onto the waker's CPU when the waker is about to block needs a "the caller now waits" signal. ToyOS's IPC (framed pipes and ports, no call/reply primitive) does not carry one.

### 3.5 The fair model: EEVDF on each CPU (S4)

- **Entities are threads.** Each task record holds v, vd, request size r, weight w and lag.
- **V is per CPU:** V = Σw·v / Σw over the queued, running and delayed entities, kept relative to a base. Eligibility (v ≤ V) is tested in `i128` without a division.
  - The pick is the earliest vd among eligible entities, with a total tie-break.
  - This deletes `Frontier`, the global line written on every pick.
- **Joins and leaves stay inside the proved model** [P, 96-038]:
  - **Wake and spawn** join at zero lag: v = V.
  - **Sleep with negative lag is a delayed leave.** The entity stays in its CPU's sums, unrunnable, until its lag reaches zero: the paper's dummy request. A parked task already lives on its home CPU, so this is per-CPU state and adds no shared word. Micro-sleeps then buy nothing [P].
  - **Sleep with positive lag forfeits it**, and V moves (the PS-system rule). The open "permanent positive lag" problem [C] cannot arise.
  - **Migration** (steal, push, forward) carries lag in the `Adopt` and places at V_dst − lag·(W+w)/W. A move is the scheduler's act, not the task's, so it neither gains nor loses. An ineligible task is never migrated.
  - **Lag is clamped** to the paper's (−r, max(r, q)), not to a fixed ±50 ms.
- **Latency comes from the request size, which is measured, never configured.** The owner asked for responsiveness "universally, not as an option" (`issues/the-fair-band-orders-by-share-alone-and-a-woken-editor-waits.md`).
  - Each thread's r is its own decayed 95th-percentile activation length: run time from dispatch to park.
  - r is clamped to [r_min, r_max], a range the program's endowment bounds; r_max is today's 10 ms.
  - This is Zijlstra's own rule, applied per task by the kernel [I].
  - It is safe because EEVDF's share is the weight alone: a short r buys an earlier deadline, never more CPU [P].
- **Preemption.**
  - A one-shot timer fires when the running request completes. That replaces the fixed quantum tick.
  - An arriving fair task preempts only if it is eligible, its vd is earlier, and the running task has had M = 1 ms since dispatch.
  - RT, kill and stop preempt unconditionally.
  - M is the protection the database regressions measured as necessary [M].
- **Per-program fairness without a shared pot.**
  - A thread's weight is w_t = W_program / n_program, where n is the program's runnable-thread count. It is recomputed at the thread's own enqueue and at each new request.
  - That is one atomic per program, written at enter and leave. Today's share lock already pays this, and also charges the pot on every pass; the per-pass charge goes.
  - This is the flat shape that removes per-CPU dilution [C].
  - W_program = 1 until S6.
- **Cross-CPU fairness.** Lag-carrying migration plus the busy-busy balancer in §3.3, which equalizes Σw/capacity.
  - The simulator measures the per-program service error over growing windows, as DWRR measured CFS.
  - DWRR's round epochs [P] are adopted only if that error grows with the window.
  - A thread that cannot be split simply ends up alone on its CPU. The balancer moves a task only if the move lowers the pair's maximum, so it never chases an infeasible weight (SFS's starvation case is a simulator scenario).
- **What S4 deletes:** `Frontier`, the per-process `ShareState` pot and its lag, `MAX_VRUNTIME_LAG_NS`, and the frozen insertion-time keys behind I5's staleness term. It closes the mechanism of `issues/per-process-fair-split-is-the-policy.md` and the defect in `issues/granularity-bound-crossed-at-four-widths.md`.

### 3.6 Real time: reservations held as capabilities (S5)

This is `issues/cpu-time-is-a-band-and-not-a-reservation.md`'s track. Its structure stands:
- a per-CPU ledger;
- three entity kinds: a real-time client, one fair class per CPU and one dying server per CPU;
- EDF among the entities that hold budget, with a work-conserving background tier;
- grid replenishment;
- a system reserve;
- refusal by name.

The research amends it in six places:

1. **Time is a capability.**
   - A scheduling context (Q, P, CPU) is a kernel object reached by a handle. It can be minted only from per-CPU bandwidth its minter holds, so admission holds by construction [C, seL4 MCS].
   - `supervisor` holds the root bandwidth and endows it from `system.toml`.
   - This deletes `Rights::RT` and `SYS_RT_ENTER`.
2. **The hard-CBS wake rule, with implicit deadlines only** (D = P). The service delay is bounded by 2(P−Q) [P]. A reservation with D < P is unrepresentable until a workload needs one.
3. **Budgets are charged in wall time, never in capacity- or frequency-scaled time.** Scaled charging is the multi-second RT stall measured on Linux 6.12 [M].
4. **Every audio hop that runs on its own clock holds its own context.** The client callbacks' contexts are cut from soundd's bandwidth, the workgroup shape.
   - So a new client is refused at connect rather than heard as silence. Android measured reservations glitch-free at 2.67 ms [M].
   - This deletes the pipe lend (`pipe.rs:120`, `RtState::inherited`, invariant I9) and the mark's soundd-to-client trigger. The mark stays only for lock waits.
5. **Placement is topology's.** EDF is partitioned per CPU: exact admission, no Dhall effect [P].
   - Admission prefers a CPU whose core sibling holds no context, in the LLC of the device's interrupt CPU.
   - Semi-partitioning (99%+ schedulable [M], https://people.mpi-sws.org/~bbb/papers/pdf/rtss16b.pdf) waits for a reservation that does not fit one CPU.
6. **Time across IPC.**
   - ToyOS IPC is asynchronous, so seL4's donation, which needs a synchronous call, and Fuchsia's channel-call inheritance have no hook here. Active servers hold their own contexts.
   - A client's work done by a server is charged to the server. This is recorded as open in roast 9.

### 3.7 Energy and capacity

- **S1 carries the facts.** A consumer is built only when a bench shows different values.
- **Favored cores may be the first consumer.** Turbo Boost Max and AMD's preferred cores give different highest performance per core even on non-hybrid parts [C, https://docs.kernel.org/admin-guide/pm/amd-pstate.html]. Row R1b reads that on both benches. If the values differ, spawn and wake prefer the highest-capacity idle core.
- **Energy-model placement, Thread Director and per-thread hardware hints are refused until there is hybrid metal**, for the reasons in §2. The policy for them, when it comes, belongs to a userland power server, with the kernel enforcing only the constraints it sets [I].
- **Spread is the default.** Packing for package C-states is a measurement owed to #870's deep idle states, not a guess.

### 3.8 Refused, with the reason

- **A periodic global balancer.** Work conservation comes from idle stealing plus push, and stealing migrates nothing when all CPUs are busy [P, https://cs.utexas.edu/~venkatar/sys_perf_analysis/ws_theory.pdf]. A tick on idle CPUs is an audio change (`kernel/CLAUDE.md`).
- **Least-loaded choice from stale data** (herding), and **averages in summaries** (Wasted Cores).
- **Interactivity scores** (ULE starves) and a **latency-nice integer**. Latency is r.
- **A real-time band without a budget**, and **global EDF**.
- **Microsecond core allocation with a spinning core, userland per-decision agents, and UINTR.** The desktop works on a millisecond scale. Those systems switch C-states and turbo off; ghOSt measured its agent's cost; UINTR is Intel-only and has no Linux support [M/C, notes].
  - A dedicated core is already expressible as data: a context with Q = P.

## 4. What it deletes

- **S2:**
  - `idle_sibling`;
  - the flat scans in `best_victim`, `push_on_surplus` (with `push_cursor`) and `CpuHandles::place`;
  - the driver's `ROTATE`;
  - #865's roast 1 debt: the O(n) idle-path scan at 768 CPUs becomes one LLC word plus one machine word per 64 LLCs.
- **S4:**
  - `Frontier`;
  - the `ShareState` pot and its lag;
  - `MAX_VRUNTIME_LAG_NS`;
  - `QUANTUM_NS` as the fairness granularity, which becomes r_max;
  - the frozen insertion-time keys;
  - #874's key compare;
  - the per-pass share charge.
- **S5:**
  - the RT FIFO band and `serves_rt_band`;
  - the lend (`RtState::inherited`, `lends`, invariant I9) and `rt_boost_pending`;
  - the dying list's aging (`DYING_AGE_NS`, `DYING_CHUNK_NS`, `aged_grant`, `Corpse::since`);
  - `Rights::RT` and `SYS_RT_ENTER`.
- **Issues closed:**
  - `placement-is-blind-to-caches-and-topology` at S3;
  - `the-fair-band-orders-by-share-alone-and-a-woken-editor-waits` and `granularity-bound-crossed-at-four-widths` at S4, and `i13s-margin-at-32-cpus-is-down-to-two-milliseconds` re-measured against S4's new bound;
  - `cpu-time-is-a-band-and-not-a-reservation` at S5.

## 5. Stages, and how each is verified

The order is the owner's: **S0–S2 before #865, then S3**. S4 and S5 are independent tracks:
- S4 starts once #874 lands, beside S1–S3, and lands after S2, whose summaries its balancer reads.
- S5 can start at any time.

Every metal row runs on **both benches**. Its negative control is the whole change reverted onto the base its green arm was measured on. The tiers are host first, then simulator, then metal; QEMU is not used.

| Stage | What lands | Host, simulator, loom | Metal |
|---|---|---|---|
| **S0** | The simulator's topology shape (§6) and the WC invariant. No kernel change. | Every scenario clean at the T14's shape (one LLC, 4 cores × 2, siblings 4 apart), the AMD bench's (2 LLCs × 4 × 2, adjacent), 4×8×2 and 48×8×2. WC red on the replayed group-average bug. Per-level counts printed. | none |
| **S1** | Discovery, the tree and the boot line. No behaviour change. | Decoding checked against the scout's recorded CPUID words (a hardware oracle, committed with provenance). PPTT corpus plus QEMU's PPTT as a fixture. Refusals of `from_keys`. | R1, R1b |
| **S2** | Summaries, stealing, push, spawn, `idle_near`. | The simulator gates in §6 at every shape. Loom on the widened Dekker pair, with its relaxed control red. | R2, R4, R6 |
| **#865** | 16 CPUs on the AMD bench, two LLCs. | #865's own gates. | its own rows; R1 again |
| **S3** | Cross-LLC patience from R5, the 1:1 pair rule. | Pair and 1:N scenarios: a pair crosses LLCs at most once, and a 1:N server is pulled zero times. | R3, R5, R7, R9 |
| **S4** | EEVDF, measured request size, weight split, busy-busy balancer. | See below. | R8, R10, R11, audio |
| **S5** | Contexts, EDF/H-CBS, the fair and dying contexts, the audio graph. | Admission algebra exact under any mint or split sequence. No budget overrun in any window of length P. Zero misses under admitted load. Fair floor holds. Time conserved. Wall-time charging, with scaled charging as the negative control (it must turn red). | R12, audio |

**S4's simulator gates.** These are the paper's theorems run as invariants:
- Σlag = 0 per CPU, and the lag bound, at every step.
- An eligible woken request runs within vd + q.
- V recomputed from scratch matches.
- Micro-sleep and thread-count gaming gain nothing.
- SFS's infeasible-weight case does not starve.
- Per-program service error stays bounded as the window doubles (DWRR's method).
- I5 and I13 hold at their new derived bounds; I13's coverage is reported beside its verdict.
- The policy table is re-measured. Prediction: the 637 ms interactive-wake row falls to the order of r_min + M.

**S4's independent oracle** is a fluid GPS model and a separately written WF2Q+, fed identical traces: a differential implementation.

**The metal rows and their kill conditions** (9 boots per arm where a rate is compared):

| Row | Measures | Kill / bound |
|---|---|---|
| **R1** `topology_readback` | Boot `topo:` lines against an expectation derived from the scout's raw words. The independent oracle is a userland program's own CPUID. | An exact match; a red is a defect in S1. Re-run on the AMD bench at 16 CPUs. |
| **R1b** capacity readback | Per-CPU HWP highest performance on the T14, against Linux's reading of the same per-CPU value under Ubuntu on the same machine as the oracle. AMD CPPC through its MSR, or "unknown" with its provenance. | A fact. A favored-core consumer is built only if the values differ. |
| **R2** `smt_spread` | k = cores spinners, each sampling its core from CPUID every ms for 2 s. | **Row:** after the first slice, no sample has two spinners on one core while another core is empty. **Kill:** on the AMD bench (adjacent siblings), the build's lowest aggregate rate is not above the revert's highest; then whole-core preference goes. The T14 is the control and must sit within the revert's spread. |
| **R4** idle-path cost | Pass-cost quantiles, `wake_storm_cost`, the audio rows. | **Kill:** p99 pass cost more than one power-of-two bucket above the revert, or any audio row red. |
| **R6** #874's K1–K4 | Re-run on S2's head. | **Kill:** any K-row regresses from #874's own head. |
| **R3** pipe pair, AMD at 16 | LLC per exchange, and round trip. | **Row:** ≥ 99% of exchanges after the first 1000 are in one LLC. **Kill:** the median with the pair rule is not below the revert's; then the rule goes. The T14 is the one-LLC control. |
| **R5** refill and line cost | Per-level core-to-core line transfer, and a 4 MiB first sweep after a same-LLC versus a cross-LLC move. | A measurement that sets the cross-LLC patience. |
| **R7** two-CCX spread, AMD at 16 | 8 spinners. | **Row:** one per core, 4 per CCX. **Kill:** rate not above the revert's. |
| **R9** message storm | Many pipe pairs, hackbench-shaped. | **Kill:** the build's median completion time is above the revert's worst; then the cross-LLC rule that caused it goes. This is the Zen 3 search and Nest lesson [M]. |
| **R8** editor among hogs | A sleeper (0.25 ms every 3 ms) against N = 1, 4, 16 hogs per CPU in another program; wake-to-run p99 and maximum. | **Kill:** p99 not below the revert's at N = 4 and 16. |
| **R10** wake-preemption throughput | A many-thread request/response program beside a CPU-bound one. | **Kill:** the build's median throughput is below the revert's minimum; then the protection rule is reworked. |
| **R11** thread-count fairness | Program A with 1 hog per CPU against B with 8 per CPU. | **Row:** each program gets ≥ 45% of the machine's iterations. |
| **R12** reservation jitter | A reserved thread's release-to-run under a fair storm. | **Row:** ≤ 2(P−Q) plus the blocking bound. The revert reproduces the 93.3 ms starvation as its negative control. |

**The audio rows** (`audio_tone_load`'s underruns stay 0 under burners) run at S2, S4 and S5. Under the root rule on audible quality, any red there stops the stage.

## 6. The owner's question: should the simulator model topology first? Yes, as S0, and only its shape

- **What it adds.** `Scenario::with_topology` builds per-CPU keys for any tree, under a **seeded permutation of dense ids**. The keys go through the same `Topology::from_keys` the kernel uses.
  - Shapes: the T14 (4×2, siblings 4 apart), the AMD bench (2 CCX × 4 × 2, adjacent), 4×8×2, and a 768-CPU shape of 48 LLCs × 8 × 2.
  - Capacity rides along as data, all 1024 today.
  - The simulator already delays and reorders messages adversarially, and that stays.
- **Why first.**
  - On a flat simulator every CPU is in the caller's LLC, so the cross-LLC tier and the machine-level summary bits would be dead code under every gate.
  - "Every CPU is reached" (`policy.rs`) is exactly what a reordered scan can break.
  - The WC invariant must exist and red on its control before S2 changes a chooser.
- **What it reports: counts, not times.** Migrations per level, wakes placed per level, failed steals, IPIs, rounds-to-run, and idle-while-stealable in rounds.
- **The gates:**
  - every scenario clean at every shape;
  - WC at every step;
  - every CPU reached at two or more LLCs;
  - k = cores spawns leave no core doubled while a core is empty;
  - a cross-LLC pair migrates across LLCs at most once;
  - a 1:N server whose clients alternate LLCs is pulled zero times.
- **What it must not gain.** No cache, frequency or SMT-throughput model.
  - The simulator's clock advances on the executing CPU's step (`policy.rs`'s header).
  - Nest's whole result is frequency [M].
  - A modelled refill would confirm the assumption it was given.
  - Per-level patience enters only as a parameter, so a unit test can check the patience rule is followed. Whether it pays is metal's verdict alone.

## 7. How it fits #865's boot-sized tables

- Each CPU writes its own record into its own arch per-CPU block at bring-up, so no `[T; MAX_CPUS]` static is added.
- `Topology` (each level's domain lists), the per-LLC summary lines (one padded word per 64 members) and the machine bitmap (one word per 64 LLCs) are `Box<[_]>`s built once, after the roster commits, in `driver::init`, beside `CpuHandles`. Nothing names `MAX_CPUS`.
- S2 retires #865's roast 1, the flat idle-path scans, before the cap is lifted.

## 8. The roast

1. **This is a whole-scheduler plan, not the topology patch the ruling ordered first.** S0–S2 alone serve the ruling. S4 and S5 are sequenced around it. Counting them all, it is the largest scheduler change the tree has had. Size, estimated and not measured, in production lines:
   - S1 ≈ 400 added, of which the PPTT decoder is ≈ 200;
   - S2 ≈ 400 added and ≈ 150 deleted;
   - S4 ≈ 600 added and ≈ 450 deleted;
   - S5 is the track's own.
2. **The LLC half meets metal only at #865's 16 CPUs.** Before that both benches have one LLC, so S2 shows only the SMT half (R2) and its cost (R4).
3. **The measured request size is my inference.** No paper or patch measures a per-task automatic r. The nearest is Zijlstra's guidance and Yousef's question about requesting the average runtime, both in the 2023 thread.
   - The risk is phase changes: a thread that was bursty and turns into a hog keeps a short r for one decay window. That buys it latency, never share.
   - R8 and R10 are its kill conditions.
4. **Forfeiting positive lag departs from the retain-lag school.** I chose it to stay inside the paper's proved model. The consequence is that interactive latency rests wholly on r. If R8 shows that is not enough, the alternative is WF2Q+'s rule (forfeit credit, keep debt), not retained lag.
5. **Cross-CPU fairness of the chosen mechanism is unproved.** DWRR's epochs are the proved fallback, and the simulator decides between them, not metal.
6. **The per-program runnable count is a line that every CPU running that program writes at enter and leave.** That is cheaper than today's per-pass pot charge, but it is not free at width. Weight staleness is bounded by one request and is unproved beyond that.
7. **Randomness enters the kernel** (two choices), through a per-CPU generator seeded from the CPU id. The simulator seeds it, so runs stay reproducible. Herding is what it buys out.
8. **A busy-home wake is still two hops.** The wakee's record belongs to home. A waker that claims an idle CPU directly (join-idle-queue [P], https://www.microsoft.com/en-us/research/wp-content/uploads/2011/10/idleq.pdf) would need that ownership changed. That is about 5 µs against today's 10 ms, and it is recorded, not designed.
9. **Server work is charged to the server.** With asynchronous IPC, a client can make a server burn CPU that is billed to the server's share, which is a hole in per-program fairness. Closing it needs a synchronous call primitive with donation, or per-request accounting. Both are IPC decisions, for the owner.
10. **SMT interference is unpriced in reservation admission.** A hardware thread's capacity depends on what its sibling runs. Admission's sibling preference and the track's rule (a budget is twice the worst measured spend) absorb it. Nothing bounds it.
11. **Two boot refusals make QEMU a dependency of the claim.** These are a CPU without 0xB or a cache leaf, and an AArch64 machine without a PPTT. Whether QEMU's x86 model and its `virt` machine provide them is unmeasured; it is the first step of S1's build. Where QEMU lacks them, the invocation changes or the gap is filed.
12. **Capacity is read with no consumer** until R1b shows unequal values. That is about 30 lines of facts held ahead of their use. They are kept because S5's admission and the hybrid track need them, and both benches can check them against an oracle.
13. **Not covered:**
    - NUMA: SRAT and SLIT are unread. The tree takes a node level as data, with no bench to show it.
    - Hybrid placement.
    - Unpairing running tasks from busy SMT siblings: only queued tasks move.

## 9. Unsure

- **The AMD bench's capacity MSRs.** By `amd-pstate`'s documentation, the CPPC registers are MSRs only on some Zen 3 and later parts; others reach them through `_CPC`, which is AML. So the AMD bench may read "unknown" until the AML track lands.
- **Whether the T14 has favored cores.** Its per-core HWP highest performance is unread.
- **The defaults r_min and the patience across LLCs** are measurements owed, not numbers I have.
- **That `driver::init` runs before every chooser on the BSP.** This is carried over from the first design, and I have not traced it.

## Gates

None run. The branch holds one empty commit and changes no file.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_015xhaydXCVRNscoccHYFUWy

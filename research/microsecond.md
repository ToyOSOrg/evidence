# Microsecond-scale core allocation, work stealing, preemption, userland-delegated scheduling

Research notes for the ToyOS scheduler design round. Every claim carries its URL and a tag:
[MEASURED by source], [PROVED by source], [CLAIMED by source], [INFERENCE - mine].
Primary sources were read as full text (PDFs extracted locally) unless marked otherwise.

---

## 1. Shenango (Ousterhout, Fried, Behrens, Belay, Balakrishnan; NSDI 2019)

Source: https://www.usenix.org/system/files/nsdi19-ousterhout.pdf (landing: https://www.usenix.org/conference/nsdi19/presentation/ousterhout)

Design
- A single busy-spinning, root-privileged process, the **IOKernel**, on a dedicated core steers NIC packets in software and decides core allocation; applications run in per-app user-level runtimes linked as a library (uthreads on per-core "kthreads"). [CLAIMED by source, §3.1, §4]
- Each runtime has **guaranteed** cores (never preempted; oversubscription not allowed) and **burstable** cores the IOKernel may revoke at any time. [CLAIMED by source, §4.1.1]
- Cores are **given back voluntarily**: a kthread whose local runqueue is empty and which found nothing to steal "parks" and tells the IOKernel. [CLAIMED by source, §4.1.1]
- **Congestion detection every 5 µs**: if any thread or packet present in a kthread's queue at the previous pass is still there now (i.e. queued ≥ 5 µs), the app is "congested" and gets one more core. Implemented as comparing current head with previous tail of a ring buffer; runtimes expose this in **one cache line of shared memory per kthread**. Queueing *duration* chosen over queue *length* because length needs a per-workload threshold. [CLAIMED by source, §4.1.1, Algorithm 1]
- A packet arriving for a runtime with zero cores is granted a core immediately. [CLAIMED by source, §4.1.1]
- Core selection order: hyperthread sibling of a core the app already holds, then the core the app most recently yielded, then any idle core, and only then preempt a random *bursting* app; "always grants an idle core instead of preempting a busy core, if an idle core exists." Also picks the parked kthread that last ran on that core. Cost linear in core count. [CLAIMED by source, §4.1.2, Algorithm 2]
- Footnote: cache warmth is ephemeral — "a core with a clock frequency of 2.2 GHz can completely overwrite a 3 MB L2 cache in as little as 60 µs." [CLAIMED by source, §4.1.2 fn 1]
- Runtime: per-kthread runqueues, only the local kthread appends, so uthread wakeups are lock-free; **work stealing** order: hyperthread sibling, then a random kthread, then iterate all; spin "a couple of microseconds", then park. Run-to-completion inside an app (no intra-app preemption; Shinjuku-style preemption "left to future work"). [CLAIMED by source, §5]
- Mechanism on Linux: kthreads pinned by `sched_setaffinity`; park = blocking read on an eventfd; unpark = IOKernel writes the eventfd; preemption = `tgkill(SIGUSR1)`, the handler parks. A malicious kthread refusing to park is unmitigated ("could wait a few microseconds and then migrate it" — not implemented). [CLAIMED by source, §6.1]
- "Linux takes about 600 nanoseconds to switch between processes" with PCIDs. [CLAIMED by source, §4.1.1; no measurement method given]

Measured (Xeon E5-2650v4 2.2 GHz, turbo/C-states/DVFS **disabled**, 10 GbE 82599ES, Linux 4.15; 16 hyperthreads, 2 of them dedicated to the IOKernel)
- Core reallocation completes in **5.9 µs** and needs **< 2 µs of IOKernel compute**. [MEASURED by source, §3.1]
- memcached: > 5 Mrps at median 37 µs / p99.9 93 µs; ZygOS holds similar latency only to 4 Mrps while busy-polling all 16 hyperthreads; IOKernel becomes the bottleneck at memcached's < 2 µs service times. [MEASURED by source, §7.1, Fig. 3]
- Linux at 0.4 Mrps: p99.9 83 µs without batch work vs **over 2 ms with a co-located batch job**. [MEASURED by source, §7.1]
- Bursts 100 krps → 5 Mrps: p99.9 stays < 125 µs; Arachne takes > 500 ms to add enough cores and accumulates milliseconds of tail latency. [MEASURED by source, §1, §7.2, Fig. 5]
- Allocation interval: 5 µs vs 25/50/100 µs — larger intervals add ≥ 150 µs to the tail; the 5 µs interval costs up to 6% batch throughput; smaller than 5 µs bought little. [MEASURED by source, §7.3, Fig. 8]
- Thread ops (ns, single core): uncontended mutex / yield ping-pong / condvar ping-pong / spawn-join — pthreads 30 / 593 / 1,900 / 12,996; Go 24 / 109 / 281 / 462; Arachne 55 / 79 / 203 / 595; Shenango 37 / 52 / 100 / 148. [MEASURED by source, Table 2]
- Waking and preempting kthreads add "a few µs" to RTT, attributed to Linux syscalls (eventfd, signals). [MEASURED by source, §7.3, Fig. 6]
- IOKernel tops out at ~6.5 Mpps; most of its overhead is packet forwarding, not core allocation. Single-socket only; NUMA unevaluated. [MEASURED by source, §8]

Verification: real-hardware measurement against ZygOS/Arachne/Linux; an M/M/n/FCFS simulator bounds the efficiency of an ideal 1 ms allocator (Fig. 1). No formal model. [CLAIMED by source, §2]

## 2. Caladan (Fried, Ruan, Ousterhout, Belay; OSDI 2020)

Source: https://www.usenix.org/system/files/osdi20-fried.pdf (landing: https://www.usenix.org/conference/osdi20/presentation/fried)

Design
- Claim: resource *partitioning* (CAT, MBA, static core pinning) "is neither necessary nor sufficient"; Caladan manages interference **exclusively by core allocation**, decided by one dedicated, busy-polling scheduler core, plus a Linux module **KSCHED**. [CLAIMED by source, abstract, §4]
- Rule of thumb derived in §2: if interference can halve service rate instantly, keeping latency from rising by X needs detection-and-reaction within 2X (so 50 µs of tolerance needs ≤ 100 µs reaction). [CLAIMED by source, §2; simple derivation, not a proof]
- Control signals, each with one tunable: (a) **queueing delay** — every queued element (runqueue, NIC ingress, storage completion, timer heap) carries an arrival timestamp in shared memory; per core the delays of the oldest element in each queue are summed, max over the task's cores; threshold THRESH_QD (10 µs in evaluation). (b) **memory bandwidth** — global DRAM-controller counter vs THRESH_BW (25 GB/s), attributed by per-core LLC-miss sampling over 10 µs. (c) **hyperthread interference** — runtime publishes per-hyperthread request start time; if an LC request runs past THRESH_HT (25 µs silo, 40 µs storage, ∞ memcached), the sibling is banned and parked in C1 with `mwait`. [CLAIMED by source, §5.2, §7]
- All controllers run every **10 µs** on the scheduler core; because reallocation is that fast, a task can hold a *fractional* core on average. Yields are reported by KSCHED and the freed core is re-granted immediately. Core scoring prefers fully idle sibling pairs, then pairing different tasks on a physical core, then temporal locality (last-use timestamp shared across siblings). [CLAIMED by source, §5.2.1]
- LC tasks get guaranteed cores never preempted by others; BE tasks get zero guaranteed cores and are throttled; "a BE task can never preempt an LC task". [CLAIMED by source, §5.1, §5.2.1]
- **KSCHED**: per-core shared-memory command slots (one 64-byte cache line each, packed contiguously for prefetching); the scheduler writes commands then kicks targets with **multicast IPIs** through one `ioctl`; commands (wake/preempt task, idle core, read PMU counter + TSC) execute in kernel on the *target* core, asynchronously. Idle cores poll with `monitor`/`mwait` on their command line, so commands to idle cores need **no IPI**. Before preempting, KSCHED signals the runtime to give it "a few microseconds to yield cleanly". The authors also modified Linux to speed multicast IPIs because `smp_call_function_many()` "imposes additional software overhead". [CLAIMED by source, §5.3, §6]
- Requirement: apps must use Caladan's runtime and LC tasks must **expose their concurrency** (e.g. thread-per-connection) or extra cores cannot help them. Not NUMA-aware; ignores cross-sibling transient-execution attacks. [CLAIMED by source, §8]

Measured (2× 12-core Broadwell Xeon, single socket used, turbo/C-states/DVFS/THP **disabled**, Linux 5.2 modified, 40 GbE ConnectX-5)
- memcached + a garbage-collected BE task (swaptions-GC): p99.9 reduced from **580 ms (Parties\*) to 52 µs**, an 11,000× reduction; Parties\* also gave 5% less BE throughput. Parties\* is the authors' reimplementation (source unavailable). [MEASURED by source, abstract, §7.1]
- Constant memory-bandwidth antagonist: Linux tail up to 235× and Shenango 6× worse than without interference; Shenango throughput −75% because its scheduler core (which also forwards packets) suffers cache misses. [MEASURED by source, §7.1, Fig. 4]
- Up to **230,000** core reallocations/s in the 5-app colocation; up to **560,000/s** with 11 LC apps (5 µs exponential service) vs ~285,000/s ceiling for the Linux-syscall variant (`sched_setaffinity`, `tgkill`, `eventfd`). Moving 22 tasks: Linux syscalls cost **43× more scheduler work and 5× more latency** than KSCHED. [MEASURED by source, §7.2–7.3, Fig. 8a/b]
- Disabling the hyperthread controller costs up to 117 µs of tail latency; allowing LC self-pairing on siblings gives 37% more LC throughput than Elfen's policy. [MEASURED by source, §7.3]

Verification: real-hardware measurement only; Parties reimplemented; no formal model. [CLAIMED by source]

## 3a. Shinjuku (Kaffes, Chong, Humphries, Belay, Mazières, Kozyrakis; NSDI 2019)

Source: https://www.usenix.org/system/files/nsdi19-kaffes.pdf (landing: https://www.usenix.org/conference/nsdi19/presentation/kaffes)

- Terminology: d-FCFS = per-core queues (RSS) each served FCFS; c-FCFS = one central queue (ZygOS approximates it by stealing); PS = processor sharing. Claim: d-FCFS is fine only for low dispersion; c-FCFS fails for high-dispersion (bimodal) distributions; PS best for heavy tails. [CLAIMED by source, §1–2]
- Discrete-event simulation, 16 cores, idealised (zero overhead), PS slice 0.1 µs: Exp(1) — c-FCFS optimal, PS slightly worse, d-FCFS suffers at moderate/high load; log-normal(1,10) — d-FCFS poor, c-FCFS much better; Bimodal(99.5%·0.5 µs, 0.5%·500 µs) — c-FCFS "significantly worse", PS and preemptive single queue (c-PRE-SQ) good. [MEASURED by source in simulation, §2, Fig. 1–2]
- Design: single-address-space OS on Dune (VT-x); a centralised **dispatcher** thread with a single queue; preempts a request after a **5–15 µs** quantum *only if the queue is non-empty*; preempted requests go to the queue tail (approximating PS) for heavy-tailed/multimodal loads or the head (approximating c-FCFS) for light-tailed. Multi-queue policy picks the queue whose head has the highest (queueing time / per-type SLO) ratio, after BVT. [CLAIMED by source, §3.1, §3.4]
- Preemption cost (cycles, sender / receiver / total, 2 GHz-class Xeon): Linux signal 2084 / 2523 / 4950; vanilla virtualised IPI 2081 / 2662 / 4219; posted interrupts with dispatcher writing the real APIC (no VM exits) **298 / 1212 / 1993**. Receiver cost "cannot be significantly improved without hardware changes, such as support for lightweight user-level interrupts". [MEASURED by source, Table 1, §3.2]
- Context switch (cycles): `swapcontext` 985 (Linux process); skipping signal mask 140; skipping FP restore/save 36–109. ring3→ring0→ring3 transition **84 cycles**. Cache-line message round trip **211 cycles**; dispatcher send ≈ 70 cycles → theoretical 28 Mrps ceiling. [MEASURED by source, Table 2, §3.5, §3.6]
- Monte-Carlo: RSS needs ~16,000 connections to keep imbalance < 10% w.p. > 90% across 24 hyperthreads. [MEASURED by source in simulation, Fig. 4]
- Results (2× E5-2658 2.3 GHz, 10 GbE, 16 hyperthreads, 2 of them networking+dispatcher): Bimodal(99.5–0.5, 0.5–500) — up to 50% lower tail at low load and **5× throughput at a 300 µs p99 target** vs IX/ZygOS; RocksDB point+range — up to **6.6× throughput, 88% lower tail**; ZygOS shows 60% steal rate even on homogeneous loads. A single dispatcher handles ≥ 5 Mrps (one socket). [MEASURED by source, §4]
- Security caveat: the dispatcher has the real APIC mapped; "one process could launch a denial-of-service attack on another process by issuing a large number of interrupts"; apps run in ring 0 by default. Preemption disabled around non-thread-safe code and malloc. [CLAIMED by source, §3.6]

## 3b. Concord (Iyer, Unal, Kogias, Candea; SOSP 2023) — "Achieving Microsecond-Scale Tail Latency Efficiently with Approximate Optimal Scheduling"

Source: https://dslab.epfl.ch/pubs/concord.pdf (DOI https://doi.org/10.1145/3600006.3613136)

- Thesis: approximate, don't implement, the "optimal" single queue + precise preemption. Cites Wierman & Zwart: no single policy minimises tail latency for all workloads; FCFS optimal for light tails, PS for heavy tails; single queue beats multi-queue for both. [CLAIMED by source, §1]
- Shinjuku's preemption costs 20% throughput at a 5 µs quantum and 50% at 2 µs. [CLAIMED by source, §1]; IPI preemption overhead **33% at 2 µs, 6% at 10 µs**; rdtsc()-probe instrumentation a flat ≈ 21% (probe every ~200 instructions, rdtsc ≈ 30 cycles). [MEASURED by source, §2.2.1, Fig. 2]
- Analytical overhead model: per-worker overhead = (c_proc + ⌊S/q⌋·(c_notif + c_switch + c_next) + c_fin)/S; dispatcher overhead = 1. Synchronous single-queue hand-off costs ≥ 2 coherence misses (≈ 400 cycles) per request, up to 400·n while the dispatcher is busy. [CLAIMED by source, §2.1–2.2; model, not a proof]
- Mechanism 1, **compiler-enforced cooperation**: dispatcher writes a per-worker cache line when the quantum expires; LLVM-inserted probes (function entry, around un-instrumented calls, loop back-edges, loops unrolled to ≥ 200 IR instructions) poll it — 2 cycles when L1-resident, ≈ 150-cycle miss on the final check, i.e. **1/8 the cost of a Shinjuku IPI**; overhead 1–1.5% flat; 12× less than IPIs at 2 µs, 10× at 5 µs, equal (~0.7%) at 25 µs. [MEASURED by source, §3.1, Fig. 2]
- Imprecise preemption with σ ≤ 2 µs around a 5 µs quantum is nearly indistinguishable from precise preemption in p99.9 slowdown (queueing simulation); measured σ stays within 2 µs over 25 benchmarks. [MEASURED by source in simulation + measurement, Fig. 5, §5.4]
- "Safety-first": never preempts inside un-instrumented external calls (syscalls, libc) or while an app lock is held (LevelDB needed 4 lines of lock-counting). A Shinjuku LevelDB GET was found unpreemptible for 100 µs. [CLAIMED by source, §3.1]
- Mechanism 2, **JBSQ(k)**: central queue plus per-worker queues bounded at k; dispatcher pushes into the shortest; JBSQ(1) = single queue; **k = 2** sufficient above 1 µs service; rule k ≈ c_next/S + 1. Cuts worker idle overhead **9–13×** vs a synchronous single queue. Prior work (Kogias et al., R2P2) "has shown that k = 2 imposes a negligible tail-latency penalty". [MEASURED by source, §3.2, Fig. 3]
- Mechanism 3: work-conserving dispatcher runs app requests when all worker queues are full (self-preempting via rdtsc instrumentation). [CLAIMED by source, §3.3]
- Results (Xeon Gold 6142, 14 workers, Linux 4.4, SLO = p99.9 slowdown ≤ 50×): up to **52%** more throughput on microbenchmarks at 2 µs (18% at 5 µs) and up to **83%** on LevelDB at 2 µs (52% at 5 µs). [MEASURED by source, §1, §5]
- On a 192-core Sapphire Rapids Xeon, compiler-enforced cooperation is ≈ **2× cheaper than Intel user IPIs**; "no matter how fast interrupts get, they will always be slower than ... reads and writes to a shared cache line". [MEASURED by source, §5.6, Fig. 15; the "always" is CLAIMED]
- Limitations: needs source + LLVM; single dispatcher bottleneck at high core counts. [CLAIMED by source, §6]

## 3c. User interrupts (Intel UINTR/UIPI) for userland preemption

### Mechanism (as described by the sources)
- Receiver registers a handler and a User Posted Interrupt Descriptor (UPID); the kernel hands an fd to senders; senders get an index into their per-thread User Interrupt Target Table (UITT); `SENDUIPI idx` posts into the target UPID and sends a notification. 64 vectors per receiver thread. If the receiver is running, delivery is direct; if it is not running, the UPID records the request and the notification is suppressed; if it is blocked, an ordinary interrupt unblocks it and the user interrupt is injected later. Kernel is not involved after registration. Hardware saves only flags, RIP and RSP; `clui`/`stui` mask/unmask; `uiret` returns. Sapphire Rapids (4th-gen Xeon Scalable) and later. Source: LibPreemptible, https://arxiv.org/pdf/2308.02896 §II-B [CLAIMED by source]; NSDI'25 paper below §2.3, §3.1.3 [CLAIMED by source].
- Security model: "designed with a focus on trusted and cooperating processes"; any holder of the receiver's uintr fd can raise the vector; an interrupt storm is a DoS vector (the handler re-enables delivery on `uiret`). LibPreemptible restricts senders to its own timer thread in the same security domain. https://arxiv.org/pdf/2308.02896 §VII-A [CLAIMED by source]
- Upstream status: the Linux UINTR patch series was posted as an RFC (2021) and is not in mainline as far as the sources show; NSDI'25 ran a patched 6.0 kernel and Skyloft a kernel module. [INFERENCE - mine from the sources' setups; see §8 for the LWN source]

### Guo, Zuberi, Garfinkel, Ousterhout — "The Benefits and Limitations of User Interrupts for Preemptive Userspace Scheduling" (NSDI 2025)
Source: https://www.usenix.org/system/files/nsdi25-guo.pdf (landing: https://www.usenix.org/conference/nsdi25/presentation/guo)
- Setup: Xeon Gold 5420+ (Sapphire Rapids) 2.0 GHz, turbo/DVFS disabled, Linux 6.0 with UINTR patches. [CLAIMED by source, §4]
- Per-preemption receive cost: **signal ≈ 2.4 µs** (≈ 1.4 µs of it user↔kernel transitions), **user interrupt ≈ 0.4 µs**; posted-interrupt virtualisation (Shinjuku) ≈ 0.6 µs. Send cost: signal 1.7 µs, user interrupt 200 ns, compiler instrumentation a single store. [MEASURED by source, §2.1, §2.3, §4.4]
- For ≤ 10% slowdown, user interrupts allow a **5 µs** quantum, signals ≈ **30 µs**; at 100 µs quanta signals cost ~3%, at 10 µs ~25%+. [MEASURED by source, Fig. 1, 24 programs]
- Compiler instrumentation (Concord) has low but **unpredictable, workload-dependent** overhead; one tuning knob (`subloops`) moved `lu-c` from poor timeliness (10) to acceptable (11) to > 50% overhead (≥ 20); Go abandoned loop back-edge checks after up to 96% slowdown on one benchmark. [MEASURED by source, §2.2, Fig. 2; Go figure CLAIMED by source citing the Go issue]
- `stui`+`clui` pair ≈ 18 ns vs ≈ 600 ns to mask/unmask a signal; but hardware deferral around frequent malloc/free slows RocksDB GET 7%, software deferral (a counter) < 1%. [MEASURED by source, §3.1.2]
- Saving all AVX-512 state (2 KB) per preemption: usually < 40 ns, worst case > 700 ns when it pushes the working set out of a cache level; XSAVEC/XRSTOR cost 100–150 ns vs 10–30 ns for explicit saves. [MEASURED by source, Appendix A]
- **Skip unnecessary preemptions**: the timer core preempts only if the thread ran ≥ a quantum *and* other work is queued on that core; skips ~70% of preemptions; with a 5 µs quantum the inter-preemption interval is typically > 30 µs. **Prioritise newly arrived work over preempted work** (two-queue MLFQ variant) to avoid head-of-line blocking behind preempted tasks. [MEASURED by source, §3.1.1, §3.2, §4.4]
- One timer core sustains 5 µs preemption for only **2 cores with signals, 22 with user interrupts, 24 with instrumentation**. [MEASURED by source, Fig. 11]
- In Go (Aspen-Go), shrinking the quantum below ~50 µs was counter-productive and user interrupts helped little: "when a system is not fully designed for fine-grained preemptive scheduling, user interrupts provide limited benefits". [MEASURED by source, §1, §4.1.4]
- Rule: quantum ≥ tail runtime of the "short" tasks you want unpreempted. [CLAIMED by source, §4.1.4]

### LibPreemptible (Li, Lazarev, Koufaty, Yin, Anderson, Zhang, Suh, Kaffes, Delimitrou; HPCA 2024)
Source: https://arxiv.org/pdf/2308.02896
- UINTR-based user-level threading library with **LibUtimer** (a timer thread polling the TSC against per-thread 64-byte-aligned deadlines and sending UIPIs); minimum quantum **3 µs**; adaptive quantum via statistical tests. [CLAIMED by source, §III]
- Claims 10× better tail latency than Shinjuku across workloads and 10% more BE throughput at the same LC p99 SLO. [MEASURED by source, §I, §V]
- Google traces show **50 to ~500 threads per core** for widely used apps (charlie 484, whiskey 169, delta 75, merced 50 threads/core). [MEASURED by source citing Google traces, Table I]
- NSDI'25 found LibPreemptible's quantum adaptation slow (updates every 10 s). [CLAIMED by https://www.usenix.org/system/files/nsdi25-guo.pdf §4.4]

### Skyloft (Jia, Tian, You, Chen, Chen; SOSP 2024)
Source: https://madsys.cs.tsinghua.edu.cn/publication/skyloft-a-general-high-efficient-scheduling-framework-in-user-space/SOSP24-Jia.pdf (DOI https://doi.org/10.1145/3694715.3695973)
- **Delegates the local APIC timer to user mode**: sets the UINTR notification vector (UINV) to the timer vector and keeps the UPID's PIR non-empty by a self-`SENDUIPI` with Suppress-Notification set (≈ 123 cycles), so each timer interrupt is delivered straight to a user handler — per-CPU preemption without a timer core. Undocumented by Intel. [CLAIMED by source, §3.2]
- Per-core main loop, no global controller; multiple applications via a kernel module that switches the kernel thread bound to an isolated core ("single binding rule"); shared runqueues across address spaces are a stated safety concern (MPK suggested, not enforced). [CLAIMED by source, §3.3, §6]
- Cycles (Xeon Gold 5418Y, 2.0 GHz, turbo/C-states disabled), send / receive / delivery: **signal 1,224 / 6,359 / 5,274; kernel IPI 437 / 1,582 / 1,345; user IPI 167 / 661 / 1,211** (cross-NUMA 178 / 883 / 1,782); setitimer receive 5,057; **user timer interrupt receive 642**. [MEASURED by source, Table 6]
- A dedicated timer core emulating timers for 13 workers at 5 µs costs 13% throughput vs local APIC timer interrupts (one fewer worker). [MEASURED by source, §5.3]
- schbench: per-CPU CFS/RR/EEVDF in user space with a **100 kHz** tick gets p99 wakeup latency around **100 µs vs ~10 ms** for Linux (Linux CFS tuned to 12.5 µs min granularity / 1 kHz tick still timer-bound); wakeup latency "roughly proportional to the time slice"; Skyloft EEVDF beats Skyloft CFS. [MEASURED by source, §5.1, Fig. 5–6]
- vs ghOSt: 1.2× max LC throughput; RocksDB with 5 µs preemption in work stealing: 1.9× the load of Shenango at a 50× slowdown SLO. [MEASURED by source, abstract, §5.3]
- Linux thread switch measured at **1,124 ns** (both runnable) and **2,471 ns** when one wakes the other; Skyloft inter-application switch 1,905 ns; Skyloft uthread yield 37 ns vs pthread 898 ns. [MEASURED by source, §5.4, Table 7]

## 4. ghOSt (Humphries, Natu, Chaugule, Weisse, Rhoden, Don, Rizzo, Rombakh, Turner, Kozyrakis; SOSP 2021)

Source: https://storage.googleapis.com/gweb-research2023-media/pubtools/6413.pdf (landing: https://research.google/pubs/ghost-fast-and-flexible-user-space-delegation-of-linux-scheduling/ ; DOI https://doi.org/10.1145/3477132.3483542)

Design
- Policy runs in userspace **agents** (pthreads of one process); mechanism is a kernel scheduling class. Machine partitioned at CPU granularity into **enclaves**, each with its own policy; every managed CPU has a local agent; per-CPU model = each agent schedules its own CPU; centralized model = one spinning **global agent** schedules all CPUs of the enclave, the others inactive. [CLAIMED by source, §3]
- Kernel→agent: **messages** (THREAD_CREATED/BLOCKED/PREEMPTED/YIELD/DEAD/WAKEUP/AFFINITY, TIMER_TICK) in shared-memory queues; **status words** expose sequence numbers. Agent→kernel: **transactions** in shared memory committed by `TXNS_COMMIT()`; **group commits** amortise syscalls and send one batched IPI. [CLAIMED by source, §3.1–3.2]
- Staleness: per-agent sequence number A_seq (per-CPU model) and per-thread T_seq (centralized) travel with the commit; the kernel fails a stale commit with ESTALE, the agent drains and retries — optimistic concurrency between asynchronous policy and kernel state. [CLAIMED by source, §3.2–3.3]
- The global agent runs at top priority; when CFS needs its CPU it does a "hot handoff" to an inactive agent on an idle CPU. [CLAIMED by source, §3.3]
- Fault isolation: ghOSt class sits *below* CFS, so CFS threads preempt ghOSt threads; agent crash or **watchdog** (no runnable thread scheduled within a configurable number of ms) destroys the enclave and moves its threads back to CFS; in-place agent upgrade without reboot. [CLAIMED by source, §3.4]
- BPF on `pick_next_task()` fills idle CPUs when the agent has not committed, to hide the agent loop's latency (30 µs loop in Search). [CLAIMED by source, §3.2, §5]

Measured (Xeon Platinum 8173M 2 GHz, Linux 4.15 + patches)
- Message to local agent 725 ns (dominated by a 410 ns context switch); to spinning global agent 265 ns; local schedule (1 txn) **888 ns** vs CFS context switch **599 ns**; remote schedule: agent 668 ns, target 1,064 ns, end-to-end **1,772 ns**; group of 10: agent 3,964 ns, end-to-end 5,688 ns; syscall 72 ns; pthread minimal context switch 410 ns. [MEASURED by source, Table 3]
- One global agent: ≈ 1.5 M (single) / 2.52 M (grouped) scheduled threads/s; "can keep 100 CPUs busy if threads are 40 µs long"; throughput drops when a worker shares the agent's physical core and when scheduling the remote socket. [MEASURED by source, §4.1, Fig. 5]
- Shinjuku policy in 710 LOC: within 5% of Shinjuku's saturation throughput, and (unlike Shinjuku) lets a batch app use idle CPUs; Shenango-style sharing in +17 LOC. [MEASURED by source, §4.2]
- Google Snap vs MicroQuanta: similar or up to 10% better to p99.9 for 64 B messages but **up to 1.7× worse at p99.99+**; 5–30% better at p99.9+ for 64 kB. [MEASURED by source, §4.3]
- Google Search on 2× AMD Rome (256 CPUs), one global agent: throughput parity with CFS only after NUMA (+27%) and CCX (+10%) awareness; 40–45% lower p99 for query types A and B; keeping a thread pending 100 µs for its CCX beat migrating it. [MEASURED by source, §4.4]
- Iteration: kernel edit-test cycle ~5 variants/day vs agent relaunch "within one minute". [CLAIMED by source, §4.4]

## 5. sched_ext (Linux 6.12)

Sources: kernel documentation https://docs.kernel.org/scheduler/sched-ext.html ; source `kernel/sched/ext.c` at tag v6.12 https://raw.githubusercontent.com/torvalds/linux/v6.12/kernel/sched/ext.c ; LWN "Sched_ext at LPC 2024" (Corbet, 2024-09-26) https://lwn.net/SubscriberLink/991205/deed0c808397b420 ; LAVD slides (LPC 2024) https://lpc.events/event/18/contributions/1713/attachments/1425/3058/scx_lavd-lpc-mc-24.pdf ; scx_rustland README https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_rustland/README.md

What it exposes
- A BPF program implements `struct sched_ext_ops`; only `name` is mandatory; callbacks include `select_cpu`, `enqueue`, `dispatch`, `runnable`, `running`, `stopping`, `quiescent`, `tick`, `init_task`/`exit_task`, `enable`/`disable`, `set_weight`, cgroup hooks. [CLAIMED by source, docs]
- **Dispatch queues (DSQs)**: one global FIFO `SCX_DSQ_GLOBAL`, one local DSQ per CPU `SCX_DSQ_LOCAL`, plus custom DSQs; FIFO or vtime-ordered (priority) insertion (built-in DSQs FIFO only). A CPU runs its local DSQ first, then the global DSQ, then calls `ops.dispatch()`. [CLAIMED by source, docs]
- **Wake fast path**: `ops.select_cpu()` runs at wakeup; its result is a hint; a task can be inserted directly into a DSQ from `select_cpu` (skipping `enqueue`); the example `scx_simple` uses `scx_bpf_select_cpu_dfl()` and, if an idle core is found, inserts into that CPU's local DSQ; "A side-effect of selecting a CPU is waking it up from idle." `scx_bpf_kick_cpu()` (flags SCX_KICK_IDLE / SCX_KICK_PREEMPT) wakes or preempts any CPU, via irq_work. [CLAIMED by source, docs and ext.c]
- **Safety model**: exiting the scheduler program, SysRq-S, any internal error, or **a runnable task not scheduled within `timeout_ms` (default and maximum 30 s)** aborts the BPF scheduler and "reverts all tasks back to the fair-class scheduler". The watchdog is a delayed work item scanning every CPU's runnable list every timeout/2, plus a tick-side check that the watchdog itself ran. `SCX_OPS_SWITCH_PARTIAL` limits sched_ext to SCHED_EXT tasks. [CLAIMED by source, docs; ext.c lines for `SCX_WATCHDOG_MAX_TIMEOUT = 30 * HZ`, `check_rq_for_timeouts`, `scx_watchdog_workfn`]
- Heo: sched_ext "cannot crash the machine" because BPF safety checks apply; scx_layered "reportedly deployed on over one million machines". [CLAIMED by source, LWN — second-hand report of a talk]

Community schedulers and what was measured
- **scx_lavd** (Igalia, for Steam Deck): latency criticality from the task graph — wake frequency (producer) and wait frequency (consumer); virtual deadline = f(pipeline factor, nice, vruntime); slice = f(number of runnable tasks) over a ~15 ms target latency; "core compaction" (run the fewest cores near ~50% utilisation) and an autopilot switching powersave/balanced/performance by system utilisation; heterogeneous-core aware. Game tasks "run for very short duration — roughly a few 100s usec on average". [CLAIMED by source, slides 5–16]
- LAVD vs EEVDF on Steam Deck OLED: Tomb Raider benchmark energy **752.83 J (10.7 W) vs 896.07 J (12.7 W)**; FH5 with background recording 1419.49 J vs 1423.75 J; FPS curves are in figures only. [MEASURED by source, slides 17–18]; LWN: "consistently enables higher frame rates than the EEVDF scheduler while using (slightly) less power and with fewer stutters" — no numbers. [CLAIMED by source]
- **scx_rustland** (policy entirely in a Rust userspace process, BPF shim): README says offloading every decision to userspace "comes with a certain cost" and other schedulers likely perform better for performance-critical production; demo claims better FPS than EEVDF during a parallel kernel build, no numbers. [CLAIMED by source]

## 6. Other systems and 2023–2026 work

### Arachne (Qin, Li, Speiser, Kraft, Ousterhout; OSDI 2018)
Source: https://www.usenix.org/system/files/osdi18-qin.pdf
- Core-aware user threads; a root-privileged **userland core arbiter** allocates cores via Linux cpusets; application→arbiter requests over Unix sockets (several µs each way), arbiter→application over a read-only shared page polled by the dispatcher. Reclaim is **cooperative**: the arbiter sets a flag, the app releases at a convenient point; after **10 ms** the arbiter forcibly moves the thread to the unmanaged cpuset. [CLAIMED by source, §4]
- Priority levels are self-declared; "a misbehaving application could starve other applications by requesting all of its cores at the highest priority level" — left to future work. [CLAIMED by source, §4]
- Load balancing is **at thread creation**, power-of-two-choices on a per-core `maskAndCount` word (sender-initiated), explicitly rejecting work stealing as costly and laggy for µs threads; thread start on another core in ~4 cache-miss times, **~320 ns**; core grant **20–30 µs**. [MEASURED by source, abstract, §5.2]
- Core estimation: scale up on load factor, scale down on utilisation; interval tens of ms. Shenango later measured Arachne taking > 500 ms to adapt to a load step. [CLAIMED by source §6.2; MEASURED by https://www.usenix.org/system/files/nsdi19-ousterhout.pdf §7.2]
- memcached: 37% higher SLO-compliant throughput, > 10× lower tail vs Linux. [MEASURED by source]

### Junction (Fried, Chaudhry, Saurez, Choukse, Goiri, Elnikety, Fonseca, Belay; NSDI 2024)
Source: https://www.usenix.org/system/files/nsdi24-fried.pdf
- Caladan-style dedicated busy-polling scheduler core for thousands of kernel-bypass instances; scalable polling via a NIC **event queue + doorbell** (armed only for idle queues) and a **16 µs hierarchical timer wheel** so the scheduler ignores instances with far-future timers; per-instance state packed to few cache lines, active/idle state split to avoid false sharing; **UIPIs for timeslicing, sent only when queued packets or runnable threads are waiting**. [CLAIMED by source, §3, §5.2]
- 19–62× more instances than prior kernel-bypass systems (3,500 before running out of memory); vs Linux 1.6–7.0× throughput with 1.2–3.8× fewer cores across seven apps. [MEASURED by source, abstract, §8]

### Syrup (Kaffes, Humphries, Mazières, Kozyrakis; SOSP 2021) — abstract only (full text not obtainable here)
Source: https://doi.org/10.1145/3477132.3483548 (abstract via https://api.semanticscholar.org/graph/v1/paper/DOI:10.1145/3477132.3483548)
- Policies written as **matching functions between inputs (threads, packets, connections) and executors (cores, sockets, NIC queues)**, deployed across layers by untrusted application developers with multi-tenant safety; "up to 8x" over default policies. [CLAIMED by source, abstract]

### Perséphone / DARC (Demoulin, Fried, Pedisich, Kogias, Loo, Phan, Zhang; SOSP 2021)
Source: https://par.nsf.gov/servlets/purl/10333250 (DOI https://doi.org/10.1145/3477132.3483571)
- **Non-work-conserving by design**: profiles request types via application classifiers and **reserves cores for short requests**, leaving them idle rather than letting long requests occupy all workers; work-conserving only for short requests. Costs ~5% peak throughput; sustains up to **2.3× (vs Shenango) and 1.3× (vs Shinjuku)** more load at a target SLO. Shinjuku interrupts measured at ≈ 2 µs each. [MEASURED by source, §1]
- Argument: a short request behind a long one can see slowdown 1001 (0.5 µs vs 500 µs), the reverse 1.001. [CLAIMED by source, §2]

### Tiny Quanta (Luo, Son, Bali, Amaro, Ousterhout, Ratnasamy, Shenker; ASPLOS 2024)
Source: https://cseweb.ucsd.edu/~aousterhout/papers/tinyquanta_asplos24.pdf (DOI https://doi.org/10.1145/3620665.3640381)
- **Forced multitasking**: compiler-inserted, physical-clock (rdtsc) probes placed far apart using instruction-count bounds on paths, plus coroutine yields (tens of ns stackful); makes **1 µs quanta practical** (vs ≥ 5 µs in Shinjuku). [CLAIMED by source, §2–3.1]
- **Two-level scheduling**: a dispatcher only does job load balancing (**JSQ** with a *Maximum-Serviced-Quanta* tie-break); each worker does **processor sharing** of its admitted jobs; jobs never migrate (cache locality); dispatcher load is independent of the quantum, unlike Shinjuku's. [CLAIMED by source, §3.2]
- Cites PS as "provably optimal in terms of tail sojourn time for broad/heavy-tailed service time distributions" and M/G/K/JSQ/PS as "provably near-optimal for the mean sojourn time"; "no theoretical work on the tail sojourn time of the JSQ-PS combination". [CLAIMED by source citing proofs, §3.2]
- Simulation: with 1 µs preemption overhead any quantum below 3 µs loses capacity; with 100 ns overhead, below 1 µs. [MEASURED by source in simulation, §2]
- 1.2×–6.8× the load of Shinjuku and Caladan at low tail latency. [MEASURED by source, abstract]

### McClure, Ousterhout, Shenker, Ratnasamy — "Efficient Scheduling Policies for Microsecond-Scale Tasks" (NSDI 2022)
Source: https://cseweb.ucsd.edu/~aousterhout/papers/scheduling_policies_nsdi22.pdf (landing https://www.usenix.org/conference/nsdi22/presentation/mcclure ; simulator https://github.com/smcclure20/scheduling-policies-sim)
- Overheads modelled from measurement: cross-core load-balancing op ≈ 2 cache misses, 60–400 ns (30 ns Haswell to 200 ns Xeon Phi per miss); Caladan's steal check ≈ 120 ns; core reallocation ≥ one IPI ≈ 1,993 cycles ≈ 1 µs; Shenango 2.2 µs (idle core) / 7.4 µs (busy core); Arachne 29 µs. Simulation uses 100 ns per balance, 5 µs per core reallocation. [MEASURED by source / cited, §3.3, §4.1]
- Finding NP-hardness: optimal tail latency under a CPU-usage bound (or vice versa) with finite cores and non-constant service is NP-hard (reduction from multiprocessor scheduling). [PROVED by source, App. A.1]
- **Finding 1: work stealing Pareto-dominates enqueue choice (power-of-two at enqueue) and work shedding** across percentiles, service times (1/10/100 µs), distributions, core counts, and even if the others' overheads were zero vs stealing's 200 ns. Enqueue choice loses because of per-task overhead, few choices, and counting tasks rather than queued work, which strands tasks while cores idle. Shed tasks waited 3.1–4.5 µs elsewhere vs 0.3–1.4 µs for stolen ones. [MEASURED by source in simulation, §4.2.1]
- **Finding 2: adding enqueue choice to work stealing gives no gain or a loss; adding shedding helps a little at the tail.** [MEASURED by source in simulation]
- **Finding 4: for ~1 µs tasks no dynamic core-allocation policy beats a static allocation of the same average size**; with 10–100 µs tasks some do (all of them paired with work stealing). Reallocation's real value is adapting to *changes in average load*; reacting at 50 ms causes spikes. [MEASURED by source in simulation]
- **Finding 6: yielding a core only when no work is found (Shenango, Caladan, per-task "a core per arrival") wastes CPU** — per-task efficiency ≤ T/(T+R); with 64 cores Caladan and per-task used > 80% of cores for a 50% load; proactive revocation ("delay range"/"utilization range") saved up to 13–22% of cores in Caladan without hurting latency. [MEASURED by source, simulation §4.3 and implementation §6]

### Nest (Lawall et al.; EuroSys 2022) — abstract-level
Source: https://hal.archives-ouvertes.fr/hal-03612592
- Linux CFS spreads tasks at creation/wakeup onto long-idle cores that run at lower frequency; Nest keeps a "nest" of recently used warm cores tried first; comparable to CFS for highly parallel apps, **10%–2× faster** with fewer tasks than cores, and can save energy. [CLAIMED by source, abstract as reported by search; not read in full]

### "The Linux Scheduler: a Decade of Wasted Cores" (Lozi et al.; EuroSys 2016)
Source: https://people.ece.ubc.ca/sasha/papers/eurosys16-final29.pdf
- Invariant: "make sure that ready threads are scheduled on available cores"; found broken for seconds; built an online invariant checker. [CLAIMED by source, abstract]
- **Overload-on-Wakeup**: a wakeup optimisation for cache reuse only considered the waker's node, so threads woke on busy cores while other nodes had idle cores; fix: wake on the thread's previous core if idle, else on the **longest-idle core**, else the old path (enabled only when C-states are off, for power reasons). Fix alone: TPC-H request #18 **−22.2%** time, full TPC-H −13.2%. [MEASURED by source, §3.3, Table 2]

### xUI — Extended User Interrupts (Aydogmus, Guo, Zuberi, Garfinkel, Tullsen, Ousterhout, Taram; ASPLOS 2025)
Source: https://cseweb.ucsd.edu/~aousterhout/papers/xui_asplos25.pdf (DOI https://doi.org/10.1145/3676641.3716028)
- Reverse-engineered Sapphire Rapids UIPI: **end-to-end 1,360 cycles, receiver cost 720, SENDUIPI 383 (279 stalled on serialising MSR writes), CLUI 2, STUI 32**; the receiver flushes the pipeline (424 lost cycles). UIPI receive ≈ 600–900 cycles vs signals ≈ 2,800; **UIPI still 6–9× slower than memory-based notification (~100 cycles)**, and the flush cost grows with speculation windows. UIPI supports no timer or device interrupts. [MEASURED by source, §2–3]
- Proposed (simulated in gem5) tracked interrupts 231/105 cycles, hardware safepoints, a per-core kernel-bypass timer (105 cycles/timer interrupt), interrupt forwarding; +10% RocksDB throughput in Aspen, −45% CPU vs busy-polling at 40% load in l3fwd. [MEASURED by source in simulation, §4, §6]

## 7. Queueing theory these systems rely on

- **No blind policy is tail-optimal for all workloads.** Wierman & Zwart, "Is Tail-Optimal Scheduling Possible?", Operations Research 60(5), 2012: FCFS is known good for light-tailed job sizes, PS/SRPT for heavy-tailed; "We prove that no such work-conserving, nonanticipatory, nonlearning policy exists" that optimises the sojourn-time tail across both. So a scheduler must learn or be told the size distribution. https://authors.library.caltech.edu/records/5jvpq-hyc27 (DOI https://doi.org/10.1287/opre.1120.1086) [PROVED by source]
- **Single queue vs per-core queues (c-FCFS vs d-FCFS).** Shinjuku's idealised 16-core simulation: d-FCFS degrades at moderate/high load even for Exp(1); c-FCFS optimal for light tails; PS best for high dispersion. https://www.usenix.org/system/files/nsdi19-kaffes.pdf §2 [MEASURED by source in simulation]. Perséphone's simulations agree and add non-work-conserving core reservation (DARC). https://par.nsf.gov/servlets/purl/10333250 §2 [MEASURED by source in simulation]. Pooling (M/M/k beats k×M/M/1) is the textbook basis these cite. [INFERENCE - mine: standard result, not re-derived here]
- **Approximating the single queue without a single queue:**
  - *Power of d choices* (supermarket model): "Having d=2 choices leads to exponential improvements in the expected time a customer spends in the system over d=1"; d=3 only a constant factor better than d=2. https://www.eecs.harvard.edu/~michaelm/abstracts/tpds2001.html (PDF https://www.eecs.harvard.edu/~michaelm/postscripts/tpds2001.pdf) [PROVED by source, large-n limit]
  - *Join-Idle-Queue*: idle processors inform dispatchers when they become idle; arrivals go to an advertised idle processor; "no communication overhead between the dispatchers and processors at job arrivals"; large-system analysis gives a **30-fold reduction in queueing overhead vs Power-of-Two at medium to high load**; core idea "decouple discovery of lightly loaded servers from job assignment". https://www.microsoft.com/en-us/research/wp-content/uploads/2011/10/idleq.pdf [PROVED by source in the large-system limit; PS and FIFO]
  - *JBSQ(k)*: central queue + per-worker queues bounded at k; JBSQ(1) = single queue; k = 2 near-single-queue tails while masking hand-off latency. https://dslab.epfl.ch/pubs/concord.pdf §3.2 [MEASURED by source]
  - *Work stealing*: Shenango/Caladan/ZygOS approximate c-FCFS by stealing; McClure et al. find stealing Pareto-best among practical policies for µs tasks. https://cseweb.ucsd.edu/~aousterhout/papers/scheduling_policies_nsdi22.pdf §4.2 [MEASURED by source in simulation]
  - *JSQ + per-core PS (two-level)*: M/G/K/JSQ/PS provably near-optimal for the *mean* sojourn time; tail unproven. https://cseweb.ucsd.edu/~aousterhout/papers/tinyquanta_asplos24.pdf §3.2 [CLAIMED by source citing proofs]
- **Who initiates the move: sender (waker/pusher) or receiver (idle puller)?** Eager, Lazowska, Zahorjan (SIGMETRICS 1985 / Performance Evaluation 1986), analytic models: both beat no sharing; **sender-initiated is preferable at light-to-moderate load; receiver-initiated is preferable at high load, but only if transfer costs are comparable; if receiver-initiated must move executing tasks (costlier), sender-initiated is uniformly better**; receiver-initiated restricted to newly arrived tasks ("reservation") performs poorly; a probe limit of 3–5 is nearly as good as 20. http://lazowska.cs.washington.edu/p1-eager.pdf [PROVED by source — analytic model; extended abstract read in full]
- **Preemption quantum vs overhead.** TQ simulation: shrinking the quantum raises capacity only while per-preemption overhead is small (overhead 1 µs → no gain below 3 µs). https://cseweb.ucsd.edu/~aousterhout/papers/tinyquanta_asplos24.pdf §2 [MEASURED by source in simulation]. Concord: imprecise preemption with σ ≤ 2 µs around a 5 µs quantum ≈ precise preemption. https://dslab.epfl.ch/pubs/concord.pdf Fig. 5 [MEASURED by source in simulation]. NSDI'25: quantum should be ≥ the tail runtime of the "short" tasks. https://www.usenix.org/system/files/nsdi25-guo.pdf §4.1.4 [CLAIMED by source]
- **Non-work-conservation can win** when request classes are known (DARC). https://par.nsf.gov/servlets/purl/10333250 [MEASURED by source]
- **Tail effect of preempted work re-queued at the head vs tail**: tail ≈ PS (good for heavy tails), head ≈ c-FCFS (good for light tails). https://www.usenix.org/system/files/nsdi19-kaffes.pdf §3.4 [CLAIMED by source]; NSDI'25 prioritises *new* work over *preempted* work to avoid head-of-line blocking behind preempted tasks. https://www.usenix.org/system/files/nsdi25-guo.pdf §3.1.4 [CLAIMED by source]

## 8. What transfers to a desktop/workstation OS, and measured costs on modern x86

### Measured costs (all x86; numbers as reported, clock in parentheses)
| Operation | Cost | Source |
|---|---|---|
| Kernel IPI send / receive / delivery | 437 / 1,582 / 1,345 cycles (Xeon Gold 5418Y, 2.0 GHz) | Skyloft Table 6 [MEASURED] |
| Linux signal send / receive / delivery | 1,224 / 6,359 / 5,274 cycles | Skyloft Table 6 [MEASURED] |
| User IPI (UIPI) send / receive / delivery | 167 / 661 / 1,211 cycles (cross-NUMA 178 / 883 / 1,782) | Skyloft Table 6 [MEASURED] |
| UIPI end-to-end / receiver / SENDUIPI / CLUI / STUI | 1,360 / 720 / 383 / 2 / 32 cycles (Sapphire Rapids) | xUI §3 [MEASURED] |
| Memory (cache-line) notification | ~100 cycles; cache-line message RTT 211 cycles (Shinjuku); one-way 180–570 cycles (2009 Intel/AMD) | xUI §2; Shinjuku §3.5; Multikernel Table 2 [MEASURED] |
| Per-preemption cost to the preempted program | signal 2.4 µs, UIPI 0.4 µs, posted-interrupt (VT-x) 0.6 µs (2 GHz) | NSDI'25 §2 [MEASURED] |
| Preemption via posted interrupts, sender / receiver | 298 / 1,212 cycles | Shinjuku Table 1 [MEASURED] |
| User-mode LAPIC timer interrupt receive | 642 cycles (vs setitimer 5,057) | Skyloft Table 6 [MEASURED] |
| Linux context switch | 599 ns CFS, 410 ns minimal pthread (Skylake 8173M, Linux 4.15) | ghOSt Table 3 [MEASURED] |
| Linux thread switch | 1,124 ns runnable→runnable; 2,471 ns when one wakes the other (2.0 GHz Xeon, Linux 6.x) | Skyloft §5.4 [MEASURED] |
| Remote schedule via IPI (agent→target running) | 1,772 ns end-to-end; 10 CPUs grouped 5,688 ns | ghOSt Table 3 [MEASURED] |
| User-level thread yield / condvar ping-pong | 37–52 ns / 86–100 ns (Skyloft/Shenango) vs pthread 593–898 ns / 1,900–2,532 ns | Shenango Table 2, Skyloft Table 7 [MEASURED] |
| AVX-512 state save on preemption | < 40 ns typically, > 700 ns worst case; XSAVEC/XRSTOR 100–150 ns | NSDI'25 App. A [MEASURED] |
| ring3→ring0→ring3 transition | 84 cycles (2019 Xeon) | Shinjuku §3.6 [MEASURED] |

URLs: Skyloft https://madsys.cs.tsinghua.edu.cn/publication/skyloft-a-general-high-efficient-scheduling-framework-in-user-space/SOSP24-Jia.pdf ; xUI https://cseweb.ucsd.edu/~aousterhout/papers/xui_asplos25.pdf ; Shinjuku https://www.usenix.org/system/files/nsdi19-kaffes.pdf ; Multikernel https://www.sigops.org/s/conferences/sosp/2009/papers/baumann-sosp09.pdf ; NSDI'25 https://www.usenix.org/system/files/nsdi25-guo.pdf ; ghOSt https://storage.googleapis.com/gweb-research2023-media/pubtools/6413.pdf ; Shenango https://www.usenix.org/system/files/nsdi19-ousterhout.pdf

Caveats on these numbers
- Nearly every setup **disabled Turbo Boost, C-states and DVFS** (Shenango, Caladan, NSDI'25, Skyloft). So none of them measures wake-from-deep-idle latency or frequency ramp — the costs a laptop/desktop actually pays on a wake to an idle core. [INFERENCE - mine, from the papers' setup sections]
- No primary measurement of IPI or context-switch cost on AMD Zen 4/5 or on any AArch64 core turned up in this survey. ToyOS has to measure these itself on metal. [INFERENCE - mine]
- **UINTR is Intel-only (Sapphire Rapids and later) and absent from mainline Linux**: neither `arch/x86/entry/syscalls/syscall_64.tbl` nor `arch/x86/include/asm/cpufeatures.h` at v6.12 or v6.16 mentions it (FRED and WAITPKG are present). The 2021 RFC is at https://lkml.iu.edu/hypermail/linux/kernel/2109.1/07335.html and LWN https://lwn.net/Articles/869140 . [INFERENCE - mine, from grepping those mainline files at https://raw.githubusercontent.com/torvalds/linux/v6.16/arch/x86/include/asm/cpufeatures.h]
- Monitor/wait-on-cache-line as a no-IPI doorbell exists on both ISAs: x86 MONITOR/MWAIT, used by Caladan's KSCHED so commands to idle cores need no IPI (https://www.usenix.org/system/files/osdi20-fried.pdf §5.3) [CLAIMED by source], and Barrelfish idles via IPI or MONITOR/MWAIT (https://www.sigops.org/s/conferences/sosp/2009/papers/baumann-sosp09.pdf §4.4) [CLAIMED by source]; on AArch64, WFE wakes on the clearing of the PE's global exclusive monitor, i.e. a store to a line the waiter loaded exclusively (Arm ARM DDI 0487 "Wait for Event"; quoted at https://cirosantilli.com/linux-kernel-module-cheat/arm-wfe-and-sev-instructions.html) [CLAIMED by source — secondary quotation of the Arm ARM; verify against DDI 0487 before relying on it].
- Barrelfish's spin-then-block rule: poll for P cycles before sleeping on an IPI that costs C; choosing P = C bounds overhead at 2C and latency at C; C ≈ 6,000 cycles on their hardware. https://www.sigops.org/s/conferences/sosp/2009/papers/baumann-sosp09.pdf §5 [CLAIMED by source — simple competitive argument]

### What transfers and what does not [INFERENCE - mine unless tagged]
- **Datacentre-only**: dedicated busy-polling scheduler/IOKernel cores (Shenango, Caladan, Junction, Shinjuku, Concord's dispatcher, ghOSt's global agent) — they trade a whole core of power for µs reaction; Concord itself computes a 20% throughput loss for a dispatcher on a 4-vCPU VM (https://dslab.epfl.ch/pubs/concord.pdf §2.2.3 [CLAIMED by source]). Every efficiency number above was taken with C-states off. A laptop cannot pay that.
- **Datacentre-only**: µs-scale (1–5 µs) preemption quanta. They pay off only when service times are µs and dispersive (RPC). Desktop work units are larger: LAVD measured game tasks at "a few 100s usec on average" per schedule (slides, [MEASURED by source]). For audio, a 128-frame period at 48 kHz is 2.67 ms (arithmetic). The relevant scale is tens of µs of *wake latency* and 0.1–3 ms of *quantum*, not 5 µs PS.
- **Datacentre-only**: compiler-instrumented preemption (Concord, TQ). It needs the source and an LLVM pass, its overhead is workload-dependent (NSDI'25), and it cannot preempt code that isn't cooperating — incompatible with "the kernel never crashes from userland" as a *kernel* mechanism. An in-process async runtime might still use it.
- **Transfers**: the **wake-placement fast path** — wake on the previous CPU if idle, else an idle CPU, preferably a warm one (Wasted Cores fix; Nest; sched_ext `select_cpu` → local DSQ; Shenango "always grants an idle core instead of preempting"). The measured cost of getting it wrong is large: −22% on a TPC-H query from Overload-on-Wakeup alone.
- **Transfers**: **idle cores pull (work stealing)** as the main balancer (McClure Finding 1; Eager: receiver-initiated wins at high load), plus **waker push to idle cores** at light and moderate load (Eager: sender-initiated wins there; JIQ). Desktops spend most of their time lightly loaded, so the push path matters most.
- **Transfers**: **preempt only when someone is waiting** (NSDI'25 skipped ~70% of preemptions; Junction sends UIPIs only when work is queued). In a kernel this means a per-CPU one-shot timer armed only while the runqueue is non-empty, with no periodic tick.
- **Transfers**: **prioritise newly woken work over preempted work** (NSDI'25 two-queue; Shinjuku tail re-queue), plus a learned measure of latency-criticality instead of a blind single policy. Wierman–Zwart prove learning is necessary; LAVD's wake/wait-frequency signal is one cheap learner.
- **Transfers**: **interference-aware SMT pairing** (Caladan's hyperthread controller: idle the sibling while a latency-critical thread runs long; −117 µs tail when on). For audio/RT threads under a background compile this is the desktop analogue. It is also what core scheduling for security needs.
- **Transfers with care**: two-level split (spatial allocation by a privileged allocator, temporal dispatch per core). It fits a capability microkernel only if the allocator works at coarse time scales and the kernel enforces grants unilaterally — see Merits.

## 9. How each was verified

| Work | Verification | Oracle independence |
|---|---|---|
| Shenango | Real hardware (1 server, C-states/turbo off) vs ZygOS, Arachne, Linux; M/M/n simulation bound for a 1 ms allocator | Differential vs other systems; simulator for the bound |
| Caladan | Real hardware vs reimplemented Parties (source unavailable), Linux, Shenango | Baseline is the authors' reimplementation |
| Shinjuku | Discrete-event simulator for policy; real hardware vs IX/ZygOS; Monte-Carlo for RSS imbalance | Differential |
| Concord | Analytical overhead model; queueing simulation for imprecise preemption; hardware vs Shinjuku/Persephone (replicated their published results) | Replication of baselines' numbers |
| NSDI'25 user interrupts | Microbenchmarks over 24 programs (Splash-2/Phoenix/Parsec); RocksDB/Badger/DataFrame on Sapphire Rapids | Three mechanisms compared in one runtime (apples-to-apples) |
| LibPreemptible | Microbenchmarks + apps on Sapphire Rapids vs Shinjuku | Differential |
| Skyloft | schbench vs Linux RR/CFS/EEVDF; synthetic vs ghOSt/Shinjuku; apps vs Shenango | Differential; Linux tuned and default |
| ghOSt | Microbenchmarks; RocksDB vs Shinjuku; **production workloads (Snap, Search) at Google** | Production comparison vs MicroQuanta and CFS |
| sched_ext / LAVD | Game benchmarks (FPS, energy) on Steam Deck vs EEVDF; fleet deployment claims | Vendor talk slides; no peer review |
| McClure et al. | Simulator with measured overheads (open source) + implementation in Caladan | Simulation cross-checked against real systems' trends |
| Tiny Quanta | Simulation + hardware vs Shinjuku/Caladan | Differential |
| Persephone | Simulation + hardware vs Shenango/Shinjuku | Differential |
| xUI | Reverse-engineering on real Sapphire Rapids, then gem5 model calibrated to it | Hardware measurement anchors the simulator |
| Eager et al.; Mitzenmacher; JIQ; Wierman–Zwart | Analytic queueing models / proofs (large-system limits) | Mathematical |
| Ipanema (Lepers et al., EuroSys 2020) | DSL + theorem prover; defines **concurrent work conservation** and proves it for its policies; performance comparable to production schedulers https://hal.archives-ouvertes.fr/hal-02554342 (DOI https://doi.org/10.1145/3342195.3387544) | Formal proof [CLAIMED by source; abstract via search, full text not read] |
| Wasted Cores | Online invariant checker ("ready threads are scheduled on available cores") + visualiser on real machines | Runtime invariant |

---

## Merits for ToyOS [INFERENCE - mine throughout, grounded in the tagged evidence above]

ToyOS today: per-CPU state machines that talk only by message (mailbox + doorbell IPI), no global run queue, a fair band (per-process vruntime, 10 ms quantum), a strict RT band, idle CPUs stealing queued tasks, and wakes sent to the CPU the task parked on. A wake to a busy CPU waits for that CPU's next pass; a branch in progress lets idle CPUs take such wakes.

### Bottom line
The microsecond literature splits into **mechanisms that transfer** (wake placement onto idle and warm cores, idle-pull stealing, preempting only when someone waits, monitor/wait doorbells, a spatial/temporal two-level split, interference-aware SMT pairing, a kernel fallback under delegated policy) and **datacentre economics that do not** (a busy-spinning scheduler core, 1–5 µs processor sharing, compiler-instrumented or user-interrupt preemption, kernel bypass). ToyOS's per-CPU message design already sits where the evidence points. Its largest gap against the literature is the wake path, not balancing and not quantum length.

### 1. Centralised vs per-CPU dispatch → keep per-CPU; refuse a central dispatcher or agent on the hot path
- Every centralised design pays a dedicated spinning core: Shenango, Caladan, Shinjuku, Junction, ghOSt's global agent. It also pays a dispatcher throughput ceiling: ~5 Mrps for Shinjuku, 1.5–2.5 M decisions/s for a ghOSt agent. Tail costs follow: ghOSt's 30 µs agent loop left idle gaps, and Snap's p99.99 was up to 1.7× worse. A laptop cannot spend a core spinning, and Concord's own arithmetic loses 20% of a 4-vCPU machine to its dispatcher.
- The single-queue ideal is reached closely enough without a single queue. JBSQ(2), work stealing (McClure Finding 1), JIQ and JSQ-plus-per-core-PS (Tiny Quanta) all keep per-core ownership. Tiny Quanta shows the two-level form also keeps locality and scales as quanta shrink.
- So the per-CPU state machines stay. "Centralised" in ToyOS should mean only the *spatial* allocator (§4), never per-decision dispatch.

### 2. The wake path is the first-class fast path; "a wake to a busy CPU waits for the next pass" is a defect
- Evidence that placement dominates:
  - Wasted Cores' Overload-on-Wakeup cost 22% on a TPC-H query.
  - Shenango "always grants an idle core instead of preempting".
  - sched_ext's whole performance story rests on `select_cpu` → local DSQ of an idle CPU.
  - ghOSt beat CFS's p99 by 40–45% on Search because it rebalanced in µs rather than at periodic ms intervals.
  - With a 10 ms quantum and no wake preemption, wake latency on a saturated CPU scales with the slice (Skyloft's schbench: wake latency "roughly proportional to the time slice").
- Recommended order, decided on the **waker's** CPU (bounded kernel work charged to the waker, which fits the no-kernel-threads rule):
  1. the parked CPU, if idle (no migration);
  2. an idle CPU sharing L2/LLC, preferring recently idle (warm, shallow C-state, high frequency — Nest) over long-idle. Wasted Cores chose the longest-idle core but only with C-states off. Which wins on metal is a T14 measurement, not a paper result;
  3. any idle CPU;
  4. no idle CPU: send to the parked CPU and **make the doorbell IPI run the mailbox and a wake-preemption check immediately**, comparing deadline or lag, plus the RT band. Do not wait for the next pass. The IPI handler's work is bounded and charged to the interrupt.
- Keep receiver-initiated stealing as well (the branch in progress). Eager–Lazowska–Zahorjan proved the hybrid is right across loads: sender-initiated (waker pushes to an idle CPU) wins at light-to-moderate load, which is where a desktop lives; receiver-initiated (idle pulls) wins at high load if transfer costs match.
- **Message-only idle discovery, JIQ-style:** idle CPUs advertise idleness when they go idle (one line per LLC that wakers read), separating "discovering idle CPUs" from "assigning a wake to one". The waker *claims* by message. The target stays the authority over its own state and rejects a stale claim (ghOSt's ESTALE pattern); a rejected wake moves to the next candidate. This avoids a global run queue and avoids JIQ's "many dispatchers pick the same idle server" pile-up.
- **No-IPI doorbell to idle CPUs:** the idle loop arms MONITOR/MWAIT on x86, or LDXR+WFE on AArch64, on its mailbox line, so the waker's store wakes it (Caladan's KSCHED does this). That removes roughly 1.3k cycles of IPI delivery plus about 1.6k cycles of receive per wake-to-idle (Skyloft Table 6). IPIs remain only for busy targets. Before a deep idle, spin on the mailbox for about one IPI-plus-switch cost (Barrelfish's P = C rule) and only then pick a C-state.
- A fast path for wakes onto idle CPUs matters more than periodic balancing for interactive and audio work. Periodic balancing then only has to be a slow (tens of ms) fairness corrector for long-running CPU-bound threads. Idle stealing covers the rest.

### 3. Preemption granularity → millisecond quanta, event-driven wake preemption, timers armed only under contention
- Get wake latency from placement and preempt-on-wake, not from a short quantum. Desktop work units are around 100s of µs (LAVD's game-task measurement), and an audio period is roughly 1–5 ms. µs-scale PS only pays for µs-scale dispersive service times (Shinjuku, Concord, Tiny Quanta). Tiny Quanta and NSDI'25 show that quanta shorter than the short tasks' tail only add overhead.
- Arm a per-CPU one-shot preemption timer only while at least one other runnable task waits on that CPU or a budget expires; otherwise run tickless. Evidence: NSDI'25 skipped ~70% of preemptions this way, and Junction sends UIPIs only when work is queued.
- When a preempted task and a newly woken task compete, prefer the woken one, or order both by virtual deadline (NSDI'25's two-queue rule; Shinjuku's tail re-queue). Some learned latency-criticality signal is required in principle: Wierman–Zwart prove no blind policy is tail-optimal for both light and heavy tails. LAVD's wake/wait frequencies are a cheap learner. The fair-band algorithm itself is outside this topic.
- **Refuse user interrupts (UINTR) as a design dependency.** They are Intel-only (Sapphire Rapids+), absent from AArch64 and from mainline Linux, and their trust model lets any holder of the fd storm the receiver. The pipeline flush still costs about 720 receive cycles, 6–9× a memory notification (xUI). If ToyOS ever offers them as an x86 optimisation for in-process runtimes, the kernel owns the UITT, so "may interrupt thread T" maps naturally to a capability. That is a later idea, not a basis.
- **Refuse compiler-instrumented preemption (Concord/TQ) as a kernel mechanism.** It relies on code cooperating, and NSDI'25 measured its overhead as workload-dependent and fragile under tuning. It remains a legitimate *in-process* runtime technique.

### 4. A userland core-allocation server granting cores by capability → yes, but coarse-grained, unilaterally enforced, and off the wake path
- Fit with doctrine: deciding how many and which cores each program or session gets, SMT pairing, core compaction for power, and RT admission is long-running policy work with no single owner. That makes it a userland server's job. The kernel keeps the mechanism: a **CPU-grant kernel object** (CPU set, band, weight, budget) held by capability and enforced by the per-CPU dispatchers.
- Timescale: milliseconds, or event-driven. McClure et al. show that for ~1 µs tasks dynamic reallocation never beats a static allocation of the same average size. Its value is tracking *changes* in load, and reacting within milliseconds is enough for desktop load shifts; only 50 ms-plus reaction (Arachne) caused spikes. The 5–10 µs allocators (Shenango, Caladan) bought that speed with a spinning core. Refuse that.
- **Revocation must be unilateral.** The kernel preempts and migrates immediately. Arachne's cooperative release (10 ms timeout), Shenango's unmitigated "malicious kthread refusing to park", and Arachne's self-declared priorities all break capability isolation. In ToyOS, priority or RT reservations are capabilities the supervisor hands out, never self-declared.
- Revoke proactively. McClure Finding 6 shows that yielding only when no work is found wastes cores, and Caladan proved better with delay-range or utilisation-range policies.
- Signals the server needs, exposed as read-only status pages (ghOSt's status words, Caladan's per-queue oldest-element timestamps, Shenango's one-cache-line-per-core "head vs last tail" test) rather than as a message per event:
  - per-grant queueing delay (oldest runnable timestamp);
  - utilisation;
  - topology;
  - optionally LLC-miss or bandwidth counters for Caladan-style interference control, e.g. idling an RT/audio thread's SMT sibling while it runs. Core scheduling for security needs the same mechanism.
- Fallback: because per-decision dispatch never goes through the server, a dead or hung server leaves grants stale but never stalls a runnable thread. No sched_ext-style watchdog is needed for liveness, and sched_ext's 30 s default would be far too slow for audio anyway. This is the structural advantage of **policy by parameters, not by per-decision upcalls**.

### 5. Per-decision delegation (ghOSt, scx_rustland) → refuse for the default path
- An upcall per wake or block costs roughly 0.7–1.8 µs per decision (ghOSt Table 3) plus an agent thread that is either spinning or must itself be woken. scx_rustland's README concedes the cost. It also puts a userland thread on the critical path of every wake. Dispatch at block, wake and timer events is exactly the bounded kernel work "caused by the thread or interrupt", so it stays in the kernel.
- What userland legitimately owns: policy parameters (§4), and, inside a program, its own M:N runtime on cores it was granted (the Arachne/Shenango two-level model). Scheduler-activation-style "my thread blocked" notifications can be added later if such a runtime needs them.

### 6. Refuse outright
- A dedicated busy-polling scheduler core.
- Shared runqueues mapped across address spaces (Skyloft).
- APIC registers mapped into userland (Shinjuku).
- Self-declared priorities (Arachne).
- A non-work-conserving reservation (Perséphone's DARC) as a default. It wins only when request classes are known; the RT band with admission control is ToyOS's analogue.
- Power-of-two enqueue choice as the primary balancer: McClure shows stealing Pareto-dominates it, and adding it to stealing does not help. This is different from consulting an idle advertisement on wake, which is JIQ, not queue-length sampling.

### 7. What ToyOS should measure and check before committing (oracles independent of the implementer)
- On the T14 with **C-states and turbo enabled**: the wake-to-run latency distribution for (a) an idle target in MWAIT at C1 vs deeper states, (b) a busy target preempted by doorbell IPI, (c) a stolen wake. Also raw IPI send/receive cycles, context-switch cost, and warm-core vs long-idle-core placement. The papers disabled exactly the states that matter here, and no AMD or AArch64 numbers exist in this literature.
- A runtime invariant from Wasted Cores: no runnable task waits longer than a bound while an eligible CPU idles. Enforce it as a test assertion.
- A differential oracle for the placement and steal policy: McClure et al.'s open-source simulator (https://github.com/smcclure20/scheduling-policies-sim), extended with sender-initiated placement onto idle CPUs.
- A formal model of the mailbox claim/reject protocol checked for Ipanema's *concurrent work conservation*: no idle CPU while a wake is pending, modulo in-flight messages.

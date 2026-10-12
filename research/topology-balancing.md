# Topology-aware placement, load balancing, wake placement, and their verification

Research notes for the ToyOS scheduler design round. Every claim carries a URL and a tag:

- [MEASURED by source]: the source ran it and reports a number.
- [PROVED by source]: a theorem or machine-checked proof in the source.
- [CLAIMED by source]: the source asserts it without a measurement or proof I could see.
- [INFERENCE - mine]: my reasoning. Not evidence.
- [READ by me]: I read it in the source code or text myself (for example, a constant in a file).

The PDFs were read in full, through a local text extraction. Where only a search-result summary was available, the tag says so. Linux source was read from `torvalds/linux` master at **v7.3-rc7** (the Makefile at fetch time).

---

## 1. "The Linux Scheduler: a Decade of Wasted Cores" (Lozi, Lepers, Funston, Gaud, Quéma, Fedorova; EuroSys 2016)

URL: https://people.ece.ubc.ca/sasha/papers/eurosys16-final29.pdf

**Invariant at stake.** The paper names one invariant: "make sure that ready threads are scheduled on available cores". It found that Linux CFS often broke it, with "cores ... idle for seconds while ready threads are waiting in runqueues". [MEASURED by source]

**Machine.** 8× 8-core AMD Opteron 6272 (Bulldozer), 64 hardware threads, 8 NUMA nodes, 512 GB RAM, HyperTransport 3.0. Each node of 8 cores shares an LLC. Pairs of cores share an FPU. [READ by me, Table 5]

**The four bugs (Table 4):**

| Bug | Root cause | Since | Max measured impact |
|---|---|---|---|
| Group Imbalance | The hierarchical balancer compares a group's **average** load. A high-load single-thread process (the autogroup load divides make's 64 threads by 64) inflates one node's average and hides idle cores in it. Idle cores on that node do not steal from overloaded nodes. | 2.6.38 | 13× (NAS lu with 60 threads + 4 R processes); make −13% |
| Scheduling Group Construction | Groups at the NUMA levels were built from core 0's perspective. Nodes two hops apart (1 and 2) landed in both groups, so the averages were equal and nothing was stolen. A pinned app ran on one node. | 3.9 | 27× (lu); Table 1 shows 1.33×–27× across NAS |
| Overload-on-Wakeup | The wakeup path considers only the waker's node ("for the sake of better cache reuse"). A thread wakes on a busy core of node X while other nodes have idle cores. Triggered by a transient kernel thread that makes the balancer move a DB thread. | 2.6.32 | 22% (TPC-H Q18) |
| Missing Scheduling Domains | Hotplugging a core off and back on dropped the call that rebuilds the cross-NUMA domains in a refactor. No balancing between nodes afterwards. | 3.19 | 138× (lu; Table 3 shows 4×–138×) |

All [MEASURED by source]. Super-linear slowdowns arise because "if threads spin on a lock held by a descheduled thread, they will waste even more CPU time". [CLAIMED by source, with Tables 1 and 3 as evidence]

**Fixes and what they teach:**
- Group Imbalance: compare the **minimum** load of the groups, not the average. It costs the same and in their experience did not increase ping-pong migrations. [MEASURED by source for the speedup; CLAIMED for no extra ping-pong]
- Overload-on-Wakeup: wake on the local core if it is idle. Otherwise use "the core that has been idle for the longest amount of time" (the kernel already keeps an ordered idle list, so this is O(1)). Otherwise fall back. Enforced only when power management forbids low-power states. TPC-H Q18 −22.2%, full TPC-H −13.2%, both fixes −14.2%. [MEASURED by source]
- Short-term vs long-term idle: balancing toward a core that is only idle for a moment (its own sleeper will wake back onto it) does not fix the imbalance. The balancer "makes no distinction between short-term and long-term idle cores". [CLAIMED by source, illustrated by their Figure 3 traces]

**Sanity checker (section 4.1).** Algorithm 2 checks every CPU1 with `nr_running < 1` against every CPU2 with `nr_running >= 2` and `can_steal(CPU1, CPU2)`. It is not an assertion. It must tolerate short legal violations and flag persistent ones. It runs every **S = 1 s**. On a hit it monitors migrations, forks and exits for **M = 100 ms** (the balancer runs every 4 ms, but a hierarchical recovery takes several rounds). It flags a bug only if the condition is not resolved. Overhead was **< 0.5%** with up to 10,000 threads. On detection it records systemtap profiles of the balancing functions for 20 ms (about 7% overhead while active). It was ported from 3.17 to 4.3 by changing one line. [MEASURED by source]

**Visualisation tool.** Under 150 LOC of instrumentation. It records every runqueue-size change, load change and set of "considered cores" per balance or wakeup into a static array (20 B per event). The DB workload produced 186,200 events/s, which is 3.6 MB/s on 64 cores. [MEASURED by source]

**Lessons claimed by the authors.** The "very basic function of the scheduler ... fell through the cracks" because optimizations accreted. They propose a "core module" that always maintains "basic invariants, such as not letting cores sit idle while there are runnable threads", with optimization modules that only *suggest* placements. Combining conflicting suggestions "is a difficult open problem". [CLAIMED by source]

---

## 2. Ipanema: "Provable Multicore Schedulers with Ipanema: Application to Work Conservation" (Lepers, Gouicem, Carver, Lozi, Palix, Aponte, Zwaenepoel, Sopena, Lawall, Muller; EuroSys 2020)

URL (author copy): https://hal.science/hal-02554342/document. DOI: https://doi.org/10.1145/3342195.3387544. Slides: https://www.eurosys2020.org/wp-content/uploads/2020/04/slides/411_lepers_slides.pdf

**Definitions (section 2.2–2.4).** A core is *idle* with no runnable thread and *overloaded* with more than one. [READ by me]
- Local WC for an `unblock`/`new` event placing on core c: O(c) ⇒ ∀c′ ¬I(c′).
- Global WC for load balancing: (∃c O(c)) ⇒ ∀c′ ¬I(c′).
- Plain WC is unachievable in a concurrent scheduler. Concurrent block, unblock, fork and exit can idle or overload a core after it was observed.
- **Concurrent WC** removes those cores from consideration: CO(c) = O(c) ∧ ¬U(c), and CI(c) = I(c) ∧ ¬B(c) ∧ ¬E(c). Here U means a concurrent unblock or new placed a thread on c (or c stole from such a core). B means a concurrent block or terminate removed one. E means another scheduling event is still in progress on c.
- Hierarchical CWC generalises this to groups of k cores ("more than k threads" / "fewer than k threads").

**Concurrency model (section 3.1).** Events are mutually exclusive per core under a per-core lock that the compiler generates. Other cores may *read without locks* only four variables: `cload`, the per-core runnable `count`, `idle_cores` and `active_cores`. The policy cannot write them. The compiler orders the updates so that a published value "overestimates the load on the core by at most the load of a single thread". The handlers for balancing, unblock and new are split into lock-free *observing* phases and short *updating* phases. Steals remove the threads under the source lock, then add them under the destination lock. The model assumes an ARM-like weak memory model and the compiler inserts the barriers. [READ by me]

**What is proved, how.** The DSL compiles to C (a Linux 4.19 module) and to WhyML. The proofs are in **Why3**, discharged with **Alt-Ergo and CVC4**. (Leon is cited only as another tool with ghost code. The proofs do not use it.) [READ by me]
- Updating phases are cut into one-shared-write fragments returning continuations. A WhyML loop simulates every interleaving under three regimes: `others()`, `others_and_synchronize(c)` and `others_except(c)`. Ghost maps B and U record the concurrent blocks and unblocks. [READ by me]
- The load-balancing proof skeleton is generic over three policy hooks, `can_steal_core`, `select_core` and `steal_thread`, and is proved once. [PROVED by source]
- Unblock and new are proved per policy, with loop invariants placed by hand. [PROVED by source]
- Proved policies: ULE-CWC and CFS-CWC. [PROVED by source]

**Proof cost.** A WhyML library of about 2,000 lines took about 1 person-year part-time. The balancing skeleton of about 700 lines took 4 person-months full-time. Replaying a full proof takes about 10 minutes on a 44-core server. [MEASURED by source]

**Trusted computing base.** Why3, the provers and the Ipanema compiler (about 37k lines of OCaml in the frontend and 4,200 in the C backend), plus the assumption that the kernel calls load balancing periodically. [READ by me]

**Bugs the proofs exposed.**
- Proving CFS's `new`/`unblock` placement fails, because CFS searches only the parent's or previous core's domain. They state this is "the root cause of the fourth WC bug described by Lozi et al. ... that remains unfixed". [PROVED (by failed proof) + CLAIMED by source]
- Their own early `can_steal_core` criteria were found to be non-CWC from unprovable verification conditions. [CLAIMED by source]

**Design choices.**
- All CWC policies let **one core balance for the whole machine** (a softirq every 4 ms), so that concurrent balancers do not steal each other's placements. [READ by me]
- CFS-CWC removes CFS's 10–25% imbalance thresholds and steals on any imbalance. If its locality search finds nothing, it searches the whole machine for an idle core. [READ by me]
- Code size: CFS-CWC 362 DSL LOC (1,526 C), CFS-CWC-FLAT 222 (1,267), ULE-CWC 243 (1,404), plus a 1,900-LOC C abstraction library. [READ by me]

**Measured performance.** Machine: 4-socket Xeon E7-8870 v4, 80 cores / 160 threads, `performance` governor, Linux 4.19, mean of 12 runs. [MEASURED by source]
- NAS with 160 threads, geometric-mean improvement over CFS: ULE 15.5%, CFS-CWC 11.8%, CFS-CWC-FLAT 14.0%, ULE-CWC 14.4%. Up to 36%. UA is 5% slower with CFS-CWC, attributed to placement-sensitive locality; pinned placements differ by up to 33%. [MEASURED by source]
- Root cause on FT: CFS places all new threads on the parent's NUMA node, and only at 0.5 s does every core have a thread. [MEASURED by source, trace in Figure 5]
- Kbuild: under 6% difference. MySQL throughput: up to 8.2% better than CFS. MongoDB: at most 3% difference. 95th-percentile latency: at most 11% difference. [MEASURED by source]
- **Flat vs hierarchical:** CFS-CWC-FLAT, which steals for each core from all cores, is "sometimes better and sometimes worse". There was "no clear winning strategy on our 160 core machine". [MEASURED by source]
- Concurrent unblocks choosing the same core caused 2 placement errors at FT start-up. CWC tolerates this. [MEASURED by source]

---

## 3. Nest: "OS Scheduling with Nest: Keeping Tasks Close Together on Warm Cores" (Lawall, Chhaya-Shailesh, Lozi, Lepers, Zwaenepoel, Muller; EuroSys 2022)

URL (author copy): https://hal.science/hal-03612592/document. DOI: https://doi.org/10.1145/3492321.3519585

**Premise.** On turbo parts the frequency depends on how many cores of the socket are active and on sustained activity. CFS spreads forks and wakeups onto long-idle (low-frequency) cores and across sockets. [CLAIMED by source; turbo tables in Table 3]

**Mechanism (sections 3–4, about 500 LOC in Linux 5.9):**
- **Primary nest.** Recently used cores. A fork or wake searches it for an idle core first, starting at the task's previous core (or the parent's core) and staying on the same die first.
- **Reserve nest.** At most 5 cores. These are cores demoted from the primary nest or recently picked by CFS. It is searched second, from a fixed core, to reduce dispersal.
- **Fallback.** If both nests fail, CFS's choice is used and that core goes into the reserve nest.
- **Promotion and demotion.** A reserve core that gets picked is promoted. A primary core unused for 2 ticks (8 ms) becomes eligible for compaction. A core whose task exits goes straight to the reserve nest.
- **Impatience.** A task that finds its previous core busy 2 times in a row is "impatient" and grows the primary nest.
- **Keep-warm spin.** The idle task spins for up to 2 ticks after a block and stops at once if the hyperthread sibling gets a task.
- **Attachment.** A task with two consecutive runs on the same core is attached to it.
- **Wakeup work conservation.** Wakeup is extended to all dies when CFS finds no idle core on its die.
- **Placement claim.** Each runqueue has a compare-and-swap "task placed here" flag, so concurrent forks and wakeups cannot choose the same core.

[READ by me]

**Machines.** 2-socket 6130 (64 threads), 4-socket 6130 (128 threads), 2-socket 5218 (64 threads), 4-socket E7-8870 v4 (160 threads), all Intel with die = socket = LLC. Also single-socket Xeon 5220 and **AMD Ryzen 5 PRO 4650G** (6 cores / 12 threads, Zen 2 Renoir, 2 CCX). [READ by me]

**Results (baseline CFS-schedutil):**
- Configure scripts: speedups over 5% on almost all, up to 37% (E7). CPU energy down by up to 19%. [MEASURED by source]
- DaCapo: from −6% (fop on E7) to over +40%. h2 on the 4-socket 6130 sped up by more than 2× compared with a CFS run that dispersed it over sockets. [MEASURED by source]
- NAS: the same on the 2-socket machines. On E7, +16% to over +80% except CG and EP. [MEASURED by source]
- Phoronix (up to 222 tests): at least 7% of tests are over 5% faster on every machine, and 21% on E7. 1 to 15–19 tests are slower by 5–20%. [MEASURED by source]
- Ablation: removing the spin costs 10–26% on h2-class workloads. Removing the reserve nest costs about 5% (up to 16% on E7). [MEASURED by source]
- **AMD 4650G:** configure +20–80% (Nest-schedutil) and +27–157% (Nest-performance). DaCapo +10–30%. NAS the same as CFS. [MEASURED by source]
- **Losses:** hackbench goes from 22.5 s to 76 s, sometimes over 380 s (I-cache misses from 30M to 49M or 319M). apache-siege is slower as the number of users grows. libavif −22% on the 4-socket machine. [MEASURED by source]
- On SMT: CFS on Rodinia stacked compute tasks on sibling hyperthreads. Nest placed them on cores with an idle sibling and was faster on 6130/5218. On E7, Nest's all-dies wake-WC spread the tasks out and lowered frequencies (−8%). [MEASURED by source]
- Related result, "Fewer Cores, More Hertz" (Gouicem et al., ATC 2020), as described by the Nest paper: *frequency inversion*. A parent forks or wakes a child and blocks, the child lands on an idle low-frequency core, and the parent's high-frequency core sits idle. [CLAIMED by Nest describing that source; not fetched]

---

## 4. Linux: sched domains, wake placement, SIS_UTIL, and cache-aware scheduling

### 4a. Sched-domain model
URL: https://docs.kernel.org/scheduler/sched-domains.html
- Domains are per CPU and linked by `->parent`. A domain's span must be a superset of its child's span. Its groups' union equals its span, and its first group contains the owning CPU. Groups may overlap (`SD_OVERLAP`). [READ by me]
- Balancing runs from a tick-raised softirq that walks up the domains. Each domain whose interval has expired finds the busiest group, then the busiest runqueue in it, then moves the imbalance. [READ by me]
- Domains are per CPU "because they are updated without locks". [CLAIMED by source]

### 4b. Wake placement in v7.3-rc7 (`kernel/sched/fair.c`)
URL: https://raw.githubusercontent.com/torvalds/linux/master/kernel/sched/fair.c (feature defaults in https://raw.githubusercontent.com/torvalds/linux/master/kernel/sched/features.h)

**`wake_wide()`.** Detects M:N waker/wakee relations with a "flip" counter (the number of distinct wakees, decayed every second). It spreads when one partner's flips are at least `llc_size` and the other's are at least `llc_size` times that. In other words, it spreads when the apparent partner count exceeds the LLC size. [READ by me]

**`wake_affine()`.** Only considers "the waking and previous CPU". [READ by me]
- `wake_affine_idle`: if this CPU is idle and shares cache with prev, return prev if prev is idle, else this CPU. On a sync wakeup with the waker alone on its runqueue, return the waker's CPU. If prev is idle, return prev.
- `wake_affine_weight`: compares the effective loads, with a bias of half the `imbalance_pct`.
- Defaults: `WA_IDLE`, `WA_WEIGHT` and `WA_BIAS` are all true.

**`select_idle_sibling(p, prev, target)` order:**
1. target, if idle.
2. prev, if it shares cache with target and is idle ("don't be stupid").
3. Stack on a per-CPU kthread that woke the task on prev (I/O completion).
4. `recent_used_cpu`, if cache-affine and idle.
5. On asymmetric-capacity machines, `select_idle_capacity`.
6. Within `sd_llc` only, and if SMT is active: when there is no idle core, try prev's SMT siblings.
7. Otherwise `select_idle_cpu`. With `has_idle_core` it scans for a **whole idle core**. Without it, it scans for an idle CPU, bounded by `nr_idle_scan` (SIS_UTIL). The scan starts at target+1 and wraps.
8. Fallbacks: prev_aff, then recent, then target.

[READ by me]

**`has_idle_cores`.** One flag per LLC in `sched_domain_shared`. It is set lazily when a CPU goes idle and finds all its SMT siblings idle (`__update_idle_core`), and cleared when a full core scan fails. [READ by me]

The 2016 rewrite (`10e2f1a`, Peter Zijlstra) introduced the three explicit scans and the idle-core flag: "looking for idle cores is pointless when the machine is busy". It gates the idle-CPU scan on average scan cost versus average idle time, with "a significant fudge factor". No numbers are given in the commit message. URL: https://github.com/torvalds/linux/commit/10e2f1acd0106c05229f94c70a344ce3a2c8008b [CLAIMED by source]

**Cross-LLC on the wake path.** Linux does not search beyond the LLC when it wakes a task. Other LLCs are left to the load balancer.
- `SIS_NODE` / `select_idle_node()` (P. Zijlstra, tip, mid-2023) searched the other LLCs of the node. It was motivated by Tejun Heo's Zen 2 machine (3 cores per LLC, 4 LLCs), which showed "significant idle time" with short tasks that periodic balancing could not fix. URL: https://lkml.rescloud.iu.edu/2306.0/00251.html [CLAIMED by source; no numbers]
- K Prateek Nayak's dual-socket Zen 3 results (8 CCX per node) under NPS1:
  - hackbench (16 groups) **34% worse** with SIS_NODE (10.56 vs 7.88), flat with a scan limit of 4, 2% worse with a "two nearby CCX" domain.
  - tbench (512 clients) **+20%** with SIS_NODE, 7–10% worse with the limit or the domain.
  - netperf: +5% / +14% / +14% at 128 clients; LIMIT −24% at 256 clients.
  - URL: https://lkml.iu.edu/hypermail/linux/kernel/2306.1/05961.html [MEASURED by source]
- Zijlstra preferred a topology fix over a "magic" scan limit. [CLAIMED by source]
- `SIS_NODE` and `select_idle_node` are **absent from v7.3-rc7** `fair.c` and `features.h`. [READ by me; I did not locate the revert's message]

**`task_hot()` (balancer's cache-hotness test).**
- Returns 0 for SMT domains ("SMT siblings share cache").
- Otherwise the task is hot if it ran within `sysctl_sched_migration_cost` = **500,000 ns**, a fixed constant.

[READ by me]

### 4c. SIS_UTIL (Chen Yu, v4, June 2022; default on in v7.3-rc7)
URL: https://lkml.rescloud.iu.edu/2206.1/04975.html

**Problem.** `select_idle_cpu()` "might spend too much time searching for an idle CPU, when the system is overloaded". [CLAIMED + histogram by source]

**Mechanism.**
- Scan count nr = llc_weight · (1 − p·x²), where x = sum_util / (llc_weight · 1024), so the count reaches **0 at 85% LLC utilisation** (imbalance_pct 117).
- Recomputed during periodic balancing, not on newly-idle, to limit cache-line contention.
- Example counts: a 112-CPU LLC scans 112 / 65 / 25 / 1 / 0 CPUs at 0 / 55 / 75 / 85 / 86% utilisation. A 16-CPU LLC scans 16 / 9 / 3 / 0.

[READ by me]

**Results on a 112-CPU-per-LLC machine (vs v5.19-rc1):**
- netperf TCP_RR and UDP_RR **+187% to +197%** at 196–224 threads, about flat below that.
- hackbench −4.9% to +11.9%.
- tbench about ±1.7%.
- schbench 90th percentile −7% to +10%, with high standard deviation.
- Scanned CPUs −87.9%.
- A stress-ng.sock regression, and a 16-CPU-LLC hackbench regression that was "needs further investigation".

[MEASURED by source]

**Known blind spot.** With 7 of 8 CPUs busy (87.5%), the eighth idle CPU is never scanned. The author relies on newly-idle balancing to pull work to it. [CLAIMED by source]

### 4d. Cache-aware scheduling / cache-aware load balancing (2025–2026; **in mainline v7.3-rc7 as `CONFIG_SCHED_CACHE`, default y**)

**Origin.** Peter Zijlstra's RFC "sched: Cache aware load-balancing" (March 2025) adds per-`mm` per-CPU decayed runtime and steers wakeups toward the CPU, and so the LLC, where the process ran most. It was "not meant to be merged". Sources: https://lkml.iu.edu/hypermail/linux/kernel/2503.3/02138.html (seen via LWN) and Corbet, LWN, https://lwn.net/Articles/1018334 [CLAIMED by source]

**Chen Yu's RFC (April 2025).** Caps aggregation (at most 25% of the target domain's CPU time / 33% of its load). It reports that the wakeup-path pull and the balancer push "are in the opposite directions and tend to bounce tasks between LLCs". It ran schbench on Intel EMR and AMD Zen 3 Milan: better tail latency when the LLC is underloaded, regressions when it is saturated. No numbers in the cover. URL: https://lwn.net/Articles/1018301/ [CLAIMED by source]

**Tim Chen, "[PATCH 00/19] Cache Aware Scheduling" (October 2025).** URL: https://lwn.net/Articles/1041668/
- Tunables: `llc_aggr_tolerance`, `llc_overload_pct` 50%, `llc_imb_pct` 20%, a 10 ms occupancy epoch, and a 50 ms preference timeout.
- Spillover to a secondary LLC was rejected, because "hopping between primary and secondary LLCs often caused cache bouncing". [CLAIMED by source]
- Sapphire Rapids (2 sockets × 30 cores, interleaved memory, 2 LLCs of 60 CPUs): hackbench with 1 group about −30% time (38.48 → 26.71), schbench 99th-percentile wakeup latency −22% to −37% for 2–64 threads, ChaCha20-xiangshan about +10%, stream and netperf flat. [MEASURED by source]
- **AMD Milan (8 CCX × 8 CPUs per node):** "no obvious differences". [MEASURED by source]
- **AMD Genoa (2 CCX × 16 CPUs per node):** ChaCha20 −44% time, but only with `llc_aggr_tolerance=100`. Defaults showed little change. [MEASURED by source]

**v3 (February 2026).** The cache-aware logic moved into the load balancer, which skips after `cache_nice_tries` failures. URL: https://lkml.iu.edu/hypermail/linux/kernel/2602.1/03506.html
- Genoa hackbench (pipe) +20% to +50% when underloaded, **but −12.8% / −10.1% / −4.3%** in some group and thread mixes.
- Sapphire Rapids schbench 99th-percentile request latency −22.5% in one case.

[MEASURED by source]

**Enhancements v4 (May 2026).** Address "over-aggregation". The working-set estimate moves from RSS to NUMA-balancing fault statistics. URL: https://lwn.net/Articles/1072753/ [CLAIMED by source]

**Mainline code (v7.3-rc7).**
- Aggregation is refused when the process footprint exceeds `llc_bytes · (1 + (tol − 1)·256)`, or when `nr_running_avg · smt_threads` does not fit `tol · llc_size`.
- The source comments that the tunable numbers "come from a place the sun don't shine".
- Kconfig: https://raw.githubusercontent.com/torvalds/linux/master/init/Kconfig

[READ by me]

### 4e. AMD CCX-specific findings by maintainers

**Mel Gorman (2021–22, merged February 2022, commit e496132).** He limited the allowed NUMA imbalance so tasks do not share an LLC prematurely on Zen, which has several LLCs per node. Zen 3 STREAM with one instance per LLC: +18.9% at 104 threads, +17.5% at 120. NPB-ep also gained from better spreading across LLCs. URL: https://lkml.iu.edu/2110.3/05529.html [MEASURED by source; seen via search summary, not read in full]

**Zen 3 SIS_NODE data** (section 4b): cross-CCX wake search wins on tbench and loses on hackbench. [MEASURED by source]

**Cache-aware scheduling on Milan** (8-CPU CCX): no gain at defaults. On Genoa (16-CPU CCX) it gained only with tolerance 100. [MEASURED by source]

---

## 5. sched_ext schedulers (github.com/sched-ext/scx)

**scx_lavd.** README: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_lavd/README.md. Design header: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_lavd/src/bpf/main.bpf.c

*Latency criticality.* A task is more latency-critical when its runtime per schedule is shorter, it wakes others more often, or it waits for others more often. Criticality sets a virtual deadline. [CLAIMED by source]

*Core compaction.* When system utilisation is low ("say < 50%"), only "active cores" are used, kept below about 50% utilisation, so they run faster and the rest stay in C-states longer. Compaction is disabled at moderate utilisation and does not apply to kernel or pinned tasks. A January 2026 commit lowered the target to 40% for spiky loads (gitea mirror, seen via search). [CLAIMED by source; no published measurement found]

*Idle-CPU policy* (`idle.bpf.c`, https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_lavd/src/bpf/idle.bpf.c):
1. Stay in the active and overflow sets.
2. Extend the overflow set in preference order.
3. Match CPU type to task type.
4. Prefer a fully idle core over a partially idle one within prev's domain.
5. On a sync wakeup, stay on the idle waker CPU if no other idle CPU is in the sticky domain.
6. Migrate across domains only when the source domain is a "stealee", the target is a "stealer" **and the target has a fully idle core**. Otherwise stay on prev "hoping that the load imbalance ... will be resolved by the load balancing mechanism".

The random CPU choice uses "the random of two choices technique". Kick-preemption victims are also chosen by power of two choices. [READ by me]

*Balancing* (`balance.bpf.c`): compute domains are classified against a capacity-weighted fair share ± a migration delta. A stealer may take half its deficit and a stealee may give half its excess. Halving "avoids ... ping-pong" and "thundering-herd". [READ by me]

*Measurements.* LWN's LPC 2025 report (https://lwn.net/Articles/1051430/) covers the design, with game tasks of about 1 ms in chains of 20–30 per action. It gives no LAVD performance or power numbers. [CLAIMED by source] The README says it "mainly targets single CCX / single-socket systems". [CLAIMED by source]

**scx_rusty.** README: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_rusty/README.md. Balancer: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_rusty/src/load_balance.rs
- One domain per LLC, round robin in BPF.
- Userspace computes duty-cycle load per domain, then balances push/pull first between NUMA nodes (higher cost, so a higher threshold) and then between the domains within a node.
- The README warns of "infeasible weights" leaving cores idle (also in CFS).
- The authors list as future work that the migration decision ignores L3 co-location benefits: "a very complex, multivariate cost function".

[CLAIMED by source]

**scx_bpfland.** https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_bpfland/README.md. vruntime with interactive classification by voluntary context-switch rate. No topology claims in the README. [CLAIMED by source]

**scx_flash.** https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_flash/README.md. EDF with dynamic latency weights. No topology claims in the README. [CLAIMED by source]

**scx_cosmos.** https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_cosmos/README.md. Keeps tasks on their CPU via local DSQs when the system is not saturated. When saturated it switches to deadline scheduling on a shared (or per-node) DSQ, and it batches CPU wakeups with a timer. [CLAIMED by source]

**scx_p2dq.** README: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_p2dq/README.md. Source: https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_p2dq/src/bpf/main.bpf.c
- Per-LLC DSQ, per-CPU DSQ and a per-LLC migration DSQ.
- An idle CPU consumes CPU, then LLC, then migration queues.
- If those are empty, it picks **two random LLCs**, tries the more loaded one's migration DSQ and then the other's.
- Defaults: a 5 ms backoff, at least 10 queued tasks, and a 250 ms balance timer. When the system is saturated it falls back to aggressive random stealing.
- The comment says this "yields better work conservation on machines with a large number of LLCs".
- The README FAQ admits LLC "stickiness" loses on benchmarks that ramp load quickly, and loses at 100% utilisation from overhead. "Tested on various services at Meta ... similar performance to EEVDF".

[READ by me; CLAIMED by source; no numbers published in the README]

**Per-node idle masks in sched_ext (A. Righi, 2024–25).** A single global idle mask "stresses cache coherency on large multi-NUMA systems", so it was split per node. Measured: no change on small systems, about +2–2.5% with a modified bpfland. URLs: https://lkml.iu.edu/hypermail/linux/kernel/2412.2/07387.html and https://lkml.rescloud.iu.edu/2502.1/10525.html [MEASURED by source; seen via search summary]

---

## 6. Load-balancing theory

**Work stealing (Blumofe & Leiserson, JACM 1999).** URL: https://cs.utexas.edu/~venkatar/sys_perf_analysis/ws_theory.pdf
- For fully strict computations, randomized work stealing runs in expected time **T₁/P + O(T∞)** with space S₁·P. Communication is existentially tight, while "work-sharing schedulers have nearly worst-case behavior for communication". [PROVED by source]
- "When all processors have work to do, no threads are migrated by a work-stealing scheduler". [CLAIMED by source; follows from the algorithm]

**Work stealing with private deques, i.e. by message passing (Acar, Charguéraud, Rainey, PPoPP 2013).** URL: https://www.chargueraud.org/research/2013/ppopp/full.pdf
- A thief "sends a message to a randomly chosen victim processor and awaits for a response". Victims poll, sometimes interrupt-driven.
- Their sender-initiated and receiver-initiated algorithms keep bounds similar to concurrent deques, with the polling delay bounded by the "branching depth".
- Private deques remove fences from local operations and make steal-half easy.

[PROVED by source for the bounds; CLAIMED for the practical advantages]

**Locality of work stealing (Acar, Blelloch, Blumofe, SPAA 2000).** URL: https://www.cs.cmu.edu/~guyb/papers/locality2000.pdf
- For general computations, no useful bound relates multiprocessor cache misses to uniprocessor ones. For nested-parallel ones, the extra misses are O(C·⌈m/s⌉·P·T∞). [PROVED by source]
- *Locality-guided work stealing* gives each thread an affinity. Each processor has a **mailbox** (a FIFO of threads with affinity for it). A new thread goes to both the deque and the affine processor's mailbox, and a processor checks its mailbox before stealing. [READ by me]
- About as good as static partitioning in dedicated mode, without the "performance cliff" under multiprogramming, on a 14-processor Sun. The journal abstract (seen via search) says up to 80% over plain work stealing. [MEASURED by source]

**Power of two choices (Mitzenmacher, IEEE TPDS 2001).** URL: https://www.eecs.harvard.edu/~michaelm/postscripts/tpds2001.pdf
- In the supermarket model, d ≥ 2 random choices give an **exponential** improvement in expected time in the system as λ → 1: T_d ~ log T₁ / log d.
- The maximum queue length is log log n / log d + O(1) w.h.p.
- d = 3 is only a constant factor better than d = 2.
- Rule of thumb: "Systems where items have two (or a small number of) choices can perform almost as well as a perfect load balancing system with global load knowledge."

[PROVED by source for the theorems; MEASURED by simulation for small n; CLAIMED for the rule of thumb]

**Stale information (Mitzenmacher, "How useful is old information?", PODC 1997 / TPDS 2000).** URL: https://www.eecs.harvard.edu/~michaelm/abstracts/tpds2000.html
- With load information that is T seconds old, sending each task to the apparently least-loaded server "can significantly hurt performance": arrivals herd onto it before the information updates.
- Picking the lesser of two random choices stays good across a wide range of parameters.
- "Only small amounts of queue length information can be extremely useful."

[PROVED (limiting systems) and simulated by source; the full text is a scanned image and I read only the abstract]

**Sparrow (Ousterhout, Wendell, Zaharia, Stoica; SOSP 2013).** URL: https://amplab.cs.berkeley.edu/wp-content/uploads/2013/11/p69-ousterhout.pdf
- Per-task two-choice sampling is still more than 2.6× an omniscient scheduler at 80% load for 100-task jobs (simulation of 10,000 4-core machines). [MEASURED by source]
- **Batch sampling** probes d·m workers for m tasks. [READ by me]
- **Late binding** reserves on workers and assigns a task only when a worker is ready, because "server queue length is a poor indicator of wait time" and parallel samplers race. It cuts median response time by up to 45% compared with batch sampling alone. Sparrow is within 12% of ideal on 110 machines. [MEASURED by source]

**Linux scaling evidence, already cited above:**
- Per-LLC scan bounded by SIS_UTIL; no cross-LLC wake scan (4b, 4c).
- `has_idle_cores` is one flag per LLC (4b).
- sched_ext per-node idle masks (section 5).
- Ipanema's flat balancer was not worse at 160 threads (section 2).
- Wasted Cores' Group Imbalance shows that *averages* in summaries hide idle CPUs (section 1).

---

## 7. FreeBSD ULE and XNU Edge

**ULE paper (Jeff Roberson, BSDCon 2003).** URL: https://www.usenix.org/legacy/event/bsdcon03/tech/full_papers/roberson/roberson.pdf (the PDF is RC4-protected; I decrypted it locally to read it)
- One `kseq` per CPU.
- Pull: an idle CPU steals the highest-priority thread from the most loaded kseq.
- Push: a timeout "twice a second" picks the two most unbalanced kseqs and moves threads, at least one even if they differ by one, because "one thread using 100% of the CPU [can] prevent the pull method from working".
- "Attempts at over aggressive balancing are likely to ruin caches and not resolve real load imbalances".
- SMT is treated as a NUMA-like cost case, with the logical CPUs of a core mapped to **one shared kseq**.
- "Enabling Hyper-Threading logical cores leads to worse performance than having them disabled."
- Measured: a parallel compile 4× faster than 4BSD on SMP, Apache +30% on a dual Xeon.
- The author calls the SMP balancing "quite primitive ... This topic is worthy of a paper on its own."

[MEASURED/CLAIMED by source as marked in the text]

**Modern ULE (`sys/kern/sched_ule.c`, FreeBSD main).** URL: https://github.com/freebsd/freebsd-src/blob/main/sys/kern/sched_ule.c
- Topology is a `cpu_group` tree with sharing levels (THREAD / L2 / L3 / NONE).
- Affinity is time-based per level: `SCHED_AFFINITY(ts, level)` = ticks since last run < level·affinity. **Affinity for a farther cache expires later.**

`sched_pickcpu` order:
1. Previous CPU, if idle, affinity unexpired and, for SMT groups, all SMT siblings idle.
2. Climb to the largest group whose affinity has not expired, and pick the least-loaded CPU there that can run the thread now.
3. Global least-loaded CPU that can run now.
4. Global least-loaded CPU.
5. Prefer the current CPU if the target is busy and the current CPU's load is no higher than the target's + 1.

The search sums load per child group, adds a random tie-break of 0..127 within groups, and penalises SMT groups with load above one.

`tdq_idled`:
- Steals from the most loaded CPU in its own group with load ≥ `steal_thresh` (2).
- Escalates to the parent if none is found.

Periodic balance:
- Every `balance_interval` ±50% (random), with `realstathz` as the default.
- `sched_balance_group` repeatedly pairs the highest with the lowest. Each CPU donates or receives once per pass.

[READ by me]

**ULE vs CFS measured (Bouron et al., ATC 2018).** URL: https://www.usenix.org/system/files/conference/atc18/atc18-bouron.pdf
- 37 applications, with ULE ported into Linux.
- CFS converges faster to balance, but ULE achieves better balance in the long run.
- CFS's migration-avoidance heuristics sometimes put two threads on one core in one-thread-per-core HPC runs, while ULE always places one per core.
- ULE's periodic balancer was dead in recent FreeBSD from a bug (a variable initialised wrongly), fixed for their study.
- ULE balances every 500–1500 ms on core 0 only, at most one thread per core per pass.

[MEASURED by source]

**XNU Edge scheduler.** URL: https://github.com/apple-oss-distributions/xnu/blob/main/doc/scheduler/sched_clutch_edge.md
- **Per-cluster runqueues**, not per-CPU. Placement starts from a performance-controller recommendation per thread group and QoS.
- Goals: be "compact", "rapidly open up clusters", "migrate down only", and manage "passenger effects".
- **Edge matrix per QoS.** Each directed edge between clusters has `migration_allowed`, `steal_allowed` and a `migration_weight`.
- Per-cluster **scheduling-latency metric** = (runnable plus running threads of higher or equal QoS) × (EWMA of execution time per QoS).
- Placement: use the preferred cluster if its latency is 0. Otherwise take any cluster with latency 0. Otherwise migrate to the cluster with the largest latency delta, **only if the delta exceeds the edge weight**. Homogeneous clusters are tried before asymmetric ones.
- Steal order when idle:
  1. foreign runnable threads
  2. native runnable threads
  3. a foreign running thread (via an IPI rebalance)
  4. other clusters' threads, by load and `steal_allowed`
- "Stir-the-pot" rotates long-running threads across core types at quantum expiry.

[CLAIMED by source; no numbers in the doc]

---

## 8. Cost of migration across SMT, LLC and CCX, and "run cold vs wait"

**Velten, Schöne, Ilsche, Hackenberg, "Memory Performance of AMD EPYC Rome and Intel Cascade Lake SP" (ICPE 2022).** URLs: https://arxiv.org/abs/2204.03290 (read via ar5iv) and https://research.spec.org/icpe_proceedings/2022/proceedings/p165.pdf. Method: BenchIT pointer chasing timed with rdtsc.

*EPYC 7702 (Zen 2 Rome):*

| Access | Latency |
|---|---|
| Own L1 / L2 | 2 / 6 ns |
| Local-CCX L3 hit | 19.5 ns |
| Line in another core of the **same CCX** | 36–39 ns |
| Line in a core of the **other CCX on the same CCD** | **102–126 ns** (Shared lines from another CCX are served from RAM) |
| Other CCD | "at least 200 cycles (100 ns)" |
| Local DRAM | 110 ns |
| Remote socket | about 203–218 ns |

*Xeon Gold 6248:*

| Access | Latency |
|---|---|
| Other core's M/E line, same SNC | about 48–53 ns |
| Other SNC | about 54–58 ns |
| L3 | 21.6 ns |
| DRAM | 80 ns |

[MEASURED by source]

**Li, Ding, Shen, "Quantifying the Cost of Context Switch" (ExpCS 2007).** URL: https://www.usenix.org/legacy/events/expcs07/papers/2-li.pdf
- The indirect cost (cache refill) of a context switch "ranges from several microseconds to more than one thousand microseconds" depending on working set and stride.
- It is flat (4.2–8.7 µs) while the data fits in L2.

[MEASURED by source]

**Direct evidence that waiting for locality loses:**
- Wasted Cores' Overload-on-Wakeup: "waiting in the runqueue for the sake of better cache reuse does not pay off" (22%). [MEASURED by source]
- Ipanema: CFS "favors preserving cache locality over work conservation", costing 11.8–15.5% geometric mean on NAS. [MEASURED by source]
- Bouron: CFS's migration-avoidance doubles threads up on cores. [MEASURED by source]

**Where locality wins:**
- Cache-aware aggregation on Sapphire Rapids and Genoa (section 4d). [MEASURED by source]
- SIS_UTIL netperf: staying on prev rather than "grabbing other CPUs' lock". [MEASURED by source]
- SIS_NODE's hackbench loss on Zen 3. [MEASURED by source]
- Nest's warm-core reuse (section 3). [MEASURED by source]

**Policy constants in production are not measured per machine:** Linux `sysctl_sched_migration_cost` is 500 µs [READ by me]. The cache-aware constants come "from a place the sun don't shine" [READ by me]. XNU's edge weights are set by a performance controller [CLAIMED by source].

**Intel client parts.** I found no peer-reviewed core-to-core latency paper for 4-core Intel client parts with one shared L3. Only secondary sources exist (AnandTech, Chips and Cheese), which the brief excluded. **Gap: measure on the bench.**

**The "run cold beats waiting" arithmetic** [INFERENCE - mine, using the measured numbers above]:
- Refilling a 512 KiB Zen 2 L2 from the local L3 is 8,192 lines × 19.5 ns ≈ 160 µs if fully serialised. With about 10–20 misses outstanding it is about 8–16 µs. Refilling from another CCX or DRAM (about 110–125 ns per line) is about 5–6× more.
- A queued task waits about a slice when its CPU is busy. Linux's default is milliseconds: `sysctl_sched_base_slice` is 0.70 ms × (1 + ilog2(min(ncpus, 8))), so 2.8 ms at 8 or more CPUs [READ by me, v7.3-rc7 fair.c lines 85–86 and `get_update_sysctl_factor`].
- So moving to an idle CPU in the same LLC almost always beats waiting. Moving across an LLC beats waiting unless the expected wait is short: a sync handoff, or a runner about to block.
- This is exactly XNU Edge's rule, stated in time units: migrate if E[wait here] − E[wait there] > cost(edge).

---

## 9. Verification

**Ipanema proofs (section 2).**
- CWC for load balancing is proved once, generically, with a skeleton. For `unblock`/`new` it is proved per policy, with loop invariants written by hand. [PROVED by source]
- The proofs found real non-CWC code: CFS placement and their own early criteria. [CLAIMED by source]
- The proofs assume the kernel invokes balancing periodically, and they do not prove liveness. "Thread liveness" is listed as future work. [READ by me]

**Wasted Cores sanity checker (section 1).** A runtime monitor with a period (S = 1 s) and a grace window (M = 100 ms). It catches persistent violations with probability that grows with their duty cycle. Under 0.5% overhead. [MEASURED by source]

**Enoki (Miller, Kumar, Vakharia, Chen, Zhuo, Anderson; EuroSys 2024).** URL: https://foci.uw.edu/papers/eurosys24-enoki.pdf
- Schedulers are written in safe Rust against a narrow interface.
- A `Schedulable` type "represents a task and what core it can safely be scheduled on". It stops the scheduler returning a task the kernel cannot run.
- **Record and replay:** every call and hint into the scheduler, plus its responses and **the order of lock acquisitions**, are recorded. The *same scheduler code* is replayed in userspace, with an alert if responses diverge. Exact timing is not recorded; timing the scheduler depends on travels in the messages.
- Live upgrade pauses for about 10 µs.

[READ by me / CLAIMED by source]

Its WFQ scheduler versus CFS: 0.74% geometric-mean slowdown over 36 benchmarks, worst case 8.57%. pipe wakeup costs 3.0 µs (CFS) vs 3.6 µs (WFQ) on one core. [MEASURED by source]

Its locality-aware scheduler with hints co-locating a schbench message thread and its workers had "significantly lower 99% latency" than CFS or random placement. [MEASURED by source; numbers in their Table 6, not extracted]

**LinSched (UNC, then Google 2010).** URL: https://lwn.net/Articles/409680/
- Runs the kernel's scheduling subsystem as a userspace program with "arbitrary hardware topologies" and sched domains "for all levels".
- Results are "stable and repeatable", and it "cut validation time from days to hours".
- It helped find a load-balancing bug.
- The announcement does not describe validation against hardware, and the article does not mention cache effects.

[CLAIMED by source]

**SchedViz (Google).** URL: https://github.com/google/schedviz
- Ingests ftrace `sched_switch`, `sched_wakeup`, `sched_wakeup_new` and `sched_migrate_task`, then infers per-CPU and per-thread state.
- Purpose: to "quantify task starvation due to round-robin queueing" and find "core allocation choices that cause unnecessary waiting".
- It warns that PID reuse and misaligned per-core timestamps break inference.

[CLAIMED by source]

**Invariants a simulator can check** [INFERENCE - mine, assembled from sections 1, 2 and 9]:
- (I1) Task conservation: every task is in exactly one place.
- (I2) Concurrent work conservation, in a message-passing form (see Merits).
- (I3) Bounded idle-while-queued: no CPU idle with a stealable task queued elsewhere for longer than K protocol rounds. This is the Wasted Cores checker with M expressed in rounds.
- (I4) Bounded migration: no ping-pong.
- (I5) Affinity respected.
- (I6) No starvation within a bound.
- (I7) Topology rebuild after hotplug equals a fresh build. The Missing Scheduling Domains bug was a hotplug rebuild bug.
- (I8) Groups are perspective-correct: built from each CPU's own viewpoint. The Group Construction bug violated this.

---

## Merits for ToyOS [INFERENCE - mine, throughout this section]

The previous proposal sorted CPUs into one `nearest(from)` order and preferred whole idle cores, spawn-near and wake-affine pulls. Almost every production scheduler converges on that same tree, so it is not wrong. The evidence says state of the art lies elsewhere: in **how the tree is used and what is guaranteed regardless of it**. Every documented failure in sections 1–4 is a placement or locality heuristic that silently overrode work conservation:
- averages in group summaries
- groups built from the wrong viewpoint
- waker-affine wakes confined to a node
- searches confined to an LLC
- hotplug rebuilds
- aggregation fighting the balancer

So the design should separate a **checked core** from **locality hints**: the Wasted Cores authors' "core module" vision, made provable as Ipanema did.

### 1. Topology model and balancing scheme for a message-passing per-CPU scheduler

**Topology.** A level tree built per CPU, from that CPU's own viewpoint (the Group Construction lesson): SMT core → LLC (CCX) → package or NUMA node → machine.
- Keys come from CPUID 0xB/0x1F plus cache leaf 4 / 0x8000001D on x86, and from ACPI PPTT on AArch64, as previously proposed. That part stands.
- Each level gets a **migration cost (edge weight) in time units**, not just a rank. SMT ≈ 0, matching Linux's `task_hot` and ULE's shared kseq. Intra-LLC is about an L2 refill. Cross-LLC is about an LLC-or-DRAM refill.
- Measure the weights on metal at bring-up or once per machine model. The bench is the oracle: Velten's Rome numbers show a ~3× intra- vs cross-CCX gap, but the Renoir-class bench is monolithic and may differ.
- This replaces magic constants like Linux's 500 µs and makes XNU Edge's "migrate if Δwait > edge weight" rule directly usable.

**Mutation by message, observation by published summary.** This is Ipanema's concurrency model, and it is the one that has been proved CWC.
- Each CPU owns its queue. All mutations go through its mailbox, which is what ToyOS already does.
- Each CPU *publishes* a tiny single-writer summary: running / idle-polling / parked, nr_queued, nr_stealable, and last-busy time for warmth.
- Others read it without locks. Publish so the value **errs in the safe direction**:
  - overestimate the load by at most one task, as Ipanema did;
  - set "I have stealable work" *before* checking for parked CPUs;
  - set "I am parked" *before* the final re-check for stealable work.
- That two-sided store-then-load handshake (with a fence) is what rules out "parked while work exists" without locks. It is the property to model-check.
- Mutations stay messages, so ToyOS's model is intact. Only observation becomes shared memory.

**Balancing scheme: receiver-initiated, locality-ordered, randomized stealing, plus event-driven push.**
- **Steal (idle CPU, in its own idle loop: no kernel threads needed).**
  - Escalate SMT sibling → LLC → other LLCs → machine, as ULE's `tdq_idled` does.
  - Within a level, pick the victim by **power of two choices** among CPUs whose summary shows stealable work, not "most loaded".
  - Reason: published loads are stale by message latency. Mitzenmacher proves least-loaded herding is the failure mode under stale information, while two choices is robust. p2dq and LAVD already do this.
  - Across LLCs, choose two random LLCs and take from the more loaded, as p2dq does.
  - The victim answers with up to half its surplus. Halving avoids the ping-pong and thundering herd LAVD documents, and private-deque work stealing supports steal-half. It gives its *least recently run* (coldest) tasks first. That is the cheap cost proxy behind Linux's `task_hot`.
- **Push (enqueuer).** When a CPU's queue gets a waiting task, it rings a parked CPU, nearest first by level, preferring a parked whole core and a warm one. This keeps ToyOS's existing push. Make the target choice two-choice too, to avoid several pushers ringing the same CPU (Nest's CAS claim and Ipanema's concurrent-unblock collisions show this happens). The rung CPU **pulls** (late binding, as in Sparrow). If the work is gone by then, it costs one failed steal, not a misplacement.
- **No periodic global balancer for work conservation.** WC is guaranteed by idle CPUs not parking while stealable work exists, plus push on enqueue.
- Fairness between *busy* CPUs (3 waiting on A, 0 waiting on B, both running) is a separate, slower concern: ULE's pairwise pass, LAVD's stealer/stealee budgets. Keep it out of the WC proof.

### 2. Can work conservation be a checkable invariant? Yes, in three tiers

**(a) A safety invariant over protocol states,** checkable at every step of a simulator or model checker. This is CWC translated to messages:

> For every CPU c parked idle (not polling, no outstanding steal request, no task in flight to c), no CPU holds a stealable queued task that it has not either (i) already pushed toward some parked CPU, or (ii) published in a summary that c re-read after parking.

The message-in-flight and mid-event exceptions are exactly Ipanema's U, B and E predicates.

**(b) A bounded-response property:** an idle CPU with stealable work anywhere runs a task within K protocol rounds.
- This is the Wasted Cores checker with M expressed in rounds instead of 100 ms. A simulator can check it with K as a function of tree depth.
- Ipanema did not prove liveness. Here it is cheap to check, because rounds are discrete.

**(c) A runtime monitor in the kernel.**
- A sampled check of the same predicate with a grace bound. ToyOS's "bounded by a timeout that fails loudly" principle fits Lozi's S/M design exactly.
- It runs on idle CPUs, so it is charged to idle time.
- A violation is a kernel bug: panic loudly in tests, or log in production. A proof is optional later: Ipanema needed about 1.3 person-years of Why3 work.

**Patience bounds.** Pure WC with zero patience is what made SIS_NODE lose hackbench by 34% on Zen 3. Give each level a **patience bound D(level) = its edge cost**: a queued task may wait at most D(level) before a CPU at that distance must take it. The invariant becomes: no stealable task waits longer than D(level) while a CPU within that level is idle. That is both checkable and the principled form of "run cold beats waiting". D(SMT) = D(LLC) ≈ 0. D(cross-LLC) is about a refill, tens of µs: still far below a slice.

### 3. Wake placement: home vs waker-affine vs idle-nearest

Proposed order:
1. **Home (prev CPU), if idle.** It is cache-hot with no migration. Linux, ULE, LAVD and Nest all do this first.
2. **A sync handoff to the waker's CPU, only if the waker is about to block.**
   - The waker's CPU is then effectively idle and hot for the shared data, and this avoids frequency inversion (Gouicem via Nest; LAVD's rule).
   - It needs an explicit signal, not a guess. In ToyOS, an IPC send-then-receive call is the signal: the kernel *knows* the waker is blocking.
   - **This is the one place where the message-passing IPC design gives better information than Linux's `WF_SYNC` hint.**
3. **An idle CPU near home**, preferring a whole idle core, then any idle CPU in home's LLC. Rotate the start point (Linux scans from target+1; ULE uses random tie-breaks) to avoid herding.
4. **An idle CPU near the waker's LLC, only for proven 1:1 partners**, and only when home's LLC has no idle CPU.
   - Linux's `wake_wide` flip test is the cheap detector.
   - Do **not** start with process-level LLC aggregation. It took Linux five RFC rounds and four limits (footprint, thread count, 50% overload, 20% imbalance). It was neutral on 8-CPU-CCX Milan and needed tolerance 100 on Genoa.
   - ToyOS's AMD bench has **4-core CCXs**, where over-aggregation saturates fastest.
5. **Any idle CPU anywhere, subject to the level's patience D.** This is the CWC requirement that Nest and Ipanema both added to CFS.
6. **None idle: queue at home.** Do not queue on the "globally least loaded" CPU from stale data. Let stealing correct it. Work stealing migrates nothing when everyone is busy.

ToyOS today wakes onto the last parked CPU unconditionally. That is step 1 + step 6 without steps 2–5, so a wakeup onto a busy home CPU waits until an idle CPU steals. Correctness then rests entirely on the steal path being prompt. That is the reason to add steps 3–5 even before the topology lands.

**Warm idle CPUs over long-idle ones (Nest).** Among equal candidates, prefer the idle CPU that was busy most recently.
- Nest measured +20–80% on configure-style fork storms on an **AMD 4650G**, a Zen 2 Renoir APU, the same class as the ToyOS AMD bench, and 10%–2× on Intel servers.
- This contradicts Wasted Cores' "longest idle" fix, which they enforced only with C-states disabled. ToyOS has C-states, so warm-first is right.
- The size of this effect depends on how ToyOS drives P-states and C-states. **Measure it on the benches before adopting nest-style compaction.**

### 4. SMT whole-core preference

- **Yes, for placing a new runner.** Linux (`select_idle_core` gated by `has_idle_cores`), ULE (SMT groups penalised when load > 1, idle-affinity check of all siblings) and LAVD (fully idle core first; cross-domain migration only to a fully idle core) all agree. Nest's Rodinia data shows the cost of stacking compute tasks on siblings.
- **No, for a sync partner.** The sibling shares L1 and L2, so it is the best home for a 1:1 partner, and migrating between siblings costs nothing (`task_hot` returns 0 at SMT).
- Steals from an SMT sibling should always be allowed and are the cheapest.
- **Mechanism.** Keep a per-LLC "has idle core" bit, set lazily on idle entry and cleared on a failed core search as in Linux. Being stale costs only a preference, never WC. Better still, keep a per-LLC idle-*core* bitmap derived from the published per-CPU idle bits, since ToyOS's LLCs are 4–8 cores.

### 5. Per-LLC summaries vs flat scans, 16 to 768 CPUs

**Current benches (8 and 16 CPUs).** A flat scan touches 8–16 published words.
- Upper bound if every word is a remote modified line: 16 × ~40–125 ns ≈ 0.6–2 µs if serialised. Memory-level parallelism makes it less.
- At this size a flat scan is fine, and Ipanema's flat CWC balancer was competitive even at 160 threads.
- Cost is not the reason to change the scan. Two reasons are: (i) it is **blind** to SMT and LLC, so it picks the wrong idle CPU; (ii) a dense-id scan always starts at CPU 0, which herds placements onto the low ids.

**768 CPUs.** For example, two sockets × 192 Zen 5c cores × 2 SMT, with 16-core CCXs giving about 48 LLCs. That example machine is my recollection of AMD's specs, unverified.
- A flat scan of 768 published words on every wake is about tens of µs of serial misses in the worst case. That is unacceptable on a wake path.
- A single global idle bitmap becomes a cross-socket hot line. That is the sched_ext per-node motivation, though the measured gain there was small (2–2.5%).

**Recommendation: a two-level summary, built so its error can only cost locality, never conservation.**
- Per LLC: bitmaps of idle CPUs, idle cores and CPUs with stealable work. Each is one or two words for an LLC of 32 threads or fewer. They bounce only inside the LLC, where a line transfer is about 37 ns on Rome versus over 100 ns across.
- Per machine: one bit per LLC for "has an idle CPU" and one for "has stealable work". These are 1–2 words at 48–96 LLCs. They change only on an LLC's first or last transition, so they are rate-limited by aggregation.
- Summaries hold **existence and minimum** (has-idle, has-stealable), never **averages**. Group Imbalance was an average hiding an idle CPU.
- A summary bit that is stale-false may delay a steal by one round. That is covered by the K-round bound, plus a periodic slow full scan as a fallback in the idle loop.
- Scan within an LLC with a rotating start. SIS_UTIL's utilisation-bounded scan length is unnecessary when the per-LLC idle bitmap answers in one word.
- This design scales from 16 to 768 without changing shape. At 16 CPUs the machine level has 1–2 bits.

### 6. What a simulator must model: shape for correctness, minimal cost for policy, metal for verdicts

**Shape, which is mandatory and sufficient for correctness.**
- Topology trees: Intel 4×2 single LLC; AMD 2 CCX × 4 × 2; synthetic big shapes up to 768 with 16-thread CCXs and multiple packages.
- Affinity masks.
- **CPU hotplug and topology rebuild** (Missing Scheduling Domains).
- Message delivery with **adversarial or seeded-random delays and reordering per channel**, IPI loss-free but late.
- Events racing: block, unblock, spawn, exit, steal requests, pushes.
- Stale reads of the published summaries, under a weak memory model for the publish/park handshake.
- Run the **same Rust scheduler core** the kernel runs, driven by a deterministic event loop, as LinSched and Enoki do. Enoki's record/replay is the way to feed real traces back into it.

**Workloads.**
- Fork storms (configure-style, Nest's best case).
- Barrier-synchronised N = ncpu (NAS-style: Wasted Cores' and Ipanema's worst cases).
- 1:1 ping-pong pairs.
- M:N servers (`wake_wide` territory).
- Mixed priorities.
- One CPU hog plus many short tasks (ULE's reason for push).

**Checks.** I1–I8 above, at every step; small configurations checked exhaustively, large ones randomised.

**Counts, not times.** Migrations per level, wakes placed per level, failed steals, IPIs, rounds-to-run, and idle-while-queued in rounds. These are host-testable regressions.

**Cost model: only the per-level edge weights and patience bounds as parameters.**
- Used to unit-test that policy decisions follow the stated rule (migrate iff Δwait > edge cost).
- **Never to predict performance.** Frequency, turbo, C-state exit and real cache refill do not simulate credibly (Nest's whole result is frequency), and ToyOS's rule is that timing verdicts come only from metal.

**Metal.** Measure the edge weights: core-to-core line transfer per level and IPI round trip per level, on both benches. Then make the A/B performance calls: warm-first vs not, cross-LLC patience values, whole-core preference.

### Net position

- Keep the level tree with CPU keys, and the nearest-first ordering. The previous proposal got that part right.
- Add:
  - (1) a stated, monitored work-conservation invariant in message-passing CWC form, with per-level patience;
  - (2) edge weights in time units, measured on metal;
  - (3) two-choice randomized victim and target selection to survive stale summaries;
  - (4) single-writer published summaries in Ipanema's model, with two-level existence/min bitmaps;
  - (5) a sync-handoff wake rule driven by ToyOS's IPC semantics;
  - (6) warm-first idle choice, to be measured;
  - (7) a deterministic simulator running the real scheduler core against the invariants.
- Defer process-level LLC aggregation and nest-style compaction until the benches show the gain: both have documented regressions and small-CCX hazards.

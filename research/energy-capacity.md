# Energy- and capacity-aware placement, hybrid cores, frequency — research notes

Scheduler design round, ToyOS. Research only; no code, no repository touched.

Tags: **[MEASURED]** the source ran it and reports numbers; **[PROVED]** formal proof; **[CLAIMED]** the source asserts it (spec, docs, cover letter); **[INFERENCE]** mine. "(snippet)" marks a fact taken from a search-result excerpt of the page, not a full read.

Access gaps: uefi.org returned HTTP 403 to both WebFetch and curl, so the ACPI 6.5 text was not read directly. ACPI facts below come from kernel docs and patches that quote it. The Intel SDM (one large PDF) was not read; HFI/ITD register facts come from kernel patches and from the Saez & Prieto-Matias paper, which cites the SDM.

---

## 1. Intel hybrid: CPUID 0x1A, HFI, Thread Director

**Core type (CPUID leaf 0x1A).**
- Leaf 0x1A `CORE_TYPE` is enumerated on P+E, P-only and E-only parts. Linux did not use it until a 2024 series added it, because hybrid parts share family/model/stepping. Encodings: 0x20 = Atom (E-core), 0x40 = Core (P-core). [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2406.2/00842.html (snippet)
- The "native model ID" in the same leaf is not unique across core types. On ARL-H there are two different Atom microarchitectures, so core type alone cannot tell them apart. [CLAIMED] https://lkml.rescloud.iu.edu/2410.2/07568.html (snippet)
- Leaves 1, 4, 0x0B, 0x1A and 0x1F vary by core, so they must be read on each logical CPU. [CLAIMED] https://github.com/pytorch/cpuinfo/pull/350 (snippet)

**Hardware Feedback Interface (HFI).**
- HFI "provides a performance and energy efficiency capability information for each CPU in the system". Depending on the model, hardware updates it periodically "as a result of changes in the operating conditions (e.g., power limits or thermal constraints)", or sends "a single HFI update at boot". [CLAIMED] https://github.com/torvalds/linux/blob/master/drivers/thermal/intel/intel_hfi.c
- Mechanism, from the driver code [CLAIMED, same URL]:
  - The table lives in OS memory: its physical address is written to `MSR_IA32_HW_FEEDBACK_PTR`, and the interface is enabled through `MSR_IA32_HW_FEEDBACK_CONFIG`.
  - CPUID.06H:EDX gives the capability bitmap (performance, energy-efficiency), the table size (`table_pages + 1` pages) and this CPU's row index.
  - The table is a u64 timestamp, a header of per-capability "updated" bytes, then 8-byte rows of u8 `perf_cap` and `ee_cap`. Rows are indexed by the per-CPU index, and CPUs may share a row.
  - Updates arrive through the package thermal interrupt with an `HFI_UPDATED` status bit. Linux copies the table, drops duplicates by timestamp, and relays the values to userspace through thermal netlink after a 100 ms delayed work item (values shifted to 0–1023).
- Mainline Linux uses HFI only to inform userspace. The scheduler does not consume it. [CLAIMED, same URL]

**Intel Thread Director (ITD).**
- ITD "extends the HFI to provide performance and energy efficiency data for advanced classes of instructions". The capabilities are "unitless and specific to each HFI class". Classes are contiguous in memory, with one header per class. [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2306.1/05728.html
- The class count comes from CPUID.06H:ECX[15:8] (`nr_classes`, named `hw_feedback_nclasses` in x86-cpuid-db). ITD "adds 4 classes in HFI table". [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2402.0/03370.html (snippet)
- MSRs: `IA32_THREAD_FEEDBACK_CHAR` (0x17D2) reports the running thread's class and `IA32_HW_FEEDBACK_THREAD_CONFIG` is 0x17D4. HRESET resets the classification history at context switch. [CLAIMED] same series (snippet); https://lkml.rescloud.iu.edu/2306.1/05717.html
- Register semantics, per Saez & Prieto-Matias citing the SDM:
  - The class ID is in the low byte of `IA32_THREAD_FEEDBACK_CHAR` and is valid only when bit 63 is 1. The OS "must use the last valid class ID" otherwise.
  - On the i9-12900K the table has ten 8-byte entries: one per P-core, and one shared by each 4-E-core cluster.
  - Pe and Ef values range 0–255.
  - [CLAIMED by source] https://docta.ucm.es/entities/publication/39718b81-76c7-4f07-8532-338c120ab67c (DOI 10.1145/3546591.3547532)

**Linux status of ITD scheduling ("IPC classes").**
- History: RFC September 2022 → v4 June 2023 (24 patches) → a 9-patch re-send in February 2024. A March 2024 LKML post asks why it is "still not merged". I found no merge. [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2209.1/03079.html, https://lkml.rescloud.iu.edu/2306.1/05717.html, https://lkml.rescloud.iu.edu/2403.1/02325.html
- Design: the class only breaks ties ("used to break ties between two otherwise identical scheduling groups") on top of asym_packing. No cover letter contains a single measurement. [CLAIMED] the same RFC and v4 cover letters.
- Reliability caveats, from the v3 21/24 review [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2304.0/01412.html:
  - "In Alder Lake and Raptor Lake, the result of thread classification is more accurate when only one SMT sibling is busy."
  - A task's class is updated only after it has been stable for 4 consecutive user ticks.
  - Rafael Wysocki: "Is it really the role of the thermal HFI driver to implement a task classification algorithm?"
  - Neri: "we may even need different filters and debouncers for different models."
- LWN's summary of the maintainers' view [CLAIMED] https://lwn.net/Articles/909611/:
  - Energy-aware heuristics "don't work well" on Alder Lake because of SMT, turbo and internal power management.
  - "For many workloads, running on an ostensibly more power-hungry Pcore can be more efficient than using an Ecore." No numbers are given.

**Measured accuracy of ITD.** Saez & Prieto-Matias 2022, i9-12900K (8 Golden Cove + 8 Gracemont), Linux 5.16, SPEC CPU2006/2017 [MEASURED by source] https://docta.ucm.es/entities/publication/39718b81-76c7-4f07-8532-338c120ab67c:
- On E-cores the class is always invalid; a usable class comes back only on P-cores.
- TD gives a fixed big/small speedup factor (SF) per class: 1.67, 1.97, 2.62 and 1.31. 99.9% of readings were class 0 or 1, and class 3 was never seen.
- TD's SF prediction has a mean absolute error of 0.38 and a correlation "<0.1" with the measured SF.
- PMC-based models built with machine learning reach correlation 0.8 (big core) and 0.84 (small core), MAE 0.19 and 0.13.
- Scheduler results against an asymmetry-aware round-robin baseline:

  | Scheduler | Throughput change | Other result |
  |---|---|---|
  | TO with TD | about +1% average, 9.3% maximum | — |
  | TO with PMC model | +20.6% average, up to +29.2% | — |
  | ACFS with PMC model | +10.4% average | up to 15.8% less unfairness |

- Stock CFS showed run-to-run completion-time variation "up to 2.3x" for the same workload.

**Other measured ITD results.**
- Windows 11 guest on i9-13900K with virtual HFI/ITD: "up to 14%+" on one 3DMark CPU subtest. Several table cells are negative (−22.6% on CPU Profile, 8 threads, in one configuration). The authors add that exposing ITD without hybrid topology and affinity "won't hurt performance, but would also not get any performance improvement". [MEASURED by source] https://lkml.iu.edu/hypermail/linux/kernel/2402.0/03349.html
- E-Mapper on i9-13900K, ITD-only allocation against CFS (above 1 is better) [MEASURED by source] https://arxiv.org/html/2406.18980v1:

  | Scenario | Execution time | Energy |
  |---|---|---|
  | Single application | 1.01x | 1.04x |
  | Multiple applications | 0.95x | 0.98x |

  ITD misclassified some threads (alexnet).

**Linux capacity on Intel hybrid (merged path).** Wysocki 2024 [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2408.1/04351.html, https://lkml.rescloud.iu.edu/2408.3/05034.html:
- Each CPU's capacity is set from `HWP_HIGHEST_PERF` (`MSR_HWP_CAPABILITIES`) relative to the largest value, which the commit calls "a rough approximation, but it is as good as it gets".
- It applies only on hybrid systems *without SMT*: "the capacity of SMT threads is not deterministic even approximately". It replaces ITMT because ITMT "may get in the way of asymmetric CPU capacity code".
- Capacity is runtime-variable. It is recomputed on HWP interrupts, ACPI notifications, CPU hotplug and `no_turbo` changes, and all CPUs are recomputed when the top CPU drops.

**Linux EAS on Intel hybrid without SMT.**
- Design [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2503.0/11638.html:
  - The premise is Lunar Lake: E-cores "when run at the same performance level, are always more energy-efficient" than P-cores.
  - Perf domains are registered *per CPU*. Cost = a CPU-type component plus "a small component proportional to performance" to balance load within a type, because an earlier per-type version migrated too much "between CPUs of the same type".
- Merged for Linux 6.16. [CLAIMED by secondary] https://www.phoronix.com/news/Linux-6.16-Power-Management
- Christian Loehle (Arm) measured it on a Raptor Lake machine booted `nosmt`, against capacity-aware scheduling [MEASURED by source] https://lkml.rescloud.iu.edu/2504.2/04100.html:

  | Workload | Energy with EAS |
  |---|---|
  | Firefox YouTube 4K playback | −26.4% |
  | Firefox WebGL Aquarium (500 fish) | −24.2% |

  He reported no performance numbers.

## 2. AMD: preferred cores, CPPC, heterogeneous Zen 5 / 5c, amd_hfi

**amd-pstate** [CLAIMED] https://docs.kernel.org/admin-guide/pm/amd-pstate.html:
- It uses the CPPC capability registers Highest, Nominal, Lowest Non-linear and Lowest, and the request registers Min, Max, Desired and EPP.
- These are MSRs on some Zen 3 and later parts. Otherwise they are ACPI shared memory reached through `cppc_acpi` (which means `_CPC`, an AML object).
- **Preferred core**: process variation means "a fraction of cores can reach maximum frequency". The per-core CPPC highest-perf value ranks cores at boot. Rankings "can dynamically change based on the workload, platform conditions, thermals and ageing", and a highest-performance-change notification re-ranks them.
- "On some ASICs, the highest CPPC performance is not the one in the `_CPC` table."
- Modes: active (EPP, firmware autonomous), passive (OS writes Desired) and guided (OS sets the min/max window and the platform picks within it).

**AMD heterogeneous cores and HFI** [CLAIMED] https://docs.kernel.org/arch/x86/amd-hfi.html:
- Topology: "performance-oriented *classic cores* and power-efficient *dense cores*", and the design "can also extend to more than two architectural classes".
- Classes: 0 Default (performant), 1 Non-scalable (efficient) and 2 I/O-bound (efficient).
- "Thread classification is performed by the hardware each time that the thread is switched out." The class is read from a logical-processor-scope MSR at switch-out, and the OS then writes an MSR to clear history before switching the next thread in.
- Ranking table: per-CPU performance and efficiency capability, each "a unit-less quantity in the range [0-255]", in PCCT shared memory. A zero means the hardware recommends not scheduling that kind of work on that CPU.
- Firmware updates the table on thermal stress, silent mode or low battery, "on the order of seconds or more", and raises a platform interrupt.
- Driver status (v11 series, June 2025): CPU selection from the ranking table "is not currently done in this series, but is intended for future follow ups". The series only sets ITMT priority from the ranking data. [CLAIMED] https://lkml.rescloud.iu.edu/2506.3/09670.html
- It reportedly merged in July 2025. [CLAIMED by secondary] https://code.amethyst.name/public-mirrors/linux/commits/branch/master/drivers/platform?page=2 (snippet)
- I found no published measurement of AMD workload classification. [INFERENCE: absence of evidence in this search]

## 3. ACPI: CPPC, MADT GICC efficiency class, PPTT

**CPPC (`_CPC`, ACPI §8.4.6)** [CLAIMED] https://docs.kernel.org/admin-guide/acpi/cppc_sysfs.html:
- Performance is "a contiguous and abstract performance scale".
- Capability fields:
  - highest_perf: peak.
  - nominal_perf: "highest sustained".
  - lowest_nonlinear_perf: the lowest level with nonlinear power savings.
  - lowest_perf.
  - reference_perf: the level at which the reference counter ticks.
- Delivered performance = reference_perf × Δdelivered / Δreference, from the feedback counters.
- nominal_freq and lowest_freq "should not be used for any functional decisions".
- `_CPC` is an AML package, so the OS needs an AML interpreter to read it. The x86 MSR paths (Intel HWP_CAPABILITIES, AMD CPPC MSRs) avoid that. [INFERENCE, from the amd-pstate doc's MSR vs shared-memory split]

**MADT GICC "Processor Power Efficiency Class"** [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2204.0/10983.html:
- Added in ACPI 6.0, specified in ACPI 6.4 §5.2.12.14.
- "Describes the relative power efficiency of the associated processor. Lower efficiency class numbers are more efficient than higher ones … absolute values of this number have no meaning."
- Linux (arm64 only) packs the used values into [0..N−1], needs at least 2 distinct classes, and builds an *artificial* Energy Model from them in cppc_cpufreq.
- This is the only standard, static (no-AML) efficiency fact on Arm ACPI systems. [INFERENCE]

**PPTT (ACPI 6.2+)** [CLAIMED] https://ayakael.net/forge/linux-uconsole/commit/2bd00bcd73e5 (snippet), https://grok.dragonflybsd.org/xref/linux/drivers/acpi/pptt.c?r=44f57d78 (snippet):
- It "describes how processing units are related to each other in tree like fashion": package, cluster, core and thread nodes with unique IDs, each with attached cache structures (level, type, size, sets, associativity, and a cache ID in the v1 structure).
- The "processor is a thread" and "identical implementation" flags were added in ACPI 6.3.
- PPTT is the portable source of LLC and cluster keys on Arm. On x86, CPUID 4/0x1F/0x8000001D give the same facts. [INFERENCE]

**Windows uses efficiency classes as a first-class axis**: its processor power settings with a "1" suffix apply to "efficiency class 1 cores". [CLAIMED] https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options

**Idle-state latency from firmware is unreliable.**
- Linux intel_idle ships hard-coded per-model C-state tables and uses ACPI `_CST` only for some models or when forced. [CLAIMED] https://github.com/torvalds/linux/blob/master/drivers/idle/intel_idle.c
- On Zen 2, C2 measured 20–25 µs against "400 µs" reported to the OS. [MEASURED by source] https://arxiv.org/abs/2108.00808

## 4. Arm: big.LITTLE / DynamIQ, capacity-dmips-mhz, SCMI, Energy Model

**capacity-dmips-mhz** [CLAIMED] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-capacity.txt:
- It is Dhrystone DMIPS/MHz, normalized to the best CPU. The OS multiplies it by each CPU's max frequency and renormalizes to 1024. Example: 1024 and 578 DMIPS/MHz at 1100 and 850 MHz give capacities 1024 and 446.
- "Makes no guarantees on the validity or suitability of any particular benchmark."
- All-or-nothing: if any CPU node lacks the property, every CPU falls back to default capacity.

**Energy Model framework** [CLAIMED] https://docs.kernel.org/power/energy-model.html:
- Each perf domain holds an ascending table of {performance, frequency, power, cost = 10·power·f_max/f, flags (inefficient)}.
- Power is in µW or in an "abstract scale". With an abstract scale, "deriving real energy in micro-Joules would not be possible".
- An "artificial EM" can be registered without real power data.
- The table can be modified at runtime through an RCU swap.
- "All CPUs in a performance domain must share the same micro-architecture." The simple C·V²·f model "might not reflect correctly the physics" when leakage matters.

**SCMI performance domains**: each domain describes levels as {level, power cost, latency}, with a flag saying whether power is in mW. [CLAIMED by implementations] https://qemu.googlesource.com/edk2/+/07c0c2eb0a5970db614ebce1060fc79d6904bdfd/ArmPkg/Include/Protocol/ArmScmiPerformanceProtocol.h (snippet), https://cos.googlesource.com/third_party/kernel/+/67cb016870e2fa9ffc8d34cf20db5331e6f2cf4d/drivers/firmware/arm_scmi/perf.c (snippet). The DEN0056 spec was not read.

**Frequency invariance on arm64** comes from the ARMv8.4 AMU counters. On x86 it comes from APERF/MPERF. [CLAIMED] https://docs.kernel.org/scheduler/schedutil.html

**DynamIQ** places cores of different types in one cluster sharing an L3. So "cluster", "LLC" and "perf domain" are three different keys, and a perf domain can be a single CPU. [INFERENCE: general knowledge, not fetched this round; consistent with the per-CPU perf domains Linux registers for Intel hybrid above]

## 5. Linux EAS and its supporting signals

**Mechanism** [CLAIMED] https://docs.kernel.org/scheduler/sched-energy.html:
- At wakeup, `find_energy_efficient_cpu()` takes, in each perf domain, the CPU with the most spare capacity (the lowest resulting OPP). It estimates the energy of every candidate and of the previous CPU with `em_cpu_energy()` and picks the minimum.
- A small task can belong on a big CPU when raising the little domain's OPP would cost more.
- Requirements:
  - `SD_ASYM_CPUCAPACITY_FULL` must be set: "EAS does not support platforms with symmetric CPU topologies".
  - An Energy Model must be registered.
  - schedutil is the only supported governor.
  - Signals must be scale-invariant in both frequency and CPU.
- **Overutilized fallback**: once any CPU passes 80% of its capacity (RT, DL and IRQ time included), the whole root domain drops EAS and returns to load balancing. Below that, load balancing is disabled.
- SMT is not supported: treating hardware threads as independent CPUs "can actually be counter-productive for both performance and energy".
- "no significant savings on SMP platforms have been observed yet."

**Complexity limit history.** The arbitrary `EM_MAX_COMPLEXITY = 2048` gate (nr_pd × (nr_cpus + nr_ps)) was removed in October 2023. Only `EM_MAX_NUM_CPUS` remains, as overflow protection. [CLAIMED] https://lkml.iu.edu/hypermail/linux/kernel/2310.1/01062.html, https://lkml.iu.edu/hypermail/linux/kernel/2210.3/08527.html

**Capacity model** [CLAIMED] https://docs.kernel.org/scheduler/sched-capacity.html:
- Original capacity is the maximum attainable; capacity is that minus IRQ and RT pressure.
- Fitness criterion: task_util < capacity.
- Misfit tasks are pulled to bigger CPUs by active balance.
- RT uses uclamp_min ≤ capacity and DL uses bandwidth < capacity, each with a fallback.
- Representing performance by one number per CPU is "somewhat of a contentious point" because relative performance varies by workload. Linux "cannot currently figure out CPU capacity on its own".

**Signals** [CLAIMED] https://docs.kernel.org/scheduler/schedutil.html:
- PELT: 1024 µs periods decayed so that y^32 = 0.5 (a 32 ms half-life).
- util_est: "instantly increase and only decay on decrease", which avoids the DVFS ramp-up after sleep.
- uclamp: per-task and runqueue-max min/max clamps.
- schedutil: f = min(f_max, 1.25·u·f_max).
- Limits: it "assumes a linear relation between frequency and work capacity", rate-limiting "reduces effectiveness", and IO-wait boost is an "XXX" placeholder.

**Measured results, EAS v6 merge series** (Perret, Rasmussen; Linux 4.18-rc5; rt-app 10–50 periodic tasks, 16 ms period, 5% duty cycle) [MEASURED by source] https://lkml.rescloud.iu.edu/1808.2/01832.html:

| Measurement | Result with EAS |
|---|---|
| Energy, Hikey960 (4×A73 + 4×A53; ACME cape: CPUs, LPDDR, GPU) | −4.3% to −20.4% |
| Energy, Juno r0 (on-board CPU energy meters) | −3.4% to −31.0% |
| perf-bench messaging, worst case (Hikey960, 1 group) | +2.31% |

- The v2 RFC showed +21.24% on that hackbench case. [MEASURED by source] https://lwn.net/Articles/749738/ (snippet)
- Workloads were synthetic and periodic. No app-level Android data appears in the upstream record. [INFERENCE]

## 6. XNU Edge + CLPC; Windows QoS / ITD

**XNU Edge scheduler** [CLAIMED] https://github.com/apple-oss-distributions/xnu/blob/main/doc/scheduler/sched_clutch_edge.md:
- Clusters are nodes in a directed graph, with one graph *per QoS*. Each edge carries `sce_migration_allowed`, `sce_steal_allowed` and `sce_migration_weight`, "a measure of the scheduling latency delta that should exist between the source and destination nodes". The performance controller retunes edges at runtime.
- "The scheduler expects the performance controller to specify a cluster recommendation for each thread group", optionally per QoS. A changed recommendation migrates threads immediately.
- Spill happens when the preferred cluster is busy with equal or higher QoS. Clusters are tried "homogeneous clusters before asymmetric clusters". Steal order prefers foreign threads first.
- Cluster load metric = higher-QoS load × average execution latency (EWMA).
- "stir-the-pot" rotates long-running threads across core types at quantum expiry, so threads make roughly equal progress.
- Shared-resource threads use RR or NATIVE_FIRST policies.

**CLPC** (Apple patent US10599481B2, priority 2017-06-04) [CLAIMED] https://patents.google.com/patent/US10599481B2/en:
- It tracks per-thread-group work-interval utilization, I/O rate, utilization, scheduling latency and cluster residency.
- Each metric feeds a controller, giving a "unitless control effort … 0 … 1". A performance map turns that into a recommended core type and DVFS state.
- Per-cluster DVFS is the maximum over active groups, capped by a thermal limiter.

**Apple developer guidance** [CLAIMED] https://developer.apple.com/documentation/apple-silicon/tuning-your-code-s-performance-for-apple-silicon:
- QoS drives core-type choice: "the system is more likely to run background tasks on lower performance cores".
- Eliminate spin-waits and `pthread_yield_np`.
- Split parallel loops into at least 3× the core count, because "a static distribution" leaves fast cores idle.

**Windows** [CLAIMED] https://learn.microsoft.com/en-us/windows/win32/procthread/quality-of-service:
- QoS is not priority: "QoS can influence core selection and processor power management. On platforms with heterogeneous processors, the QoS of a thread may restrict scheduling to a subset of processors, or indicate a preference".
- Levels:

  | Level | Behaviour |
  |---|---|
  | High | focus or audible |
  | Medium | visible but not in focus |
  | Low, Utility | on battery: most efficient frequency and efficient cores |
  | Eco | *always* efficient frequency and efficient cores |
  | Media, Deadline | tagged by the Multimedia Class Scheduler Service |

- When a thread is not explicitly tagged, QoS is inferred from window visibility, audio and thread priority.
- Hetero policy knobs: `SchedulingPolicy` and `ShortSchedulingPolicy`, each with values all, performant, prefer-performant, efficient, prefer-efficient or automatic. Short and long threads are separated by a runtime threshold, and `Long/ShortThreadArchClass{Lower,Upper}Threshold` bound the "normalized architectural class" a thread may use. Each QoS level has its own frequency and EPP settings, and efficiency class 1 has its own variants. [CLAIMED] https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/configuration-for-hetero-power-scheduling-schedulingpolicy, https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/configuration-for-hetero-power-scheduling-longthreadarchclassupperthreshold, https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options
- EcoQoS: Windows "will try to increase power efficiency through strategies such as reducing CPU frequency or using more power efficient cores". [CLAIMED] https://learn.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadinformation (snippet), https://devblogs.microsoft.com/sustainable-software/introducing-ecoqos/ (snippet)
- Windows' kernel implementation is proprietary and unmeasured in the open literature (Saez notes this). [CLAIMED] https://docta.ucm.es/entities/publication/39718b81-76c7-4f07-8532-338c120ab67c

## 7. Academic work 2015–2026 (asymmetric and energy-aware)

**Speedup-factor (SF) line.**
- The scheduler should use each thread's big-to-small speedup.
- Bias scheduling (Koufaty et al., EuroSys 2010) and PIE (Van Craeynest et al., ISCA 2012) are the foundations.
- ACFS (Saez et al., JPDC 2017) adds `amp_vruntime` progress accounting weighted by core performance × SF. It is the fairness analogue of vruntime for asymmetric machines, directly relevant to ToyOS's vruntime band. [CLAIMED; cited in] https://docta.ucm.es/entities/publication/39718b81-76c7-4f07-8532-338c120ab67c
- The 2022 TD evaluation (§1) [MEASURED]:
  - Hardware SF hints are far less accurate than PMC models (correlation <0.1 against 0.8).
  - Throughput and fairness "are often conflicting optimization objectives on AMPs".
  - "enforcing fairness requires SF prediction models with a higher degree of accuracy."

**Other results.**
- **COLAB** (Yu et al., CGO 2020): a multi-factor scheduler combining SF, bottleneck threads and fair share, evaluated in **gem5** on 4 big.LITTLE configurations with 26 PARSEC/SPLASH-2 mixes. Up to +25% against CFS and AMP-aware schedulers, 5–15% on average. [MEASURED by source, simulator] https://research-repository.st-andrews.ac.uk/handle/10023/19514
- **E-Mapper** (2024): a *user-space* resource manager, a central daemon plus a per-app library over Unix sockets. It places work by CPU affinity and tells OpenMP, TBB and TF-Lite runtimes how many threads to run. Inputs are per-app operating points (resources per core type, utility, power). Factors against CFS (above 1 is better) [MEASURED by source] https://arxiv.org/html/2406.18980v1:

  | Platform | Scenario | Time | Energy |
  |---|---|---|---|
  | i9-13900K | single app | 1.11x | 1.57x |
  | i9-13900K | multi app | 1.62x | 1.81x |
  | Odroid XU3, against EAS | single app | 1.07x | 1.27x |
  | Odroid XU3, against EAS | multi app | 1.20x | 1.38x |

  Energy came from RAPL with a *static* P/E power coefficient, and no external meter was used. Some cases regressed.
- **HARP** (Middleware 2025, TU Dresden): Linux-integrated, two-way app ↔ resource-manager interface. −12% execution time and −28% energy against existing methods on two heterogeneous systems, with Raptor Lake against CFS and ITD among them. [CLAIMED by abstract; full text 403] https://fis.tu-dresden.de/portal/en/publications/harp(41d29a82-93d6-49e6-a401-b2a921548edb).html
- **Nest** (EuroSys 2022) and **Smove** (ATC 2020): see §8.

## 8. Frequency effects on placement: turbo, warm cores, idle exit

**Turbo depends on active-core count.** Intel Xeon turbo by active cores per socket [CLAIMED by source, vendor tables] https://hal.science/hal-03612592/document:

| Part | 1–2 active | 9–12 active | 13–16 active |
|---|---|---|---|
| Xeon Gold 6130 | 3.7 GHz | 3.1 GHz | 2.8 GHz |
| Xeon Gold 5218 | 3.9 GHz | 3.1 GHz | 2.8 GHz |

The hardware picks frequency inside OS bounds "according to the number of cores on the same socket and their current degree of activity".

**Frequency inversion (Smove, ATC 2020).** CFS places a forked or woken child on an idle low-frequency core while the parent's high-frequency core goes idle. Ramping takes "dozens to hundreds of milliseconds". Smove: >5% better on 23 of 60 applications on an 80-core Xeon, >5% worse on 3, up to +56% on a 4-core AMD Ryzen. [MEASURED by source, abstract] https://www.usenix.org/conference/atc20/presentation/gouicern

**Nest (EuroSys 2022)** [MEASURED by source] https://hal.science/hal-03612592/document:
- Mechanism:
  - A primary nest of recently used cores and a reserve nest (Rmax 5).
  - A core is compacted out of the primary nest after 2 ticks (8 ms) unused.
  - A task that fails twice to get its core is marked "impatient", which grows the nest.
  - The idle loop spins up to 2 ticks (Smax) to keep a core warm, stopping if the SMT sibling gets work.
  - At most one placement per runqueue, enforced by compare-and-swap.
- Results:
  - +10% to 2× for workloads with fewer tasks than cores.
  - Up to 19–20% less CPU energy (turbostat/RAPL) on software-configure workloads.
  - Neutral (±5%) on fully parallel NAS.
  - AMD Ryzen 5 PRO 4650G: +20–80% on configure benchmarks.
  - Ablation: removing the spin loses 10–21% on 2-socket and 17–26% on 4-socket machines.
- **Regression**: hackbench (message-passing) rose from 22.5 s to "sometimes 76 seconds" or more.

**AMD Zen 2 measured** (dual EPYC 7502; server, not desktop Ryzen) [MEASURED by source] https://arxiv.org/abs/2108.00808, https://ar5iv.labs.arxiv.org/html/2108.00808:
- Idle-state exit: C1 about 1 µs; C2 20–25 µs against 400 µs reported to the OS.
- "package C-states are not used as long as a single core … is active". One thread in C1 instead of C2 adds **81.2 W** at system level.
- Marginal power per core: about 0.09 W per extra C1 core, and about 0.33 W per extra active core in a pause loop (against about 3.5 W per core cited for Skylake).
- Frequency: transitions take about 360–390 µs with a 1 ms update granularity, and the L3 clock follows the fastest core in the CCX.
- RAPL is "modeled, not measured". It misses data-dependent power that the external AC meter saw (21 W, 7.6%).

**Intel idle-state exit latencies** (µs, from Linux intel_idle per-model tables, worst case) [CLAIMED by source] https://github.com/torvalds/linux/blob/master/drivers/idle/intel_idle.c (units per https://github.com/torvalds/linux/blob/master/include/linux/cpuidle.h):

| Model | C1E | C6 | C10 |
|---|---|---|---|
| ADL-L | 2 | 170 | 230 |
| MTL-L | 1 | 140 | 310 |
| Gracemont table | — | 195 | 660 |
| SPR | — | 290 | — |
| SKX | 10 | 133 | — |

**Waking an idle core vs the busy core's SMT sibling.**
- A sibling of a busy core is already in C0, so it has near-zero exit latency, but it shares the pipeline.
- A fully idle core may be in C6 (100–300 µs exit on current Intel) and at low frequency (frequency inversion).
- The trade-off depends on how long the task runs. [INFERENCE from the rows above]

**Spread or pack.**
- EAS: no significant savings on SMP. [CLAIMED] https://docs.kernel.org/scheduler/sched-energy.html
- Nest and Smove: on turbo machines, packing onto *warm* cores within one LLC wins for bursty fork/wake workloads, and spreading wins for fully parallel ones. [MEASURED by sources]
- Windows: a core-parking engine "determines the optimum set of compute cores". [CLAIMED] https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options

## 9. Kernel facts vs userland policy; verification

**What every system reads, by source.**
- Static topology: x86 CPUID 0x1A, 0x1F and 4; ACPI MADT, PPTT and GICC efficiency class.
- Capacity: Intel HWP_HIGHEST_PERF; AMD CPPC highest_perf; Arm `_CPC` or capacity-dmips-mhz.
- Energy: an Energy Model (real or artificial).
- Dynamic hardware feedback: Intel HFI/ITD table plus thermal interrupt; AMD ranking table plus platform interrupt; CPPC highest-perf-change notification.
- Idle states: vendor tables or `_CST`/`_LPI`.

**Who consumes it today.**
- Linux puts capacity and the Energy Model in the kernel and leaves HFI to userspace.
- Apple puts the performance controller (CLPC) beside the scheduler and has the scheduler obey its per-thread-group recommendations.
- Windows splits it into a kernel PPM with QoS-indexed, provisionable policy.

All [CLAIMED] in the sources above.

**Verification practice in the literature.**
- Energy:
  - On-board meters or an instrumented board (EAS on Juno and Hikey960).
  - turbostat/RAPL (Nest).
  - RAPL with a static P/E split (E-Mapper).
  - External AC meter against RAPL (Zen 2 paper).
- RAPL is regarded as giving "accurate energy readings" on Intel, with caveats: non-atomic updates, wraparound and no timestamps. [CLAIMED] https://helda.helsinki.fi/server/api/core/bitstreams/bdc6c9a5-74d4-494b-ae83-860625a665ce/content (snippet)
- Haswell RAPL "match[es] overall energy and power trends, usually by a constant power offset". [MEASURED by source] https://web.eece.maine.edu/~vweaver/projects/rapl/2016_memsys_rapl.pdf (snippet)
- Zen 2 RAPL is modeled. [MEASURED] https://arxiv.org/abs/2108.00808
- Workloads: rt-app synthetic periodic tasks (EAS) and SPEC multi-program mixes run until the slowest finishes three times (Saez). Run-to-run variance is large: up to 2.3× under CFS, and EAS reports RSD per row.

---

## Merits for ToyOS (all [INFERENCE — mine])

### A. The capacity model the topology design must carry from day one

**One immutable boot record per logical CPU, and one mutable published record per CPU.** Everything below is a *fact*, not policy.

The immutable record, filled at boot from CPUID, MADT, PPTT and GICC:
- `cpu` id, plus the keys `smt_core`, `llc`, `cluster` (PPTT or CPUID 0x1F module), `package` and `numa`.
- `core_kind`: an opaque vendor class (Intel 0x1A type plus native model ID, AMD classic/dense, Arm MIDR part). Placement code never matches on it. It exists so two CPUs can be called "same kind".
- `perf_domain`: the set of CPUs sharing one DVFS clock. It may be one CPU (Intel hybrid, per-core P-states) or one cluster (classic big.LITTLE). Without it, no energy estimate and no frequency-coupling reasoning is possible later, and Linux EAS shows the granularity matters (the per-type domain thrashed, per-CPU worked).
- `efficiency_class: u8`: lower is more efficient, ordinal only (ACPI GICC semantics). On x86 it is derived from core kind (E = 0, P = 1; LP-E vs E needs the native model ID or cache topology).
- `idle_states[]`: {exit_latency, target_residency, provenance: firmware | vendor-table | measured}. Firmware numbers can be off by 16–20× (Zen 2 C2: 400 µs reported, 20–25 µs measured), so provenance is part of the fact.

The mutable record, published with a sequence number and read lock-free on the wake path:
- `capacity_orig: u16` on a 0..1024 scale relative to the fastest CPU now. Sources: Intel HWP_HIGHEST_PERF, AMD CPPC highest_perf (MSR or `_CPC`), Arm `_CPC` or dmips-mhz × f_max.
- `capacity(cpu, class)` for per-class rows, with `class = 0` the only row until a classifier exists.
  - Capacity must be mutable: HFI, the AMD ranking table, CPPC notifications and turbo toggles all change it at runtime, and Linux recomputes all CPUs when the top one drops.
  - Making `class` a parameter now turns ITD's or AMD HFI's per-class columns into an additive change rather than a redesign. Linux's own capacity doc calls one-number-per-CPU "contentious", and ITD and AMD HFI are the hardware vendors' answer to that.

**Even today's symmetric benches are not symmetric in capacity.**
- AMD preferred-core ranking is per-core CPPC highest_perf from process variation, and Intel ITMT favored cores exist on client parts.
- First metal row: dump per-CPU HWP_HIGHEST_PERF on the Intel laptop and CPPC highest_perf on the Zen 2 desktop, and compare with Linux's `/sys/devices/system/cpu/cpu*/acpi_cppc/highest_perf` and `cpu_capacity` on the same machine as an independent oracle.
- If the values differ, the "all cores equal" assumption is already false on x86, not only on arm64. If they are equal, the record still costs nothing.

**SMT.**
- Capacity is a per-core fact.
- Sibling occupancy is a separate *dynamic* placement term ("prefer a fully idle core").
- Linux refuses asymmetric capacity with SMT on ("not deterministic even approximately") and EAS does not support SMT. The ToyOS laptop has SMT, so do not fold SMT into capacity.

**AML.**
- `_CPC` needs an AML interpreter, and the x86 MSR paths do not.
- If ToyOS keeps AML out of the kernel (userland first), a userland ACPI server evaluates `_CPC` and hands the values in through a capability-gated, validated call. The kernel refuses out-of-range values rather than trusting them.
- On x86 the kernel can read the MSRs itself at boot.

### B. Energy-aware placement now, or only the facts?

**Carry the facts and do capacity-aware fitting now. Do not build energy-model placement (EAS-style) yet.** Reasons:
1. Both benches are SMP with SMT. EAS reports "no significant savings on SMP", disables itself on symmetric topologies, and does not support SMT.
2. There is no hardware to verify on. QEMU virt shows neither energy nor frequency, and ToyOS's own rule puts timing and energy verdicts on metal only. An energy policy that cannot be measured is silent debt.
3. Hardware classification hints are not yet trustworthy:
   - ITD's SF correlation was <0.1 on Alder Lake, and its class was invalid on E-cores.
   - Linux never merged ITD scheduling after four revisions.
   - AMD's own driver does not yet select CPUs from its ranking table.
   - The state of the art (Saez; E-Mapper; HARP) gets its wins from PMC models and app-level knowledge, which are *policy* and belong in userland.
4. Capacity-aware fitting is cheap and degrades exactly to current behavior when all capacities are 1024: task_util ≤ capacity, misfit pull, and capacity-normalized utilization for the vruntime band in the spirit of ACFS's `amp_vruntime`. It is the piece arm64 big.LITTLE needs first.

**Where policy goes (capability-shaped).**
- The kernel keeps mechanism:
  - the wake-path fit check and capacity-normalized utilization;
  - per-process *placement constraints* (allowed efficiency classes, a util clamp) that it enforces, bounded;
  - the CPPC/HWP request write (min/max/desired/EPP) as a privileged operation on a held capability;
  - HFI/AMD table ingestion, done in the thermal or platform interrupt and charged to it, since there are no kernel threads.
- A userland power server, spawned by supervisor with that capability, owns the closed loop:
  - QoS → constraints (Windows QoS / Apple QoS);
  - CLPC-like per-process-group control effort from kernel-exported utilization and latency counters;
  - optional PMC speedup-factor models (Saez) or app operating points (E-Mapper/HARP).
- Its crash leaves the kernel's defaults (all classes allowed, hardware-autonomous HWP/CPPC) in force. A bad hint wastes energy and can never fault the kernel.
- Wake-path decisions (boosting a just-woken interactive task) cannot round-trip to userland. That is why constraints are installed ahead of time and evaluated by the kernel.

### C. Spread or pack

Neither as a global rule. The measured evidence supports this order for the wake path:
1. The previous CPU if it is idle. It is warm and cache-hot.
2. Otherwise an idle CPU in the same LLC that has been idle the *shortest* time (warm: higher frequency, shallow C-state), preferring a fully idle core over a busy core's sibling when the task is expected to run longer than about the C6 exit latency.
3. Spread across LLCs (CCXs on Zen 2) only when the LLC's warm set is saturated.

Why:
- **Laptop:** packing raises turbo bins and lets the package reach deep C-states. On Zen 2 a single awake core blocked package C-states at +81 W system level.
- **Desktop:** CCX L3 capacity and the L3 clock following the fastest core argue for splitting independent heavy tasks across CCXs, and grouping communicating ones.

**Critical ToyOS-specific caveat.** Nest's one large regression was hackbench, a message-passing benchmark: 22.5 s became 76 s or more. ToyOS is message-passing throughout. Synchronous IPC must keep its own rule (hand off to the receiver on the sender's CPU or the receiver's warm CPU, never "pack" a server's clients behind it). Any pack heuristic must be measured against an IPC-heavy workload before it lands.

### D. How to verify

- **Host tier (facts):**
  - parse recorded MADT, PPTT, GICC and CPUID dumps from both benches and from QEMU, and check the resulting topology record;
  - add synthetic hetero tables, since QEMU virt very likely cannot present heterogeneous cores (unverified);
  - this is a differential oracle against Linux's sysfs topology, cpu_capacity and acpi_cppc on the same machines.
- **Host tier (policy):** a deterministic placement simulator fed with rt-app-style traces. It asserts placement decisions (order and counts only), including the all-1024 reduction to today's behavior as a negative control.
- **Metal rows:**
  - delivered frequency per CPU from APERF/MPERF (directly verifies the warm-core effect);
  - energy from Intel RAPL package/psys on the laptop;
  - on Zen 2, an external wall meter, because RAPL there is modeled. Treat it as trend only.
  - Each verdict compares the full change against its revert on the same base, over enough runs to beat the reported run-to-run spread (2.3× under CFS in Saez; EAS reported RSD per row).
- **Hetero verification** waits for hetero metal. Until then the efficiency class and per-class capacity paths are exercised only by host tests with synthetic tables, and that gap should be recorded as a tracked weakness.

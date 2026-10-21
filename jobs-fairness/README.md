# ToyOS PR #979: job fairness (scheduler stage 3)

Branch `wt/toyos-jobs`. Paths are masked as `<worktree>`, `<scratch>`, `<dev>` and `~`.

| log | what | revision | result |
|---|---|---|---|
| logs/ci-host-3.log | `cargo run -- --ci host` | 997ddb5434170a9132cb010988a533d05ff8aece | exit 0, 88 steps green |
| logs/build-only-2.log | `cargo run -- --build-only` | pre-commit tree | exit 0 |
| logs/guest-smoke-4.log | the 7 QEMU machine tests named in the PR | pre-commit tree | 7 passed |
| logs/sim-all-5.log | `cargo test --release -p kernel-sim` | pre-commit tree | all suites pass |
| logs/tree-model-nocapture.log, logs/baseline-model-nocapture.log | the scheduler model before and after the AVL `Eevdf` rewrite | d90e928be / base | byte-identical outputs |
| logs/fairness-widths*.log | `fairness_storm` I5/I13 at widths 1 to 32 | pre-commit tree | under the bound at every width |
| logs/interactive-2-16-*.log | `interactive_mix:2:16`, 2,000 seeds of each stream | pre-commit tree | no failure |
| logs/mut-armed-instant.log | negative control: decide only on a recomputed decision | pre-commit tree plus the mutation | red, exit 101 |
| logs/mut-loaded.log | negative control: `pop_surplus` may hand over the loaded task | pre-commit tree plus the mutation | red at `hand_off`'s assertion |
| logs/qemu-job-fairness.log | `job_fairness` under QEMU at 2, 4 and 8 vCPUs; scratch registration from patches/apply_qemu_jobs.py, not committed | pre-commit tree | shares within 0.329 to 0.338 |
| logs/qemu-job-fairness-mutant.log | the same with patches/mut_job_per_process.patch (each spawn makes a fresh job) | pre-commit tree plus the mutation | heavy job 0.70/0.78/0.78; red at every width |
| logs/metal-prepare-{t14,amd}.log | `--metal --metal-readback <dir> job_fairness latency_wake` | 110877546de6c68e599ae61fb81617e481ae3de3 | staged (exit 2 by design); no machine was touched |

"Pre-commit tree" is the uncommitted working tree that became 997ddb543. The edits made after each log were the clippy loop unroll in the simulator's `main.rs`, the retired `build/kernelkeys.rs` row and, for the simulator logs, the kernel/SDK change from an installed job handle to `SYS_JOB_OWN`. None of them changes the scheduler or the simulator's model. ci-host-3 at 997ddb543 also reran the scheduler core, loom and kernel-sim test suites green (the workspace host members step). 110877546 adds only the `job` field to `process_tree`'s two hand-built `Launch` literals. The staged images compile it.

The QEMU runs are exploratory. The registered verdict is metal, and those runs are pending.

## Metal, at 110877546de6c68e599ae61fb81617e481ae3de3 (run by the orchestrator)

Boots `latencycase` and `testcases`, judging `job_fairness` and `latency_wake`. USB stick serial numbers are masked.

| bench | judge | job_fairness | latency_wake |
|---|---|---|---|
| LENOVO 20W0003AMZ (T14), BIOS N34ET71W 1.71, 8 CPUs | metal/t14/judge-jt.log | PASS: 0.333/0.333/0.333, ran 23,997 of 24,000 ms | PASS: p50 4 us, p99 16 us, p99.9 2419 us, max 4418 us |
| LENOVO 82A2 (AMD), BIOS DMCN38WW, 16 CPUs | metal/amd/judge-ja.log | PASS: 0.333/0.333/0.333, ran 47,996 of 48,000 ms | PASS: p50 4 us, p99 4 us, max 6 us |

## Metal round 2, at 110877546 and its base (run by the orchestrator, isolated)

`metal2/`. Head images come from `wt/toyos-jobs` at 110877546de6c68e599ae61fb81617e481ae3de3. The base image comes from origin/main 6f4d8dbdbca1452c0faa3eead53104d9d0d47fa4, the PR's base, as a detached worktree with no probe commit. On the T14 the head and base `latencycase` boots ran back to back.

| bench | judge | job_fairness | latency_wake | wake_onto_busy | wake_storm_cost |
|---|---|---|---|---|---|
| T14, head | metal2/t14/head/judge-th.log | PASS 0.333/0.334/0.333 | PASS p99 16 us, p99.9 2466 us, max 4465 us | PASS p99 7 us, max 32 us | PASS |
| T14, base | metal2/t14/base/judge-tb.log | | PASS p99 16 us, p99.9 2529 us, max 4527 us | | |
| AMD, head | metal2/amd/head/judge-j2.log | PASS 0.333/0.333/0.333 | PASS p99 4 us, max 6 us | PASS p99 28 us, max 301 us | PASS |

The T14's tail is the base's, within its spread: it is not a regression from this change.

## Review r1 response, rebased onto origin/main a8ea09d20 (after #978)

Head 28ef305a28882d6049315f4a3186b5506b8d583b. Paths under `logs/r2/`.

| log | what | revision | result |
|---|---|---|---|
| ci-host-r2.log | `cargo run -- --ci host` | 28ef305a2 | exit 0, 87 steps green |
| r2-build-only.log | `cargo run -- --build-only` | 28ef305a2 | exit 0 |
| r2-guest-smoke.log | the 7 spawn, launch, desktop and switching QEMU rows | 28ef305a2 | 7 passed |
| r2-sim-all.log, r2-core.log | `cargo test --release -p kernel-sim`; `cargo test -p kernel --lib sched::` | f257f3128 (before the rebase; main changed nothing under `kernel/pure` or `kernel/sim`, and ci-host-r2 reran both suites) | all pass; 149 passed |
| r2-lopsided-probe.log, r2-mig-trace.log | per-seed moves before and after the first exit, and every move with each CPU's published weight | f257f3128 plus temporary prints | the causes the new bound states |
| r2-mut-no_margin.log | `patches/r2/mut_no_margin.patch`: `pop_surplus` without its quarter-thread margin | f257f3128 plus the patch | red, exit 101: 21 moves after 8 exits |
| r2-mut-no_refresh.log | `patches/r2/mut_no_refresh.patch`: `pop_surplus` without its refresh | f257f3128 plus the patch | green: `pick_fair` refreshed earlier in the pass; uncovered on a pass the real-time band picks |
| r2-oldcommit-probe.log, r2-oldcommit-blocks.log | call-site commits per schedule, and each consumer block's outcome | f257f3128 plus temporary prints | 415 caught = 415 that commit; the 85 others found a token (507 at entry, 2 at the re-check) |
| r2-oldcommit.log | the exact gate | f257f3128 | pass |
| r2-mut-gate-blind.log | `patches/r2/mut_gate_blind.patch`: the gate pointed at the fused shape | f257f3128 plus the patch | red, exit 101, seed 1 |
| metal3-t14.log | `--metal --metal-readback <dir> process_tree launch_toctou` | 28ef305a2 | staged (exit 2 by design) |

**Boot to complete on the T14.** Back to back, the same `latencycase` row gives base 6f4d8dbdb 670 ms and head 110877546 671 ms, equal stage by stage (subsystems 78 and 78 ms, storage 486 and 487 ms). The osbench probe's 693 ms against benchcase's 182 ms record comes from its base: the probe's kernel still enumerates USB (`Boot: storage ready (486ms)`), which #971 removed. The main boot that set the 182 ms record has no such stage.

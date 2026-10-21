# ToyOS PR #979: job fairness (scheduler stage 3)

Branch `wt/toyos-jobs`. Paths are masked as `<worktree>`, `<scratch>`, `<dev>` and `~`.

| log | what | revision | result |
|---|---|---|---|
| logs/ci-host-3.log | `cargo run -- --ci host` | 997ddb5434170a9132cb010988a533d05ff8aece | exit 0, 88 steps green |
| logs/build-only-2.log | `cargo run -- --build-only` | the jobs commit before it was split off for the final host run | exit 0 |
| logs/guest-smoke-4.log | the 7 QEMU machine tests named in the PR | the jobs commit | 7 passed |
| logs/sim-all-5.log | `cargo test --release -p kernel-sim` | the jobs commit | all suites pass |
| logs/tree-model-nocapture.log, logs/baseline-model-nocapture.log | the scheduler model before and after the AVL `Eevdf` rewrite | d90e928be / base | byte-identical outputs |
| logs/fairness-widths*.log | `fairness_storm` I5/I13 at widths 1 to 32 | the jobs commit | under the bound at every width |
| logs/interactive-2-16-*.log | `interactive_mix:2:16`, 2,000 seeds of each stream | the jobs commit | no failure |
| logs/mut-armed-instant.log | negative control: decide only on a recomputed decision | the jobs commit plus the mutation | red, exit 101 |
| logs/mut-loaded.log | negative control: `pop_surplus` may hand over the loaded task | the jobs commit plus the mutation | red at `hand_off`'s assertion |
| logs/qemu-job-fairness.log | `job_fairness` under QEMU at 2, 4 and 8 vCPUs; scratch registration from patches/apply_qemu_jobs.py, not committed | the jobs commit | shares within 0.329 to 0.338 |
| logs/qemu-job-fairness-mutant.log | the same with patches/mut_job_per_process.patch (each spawn makes a fresh job) | the jobs commit plus the mutation | heavy job 0.70/0.78/0.78; red at every width |
| logs/metal-prepare-{t14,amd}.log | `--metal --metal-readback <dir> job_fairness latency_wake` | 110877546de6c68e599ae61fb81617e481ae3de3 | staged (exit 2 by design); no machine was touched |

The QEMU runs are exploratory. The registered verdict is metal, and those runs are pending.

# PR 1264 round 6: the GS record starts at a non-canonical base

Head 0658715b3.

| check | exit | log |
|---|---|---|
| kernel build | 0 | r7-p2-checks.log |
| kernel clippy, x86-64 ×6 | 0 ×6 | r7-p2-checks.log |
| `fsgs_bases_per_thread` built through the harness builder | 0 | r7-p2-checks.log |

Guest run 43142558662 at 0658715b3: `a_threads_fs_and_gs_bases_stay_its_own`.

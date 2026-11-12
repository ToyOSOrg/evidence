# PR 1264 round 7: rebased over PR 1271 (main 3c5c55584)

Head a72a3d82b. The standalone row `a_threads_fs_and_gs_bases_stay_its_own` and its function are deleted; the member is judged in `testcases_members_exit_0`. range-diff: only the first commit changed, in `tests/toyos.rs`.

| check | exit | log |
|---|---|---|
| kernel build, x86-64 clippy | 0, 0 | r8-p2-checks.log |
| `cargo test --test toyos-checks` (55) | 0 | r8-p2-checks.log |

Guest run 43147838891 at a72a3d82b: `testcases_members_exit_0 shared_debug_members_exit_0`.

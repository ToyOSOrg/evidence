# PR 1264 round 2: rebased on PR 1262's round 2

Head e753534ec (748b6417d, 02279dfaf and the round commit e753534ec, on PR 1262's 2fc799bee).

## Host checks (macOS aarch64 build host)

| check | command | exit | revision | log |
|---|---|---|---|---|
| kernel builds | shipping and actuator, x86-64 | 0, 0 | e753534ec tree | r2-p2-checks.log |
| kernel clippy | x86-64 ×6 and AArch64 ×4 | 0 ×10 | e753534ec tree | r2-p2-checks.log |
| `toyos-build` library, whole | `cargo test -p toyos-build --lib` | 101: 385 passed, the same recorded macOS failure (see pr-1262 r2) | e753534ec tree | r2-p2-checks.log |
| harness checks | `cargo test --test toyos-checks` | 0 (45) | e753534ec tree | r2-p2-checks.log |
| kernel library | `cargo test -p kernel --lib --features sched-check` | 0 (459) | e753534ec tree | r2-p2-checks.log |
| entries | objdump: `#DB` and NMI with `rdgsbase`/`wrgsbase`; `#DB` `rip` at +0x58; NMI `rflags` at +0x68, nested `rip`/`rsp` at +0x10/+0x28 | inspected | e753534ec tree | r2-p2-entries.dis |

## Control

`gsentry-fsgsbase-mutation` 3e34d0863 (r2-mutation-switch-keeps-gs.patch): shipping build and clippy 0 (r2-mutations-build.log). `a_threads_fs_and_gs_bases_stay_its_own` must red on the readback assertion.

## Guest runs

| run | head | rows | expected |
|---|---|---|---|
| 43081128403 | e753534ec | `a_threads_fs_and_gs_bases_stay_its_own a_ring3_gs_load_leaves_the_kernel_its_gs nmi_under_a_user_gs_base nested_nmi_is_loud a_kernel_stack_overflow_names_its_stack ring3_debug_traps_end_their_process` | green |
| 43081134180 | 3e34d0863 | `a_threads_fs_and_gs_bases_stay_its_own` | red |

## Metal (staged; nothing touched)

- T14: `boot:testcases boot:shared-debug boot:benchcase` (`metal/r2-p2-t14`). Its `benchcase` pairs with PR 1262 r2's T14 `benchcase` for `pingpong.pipe.*` with and without FSGSBASE.
- AMD: `boot:testcases boot:shared-debug` (`metal/r2-p2-amd`).

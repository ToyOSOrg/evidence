# Evidence for ToyOS #1200

A child's arguments and environment are memory its parent lays out. Paths, the
runner's host name and CPU model strings are masked.

| file | command | revision | target | exit |
|---|---|---|---|---|
| `host/ci-host.log` | `cargo run -- --ci host` | 494063cc6 | macOS arm64 host | 1: 1 of 110 steps red, `the build system`, by `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` alone (`issues/the-llvm-environment-test-breaks-git-on-macos.md`) |
| `host/toyos-cargo-test.log` | `cargo test` in `sdk/toyos` | the tree 494063cc6 commits | macOS arm64 host | 0 |
| `guest/x86_64-rows.log` | guest-rows run 42913718083, `libc_children a_spawn_from_an_image_frees_it_when_the_child_ends session_lifecycle a_launch_gives_each_unsent_stdio_slot_a_null netstack_holders_exported_to_children console_image_boots` | 494063cc6 | guest runner, x86-64 under KVM | green, 6 of 6 |
| `guest/aarch64-rows.log` | guest-rows run 42911275777, `virt_smp virt_readonly_copyout virt_unmap_touch virt_user_mode` | 494063cc6 | guest runner, AArch64 emulated | green, 4 of 4 |
| `guest/x86_64-rows-no-such-row.log` | guest-rows run 42911268243, a filter naming shared-boot members, which no QEMU row runs | 494063cc6 | guest runner | red before any boot: `No test matches filter "startup_block"` |
| `typecheck/*.log` | `cargo check` of the kernel (both architectures), std (both), libc's C-only build (both) and the changed guest tests (x86-64) with the host's earlier fork toolchain | the tree 494063cc6 commits | macOS arm64 host | 0 each |
| `metal/metal-readback.log`, `metal/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> startup_block abuse_spawn_maps abuse_spawn_path abuse_handle_table abuse_page_straddle spawn_child_ends_first spawn_image_object spawn_lands_claimed start_refuses_itself process_tree crash_report_reads_no_kernel_memory` | cf06504fa | staged for the T14, no machine touched | 2 (staged) |

cf06504fa differs from 494063cc6 by an issue record and the visibility of one
constant (`toyos::startup::RESERVED`).

## Review round 1

| file | command | revision | target | exit |
|---|---|---|---|---|
| `metal/t14-cf06504fa/judge.log` | `cargo test --test toyos-build -- --metal --metal-readback <dir> <the eleven names above>` over the readbacks the orchestrator's run left | boots of cf06504fa, judged by the harness at 92ce3af8b | T14 | 1: 8 passed, 3 failed |
| `metal/t14-cf06504fa/*-jobs.log`, `*-verdict.txt` | each boot's job lines out of its kernel log (test-runner's, the kernel's spawn and exit records, the launcher's), and the boot's verdict | cf06504fa | T14 | each boot `passed`; `test_rs_process_tree` exited 101, `test_rs_spawn_child_ends_first` and `test_rs_abuse_handle_table` 134 |
| `host/r1-ci-host.log` | `cargo run -- --ci host`, nothing else running in the worktree | 92ce3af8b | macOS arm64 host | 1: 1 of 110 steps red, the recorded macOS test |
| `host/r1-ci-host-concurrent.log` | the same, while a metal staging ran in the same worktree | 60db1b92d | macOS arm64 host | 1: 2 of 110 red; the second is `cargo clippy -p kernel` for AArch64 failing with `couldn't create a temp dir` under `target/`, which the concurrent build was cleaning |
| `guest/r1-rows.log` | guest-rows run 42923403243, `libc_children session_lifecycle a_launch_gives_each_unsent_stdio_slot_a_null virt_user_mode` | 60db1b92d | guest runner, x86-64 under KVM and AArch64 emulated | green, 4 of 4 |
| `metal/r1/metal-readback.log`, `metal/r1/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> startup_block abuse_handle_table spawn_child_ends_first process_tree` | 92ce3af8b | staged for the T14, no machine touched | 2 (staged) |

92ce3af8b differs from 60db1b92d in three guest tests only. The machine's
vendor, model and firmware version and the runner's name are masked in the
files at this commit; the first commit of this branch carries the runner's
label in its guest logs.

## Review round 2: a bounded name in `SpawnArgs`

| file | command | revision | target | exit |
|---|---|---|---|---|
| `host/r2-ci-host.log` | `cargo run -- --ci host` | e9bbb2961 | macOS arm64 host | 1: 1 of 110 steps red, the recorded macOS test |
| `guest/r2-rows.log` | guest-rows run 42929489113, `libc_children session_lifecycle a_launch_gives_each_unsent_stdio_slot_a_null a_spawn_from_an_image_frees_it_when_the_child_ends console_image_boots virt_smp virt_readonly_copyout virt_user_mode` | e9bbb2961 | guest runner, x86-64 under KVM and AArch64 emulated | red: 7 of 8. `libc_children` ended `tty_interrupt: stalled at the nested line held`, the stall `issues/libc-childrens-tty-interrupt-can-stall-at-the-nested-shells-line.md` records on main |
| `metal/r2/metal-readback.log`, `metal/r2/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> startup_block abuse_handle_table spawn_child_ends_first process_tree abuse_spawn_labels abuse_spawn_maps abuse_page_straddle spawn_image_object spawn_lands_claimed start_refuses_itself` | e9bbb2961 | staged for the T14, no machine touched | 2 (staged) |

## Review round 2 fixes

| file | command | revision | target | exit |
|---|---|---|---|---|
| `host/r3-ci-host.log` | `cargo run -- --ci host` | 98853704a | macOS arm64 host | 1: 1 of 110 steps red, the recorded macOS test |
| `metal/r3/metal-readback.log`, `metal/r3/request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> startup_block abuse_handle_table spawn_child_ends_first process_tree abuse_spawn_path_and_name abuse_spawn_maps abuse_page_straddle spawn_image_object spawn_lands_claimed start_refuses_itself` | 98853704a | staged for the T14, no machine touched | 2 (staged) |

No guest row was run at 98853704a: against e9bbb2961 its code changes are
four lines (a constant's definition, an `expect` for an `unwrap_or`, one
parameter's type spelling, one `pub` removed) and a test's rename.

## Review round 3

**Correction.** The row above for `host/r3-ci-host.log` is wrong: at 98853704a
the `the build system` step had two failing tests, not one. The second,
`bootlog::tests::the_kernel_writes_the_records_the_host_reads`, was this
branch's own, red on every host (`382 passed; 2 failed`).

| file | command | revision | target | exit |
|---|---|---|---|---|
| `host/r4-build-system.log` | `cargo test --lib`, the `the build system` step | 166944c21 | macOS arm64 host | 101: 383 passed, 1 failed, the recorded macOS test (`llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, and `keyed_and_built`, the child process it runs) |
| `host/r4-harness-checks.log` | `cargo test --test toyos-checks`, the `the harness's own checks` step | 166944c21 | macOS arm64 host | 0: 42 passed |

166944c21 differs from 98853704a in `build/bootlog.rs`, `tests/toyos.rs`, a
comment in one guest test and issue records. The other 108 host steps were
not rerun.

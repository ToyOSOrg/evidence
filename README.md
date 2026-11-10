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

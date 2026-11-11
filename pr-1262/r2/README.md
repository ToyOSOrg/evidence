# PR 1262 round 2: #DB on IST4, DR7 and SYSENTER_CS declared

Head 2fc799bee (round commit on b768cef88). Logs are masked: `<scratch>` is the agent's scratch directory, `<home>` the build host's home, `<user>` its user.

## Host checks (macOS aarch64 build host)

| check | command | exit | revision | log |
|---|---|---|---|---|
| kernel builds | shipping and `boot-actuators,test-actuators` on `x86_64-unknown-none` | 0, 0 | 2fc799bee tree | r2-p1-checks.log |
| kernel clippy | x86-64 ×6 and AArch64 ×4, every CI shape | 0 ×10 | 2fc799bee tree | r2-p1-checks.log |
| `toyos-build` library, whole | `cargo test -p toyos-build --lib` | 101: 385 passed, 1 failed. `nmi_does_not_log` passes; the failure is below | 2fc799bee tree | r2-p1-checks.log |
| that failure on main | `cargo test -p toyos-build --lib -- llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` | 101, the same `xcode-select` refusal, already recorded in `issues/the-llvm-environment-test-breaks-git-on-macos.md` | origin/main e558cc153 | main-llvm-env.log |
| harness checks | `cargo test --test toyos-checks` | 0 (45) | 2fc799bee tree | r2-p1-checks.log |
| metal crate | `cargo test -p toyos-metal` | 0 | 2fc799bee tree | r2-p1-checks.log |
| image | `cargo run -- --build-only` | see r2-stage.log | 2fc799bee | r2-stage.log |
| `#DB` entry | objdump: CPL-0 path `rip` at +0x58; Ring 3 path copies five words to `kernel_rsp`'s top and jumps to `common_entry` as vector 1 | inspected | 2fc799bee tree | r2-p1-debug.dis |

## Controls (rebased onto 2fc799bee, each built)

| branch | head | patch | expected |
|---|---|---|---|
| gsentry-swapgs-mutation | 17abd6bec | r2-mutation-cs-only.patch | `nmi_under_a_user_gs_base` reds on `nmi-user-gs: FAIL` |
| gsentry-swapgs-signtest | e4a7eb544 | r2-mutation-sign-test.patch | the same |
| gsentry-swapgs-control | 24c9bc08c | the fix reverted (the tests commit's tree) | both QEMU rows red |

The control is unchanged from round 1. Its subject, main's kernel under the tests, is unchanged by this round: the arm moved files verbatim and `gs_segment_load` is untouched.

Build log: r2-mutations-build.log.

## Guest runs (guest runner, x86-64 under KVM)

| run | head | rows | expected |
|---|---|---|---|
| 43081109599 | 2fc799bee | the eight rows of round 1 plus `ring3_debug_traps_end_their_process` | green |
| 43068462126 | 24c9bc08c | `a_ring3_gs_load_leaves_the_kernel_its_gs nmi_under_a_user_gs_base` | red |
| 43081114529 | 17abd6bec | `nmi_under_a_user_gs_base` | red |
| 43081121891 | e4a7eb544 | `nmi_under_a_user_gs_base` | red |

43068455938, at the superseded e47fdba5b, was cancelled.

## Metal (staged; nothing touched)

- T14: `boot:testcases boot:shared-debug boot:benchcase` (`metal/r2-p1-t14`).
- AMD: `boot:testcases boot:shared-debug` (`metal/r2-p1-amd`).

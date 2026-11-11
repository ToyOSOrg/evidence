# PR 1262 round 1: the swapgs entry

Each check below lists its command, exit code, revision and target. Logs are in this directory, masked: `<scratch>` is the agent's scratch directory, `<home>` the build host's home, `<user>` its user.

PR head e47fdba5b (tests 170696a55, fix e47fdba5b); base origin/main 67713cbc1.

## Host checks (build host: macOS, aarch64; cross targets)

| check | command | exit | revision | log |
|---|---|---|---|---|
| kernel clippy, x86-64 shapes | `cargo clippy -p kernel --target x86_64-unknown-none [--features …]` with the adopted lints, `-D warnings`. Shapes: default; `boot-actuators,test-actuators`; `boot-actuators`; the instruments set | 0 ×4 | e47fdba5b tree | clippy-x86-final.log |
| kernel clippy, AArch64 shapes | the same four shapes on `aarch64-unknown-none-softfloat` | 0 ×4 | pre-split tree; its AArch64 sources are identical to e47fdba5b | clippy-a64-1.log |
| instrumentation commit alone | default kernel build, x86 clippy (default and `boot-actuators`), actuator kernel build, AArch64 actuators clippy | 0 ×5 | 170696a55 | tests-commit-build.log |
| harness checks | `cargo test --test toyos-checks` | 0 (45 passed) | pre-split tree, identical harness | checks-2.log |
| metal crate | `cargo test -p toyos-metal` | 0 (73 passed) | pre-split tree, identical | checks-2.log |
| syscall entry image gate | `cargo test -p toyos-build --lib -- entry` | 0 (15 passed, `an_entry_without_its_swapgs_is_refused` among them) | e47fdba5b tree | gate-1.log |
| image | `cargo run -- --build-only` | 0 | e47fdba5b tree | build-only-2.log |
| emitted entries | objdump of the actuator kernel: `syscall_entry`, `common_entry`, `fatal_entry`, `nmi_entry`, `timer_entry`, stubs, claim/kick/unclaimed entries | inspected | e47fdba5b tree | entries.dis |

## Controls (checked patches, each built)

| branch | head | patch | builds | expected |
|---|---|---|---|---|
| gsentry-swapgs-control | 24c9bc08c | `git revert` of the fix | yes (its tree is 170696a55's) | both QEMU rows red |
| gsentry-swapgs-mutation | 053d7ac3f | mutation-cs-only.patch | yes, actuator and shipping kernels | `nmi_under_a_user_gs_base` red |
| gsentry-swapgs-signtest | 6b8cfaa9e | mutation-sign-test.patch | yes, actuator and shipping kernels | `nmi_under_a_user_gs_base` red |

Build log: mutations-build.log.

## Guest rows (guest runner, x86-64 under KVM)

<!-- RUNS -->

## Metal

Staged without touching a machine: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases boot:shared-debug`, one directory per bench (metal-stage.log).

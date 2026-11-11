# PR 1264 round 1: FSGSBASE is taken

Head 16d1d271e, stacked on PR 1262's head b768cef88. Logs are masked as for pr-1262.

## Host checks (build host: macOS, aarch64; cross targets)

| check | command | exit | revision | log |
|---|---|---|---|---|
| kernel clippy, x86-64 | the six CI shapes: default; `boot-actuators,test-actuators`; `boot-actuators`; instruments; both heap-band sets; adopted lints, `-D warnings` | 0 ×6 | 16d1d271e tree | p2-checks-1.log |
| kernel clippy, AArch64 | the four CI shapes | 0 ×4 | 16d1d271e tree | p2-checks-1.log |
| harness checks | `cargo test --test toyos-checks` | 0 (45 passed) | 16d1d271e tree | p2-checks-1.log |
| kernel library | `cargo test -p kernel --lib --features sched-check` | 0 (459 passed) | 16d1d271e tree | p2-checks-1.log |
| kernel builds | shipping and actuator x86-64 kernels | 0 | 16d1d271e tree | p2-build-1.log |
| image | `cargo run -- --build-only` | 0 | 16d1d271e | p2-stage.log |
| NMI entry | objdump: `rdgsbase`/`wrgsbase`, `rflags` at +0x68, nested `rip`/`rsp` at +0x10/+0x28 | inspected | 16d1d271e tree | p2-nmi.dis |

## Control

| branch | head | patch | builds | expected |
|---|---|---|---|---|
| gsentry-fsgsbase-mutation | faa81a1c4 | mutation-switch-keeps-gs.patch | yes (shipping build and clippy) | `a_threads_fs_and_gs_bases_stay_its_own` red |

Build log: p2-mutation-build.log.

## Metal (staged, nothing touched)

- **PR 1264's head, T14:** `boot:testcases boot:shared-debug boot:benchcase`.
- **PR 1264's head, AMD bench:** `boot:testcases boot:shared-debug`.
- **PR 1262's head, T14:** `boot:benchcase`. This is the "without FSGSBASE" side of `pingpong.pipe.*`.

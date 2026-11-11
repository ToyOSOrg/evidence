# PR 1262 round 3: the #DB entry never resumes onto itself

Head a530d5d68: the code is d614e1b0c's, plus a records-only commit. Logs are masked as before.

| check | command | exit | revision | log |
|---|---|---|---|---|
| kernel builds | shipping and actuator, x86-64 | 0, 0 | d614e1b0c tree | r3-p1-checks.log |
| kernel clippy | x86-64 ×6 (every CI shape); AArch64 default (no AArch64 source changed this round) | 0 ×7 | d614e1b0c tree | r3-p1-checks.log |
| `toyos-build` library, whole | `cargo test -p toyos-build --lib` | 101: 385 passed, `nmi_does_not_log` ok; the one failure is the recorded macOS `llvm` test (pr-1262/r2 shows it on main) | d614e1b0c tree | r3-p1-checks.log |
| harness checks | `cargo test --test toyos-checks` | 0 | d614e1b0c tree | r3-p1-checks.log |
| image | `cargo run -- --build-only` | 0 | d614e1b0c tree | r3-p1-checks.log |
| guest binaries | `debug_trap` and `gs_segment_load` built with the harness's own `qemu::build_toyos_bin` (a throwaway test, not committed) | 0 | d614e1b0c tree | r3-p1-guestbins.log |
| `#DB` entry | objdump: frame pointer `lea rdi, [rsp+0x58]`; after the base it found is restored, `test [rsp+8], 3; jnz` to the Ring 3 path before `iretq`; `deferred` writes `rip` 0, `cs` 0x23, `rflags` 0x202, `rsp` 0, `ss` 0x1b on `debug_entry`'s address | inspected | d614e1b0c tree | r3-p1-debug.dis |

Guest run 43093456092 at d614e1b0c: `ring3_debug_traps_end_their_process`, with the new `tf-mov-ss-int1` and `tf-int1` arms.

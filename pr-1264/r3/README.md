# PR 1264 round 3: rebased on PR 1262's round 3, with PR 1262's entry.rs text

Head 32a7b4dc6. Its tree is the one checked here, and was unchanged by the last rebase onto PR 1262's records-only a530d5d68.

| check | command | exit | log |
|---|---|---|---|
| kernel builds | shipping and actuator, x86-64 | 0, 0 | r3-p2-checks.log |
| kernel clippy | x86-64 ×6; AArch64 default | 0 ×7 | r3-p2-checks.log |
| `toyos-build` library, whole | `cargo test -p toyos-build --lib` | 101: 385 passed, `nmi_does_not_log` ok, the same recorded macOS failure | r3-p2-checks.log |
| harness checks, kernel library | `cargo test --test toyos-checks`; `cargo test -p kernel --lib --features sched-check` | 0; 0 | r3-p2-checks.log |
| image | `cargo run -- --build-only` | 0 | r3-p2-checks.log |
| guest binaries | `debug_trap`, `fsgs_bases_per_thread`, `gs_segment_load` through `qemu::build_toyos_bin` (throwaway test) | 0 | r3-p2-checks.log |
| `#DB` entry | objdump: `rdgsbase`/`wrgsbase`; frame pointer at +0x58; the ring test before `iretq` | inspected | r3-p2-debug.dis |

Guest run 43094000903 at 32a7b4dc6: `ring3_debug_traps_end_their_process`.

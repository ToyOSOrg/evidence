# PR 1264 round 5: rebased onto main ce202b249 (PR 1262, 1243 and 1251 landed)

Head 01ec758d3; code at 9e283568b. The rebase conflicted with PR 1251 in `hw.rs`, `payload.rs` and `driver.rs`. The resolution puts the GS base under PR 1251's read-back and write-when-different form, with a new per-CPU `user_gs_base` record.

| check | exit | log |
|---|---|---|
| kernel builds, shipping and actuator | 0, 0 | r6-p2-checks.log |
| kernel clippy, x86-64 ×6 and AArch64 ×4 | 0 ×10 | r6-p2-checks.log |
| `toyos-checks` (53), kernel library (496), source gate | 0, 0, 0 | r6-p2-checks.log |
| `cargo run -- --build-only` | 0 | r6-p2-checks.log |
| guest binaries `fsgs_bases_per_thread`, `gs_segment_load`, `debug_trap` (harness builder, throwaway test) | 0 | r6-p2-checks.log |
| mutation 5313bcf65 (r6-mutation-switch-keeps-gs.patch): shipping build and clippy | 0, 0 | r6-mutation-build.log |

Guest runs: 43140337644 at 01ec758d3, five switch rows; 43140341877 at the mutation, which must red.

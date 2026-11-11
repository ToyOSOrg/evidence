# PR 1262 round 4: rebased onto main 818809583

Head 6fd67393f. `git range-diff` shows the kernel and record commits unchanged; the tests commit and round 2 changed only in `tests/toyos.rs` (#1254's `MACHINE_TESTS` form, `On::Every`).

| check | exit | log |
|---|---|---|
| kernel builds, shipping and actuator | 0, 0 | r5-p1-checks.log |
| kernel clippy, x86-64 ×6 and AArch64 ×4 | 0 ×10 | r5-p1-checks.log |
| `cargo test --test toyos-checks` (51) | 0 | r5-p1-checks.log |

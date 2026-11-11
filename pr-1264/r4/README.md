# PR 1264 round 4: rebased onto PR 1262 6fd67393f

Head 47f8d5b3d. `git range-diff` shows the kernel commits unchanged; the first commit changed only in `tests/toyos.rs`.

| check | exit | log |
|---|---|---|
| kernel builds, shipping and actuator | 0, 0 | r5-p2-checks.log |
| kernel clippy, x86-64 ×6 and AArch64 ×4 | 0 ×10 | r5-p2-checks.log |
| `toyos-checks` (51), kernel library (463), `toyos-metal` (81) | 0, 0, 0 | r5-p2-checks.log |

# PR #1091 review r1: head a6ae98b35aecf2f65eb1ae7c745c9ee3042175de

Every check below ran at that head.

| file | command | exit |
|---|---|---|
| host-ci.log | `cargo run -- --ci host` | 0 (104 steps) |
| unit.log | `cargo test -p toyos-i219` | 0 (113 tests) |
| harness-clippy.log | `cargo clippy --test toyos-build -p toyos-build` | 0, no warnings |
| build-only.log | `cargo run -- --build-only` | 0 |
| t14-prepare.log, request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> i219_leaves_ulp_unarmed` | 2 (Staged by design: nothing judged, no machine touched); one boot, `benchcase` |
| controls/ | each patch applied, `cargo test -p toyos-i219` run, then reverted with `git apply -R` in the same run | 101 each |

Controls:

- `no-disarm.patch`: the test fails with "ULP left with more or less than the field it does not own: ULP configuration 0x1f74 (armed, up from ULP), power control 0x0000 (K1 off)".
- `paced-hold.patch`: 52 tests fail with "held LANPHYPC low 100000238 ns".

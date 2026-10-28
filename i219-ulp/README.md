# PR #1091: i219 disarms Ultra Low Power at start

Branch `i219-ulp`, head `831d2a20a58d7c0a330b88f787bd1d259b68f57e`, base `2a24fcfb8` (origin/main).

| file | command | exit | tree |
|---|---|---|---|
| host-ci.log | `cargo run -- --ci host` | 0 | working tree with every driver, stub, test and issue change; before the metal row in `tests/toyos.rs` and one stub doc comment |
| unit.log | `cargo test -p toyos-i219` | 0 | head |
| harness-build.log | `cargo test --test toyos-build --no-run` | 0 | head's tree (the metal row) |
| harness-clippy.log | `cargo clippy --test toyos-build -p toyos-build` | 0, no warnings | head's tree |
| t14-prepare.log, request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> i219_leaves_ulp_unarmed` | 2 (Staged: by design, nothing judged, no machine touched) | head |
| controls/ | each patch applied with `git apply`, `cargo test -p toyos-i219`, reverted with `git apply -R` in the same run | 101 each | the host-ci tree |

Controls:

- `no-disarm.patch`: the wake reads ULP and writes none of it. `ulp_left_armed_is_disarmed_and_a_lost_link_leaves_the_phy_in_reach` fails: "ULP left armed: ULP configuration 0x1b10, power control 0x0000 (K1 off), 0xe4 0x00000022: armed".
- `paced-hold.patch`: LANPHYPC released at the 100 ms arbitration pace, as before. The stub refuses it on every test that cycles the pin: "held LANPHYPC low 100000238 ns, outside the 10 to 20 us a power cycle takes".

The edits after the host-ci run are the `tests/toyos.rs` row (compiled and linted separately above) and a doc comment in `stub.rs` (unit.log at head).
| build-only.log | `cargo run -- --build-only` | 0 | head |

# ToyOSOrg/ToyOS#1115 round 2: review r1's fixes at 9ee94e200

| Log | Command | Revision | Exit |
|---|---|---|---|
| w3-r2-crate.log | `cargo test -p toyos-ax2xx` | 9ee94e200 | 0; 33 tests |
| w3-r2-gates.log | `cargo test --lib -- licence sourcegate` (build crate) | 9ee94e200's tree | 0; 34 tests |
| w3-r2-lint.log | `cargo run -- --ci host lint` (licences of what ships, clippy) | 9ee94e200's tree | 0; 5 steps |

Round 1's full `--ci host` (26c6ae4ff) stands for everything else: round 2 changes
records, two comments, the crate header, and `part` and `notification` with their tests.
The crate's controls were not rerun: neither mutated line changed.

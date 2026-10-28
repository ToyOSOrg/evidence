# PR #1111 r1: steps 1 and 2 (`b24b37a56`)

- `ci-host-3.log`: `cargo run -- --ci host`, exit 0, 105 steps, on the tree before `161fc1e1c` was dropped from the branch.
- `b24-kernel-lib.log`, `b24-sim.log`, `b24-clippy.log`: `cargo test -p kernel --lib`, `cargo test -p kernel-sim` and kernel clippy at `b24b37a56`, exit 0 each.
- `step1-*.log`, `step2-pure.log`, `sim-pair.log`: the new tests while they were written.
- `controls/`: each mutation's patch and its runs. Every mutation turns only its own tests red, and `step1-never-hold` also reds the simulator's `turn_taking_pair`.

Paths under the home directory read `$HOME`.

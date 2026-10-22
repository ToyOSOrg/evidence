# PR 990, round 1: host evidence at f5fbc03c7

- `ci-host-pr1.log`: `cargo run -- --ci host` at b618d31f0 (exit 1: clippy findings in the new modules, fixed in f5fbc03c7).
- `ci-host-pr1b.log`: `cargo run -- --ci host` at f5fbc03c7, exit 0.
- `controls/`: each negative control's patch, the test log with it applied, and `results.txt` (build and test exit codes, failing tests).
- `readback-pr1.log`, `request.txt`: the staged `cryptocase` image for `crypto_instrument` (exit 2 = Staged; no machine touched).

Paths are masked as $HOME, $SCRATCH and $WORKTREE.

# The stack rebased onto main `4753fb875`, top `b01360923` (#1129)

- `ci-host-b01360923.log`: `cargo run -- --ci host`, 109 steps all green, exit 0.
- `ci-host-b01360923-unexplained-red.log`: the run before it on the same tree, which reported 1 of 109 red. The step "the build system: cargo test --lib" exited 101, but its output shows `372 passed; 0 failed` and no failing test. Run alone straight after, it passed (`build-system-lib-rerun.log`, exit 0). The cause is unknown: two judges and other agents' builds were running on the host.

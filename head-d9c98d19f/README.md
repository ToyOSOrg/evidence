# PR 1004, review round 2, head d9c98d19f

- `ci-host.log`: `cargo run -- --ci host` at d9c98d19f, exit 0, 95 steps green; every transport control reached its verdict, under the renamed model names.
- `stall-checks.log`: at 5c3ce9836, `cargo clippy -p toyos --all-targets -- -D warnings && cargo test -p toyos-net-node && cargo test --release --test transport_loom --no-run`, exit 0 (the lib tests, 126, ran before it and again inside `ci-host.log`).
- `stall-control.log`: the negative control for the gate-wait stall report. `stall-control.patch` applied to 5c3ce9836's `waiting`, then `cargo test -p toyos --lib gate_waits`: exit 101, `a_blocking_write_under_another_holders_gate_waits_for_that_holders_gate` fails (`[None]` against `[Some(2)]`); restored from a copy, and the same test passes inside `ci-host.log`.
- Reused: head-cc07115b5's full loom suite (28/28). Since then no atomic operation or model changed: `want` answers the owner it CAS'd beside, and loom's `wait_gate` delegates to its wait. The model renames are covered by `ci-host.log`'s control verdicts.

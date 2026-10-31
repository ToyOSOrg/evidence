# Review round 1

Each control is a diff against `lib/blockring/src/client.rs` at the r1 change (7f16c6997, before its stacking onto #1099). It was applied, run with `cargo test -p toyos-blockring --lib --release model::`, and the file restored byte for byte.

- `red-k1-no-wait-at-limit`: the caller's write no longer waits at the limit. Exit 101. `no_write_goes_out_while_the_client_keeps_its_limit` fails on Law::Kept, "write 3 went out with 1 blocks kept".
- `red-k2-dropped-at-done`: a write's payload is dropped when it is answered Done, not at the covering flush. Exit 101. `what_a_flush_calls_durable_is_on_the_medium` fails on Law::Durable under a reset, and so does `the_model_reaches_a_write_given_up`.
- `ci-host.log`: `cargo run -- --ci host` at 558ab7707, the head stacked on #1099. `ci-host.rev` holds the revision and the exit code: 105 steps green.

Paths under the agent's home and scratch are masked.

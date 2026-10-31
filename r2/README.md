# Review round 2 (head 20bdd1401)

- `ci-host-r2.log`: `cargo run -- --ci host` at 20bdd1401 (`ci-host.rev`), 105 steps green.
- `red-k3-own-flush-beside-callers`: the guard that lets a write at the limit wait for a caller's flush on the wire is disabled. `cargo test -p toyos-blockring --lib --release client::` exits 101, and `a_write_at_the_limit_waits_for_a_callers_flush_on_the_wire` fails. The file was then restored byte for byte.

Paths under the agent's home and scratch are masked.

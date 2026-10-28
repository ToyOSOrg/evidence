# PR #1083, round 3 (review r2)

Head `b6a717df8`, rebased onto `717baf3ac`; same host as r1. Paths, user, LAN address and MACs masked. Every run's log begins with the `HEAD` it ran at and `git status --porcelain` (empty).

- `r3-ci-host.log`: `cargo run -- --ci host` at `b6a717df8`, clean tree: exit 0, 104 steps green.
- `r3-guest.log`: `netstack_holders_exported_to_children` at `b6a717df8`, clean tree, with the SDK rebuilt into the guest: exit 0.
- `r3-drain-after-ask.{patch,log}`: at `b6a717df8`, `look` reads the bell after an ask answered "nothing". `the_holder_that_found_nothing_takes_the_next_arrival` fails with "holder 1 waits for good with [2] queued" (exit 101). Restored byte-identical; status clean after.
- `r3-rearm-only-on-take.{patch,log}`: at `b6a717df8`, the node re-arms a datagram holder only on a receive that takes a datagram. `every_holder_receives_from_one_queue_each_datagram_once_and_whole` fails, (2, 2) against (2, 3) (exit 101). Restored byte-identical; status clean after.
- `compile-fail-second-read.{patch,log}`: a second `drain.now()` in one attempt is refused, E0382 (cargo check exit 101). Run on `262855361` plus the uncommitted r3 change, whose code is `b6a717df8`'s except the `Drain` doc's first line.
- `compiles-raw-bypass.{patch,log}`: a raw `ipc::signal(end.connection, RECEIVE)` that ignores the `Drain` compiles (exit 0), with unused-variable and dead-code warnings. This is the bypass the doc comment names. Same tree as the line above.
- `r2-control-trees.diff`: r2's controls ran on a socket.rs that differs from `9a26dea93` by doc comments only, and on a datagram.rs identical to it. r2's `ci-host-2.log` and `r2-guest.log` are superseded by the two runs above at a recorded head.
- Correction to r2's README: the host run it calls `ci-host.log` is the file `ci-host-2.log`.

Invocations, each from the worktree root:
- `r3-ci-host.log`: `cargo run -- --ci host`.
- `r3-guest.log`: `cargo test --test toyos-build -- netstack_holders_exported_to_children --nocapture`.
- `r3-drain-after-ask.log`: `(cd sdk/toyos && cargo test --lib net::socket)` with the patch applied.
- `r3-rearm-only-on-take.log`: `(cd system/netstack/node && cargo test --test datagram every_holder)` with the patch applied.
- `compile-fail-second-read.log`, `compiles-raw-bypass.log`: `(cd sdk/toyos && cargo check)` with the patch applied.

After review r3, head `91b62446b` (the `#[must_use]` moved from `Drain` to `Drained`):
- `r3b-unsent-read.{patch,log}`: a bare `drain.now();` followed by a raw send warns "unused `Drained` that must be used: the bell was read for a request: send it" (`(cd sdk/toyos && cargo check)`, exit 0). Run on `b6a717df8` plus the uncommitted move, which is `91b62446b`'s tree.
- `r3b-sdk.log`: `(cd sdk/toyos && cargo check && cargo test)` at `91b62446b`, clean tree: no warnings, 145 + 28 + 6 tests passed, exit 0.

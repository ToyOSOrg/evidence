# PR #1083, round 2 (review r1)

Head `9a26dea93`; same host as r1. Paths, user, LAN address and MACs masked.

- `ci-host.log`: `cargo run -- --ci host` on the r2 tree before commit, exit 0, 104 steps green.
- `mutation-drain-after-ask.{patch,log}`: `look` reads the bell after an ask answered "nothing". `the_holder_that_found_nothing_takes_the_next_arrival` fails with "holder 1 waits for good with [2] queued" (exit 101). Restored byte-identical (`cmp`).
- `mutation-rearm-only-on-take.{patch,log}`: the node re-arms a datagram holder only on a receive that takes a datagram. `every_holder_receives_from_one_queue_each_datagram_once_and_whole` fails at the third arrival, (2, 2) against (2, 3) (exit 101). Restored byte-identical.
- `r2-guest.log`: `netstack_holders_exported_to_children` once at `9a26dea93`, with the SDK rebuilt into the guest: exit 0.

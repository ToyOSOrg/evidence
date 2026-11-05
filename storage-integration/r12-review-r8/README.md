# #1152 round 12: a reservation's take is granted its whole credit

- `mutations/grant-one-credit.*`: the transaction path's grant holding one
  transaction's credit for a take (`transact_holding(K_TX, K_TX * 8, …)`) ->
  `reservations_of_several_blocks_fill_a_volume_and_are_all_written` red at
  the invariant "a take promised more than the room keeps".
- `mutations/memory-one-credit.*`: the in-memory take judged for one
  transaction's credit (`room_for(K_TX * 8, …)`) -> green on the 64 MiB
  image. Fills tried there ended credit-bound with the open bucket full, or,
  with three blocks written first to offset it, bound by data buckets with
  four or more credits to spare; no state built put an in-memory take across
  the credit boundary.
- `arm-rows-c4d1db6e2-run-41947682423.txt`: the guest runner's aarch64 rows
  at c4d1db6e2: 5 passed, all green.
- `ci-host-9fe8f779e.log`: `cargo run -- --ci host`, exit 0, 108 steps.

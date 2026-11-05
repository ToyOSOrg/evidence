# #1152 round 11: review r7's blockers

- `mutations/no-self-cut.*`: `Mount::extend` without cutting itself back ->
  `a_refused_extension_gives_back_what_it_took` red (range grew by 96 KiB,
  room 819 200 -> 0).
- `mutations/one-credit.*`: each take judged for one transaction's credit ->
  the take's assert fires in `a_write_is_one_extent_for_each_run_of_contiguous_blocks`.
- The 8 KiB-bucket case of `small_blocks_and_a_journal_position_off_a_block_are_refused`
  panicked in `Writer::new` before the ring check moved last (reproduced, not
  kept as a log).
- `host-micro-79cd415d4.log`: the host model's 4 KiB write and scattered
  overwrite costs after these changes, as round 9's.
- `ci-host-c4d1db6e2.log`: `cargo run -- --ci host`, exit 0, 108 steps.
- `arm-rows-a1f07627e-run-41941136592.txt`: the guest runner's aarch64 rows at
  a1f07627e: 5 passed, and the job red only on a leftover in its $TMPDIR
  (`rustix_test_can_compile`, a build-script probe), before #1180 gave
  bootstrap a $TMPDIR of its own.
- The osbench at a1f07627e is in `../r10-known-gaps/osbench-a1f07627e/`.

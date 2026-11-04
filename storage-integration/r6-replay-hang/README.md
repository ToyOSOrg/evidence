# #1152 round 6: the osbench_persist hang after a reboot, and r3's blockers

## The hang

osbench round 2 at 45283fbc5 stalled on both benches in osbench_persist's
first DATA mkdir after its reboot; the test runner killed it at its bound.

Reproduced on the host (`hang.rs`, a scratch harness, not committed): a
sparse file model of the T14's DATA geometry (44 564 480 blocks) is
formatted and driven through osbench's persist and fs.disk call sequence at
a tenth of its repetitions by 94fdd7faa's engine, then dropped without an
unmount. 45283fbc5's file server mounts it (3.0 s, replay) and its first
mkdir does not return in 60 s (`45283fbc5-hang.log`).

- `45283fbc5-sample.txt`: macOS `sample` of the stall: Mount::finish ->
  take_into -> Pending::transfer, self time in transfer (Run::find, Run::at).
- `45283fbc5-instrumented.log`: the same with take_into instrumented: one
  take_into of the accounting leaf capturing 1 526 890 entries (replayed
  accounting deltas, a handful of positions), transferring them one at a
  time at about 0.45 ms each, each transfer walking every entry at its
  position.
- `fixed-run.log`, `fixed-rss.log`: at the fix (c836688ce's engine), the
  first mkdir takes 0.33 to 0.44 s; the test binary peaks at 1.0 GB
  resident (filed as issues/a-bcachefs-replay-holds-its-whole-journal-window-in-memory.md).

## Negative controls (applied, run, restored; release unit tests)

- `mutations/hang`: per-delta capture and transfer restored ->
  the_first_transaction_after_a_replay_takes_each_delta_once red,
  262 657 entries looked at for 1 551 replayed (bound 16 per entry).
- `mutations/b2/every-key.*`: drain for every key ->
  a_transaction_after_a_replay_grows_a_node_by_one_transaction_at_most red
  (renames grew a node by 6 872 bytes); `room.*`: room of the whole K_TX ->
  red (creates grew a node by 4 224 bytes).
- `mutations/b1`: write_reserved's old sector -> 
  a_reserved_write_inside_a_large_block_lands_on_that_block red
  (Checksum("extent")).
- `mutations/b3`: the whole other-volume copy case before the fix -> red
  ("opened"); after -> green.

## Checks at the head

- `ci-host-a0098f4d4.log`: `cargo run -- --ci host` at a0098f4d4, exit 0,
  108 steps (a043c5e4b after it adds only an issue file).
- `x86-rows-a043c5e4b.log`: QEMU x86-64 on the x86 host at a043c5e4b,
  `cargo test --test toyos-build -- the_data_partition_beside_the_stick_is_designated
  nvme_disk_boots a_host_disk_beside_the_stick_is_left_alone
  kernel_objects_refused_alone a_spawn_from_an_image_frees_it_when_the_child_ends`:
  exit 0, 5 passed.

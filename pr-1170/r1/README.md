# pr-1170 r1 (head 10a098e7f)

- `steal2-lib.log`, `steal2-sim.log`, `steal2-loom.log`: the core's unit tests (447), the simulator,
  and `loom_sleep` (where the ask's model now lives), green.
- `steal2-control.log`: `loom_sleep` with `--features ask-rings-first`: the ask's model red.
- `control-steal2.log` + `control-stale-outstanding.patch`: `probe_outstanding` without its
  answering condition: `a_thief_whose_victim_stopped_asks_another` red, "an ask a stopped CPU holds
  counted as an answer coming". Applied and restored in one run.
- `steal2-replay.log`: the corpus trace `old_migrate_kept_the_corpse_i14` replayed at the head, and
  `cargo run -q -p kernel-sim -- shrink old_migrate_kept_the_corpse 135`: both fail I14's "killed
  and then migrated" half.
- `host-steal2.log.gz`: `cargo run -- --ci host` at 10a098e7f: rc=0, 109 steps.

# pr-1170 r2 (head 5206f73fa)

- `steal3-lib.log`, `steal3-sim.log`: the core's unit tests (447) and the simulator, green, on the
  r2 edits before commit (the committed tree is the same).
- `control-steal3.log` + `control-stale-outstanding.patch`: `probe_outstanding` without its
  answering condition, against the r2 code: `a_thief_whose_victim_stopped_asks_another` red
  ("an ask a stopped CPU holds counted as an answer coming"), rc=101, then restored (`cmp` = yes).
- `host-steal3.log.gz`: `cargo run -- --ci host` at 5206f73fa (first line `HEAD`): rc=0, 109 steps.

# pr-1170 r0

- `steal-lib.log.gz`, `steal-sim.log.gz`, `steal-loom.log`: the core's unit tests, the simulator, and
  `loom_mailbox`, green.
- `steal-control.log`: `loom_mailbox` with `--features ask-rings-first`: the new model red.
- `control-steal.log` + `control-steal-no-retract.patch`: the stopped-victim unit test with the
  retraction removed: red.
- `host-steal.log.gz`: `cargo run -- --ci host` at b19550817: rc=0.
- `remote-steal.log.gz`: jan-pc, three x86 rows at b19550817: PASS.

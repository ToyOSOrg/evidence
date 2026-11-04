# pr-1166 r0: guests admitted by host CPUs

- `parallel/`: four rounds, per arm two harness invocations of the four virtsmpcase rows at once
  (`tools/abpar.sh`): base = main 65c77e6dd (this change reverted), head = ca16c59f2. `par.log` is the
  driver's summary; `par-<round>-<arm>-<a|b>.log.gz` each invocation's full output.
- `ambient/`: six rounds of one invocation per arm before #1160 landed (`tools/abgc.sh`).
- `controls/`: the two negative controls on the host tests, patch and run log, each red.
- `host-ci.log.gz`: `cargo run -- --ci host` at ca16c59f2, rc=0.

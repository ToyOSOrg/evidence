# ToyOS #1138 r1: the 100 ms miss, and the session that settles it

Head 4f52c3056 (main 190f3b164 + osbench's per-round ramp marks). Paths are masked: `<dev>` is the development
directory, `<scratch>` the agent's scratch, `<home>` the home directory.

- `model/`: the host model of a connection's first 300 ms on [tcp]'s test network. It is scratch: `ramp_probe.rs`
  goes into `system/netstack/shard/tcp/tests/` and is not committed. `model.sh` runs the head and three variants,
  each applied as a checked patch and reverted in the same run: `variant-window-stop-grows`, `variant-bucket-1ms`
  and `variant-no-pacing`. `model-summary.txt` holds every run's exit status and readings, and `model-*.log`
  the full output.
- `session/`: the T14 request (L1, t1, L2) with its decision rule set before the run, the image hash, the Linux
  binaries' hashes, and `judge.py`, which applies the rule: exact one-sided rank test of t1's five rounds against
  Linux's ten at 100 and 300 ms, and two-sided L1 against L2 as the exchangeability check.
- `checks/`: `cargo run -- --ci host` (exit 0, 108 steps green), the `--metal-readback` staging (exit 2: staged,
  no machine touched) and the Linux osbench build (EXIT=0).

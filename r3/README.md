# Review r3 (head bea91a3cb, on #1113 4ea1637ee)

## Host

- `ci-host-r3.log`: `cargo run -- --ci host` at bea91a3cb (`ci-host.rev`), 107 steps green.
  - `ci-host-r3.try1.log` is the first run, one commit earlier. It was red on clippy `manual_is_multiple_of` in two new tests, fixed by the amend.
- `r3-bcachefs.log` (182 unit, 57 integration) and `r3-fileserver.log` (90), exit 0.
- Red controls, each a diff applied, run (`cargo test -p bcachefs --release --lib`, filtered to the tests named), and restored byte for byte:
  - `red-r5-no-min-run`: runs of any length. `a_write_skips_single_holes_for_a_run_a_request_long` fails.
  - `red-r7-sweep-jumps`: phase two jumps SPREAD instead of sweeping forward. Both clustered tests fail, refused NoSpace once their one-lap budget is spent.
  - `red-r8-budget-per-run`: phase one's budget reset per run, not per call. `a_write_into_one_cluster_of_long_runs_reads_two_laps_at_most` fails, 7 runs reading 71 times against the bound of 39.
  - `red-r9-no-straddle`: no continuation past the lap's end. `a_free_run_straddling_the_start_is_found_whole` fails.

## Metal: X-D (r2, the minimum-run placement before r3's bound), both passed

`X-D-*.txt` hold the boots' `osbench v=2` and `disk-path-probe2:` lines.
- T14: the 8 MiB file in 10–11 runs, 68–73 flush requests, 63 full. `seq_write_fsync` 233 MB/s.
- AMD: 9 runs, 70 requests, 63 full. `seq_write_fsync` 639 MB/s, `fs.disk.seq_write.1048576` 913.
- r3 changes the search, so these boots stand for the placement only. The head reruns on metal.

Paths under the agent's home and scratch are masked.

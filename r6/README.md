# PR #1094 round 6: the --adopt-scratch alignment fix and the duplicate-name guard fix only

Head 69118dfcf731cd1e36ee68f2d9826e529f20f109 (one commit on main 4768c7650). Paths masked as before.

| file | command | exit |
|---|---|---|
| ci-host.log | `cargo run -- --ci host` at ci-host.rev | 0: 108 steps, all green |
| metal-unit.log | `cargo test -p toyos-metal --lib` (81) | 0 |
| checks-metal.log | `cargo test --test toyos-checks -- metal_` (23) | 0 |
| m1-guard-whole-line.{patch,log} | negative control: the guard keyed on the whole command line; `metal_` checks | 101 (`metal_rows_run_before_members_under_a_bound_the_members_widen`) |
| m2-spans-the-disk.{patch,log} | negative control: the table line back to `--new=1:0:0`; the alignment test | 101 |

The earlier rounds' evidence (r1, r3, r4) is for tooling this round cuts.

# PR #1263: a pass skips the timer write and the ask swaps it does not owe

Paths are masked: `<wakeperf>` is the assignment's scratch directory, `<scratch>` its parent, `<home>` the user's home.
The diagnosis this PR acts on is PR #1260's: https://github.com/ToyOSOrg/evidence/tree/3ddc686338d20b13528b597a7437e3b027479728/diagnosis

## checks/

- `pr2-checks-pre.log`: at 7babee0be, the kernel library's tests (`cargo test -p kernel --lib`, and with `sched-check`) and the clippy shapes of `build/clippy.rs` that compile the touched files; each command's exit code.
- `pr2-mutations.log`, `mutations2.py`: the new tests' negative controls at 564d662b1, each applied, run and restored. T1 to T3 abort their test binary when the assertion's panic meets a task's drop guard, so no `test result` line follows the named panic.
- `pr2-checks.log`, `pr2-checks-extra.log`: the same at ed26632e2 (code unchanged since 564d662b1 but for a test's unused binding), plus `kernel-sim`'s clippy and the AArch64 `boot-actuators,test-actuators` shape.
- `pr2-models.log`: `cargo run -- --ci host models` at 564d662b1: 78 of 79 steps green; `kernel-sim`'s `policy` test `an_interactive_wake_waits_out_at_most_one_request` red (see `policy/`).

## policy/

- `policy-runnerup-seeds.txt`: of 400 seeds of `kernel-sim run interactive_mix:1:4`, those whose sleeper waited more than 2.25 ms on two or more wakes, under main's timer behaviour (`base`: #1263 with the skip's guard ANDed with `false`) and under #1263 (`head`).
- `simdbg.patch`: the measurement-only prints those counts were read with, and the counting command.
- `base-seed15-excerpt.txt`, `head-seed0-excerpt.txt`: the events before each long wait: the sleeper's wake lands in the pass that ends a hog's request, and the next hog is scheduled.
- `breach-classification.txt`: each breaching run's long wakes, by how long the sleeper ran before it blocked: the first after 0 µs (a zero-lag tie with the hogs' fresh request), the second after 250 or 500 µs (the debt its group carries back).
- `core-reproduction.txt`, `core-reproduction.patch`: a scratch core test (never committed) printing the groups' virtual time, deadline and lag at each pass: the sleeper's group rejoins with negative lag after a burst and its deadline falls behind the hogs' fresh request.
- `pr2r-checks.log`, `pr2r-models.log`: at the head rebased onto #1266, 000bc1d72: tests and clippy exit 0; models 79 steps green.
- Round 2 at 9ca012645: `pr2r-checks.log`, `pr2r-models.log` (79 green), `pr2-corpus-replay.txt` (each trace's header and its replay's first violation), `pr2-corpus-control.txt` (a header naming another invariant reds the corpus test).

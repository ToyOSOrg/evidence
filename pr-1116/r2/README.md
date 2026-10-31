# PR #1116 r2: the bundled A/B, base 0c7e62ca7 against head 28a55585c (#1111 + #1116 + #1117)

32 metal boots, all rc=0: 16 on each bench (the T14, LENOVO 20W0003AMZ, and the AMD bench, LENOVO 82A2). Each bench had 4 boots of each image (`benchcase` and `testcases`) per side, base and head interleaved (`request-*.txt`).

- `judge/<side>-<bench>-<k>.judge.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> osbench spawn_cost wake_onto_busy [affinity_pins]`, run with the tree at that side's revision.
- `lines/`: each boot's osbench, `spawn_cost`, `affinity_pins`, `wake_onto_busy` and `TEST_END` lines, plus its `boot.txt`.
- `compare-<bench>.txt`: `python3 -I compare.py <ab2> <bench>`. For each row it gives both sides' 4 p50s, the ratio of medians (head/base) and the exact two-sided Mann-Whitney p. At 4 against 4, a row resolves (p = 0.029) only when one side's runs all beat the other's. With 168 rows, about 5 resolve by chance alone.

## Verdicts

- **Base:** every boot passed, except T14 boot 3's `wake_onto_busy` (exit -5, "the waker left CPU 1 for 6"). That is the statistical-staging failure that affinity removes.
- **Head:** `spawn_cost`, `wake_onto_busy` and `affinity_pins` passed on all 8 boots. `affinity_pins` exited 0 every time, holding 8 CPUs on the T14 and 16 on the AMD.
- **Head's `osbench` was red on all 8 boots:** `osbench_sched` exited 1, refusing `wake.onto_busy` ("no CPU but the waker's and the interrupts' to keep busy"). `mem.munmap_touched_remote.4k` was refused too.
  - Both are one defect in #1116's osbench port: `sys::allowed_cpus` read the calling thread's mask, and a pinned thread's mask names only its own CPU.
  - It is fixed in "osbench: a placement reads the CPUs the process began with".
  - `probe/` checks the fix on a 4-CPU TCG guest, with `osbench_capability_groups_exit_0` temporarily pointed at `osbench_sched` (`probe-test.patch`, never committed). Unfixed, `wake.onto_busy` refused exactly as on metal and `osbench_sched` exited 1. Fixed, the row measured (n=200) and `osbench_sched` exited 0.
  - In both probe runs, `osbench_mem` then went quiet under TCG and hit the harness's stall ceiling. So the mem row is not shown fixed in a guest. It shares the same placement call.

Paths under the home directory read `$HOME`.

## The stack rebased onto origin/main 49559ddb2

- `rebase/ci-host3.log`: `cargo run -- --ci host` at `7ea4e3206`, 108 steps all green, exit 0.
- `rebase/qemu3.log`: the two affinity QEMU tests, both PASS, exit 0.

# PR #1111 r2: where the AMD's ipc and fs pairs ran, and the tty_interrupt stall

## The AMD diagnostic (ab3)
There were 9 AMD benchcase boots, 3 per arm, interleaved, each exiting 0:
- base: `d51d28819`, main `69512b82b` plus osbench's `ran=` field.
- no1117: `599bb55a3`, base plus #1111 and #1116.
- full: `02a14edb7`, no1117 plus #1117.

The T14 had 2 benchcase boots of the full arm.

- `judge/*.judge.log`: `--metal --metal-readback <dir> [--metal-host toyos@bench-amd] osbench` with the tree at each arm's revision. All 11 report `PASS osbench`, exit 0.
- `lines/`: each boot's osbench, `TEST_END` and kernel `topo:` lines.
- `placement.txt`: for each AMD boot, the `ipc.reqrep.8` and `fs.disk.read_4k_at` p50, and where each side ran, from the row's `ran=` field.
  - The LLC column agrees with the kernel's own `topo:` lines: cpu0–7 are LLC 0 and cpu8–15 are LLC 1. The script asserts that.
  - **The row's value follows the placement in every arm:**
    - `ipc.reqrep.8` read 8.39–8.55 µs split across the LLCs, 6.66–6.85 µs in one LLC, and 6.18 µs on one CPU.
    - `fs.disk.read_4k_at` read 11.57–11.71 µs split, 9.65–9.68 µs in one LLC, and 11.10 µs on the file server's SMT sibling. The file server is on cpu10 in every boot.
  - Split rows per arm: base 5 of 6, no1117 3 of 6 (plus 1 SMT pair), full 4 of 6.
  - At 3 boots an arm, nothing ties the slow mode to #1111 or #1117. The first A/B's "head slower on the AMD" is consistent with where each boot happened to place the pairs. Neither spawn placement, before or after #1117, nor wake placement keeps a request/reply pair inside one LLC.
- The rows #1116's osbench fix restored measure on every boot that carries the fix: no1117, full and the T14's full. `wake.onto_busy` has n=200. `mem.munmap_touched_remote.4k` reads `windows_refused=0/10`. `osbench_sched` and `osbench_mem` exit 0.

## tty_interrupt (`libc_children`, local QEMU x86-64, 2 CPUs)
`tty/<rev>-<n>.log`: `cargo test --test toyos-build -- libc_children`. Each log's last line gives its exit and revision.

| revision | runs | failed |
|---|---|---|
| main `24a538c88` | 4 | 1, run 6: `stalled at the nested line held` |
| `f5ae75f6b` (#1111's step 1) | 6 | 0 |
| `dd9bf974d` (#1111's head) | 3 | 2: run 1 the same stall, run 2 `signal_quit: stalled driving the child that reloads` |

It reproduces on main, so it is not #1111's. `issue-draft.md` records it.

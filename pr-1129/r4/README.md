# PR #1129: ab6 judged, and the move kept off the waker's core (`b01360923`)

- `judgment.md`: the reading. `resolved.txt` comes from `pr-1111/r5/resolved.py`. `lines/` holds each boot's osbench and `topo:` lines with its runner verdict.
- `judge/`: the judge logs, each run in the pinned check tree at its side's revision. `osbench` PASSes in all 8. The two I219 rows are T14-only and red on the AMD.
- `mutations/`: `r3-host.log` is the #1129 host tests with the fix, exit 0. `mut-1129-core.patch` drops the core check; `mut-1129-core-host.log` shows `a_move_stays_off_the_wakers_core` red (the task goes to cpu5, the waker's sibling), exit 101, restored.

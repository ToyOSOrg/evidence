# PR #1129 review r1 (`1178599c4`) and the ab5 judgment

- `measure-k.txt`: server moves and split-pair convergence over 40 seeds for k = 1 to 12, with the scenarios at 24 rounds, from a temporary print-only test (never committed).
- `streak-iid.txt`, `streak_iid.py`: the move rate of a run of k under independent, even arrivals, by direct simulation, against 1/(2^(k+1)-2).
- `fanout.txt`: a temporary scenario (16 futex waiters woken by one producer on cpu0 of the AMD shape, 16 rounds, shipped balance), 20 seeds, migrations with the rule and with `mutations/mut-fan-norule.patch`.
- `1129-kernel-lib.log` (388 passed), `1129-sim.log`: the review tree, exit 0 each. Host CI at `1178599c4` is in `pr-1111/r4/ci-host-1178599c4.log` on branch `pr-1111`.
- `mutations/`: each patch applied, run and reversed by `mutate.sh` (on `pr-1111`); `*-host.log` is the kernel library filter, `*-sim.log` the simulator filter.
  - `rung`: the old predicate; the two-run test reds.
  - `k1`, `k4`: `WAKER_RUN` 1 and 4; the server test reds.
  - `norule`: split_pair, the run test and the two-run test red.
  - `mask`: the mask test and the server test red.
- `ab5/`: the AMD A/B at `b8bd0ea02`, before this round. `judgment.md` is the reading. `judge/` holds the judge logs, run in pinned check trees at each side's revision. `lines/` holds each boot's osbench and `topo:` lines. `compare.txt` and `resolved.txt` come from `ab5.py`.

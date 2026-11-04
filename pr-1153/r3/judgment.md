# ab11 judged against decision-rule.md (fixed before staging)

Six AMD benchcase boots: base, spawn, spawn, base, base, spawn. All six runner verdicts read `passed`, and the orchestrator
reports EXIT=0 for all. base `520532b89` = #1117 + diagnostic; spawn `bbf88b647` = #1153 `501c228b3` + the same. Judge
output: `judge-ab11.txt` (`tools/ab11.py`, rc=0). Process-spawn split shares: `proc-spawn-llc.txt`.

## Verdict: LAND (subject to review). M1, M2, S1, S2 and S3 all hold.

- **M1 PASS:** at w4 every waiter has its own CPU in all six boots. At w16 one CPU holds 2 in every boot of both arms (the
  burst is wider than the CPUs left free beside the spawner's). The packing ab10 read (2-4 to a CPU on cpu0-5) is gone.
- **M2 PASS:** `wake.storm.drain.w16` 0.894 and `.w4` 0.844. `.w1` 0.750 resolves faster too.
- **S1 PASS:** 0 split pipe rounds in every spawn boot at every size. Base split rounds again, which makes its p50 1.8-2.4x
  slower at 256, 4096 and 65536.
- **S2 PASS:** no non-moded row resolves slower by over 3%. The largest are `wake.storm.call.w1` and `.w64` at +2.6%.
- **S3 PASS:** `work.build_shaped.j16` 0.974. `ipc.reqrep.8` does not resolve.
- **Also faster:** `thread.spawn_join` 0.777 (20.9 us in every spawn boot, 27 us in every base boot),
  `mem.malloc_churn.1048576.t16` +6% kops/s, `fs.mem.seq_write.*` +3%.

## Reported, not judged (moded rows, as the rule said)
- `thread.spawn_join.default` +3.8% and `.stack64k` +4.2%. These are the procs group's variants, which sat in the 20 us mode
  in every boot of both arms, so each resolves a small, consistent cost of about 0.8 us per spawn and join. Cause not
  established: the homes walk is one state word per thread of a process with few threads. A risk to watch, not
  attributed.
- `proc.*spawn*`: the share of children ending in the other LLC from their parent was 7-44% per boot in both arms. As in
  ab10, the rows follow it, not the arm.

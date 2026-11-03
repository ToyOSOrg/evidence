# ab11 decision rule (written 2026-11-04, before any ab11 image was staged or run)

#1153's second round: a spawned thread passes over the CPUs its process's threads call home, then prefers its spawner's
LLC. Arms: base `520532b89` = #1117 `c9f88d36e` + ab10's diagnostic + `wake.storm` homes; spawn `bbf88b647` = #1153
`501c228b3` + the same. Six AMD benchcase boots: base, spawn, spawn, base, base, spawn. "Resolves" means the arms' three-boot
p50 ranges do not overlap; ratios are mean p50 over mean p50.

## M, the storm's mechanism (ab10's wake.storm.drain.w16 +17%, .w4 +4%)
- **M1:** on every spawn boot `wake.storm.drain.w16`'s `homes` has at most 2 waiters on any CPU, and `.w4`'s at most 1.
  Base's are reported beside them.
- **M2:** `wake.storm.drain.w16` and `.w4`, spawn/base <= 1.03.

## S1, the pipe (the fix's purpose)
- At most 1 split timed round per spawn boot at each `pipe.throughput` size, and each size's spawn p50 mean >= 0.95 x base's
  same-LLC median round.

## S2, nothing else slower
- No row slower by over 3% where spawn/base resolves, except the following, which are reported, not judged:
  - `tail.*`;
  - the rows `issues/many-osbench-rows-on-the-amd-bench-are-bimodal-per-boot.md` lists as moded: `pipe.*`, `thread.spawn_join`,
    `proc.*spawn*`, the client/server `ipc.reqrep*`, `fs.disk.*` / `fs.disk.direct.*` metadata rows, `fs.mem.pread_8`,
    `persist.fsync_clean`, `wake.periodic.idle` and `crunch.single.deflate`;
  - `mem.anon.map`, which read +5-7% in every non-base arm of ab10, the no-move arm included.
- The `proc.*spawn*` rows are reported beside each boot's share of children ending in the other LLC (`proc_spawn_llc.py`).
- `fs.mem.seq_read.4096` (+4.7%, spawn only in ab10) is judged.

## S3, process spawns untouched
- `work.build_shaped.j16` and `ipc.reqrep.8`: no slower than 2% where they resolve.

## Verdict
- **LAND (subject to review):** M1, M2, S1, S2 and S3 hold.
- **M1 fails:** the mechanism fix did not take on metal; report the homes.
- **M1 holds and M2 fails:** the drain cost has another cause; report.

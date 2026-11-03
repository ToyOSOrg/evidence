# ab10 decision rule (written 2026-11-02, before any ab10 image was staged or run)

Four measurement-only arms, each with ab9's diagnostic plus `parent` fields that end `_by<who woke it>`:

| arm | revision | what |
|---|---|---|
| base | `3f4bae14d` | #1117 `c9f88d36e` + diagnostic |
| head | `4fd30a2fc` | #1129 `cebbdedd5` + diagnostic + the waker hunk |
| norule | `f4ddf7589` | head with `WAKER_RUN = u16::MAX`: all of #1129's plumbing (wakes name wakers, leaving marks, counting, the waker hunk), no move ever |
| spawn | `02f099a04` | the spawn fix `791d0a23b` (on #1117) + diagnostic |

Twelve AMD benchcase boots: base, head, norule, spawn, spawn, norule, head, base, norule, base, spawn, head (3 each).
"Resolves" below means the three boots' p50 ranges of the two arms do not overlap; a ratio is mean p50 / mean p50.

## #1129: rule against plumbing (head vs norule vs base)
- **P, plumbing:** every row where norule/base resolves. A slowdown over 2% there is #1129's plumbing cost, and blocks
  #1129 until explained or removed.
- **R, rule:** every row where head/norule resolves. A slowdown over 3% there is the rule's cost, and blocks #1129.
- Each row ab9 blocked on is classified P, R, both, or neither (resolves in neither pair):
  - `thread.spawn_join`
  - `fs.disk.seek`
  - `mem.anon.map`
  - `mem.munmap_touched_remote.4k`
  - `wake.storm.call.w64`
  - `wake.storm.drain.w4`
- **Gain:** `ipc.reqrep.8` head/norule <= 0.90, the rule's own gain. `work.build_shaped.j16` head/base <= 1.015.
- **Build parent identified:** head's and norule's `work.build_shaped.j16` `parent` field lists who woke the parent (`_by`).
  It is reported whatever it reads.
- **Pipe:** head against norule per class, as ab9's D2 (>= 0.95 per size and class with at least 4 rounds per arm).
- **#1129 LAND-eligible (subject to review):** no P slowdown over 2%, no R slowdown over 3%, the gain holds, the build
  holds, and pipe passes. Anything else: report the classification, not a verdict on k.

## Spawn fix (spawn vs base)
- **S1:** on the spawn arm, at most 1 split timed round per boot at each pipe.throughput size (4096, 16384, 65536). Each
  size's p50, mean over boots, >= 0.95 x base's same-LLC median round.
- **S2:** no row of spawn/base slower by over 3% where it resolves, except `tail.*`. Rows to read with care:
  `thread.spawn_join`, `wake.storm.*` (threads one producer spawns), `fair.*`, `pingpong.*`, `work.*`.
- **S3:** `ipc.reqrep.8` and `work.build_shaped.j16` resolve no slower than 2%. They spawn processes, which the fix does not
  touch.
- **Spawn fix LAND (subject to review):** S1, S2 and S3 hold. Otherwise report which failed.

## Health
Every runner verdict `passed`; osbench and the benchcase judges PASS apart from the T14-only I219 rows.

# ab9 decision rule (written 2026-11-01, before any ab9 image was staged or run)

Arms: base = #1117 `c9f88d36e` + the shared diagnostic; head = reworked #1129 + the same diagnostic + the head-only
hunk that writes each wake's waker CPU into the diary's Wake record. Six AMD benchcase boots, order
base, head, head, base, base, head. All arms measurement-only; none lands.

Facts fixed before the run (from ab8's means, `fit-ab8.txt`): in all 18 ab8 pipe rows the number of slow rounds the mean
implies equals the number of rounds whose writer ran in the other LLC (0-7 / 8-15) from the reader. That is an
inference from means; ab9 measures it per round.

## D0, the mechanism of pipe.throughput's slow mode (both arms, every size, every timed round)
- Each round is classified `split` (reader's and writer's most-picked CPUs in different LLCs) or `same`.
- CONFIRMED if at 16384 every `split` round reads < 5000 MB/s and every `same` round > 7000 MB/s, in both arms, with at most
  one exception per arm, and each exception is explained by its own round record (a move, a neighbour on the cores, or a
  side picked on more than one CPU). Otherwise NOT CONFIRMED, and the slow mode stays unexplained.

## D1, build cost (the exit-wake rework's target)
- PASS if mean over boots of `work.build_shaped.j16` p50 on head <= 1.015 x base's. FAIL if > 1.03 x. Between: UNRESOLVED.
- Mechanism check, reported whatever D1 reads: head's `parent` field should show the parent's wakes as none-named and
  0-1 cross-LLC moves per boot. If D1 FAILS with that, the exit-wake inference was wrong.

## D2, pipe.throughput (4096, 16384, 65536), judged per class, not by p50
- Per size and class, the median of all timed rounds per arm. PASS if head >= 0.95 x base in every size/class with at least
  4 rounds in each arm. Count split rounds per arm and report them; a difference in that count is the bench's writer
  rotation against wherever the reader sits, and is reported, not judged, if D0 is CONFIRMED.
- If D0 is NOT CONFIRMED, D2 falls back to p50 per boot (head >= 0.95 x base mean) and the verdict cannot be LAND.

## D3, the gain #1129 exists for
- PASS if mean `ipc.reqrep.8` p50 on head <= 0.90 x base's.

## D4, thread.spawn_join
- Reported: head mean p50 / base mean p50. Above 1.02 with non-overlapping boot ranges is a cost that blocks LAND.

## D5, health
- Every runner verdict `passed`; osbench and the benchcase judges PASS apart from the T14-only I219 rows.
- Every other row whose head and base boot ranges do not overlap is listed with its ratio. Each slowdown over 3% is a
  blocker unless it is `tail.*` (a known head bias, 0.5-1.7% in ab5-ab8) or explained.

## Verdict
- LAND (subject to review): D0 CONFIRMED, D1 PASS, D2 PASS, D3 PASS, D4 not blocking, D5 clean.
- Anything else: #1129 does not land; report which part failed. k is not changed on this run's evidence alone.

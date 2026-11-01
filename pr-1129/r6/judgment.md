# ab8: why pipe.throughput.16384 halves under #1129, and a bisect of review r1

Six AMD benchcase boots, order base, head, k2, k2, head, base; every runner verdict `passed`. Metal-only arms, none lands:
base `86c3df248` (#1117 `e48eee9d1` + diagnostic), head `259cd4e51` (#1129 `9dcc24ee8` + diagnostic), k2 `51b69a0f8` (head with
WAKER_RUN = 2). The diagnostic (`diag-ab8.patch`) gives pipe.throughput, per timed round, each side's mode CPU and the process's
migrations / cross-LLC migrations / wakes / picks from the kernel diary (no ring overflowed: `lost0` throughout). Judge logs:
`judge/`. Two boots per arm classify; they do not rank.

## pipe.throughput.16384

| arm | p50 MB/s | mean | min..max |
|---|---|---|---|
| base | 8192, 8434 | 6242, 6391 | 3484..8553 |
| head (k=8) | 3657, 3575 | 5702, 5723 | 3526..8660 |
| k2 | 8359, 8486 | 7681, 7808 | 3513..8624 |

- Every arm's rounds are bimodal, about 3.5 against 8.4 GB/s. The arms differ in how many of the 7 rounds land slow: by the means
  about 3 in base, 4 or more in head, 1 at k = 2. So the slow mode exists without the rule, and a run of 8 makes it more frequent.
- **Nothing bounces.** Each round has 0 or 1 migrations of the process and 2-10 wakes, against 75-81 picks.
- **Placement does not decide it.** k2's second boot ran its reader on cpu10 against writers on 13, 14, 15 and 0, the CPUs of both
  head boots' rounds, and read 8.5 GB/s; head read 3.6 there.
- So the cost is not where the two sides run, and not a migration of them. The diagnostic does not record other processes, so
  whether a run of 8 leaves some other busy thread on the reader's CPU or SMT sibling, which a run of 2 would have moved, is not
  established.

## The rule itself, whatever k is

- `ipc.reqrep.8` 6.60-6.68 us on head and k2, all pairs on two cores of one LLC, against base 8.20-8.29 split. `reqrep.65536`
  about 30 us against 50.5-51.9.
- `work.build_shaped.j16` 269.0-270.3 ms on head and k2 against 257.7-259.9 on base: about +4%, in all four rule boots.
  Inference: the build's parent is woken only by its compile children's exits. Spawn placement starts children in runs within
  one LLC, so the parent follows children that are already dying, paying a move each time.
- `fs.disk.seq_read.1048576` and `fs.mem.seq_read.4096` read 2-7% lower on the rule's boots, in three of four.
- `pipe.throughput.65536` reads about 10 GB/s at k2 against 4.7-4.8 on base and head; `pipe.throughput.4096` about 5.1 on head and
  k2 against 1.9 on base. Both are as bimodal as 16384.
- `pingpong.futex.cross_core` 4.50-4.60 us on every arm. `tail.*` +0.5-1% on head and k2.

## Verdict

#1129 cannot land as it stands. Its request/reply gain is large on every arm. But the rule costs a parallel build 4% whatever k
is, and at the run length review r1 chose it halves `pipe.throughput.16384` more often than not, for a reason not yet found.

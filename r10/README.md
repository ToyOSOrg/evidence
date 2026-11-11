# PR #1131 r10: the finishing measurement, judged

Arms, `osbench_disk`, three boots each per bench, interleaved, all on main `ad5db5a65`:
M' `349ccb26b` (the after-idle row, no APST) and P' `047e0a708` (M' plus the driver's APST). Linux
`osbench persist` after each round and `sudo osbench nvme` last. Every step ran once and returned
0 or `passed` (`rows/*-chain.log`). Rules: `../r9/metal/rules.txt`, amended before any boot.

- `verdict.md`: what `judge.py` printed.
- `rows/`: what it read, extracted from each boot's `kernel.log` and each Linux run's stdout;
  CPU and drive model strings masked.

## Under the rules

| | AMD | T14 |
|---|---|---|
| L1 no back-to-back row over 5% worse and resolved | pass: nothing moved more than 4% | pass: nothing worse; six rows better and resolved |
| L2 each P' boot logs the table Linux reads | pass | pass |

Both: `0->4, 1->4, 2->4, 3->4 after 100 ms`, in all three P' boots and in Linux's read.

## Reported

**First durable write after idle**, median of p50s (range):

| bench | P' | M' | Linux | P' over Linux | worst sample P' / Linux |
|---|---|---|---|---|---|
| T14 | 14.31 ms (14.20-14.51) | 5.95 ms | 13.02 ms (12.99-13.04) | +1.29 ms, 10% | 18.34 / 13.75 ms |
| AMD | 11.33 ms (11.15-11.34) | 4.19 ms | 10.70 ms (10.58-11.47) | +0.63 ms, 6% | 11.78 / 11.83 ms |

The wake itself (P' minus M') costs 8.4 ms on the T14 and 7.1 ms on the AMD. The AMD's P' boots
lie inside the range of Linux's runs; its median is 6% over Linux's, one point past the 5% the
rules named for "about parity".

**The T14's slow mode across the idle row.** A row is slow when its p50 is over 3 ms.

| boot | `write_4k_fsync` before the idle row | durable rows after it |
|---|---|---|
| r1-M' | 6.56 ms slow | 6.79 to 7.75 ms, slow |
| r2-M' | 5.95 ms slow | 6.30 to 6.94 ms, slow |
| r3-M' | 5.74 ms slow | 6.75 to 7.70 ms, slow |
| r1-P' | 1.10 ms fast | 1.06 to 1.28 ms, fast |
| r2-P' | 6.28 ms slow | 0.98 to 1.32 ms, fast |
| r3-P' | 6.45 ms slow | 0.98 to 1.28 ms, fast |

- M': 3 of 3 began slow, 0 left the mode across 80 s of idle.
- P': 2 of 3 began slow, 2 of 2 left it.
- Beside these, not pooled: the first A/B's four boots with APST and the idle row, 4 of 4 left;
  with neither, 1 of 7 left by itself.
- By the rules this is consistent with APST ending the mode, and not proved by three boots an arm.
- Linux's own `write_4k_fsync` was slow in two of three runs (4.68, 5.22 ms) and every row after
  its idle row fast.
- The mode is why six T14 rows are better in P' and resolved: `append_4k_fsync` 0.98 against
  6.75 ms, `create_fsync_unlink` 1.16 against 7.44 ms, `write_4k_fsync_beside_1m` 1.28 against
  7.70 ms, `seq_write_fsync` 259 against 191 MB/s, `fs.disk.tree.100` 15.67 against 21.16 ms,
  `fs.disk.seq_write.4096` 194 against 177 MB/s.

The AMD's per-boot table in `verdict.md` prints "slow" and "mixed" for some rows; the 3 ms line is
the T14 drive's and means nothing there.

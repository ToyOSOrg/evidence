# PR #1202 and #1131: the A/B on `osbench_disk`, both benches, judged

Images: M `c9d6eff6f` (main plus the row), F `8a8ff27b9` (#1202), P `24f5de778` (#1131 on F).
Four boots of each per bench, interleaved M F P, every boot's verdict `passed`. Linux
`osbench persist` three times per bench and `osbench nvme` once, from P's revision. Rules:
`../metal/rules.txt`, fixed before any boot.

- `verdict.md`: every boot, every disk row, and the gates, as `judge.py` printed them.
- `judge.py`: reads each boot's `kernel.log` and each Linux run's stdout.
- `rows/`: what it read, extracted from those files: each boot's judge verdict, its NVMe
  driver's bring-up lines and its osbench disk rows; each Linux run's rows. CPU and drive model
  strings are masked. `*-linux-attempts.log` lists every Linux attempt's exit code; attempts
  that failed on a network drop were run again.

## Verdicts under the rules

| | AMD | T14 |
|---|---|---|
| F1 gain on the four durable rows | none: all four slower | none established |
| F2 no regression (over 5% worse and resolved) | **FAIL**: seven rows, the durable ones +55% to +71% | pass, because nothing is resolved |
| F3 correct | pass | pass |
| G1 wake cost, P against Linux | FAIL: 8.41 against 7.83 ms | pass: 8.12 against 11.92 ms (see below) |
| G2 worst after-idle sample | FAIL: 12.85 against 11.61 ms | FAIL: 17.89 against 13.07 ms |
| G3 back to back, P against F | pass | pass |

So #1202 is not ready (F2 fails on the AMD) and #1131 is not ready (G2 fails on both, G1 on the AMD).

## What the boots show

**AMD.** Every M boot is fast and every F and P boot sits at 4.00 ms, across six hours of
interleaving, so the spread in time does not weaken this comparison.

| row, median of boots' p50 (range) | M | F | P | Linux |
|---|---|---|---|---|
| write_4k_fsync | 2.36 ms (2.24..2.46) | 4.00 ms (4.00..4.01) | 4.00 ms (4.00..4.01) | 3.58 ms (3.01..3.67) |
| append_4k_fsync | 2.41 ms (2.32..2.51) | 4.00 ms (4.00..4.00) | 4.00 ms (4.00..4.01) | 3.84 ms (3.82..3.88) |
| create_fsync_unlink | 2.62 ms (2.54..2.93) | 4.47 ms (4.25..4.64) | 4.47 ms (4.29..4.67) | 3.32 ms (3.26..3.41) |
| write_4k_fsync_beside_1m | 3.03 ms (2.95..3.17) | 4.69 ms (4.63..4.83) | 4.67 ms (4.55..4.84) | 4.18 ms (4.08..4.19) |
| seq_write_fsync | 266 MB/s (243..274) | 212 MB/s (204..223) | 210 MB/s (202..222) | 502 MB/s (493..507) |

The forced write costs about 1.6 ms more than the write and Flush it replaced. F's samples
are tight around 4.00 ms (in one boot: min 3.71, p50 4.01, p90 4.25). Whether that figure is
the drive's or a cadence on the host is not established: no boot timed single commands.

**T14.** The drive's slow mode decides every durable row, and the arms did not draw it alike.

| boot | M | F | P |
|---|---|---|---|
| round 1 write_4k_fsync | 5.78 ms slow | 5.88 ms slow | 6.21 ms slow |
| round 2 | 0.97 ms fast | 5.87 ms slow | 5.98 ms slow |
| round 3 | 2.20 ms fast | 5.66 ms slow | 6.13 ms slow |
| round 4 | 5.92 ms slow | 6.24 ms slow | 5.83 ms slow |

- Slow against slow, F equals M (5.66..6.24 against 5.78, 5.92). Fast against fast is not
  established: F has no fast boot.
- F drew the slow mode 4 of 4 and M 2 of 4. That is too few boots to say the forced write
  causes the mode, and too lopsided to dismiss.
- In every P boot `write_4k_fsync` is slow and every durable row after the after-idle row is
  fast (append 0.93..1.08 ms, against Linux's 0.79..0.92): the mode ended during that row's
  80 s of idle, in 4 of 4 boots. P differs from F by both APST and that idle, so which of the
  two ends it is not separated.
- Those fast P rows are forced writes in the fast mode: 0.93..1.08 ms, against M's fast boots
  at 0.97 and 1.12 ms. So on this drive the forced write is no faster than a write and a Flush.
- G1 passes on the T14 only because P's back-to-back row was slow (6.05 ms), which shrinks
  the difference it subtracts. On absolute time P's first write after idle is 14.11 ms against
  Linux's 12.97 ms.

**APST, both benches.** ToyOS and Linux set the same table on both drives
(`0,1,2,3->4 after 100 ms`). The first durable write after idle is about 1.1 ms slower than
Linux's on both: 12.41 against 11.30 ms (AMD), 14.11 against 12.97 ms (T14). Before #1202 the
T14 read 17.70 against 13.06 ms (r7) and the AMD 11.29 against 11.36 ms.

# PR #1069, round 5: the per-ACK fix against a control, interleaved (2026-10-28)

One session on the T14: Linux, then A1 B1 A2 B2 A3 B3 A4 B4, then Linux (`session/t14-linux-1`, `-2`).
B is `3599f5bb3`. A is `3599f5bb3` with only the per-ACK fix reverted (`control-per-ack-reverted.patch`):
the cwnd-limited flag again cleared by the first ACK after a stop at cwnd, every counter kept. Masked as
round 1's. Same path. Means are the stop counters' sums over their counts.

| pair | A p50 (min–max) | B p50 (min–max) | cwnd-held A / B | mean cwnd at a stop A / B | mean SRTT A / B | card full A / B |
|---|---|---|---|---|---|---|
| 1 | 52 (32–60) | 59 (57–66) | 5.52 / 2.40 s | 301 / 349 KB | 4.8 / 5.3 ms | 78,183 / 100,316 |
| 2 | 31 (30–35) | 56 (55–64) | 8.91 / 2.54 s | 276 / 335 KB | 6.4 / 5.7 ms | 50,388 / 93,382 |
| 3 | 31 (30–41) | 57 (57–64) | 8.62 / 2.52 s | 266 / 351 KB | 6.8 / 5.5 ms | 53,454 / 99,423 |
| 4 | 40 (31–58) | 57 (56–65) | 6.60 / 2.21 s | 292 / 354 KB | 5.9 / 4.4 ms | 69,860 / 102,527 |

- B is faster than A in every pair; over the four of each, the exact rank test's one-sided p is 1/70.
- Linux at the session's start and end: 109 and 110 MB/s, no retransmission.
- ToyOS: one segment resent across the eight runs, no loss probe ended a slow start.
- `ci-host-10.log`: `cargo run -- --ci host` at `3599f5bb3`, exit 0.

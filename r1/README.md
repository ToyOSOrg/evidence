# PR #1078, round 1: the datasheet-required change and the prefetch tuning against main's driver (2026-10-28)

One session on the T14: Linux, then A1 B1 C1 A2 B2 C2 A3 B3 C3, then Linux (`session/t14-linux-1`, `-2`),
the AMD bench running `osbench-peer`. A is main's driver (`800e35c69` + `arm-a-main-driver.patch`), B the
datasheet-required change (`800e35c69` + `arm-b-required-only.patch`), C that and the prefetch tuning
(`800e35c69`). Masked as before. `judge/` is the harness's verdict on each readback, each judged with the
worktree at that arm's code: all nine PASS.

| round | A p50 MB/s | B p50 | C p50 | ring full A / B / C (of 15 s) | frames on the wire A / B / C |
|---|---|---|---|---|---|
| 1 | 86 | 85 | 88 | 7.85 / 7.80 / 8.07 s | 897,929 / 898,338 / 921,692 |
| 2 | 86 | 86 | 87 | 7.94 / 7.85 / 7.84 s | 917,301 / 911,552 / 912,051 |
| 3 | 85 | 86 | 87 | 7.80 / 7.89 / 7.82 s | 902,592 / 910,240 / 920,559 |

- Linux read 110 and 111 MB/s. No completion was unreported at any full answer in any run.
- B against A: no difference read. C against B: C higher in all three rounds, by about 1.5 %; with three
  runs each, the exact rank test's least p is 1/20 one-sided, 1/10 two-sided, which does not resolve it.
- B's and C's boot logs read, out of the T14's reset: TCTL 0x3003f0f8, TXDCTL 0x00000000, TARC0 0x00000403,
  RXCSUM 0x00000300, MRQC 0x00000000, RFCTL 0x00000000, and no receive address past the first valid. Each
  is a value the 82574 documents, set only in fields it documents.

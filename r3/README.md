# PR #1131 r3: the APST A/B at 500×, both benches

A is the control (no Set Features 0Ch); B is head `e996bcab4`. Both arms
carry the r2 probe. The rule is in `request-rule.txt`, and the tables are
`t14.md` and `amd.md` (`judge.py`). All 20 ToyOS boots ended with EXIT=0 and
passed their judges.

The AMD's round 2 was rerun last after ssh failures. On the AMD, Linux's
energy runs 1 and 2 and persist run 1 are void (ssh timed out), so its Linux
oracle is one energy run and one persist run.

| | T14 | AMD |
|---|---|---|
| §1 idle, median B−A | +285 mW, unresolved: no block | +4 mW, unresolved: no block |
| §1b excursions (≥ p25 + 4 W), A / B / Linux | 7 / 10 / 1 | 0 / 0 / 0 |
| §2 p50 cost against Linux's | 7.68 ≤ 11.94 ms, but confounded: both A disk boots ran in the slow write mode | 7.05 ≤ 7.80 ms |
| §2 worst sample against Linux's | **15.06 > 13.60 ms: FAIL** | 10.43 ≤ 11.61 ms |
| §3 back to back | no regression | no regression |

On the T14, B's own after-idle cost (after-idle minus back-to-back) is
13.4-13.7 ms, against Linux's 11.9 ms. The excursions occur without APST,
and Linux shows almost none.

Linux's APST parameters on the bench (`linux/*-apst.txt`) are tiers: 15 ms
latency with a 100 ms timeout, and 100 ms with 2000 ms.

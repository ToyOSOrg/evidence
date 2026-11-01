# PR #1131 r6: the APST A/B at Linux's tiers, both benches

A is the control (no Set Features 0Ch); B is head `a5d9ffc99`, Linux's tiers.
Both arms carry probe v3 (`patches/`). The rule was fixed before the run
(`rule.txt`). All 20 ToyOS boots ended with EXIT=0 and passed their judges
(`judge/`). All Linux steps ran with rc=0. `verdict.md` comes from
`judge6.py`.

Both benches' tables match Linux's: B logged `0,1,2,3->4 after 100 ms`, and
Linux's `nvme` read gave the same table on each bench.

| gate | T14 | AMD |
|---|---|---|
| G1: wake cost, after-idle p50 minus back-to-back p50, B against Linux | 13.52 against 8.29 ms: **FAIL** | 7.76 against 7.67 ms: **FAIL** (+1%) |
| G2: worst after-idle sample, B against Linux | 19.93 against 17.09 ms: **FAIL** | 19.34 against 11.74 ms: **FAIL** |
| G3: back to back | no regression | no regression |

## What the probe shows (W3)

**The wake's wait.** In a usual B sample, the first write after idle finds
PS4 and completes in 56-93 µs. The next command then waits 12.0 ms on the
T14 and 7.3 ms on the AMD, against 0.1-0.9 ms in A. With the probe, the wait
sits inside its Get Features, which the drive answers only once it is awake.
r1 had no probe and paid the same cost, so the wait is the drive's wake.

**T14.**
- Linux's after-idle write is a steady 13.0 ms. ToyOS's is 14.5-15.0 ms in
  the boots with fast back-to-back writes.
- G1's like-for-like cost swung with Linux's back-to-back mode: 4.7-5.0 ms
  here, against 1.0 ms in r3. Linux's slow mode is new evidence for the
  slow-write issue.

**AMD.**
- The usual sample's cost equals Linux's within 1%.
- Every B boot has one sample, the same one each boot (about 34 s into the
  row), where the first write itself takes 6.7-7.9 ms and the writes after it
  take as long again. That is two device waits, 17.5-19.3 ms in all. It is
  unexplained.

## Lid and display

- The lid reads asked for were not found among the Linux outputs.
- Linux's software display was On in every energy run (DPMS On, backlight at
  its setting).
- On the AMD, its Linux energy ran with Wi-Fi unblocked, its link (`energy.radios`).
- ToyOS ran the GOP display. The benchmark image starts no display driver
  until #1149.

## Idle (reported)

| bench | A idle p50 (mW) | B idle p50 (mW) | Linux idle p50 (mW) |
|---|---|---|---|
| T14 | 7083, 6737 | 7603, 7355 | 1709, 1520 |
| AMD | 1719, 1710 | 1732, 1702 | 1375, 1545 |

T14 excursions: A 9 and 5, B 22 and 11, Linux 2 and 2.

# kernel-memcpy A/B judged (base b49e6aec4, head dc535330f; 4 boots per bench, all exit 0)

Per arm: the mean of its two boots' p50s. Tables: table-read.txt, table-copies.txt (all four boots),
table-k6.txt; raw readbacks in runs/.

## Holds
- K1 (exit) holds on both benches. Head kernel read at d16 against its d0:
  - AMD: 8 KiB 902/771 = 1.17; 4 KiB 651/596 = 1.09.
  - T14: 8 KiB 1054/956 = 1.10; 4 KiB 823/781 = 1.05.
- K2 holds on the AMD: head read <= base at every d in 1..31 (0.91-0.96).
- K3 holds on both benches. Head read is 0.92-0.96 x base at d0 and every d >= W, on both sizes.
  - This is the forward-path change, from compiler_builtins' movsb/movsq/movsb to one rep movsb.
  - It is a gain on Zen 2 too, so the old sequence need not be kept anywhere.
- K4 holds on the AMD.
  - Below 32: down is 140 / 260 ns at 4 / 8 KiB, against movsb's 990 / 1946.
  - At 32 and 48: movsb 60-100 ns <= down.
- K5 holds on the AMD: down.65536.d16 is 2009 ns against movsb's 20463.
- K6 holds on both benches: no row worse than 1.05 x in both pairs. Rows outside 1.05 are one boot each:
  - AMD ipc.reqrep.*: 2-head only (65536: 49613 ns against 27952-29556 in the other three boots).
  - T14 fs.mem.pread_4k: 3-head only (1108 against 831-908).
  - The T14 pipe.* and fs seq_read rows are MB/s and rose 7-17%.
  - fs.mem metadata rows fell (got faster) to 0.71-0.93 on both benches.

## Fails, so the follow-up commit is applied
- K4 fails on Intel: down loses to movsb at every distance and length on the T14.
  - 8 KiB: down 241-256 ns against movsb 58-197.
  - 16 KiB: down 460-486 against movsb 109-369.
- K5 fails on Intel the same way: down.16384.d16 486 against movsb 259.
- K2 fails on the T14 at one row: read.8192.d96 is 1.03, from one boot (3-head 1443).
- Follow-up, per the rule: Intel never goes down.
  - With only AMD's rule left (any length), the length cap and the d < n test can never decide anything;
    both are removed.
  - Intel's K2/K3 from the in-process rows: with the head's rule removed, an Intel read takes rep movsb at
    every distance. The read rows at d >= 192, which took rep movsb, read 0.81-0.93 x base.

## Unexplained
- This run's T14 rep movsb at d16 is 136 ns at 8 KiB (2.4 x d0). #1133's copyat on the same bench,
  microcode 0xbe and day read 750 ns.
- Here the T14's slow distances follow 64-byte misalignment (d64, 128, 192, 256 fast; d96, 160, 224
  slow), not a page-alias window. The instruction and layout look the same; the cause is not found.
- On the AMD the stall reproduces: 1946 ns here against copyat's 2605.
- The kernel read rows show no base stall at d < 32 on the AMD (967 against 826 at d0, the same as every
  other d). So compiler_builtins' rep movsq sequence did not wait there, while rep movsb does (in-process
  990-20501).
  - Head's window is what keeps head's own rep movsb from stalling at d < 32. The read path's whole gain
    is the ~6% forward-path change.
  - The probe's 1.26% of file bytes at d 1..63 was therefore not stalling under base on the AMD.

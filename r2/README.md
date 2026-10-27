# r2: the T14 run (orchestrator, 2026-10-27)

- **B**: the scout `cpu-freq-scout` `3cdfa1a97`, the image staged in r1
  (sha256 c321adf6…f8c9). Verdict passed. Every CPU logs
  `scout_idle: ... taken=true` (8 of 8). leaf 5 reads (40, 40, 3, 0x11121020).
- **A**, the control: **not** the aeba59fb0 image staged in r1. The
  orchestrator used #1067's benchcase boot at `211829921`, which is main
  `8348c2a2c` plus a fileserver-only change, with the same `hlt` idle and
  the same osbench row. Verdict passed.

| row (p50) | A | B | A/B |
|---|---|---|---|
| cpu.clock max | 3789 in 16 groups, 3689 in boot | 4189 in 13 groups, 3789 in fair, net, procs, mem | |
| crunch.single.deflate | 60.76 ms | 54.67 ms | 1.11 |
| crunch.single.sha256 | 626.9 us | 568.0 us | 1.10 |
| crunch.single.matmul | 1.188 ms | 1.067 ms | 1.11 |
| crunch.single.parse | 39.73 ms | 35.93 ms | 1.11 |
| work.compress_inproc | 400.6 ms | 358.5 ms | 1.12 |
| work.build_shaped.j1 | 967.5 ms | 1175.8 ms | 0.82 |
| work.build_shaped.j8 | 159.6 ms | 164.9 ms | 0.97 |

**Is this control sound?** For `cpu.clock` and the `crunch.single` rows,
yes. Between aeba59fb0 and 8348c2a2c the kernel's idle path, HWP
declaration and CPU setup are unchanged. The only kernel change is #1057's
memory charging, and those rows are one-thread compute. A's clock matches
the 2026-10-24 session at aeba59fb0 (3789 in every group). For
`work.build_shaped`, which spawns processes, #1057 is a confound: B's j1
regression is not attributed to the scout by this pair alone. aeba59fb0's
own j1 was 922.6 ms on 2026-10-24, so B is slower than both bases.

Files: per-arm `kernel-excerpt.log` (osbench rows, scout and HWP lines),
`verdict.txt`, `image-sha256.txt`.

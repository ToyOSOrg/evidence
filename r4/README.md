# PR #1100 round 2: the scoreboard, four runs a side on each bench

ToyOS at 5e5c395b9, Linux the same revision's osbench (sha256 5c18d0f5...9d352),
interleaved Linux/ToyOS x4 by the orchestrator, AC, panel lit, radios blocked
(every Linux run's `energy.radios` says both blocked). `toyos-<bench>-<k>.txt`
are each boot's osbench lines; `linux-<bench>-<k>.txt` Linux's stdout;
`judge-*.log` the row judge over each readback (all PASS). One link name is
masked (`<vpn>`). `table.md` is `osbench-compare` over all sixteen files.

Round 1's two Linux defects are gone: Linux's `spin.all` ran 8 threads on the
T14 and 16 on the AMD, and every run read quiet within 7 s.

Resolved rows (exact two-sided Mann-Whitney, p = 0.029, every run of one
system beyond every run of the other):

| bench | row | Linux median | ToyOS median | ToyOS/Linux |
|---|---|---|---|---|
| T14 | energy.idle.package | 1648 mW | 7137 mW | 4.33 |
| T14 | energy.idle.pc2 | 102 permille | 994 permille | |
| T14 | energy.idle.pc6 | 21 permille | 0 | |
| T14 | energy.wake_10ms.package | 1219 mW | 2863 mW | 2.35 |
| AMD | energy.idle.package | 1472 mW | 1688 mW | 1.15 |
| AMD | energy.spin.all.package | 31676 mW | 31254 mW | 0.99 |
| AMD | energy.spin.all.per_chunk | 6164 nJ | 6002 nJ | 0.97 |

Not resolved: both benches' one-CPU spin (same power and work on both), the
T14's all-CPU spin (18.1 against 18.2 W), the AMD's 10 ms sleeper (Linux
1391-1705, ToyOS 1700-1710 mW; ties make its least reachable p 0.057, which
the compare words as "too few runs").

The T14's per-second series (`note=energy.idle.series`): ToyOS's idle seconds
scatter 4.6-20.6 W across the whole minute in all four boots, and its 10 ms
sleeper reads a flat 2.83-2.92 W; Linux's idle seconds scatter 1.0-9.8 W and
its sleeper reads a flat 1.14-1.50 W. Every ToyOS core is in C7 or deeper
997-998 permille of the idle minute.

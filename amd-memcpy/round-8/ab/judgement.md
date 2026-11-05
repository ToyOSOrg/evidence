# Round 8 judged: base5 a049276a6 against head5 d7e0c7037 (PR code 643b89bc8), AMD, base, head, head, base

All four boots rc=0, verdict passed. judge.txt is judge7.py against rule.txt, unchanged from round 7.

- D1 holds: base 8 KiB d16 1953 ns against 90 at d0 (both offsets).
- D2 holds: head 8 KiB rows at d 16..384 80 ns.
- D3 FAILS on `mem.memcpy.262144` alone: head 32336 MB/s against base 38485, 0.84 (round 7: 0.906).
  - Small rows recovered: 64 B 0.985, 256 B 0.987, 1 KiB 0.99 (round 7: 0.93, 0.93, 0.95).
  - 4 KiB 0.97: those copies now take copy_long's call at d0.
  - The same gap shows on copyat's unrouted 256 KiB d0 copy (head 9407/9278 ns against base 8205/8316, 1.13)
    and nowhere at 64 KiB (972 all four) or 1 MiB (94.2-94.5 us all four).
  - A 256 KiB copy runs ~15 instructions more than main's before the same rep movsb from the same data
    addresses (memcpy-disasm.txt). That does not explain 1-1.5 us.
- D4 holds: heap pair 1953 -> 80 ns.
- D5 holds at every size.
- D6 holds: ipc.reqrep.4096 1.049 and 1.000, .65536 1.002 and 0.985.

Unjudged rows, below 4 KiB, copyat.<n>.libc.s0, p50 ns, all four boots within 10%:
| n | d0 | d16 |
|---|---|---|
| 256 | 30 | 90 |
| 1024 | 31 | 270-301 |
| 2048 | 40 | 511-552 |
| 4096 | 60 | base 992, head 50-60 (routed) |
Every measured size below 4 KiB stalls at d16 and is not routed.

# Round 7 judged: base4 6cdf182b0 against head4 993461c7f, AMD, four boots (base, head, head, base)

All four boots rc=0, verdict passed, every job exit 0. Per arm: the mean of its two boots' p50s.
judge.txt is judge7.py's output against rule.txt as written. (Its "refusals" list matches the
munmap row's `first_refusal=none` field; there were no refusals.)

- D1 holds: main still stalls. Base copyat.8192.libc.s0.d16 and s16.d16 1953 ns, against d0 90/100.
- D2 holds: head 8 KiB rows at d 16..384, both source offsets, 80 ns (d0 90).
- D3 FAILS on one row, `mem.memcpy.262144`: head 36905 MB/s against base 40756, 0.906 of base, bound
  0.909. Both pairs agree and the arms barely overlap: head boots max 37399/37565, base boots min
  37301/37354, n = 15 each.
  - That copy runs at distance 0 and is never routed. Its only new code is the length and distance
    compares, so no mechanism in the copy explains a 10% loss over 256 KiB. Not explained.
  - The same row is on record as unstable on this bench: round 5's base read 19390/29365, and the
    2026-10-28 scoreboard shows a 45% range.
  - Small rows lose about as much as round 5 measured, within the bound: 64 B 0.93, 256 B 0.93, 1 KiB 0.95
    (round 5: 0.94, 0.94, 0.96). That is the hot path's cost.
  - Every 8 KiB row at d 0 and >= 512 is equal to base.
- D4 holds: the heap pair (distance 16) 1953 -> 80 ns.
- D5 holds at every size. Round 5's 4 MiB d256 failure is gone: head 383.7 µs against base 383.6 µs
  (both arms rep movsb above 1 MiB). 64 KiB d16 20434 -> 1042 ns, 1 MiB d16 330 -> 21 us.
- D6 holds: ipc.reqrep.4096 1.01 and 0.75, .65536 1.00 and 0.58 by pair; the slow arm in pair 2 is
  base boot 4.

Result: D3 fails as written, on mem.memcpy.262144 by 0.3% of its bound. Per the rule, #1133 does not
go for review on this round; the decision on that row is the orchestrator's.

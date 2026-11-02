# Round 5 judged (base3 80421e74a vs head3 0f861df89; 4 boots per bench; table r5/ab-judge.txt)

- C1 holds on the AMD and FAILS on the T14.
  - AMD: routed 8 KiB copies read 80-86 ns against d0 90, so the stall is gone and the copy is faster
    than distance 0.
  - T14: 82-103 ns against head d0 59, i.e. 1.39-1.71x. Against base's d0 (74) that is 1.1-1.37x,
    and base read 714-773 at d 16-64.
  - The worst T14 rows (s0.d16 101, s16.d32 103) are where aligned stores leave the loads 16 bytes off
    a 32-byte boundary.
- C2 holds for the matrix: d0 and d >= 512 within 1.1x. mem.memcpy.* hold except the T14's 64 B, where
  head boot 3 read 6873 MB/s in all 15 rounds against 16649-18226 in the other three boots. That copy
  is at distance 0 and never routed. Unexplained; one boot of two.
- C3 holds on the AMD (2570 -> 81) and FAILS on the T14 by a hair: 92 ns, 1.56x of head d0 59, against
  base 121.
- C4:
  - T14 holds everywhere (1 MiB 1.08-1.11, with its d0 control at 1.11 in the same boots).
  - AMD FAILS at 4 MiB: d256 597 against base 385 us, 1.55x. rep movsb did not stall there and the
    loop is slower.
  - The AMD wins at every other size, often hugely: 64 KiB d16 20449 -> 1042 ns; 1 MiB d16 330 -> 20
    us; 64 MiB d16 21.7 -> 9.8 ms.
- C5 holds on both: ipc.reqrep.* 0.99-1.00. Round 4's T14 4096 shift did not repeat.

Response (no new boot):
- The 1 MiB cap now applies on every CPU, not only where ERMS is reported. The AMD's 4 MiB regression
  goes, because above 1 MiB every copy is base's rep movsb, measured in base3. ERMS detection is gone.
- Recorded limitations:
  - on the AMD above 1 MiB the stall stays, as in base: 4 MiB d16 3.4x and 64 MiB d16 2.0x of d0;
  - the T14's routed copies run at 1.1-1.4x of rep movsb's best, against 10x before.

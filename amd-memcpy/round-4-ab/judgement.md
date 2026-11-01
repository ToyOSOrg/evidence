# Round 4 judged (base2 2fdc73934 vs head2 77488f3c4, one boot each per bench; table r4/ab-judge.txt)

- B1 FAILS on both benches.
  - T14 head: 83-89 ns at most routed distances against d0 65, which passes; but 125 ns (1.9x) where
    the destination's 32-byte stores straddle lines (s0.d16; s16.d32-384).
  - AMD head: 80 ns aligned (below d0's 90), 140 ns split (s0.d16, s16.d32-384).
  - base2's downavx rows show the same split on both benches. A split store costs as much as the stall
    the loop avoids.
- B2 holds: d0 and d >= 512 unchanged; mem.memcpy.* 0.92-1.02 (T14 64 B at 0.93, inside 1.1).
- B3 holds: heap T14 92 ns (1.42x of d0), AMD 80 (from 2565).
- B4 FAILS on the T14.
  - 1 MiB d16: 82.1 against base 37.7 us. Base was not stalled there (d0 40.9); the loop is slower, with
    split stores.
  - 64 MiB: d16 1.48x, d256 1.41x (10.1 against 7.2 ms). The loop's stores read the line first; rep
    movsb's with ERMS need not.
  - The AMD wins at every size: 1 MiB d16 331 to 20 us, 64 MiB d16 21.8 to 8.8 ms. Zen 2 has no ERMS,
    so its rep movsb is slow past the caches even at d0 (1 MiB 93.6 us).
- B5: read literally, W = 3072. On the T14 the aligned AVX loop beats rep movsb at 8 KiB almost
  everywhere, but the rule's AND over both source offsets picks up the split-store rows. Not applied; the
  window stays 512 until the aligned loop is measured.
- B6 FAILS on the T14 at ipc.reqrep.4096: 9702 against 8703 ns, with tight distributions (min 9537 against
  8562). 65536 is 0.92 and the AMD reads 0.61-0.77 (faster). A 1 us shift is more than two routed 4 KiB
  copies can cost, even split (about 0.2 us). Unexplained, from one boot each; round 5 repeats it.

Verdict: does not land. Revision 8aa56f3a2:
- each loop's stores are aligned to its width, its top 64 bytes stored unaligned once;
- copies over 1 MiB keep rep movsb where the CPU has ERMS.

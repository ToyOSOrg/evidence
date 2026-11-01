# Round 3 A/B judged (base 168b84871 vs head 6576b4dcc; 4 boots per bench; table: r3/ab-judge.txt)

- A1 FAILS on the T14. The routed 8 KiB rows read 136-151 ns there against d0 62, i.e. 2.2-2.4x, over
  the 1.6x bound. That is still a 5x gain over base (752). On the AMD A1 holds: 140 against 90
  (s0) and 100 (s16), within 1.6x + 10 ns.
- A2:
  - d >= 512 rows hold on both benches (at most 1.07x).
  - mem.memcpy.64 FAILS on the T14: 18797 to 15767 MB/s, 16% slower. Every copy of 64 bytes or more
    paid the route's arithmetic. 256 and 1024 read 7% slower, within the bound. The AMD reads 0.95-0.97,
    within it.
  - Not in the rule but found: on the AMD, d 32-384 regressed from 90 to 140 ns. The route covers
    distances the AMD does not stall at, and the SSE2 loop is slower than rep movsb.
- A3 FAILS on the T14 by a hair: heap 123/136 against d0 62, i.e. 2.09x. The base was 122, so it was
  neither slow before nor helped. On the AMD it holds: 2575 to 140 (1.56x of d0).
- A4 FAILS: T14 base d512 111 ns, 1.79x of d0, so the window by its own rule is short. But the SSE2 loop
  at 384 (136-150) is no faster than rep movsb there (129-142). The loop's rate, not the window, is the
  limit.
- A5 holds: ipc.reqrep.* at 1.00x on the T14 and 0.77-0.91x on the AMD (faster; base boot 1 is the
  AMD's usual slow first boot).

Verdict: the fix as of 4a3aa6248 does not land. Both benches retire about one store a cycle in this loop,
so 16-byte stores cap it at about 2x rep movsb's rate.
Revision 15a8464d3:
- the loop uses 32-byte AVX stores where CPUID and XCR0 allow, otherwise SSE2;
- the hot path pays one length and one distance compare.
Round 4 (base2/head2) judges it and also measures `downavx` at every distance, which sets the window.

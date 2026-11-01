# amd-memcpy: why a userland memcpy ran at a fifteenth of the T14's on the AMD bench

All rows are osbench lines extracted from the benches' kernel.log readbacks (other lines and the CPU
model string removed). Boots run by the orchestrator; every boot's job exited 0.

## Round 1, alias (branch amd-memcpy-scout 8582c16e8, measurement only): refuted
Rule in round-1-alias/request.txt. AMD aliasbase 8192 p50: heap.user 1944, heap.kernel 2625,
shm.user 80, shm.alias 90; scout kernel heap.kernel 2565. R1 fails: the linear alias costs nothing here.

## Round 2, copyat (branch amd-memcpy-copyat 02272ca2e, measurement only): cause found
Rule in round-2-copyat/rule.txt. libc memcpy, 8192 bytes, p50 ns, destination d bytes above the source
modulo 4096 (source 0 / 16 past a page):

| d | 0 | 16 | 32 | 64 | 256 | 1024 | 2048 | 4080 |
|---|---|---|---|---|---|---|---|---|
| AMD s0/s16 | 90/100 | 2595/2595 | 90/100 | 90/100 | 90/100 | 90/100 | 90/100 | 100/90 |
| T14 s0/s16 | 60/81 | 752/754 | 752/749 | 697/711 | 193/199 | 81/86 | 76/81 | 90/87 |

- M holds: anonymous pages copy at cache speed on the AMD (90 ns); memory type is not the cause.
- C1 holds on the AMD at d=16 only; C2 (source line offset) does not.
- The control premise failed: the T14 shows the same class over d = 16..256, up to 12x.
- H: dlmalloc put the two 64 KiB Vecs 16 apart on both benches (offsets 2672 and 2688). AMD heap
  2525 against the matrix's 2595: within 1.5x, explained. T14 heap 124 against the matrix's 752: not
  within; the heap pair is 64 KiB + 16 apart, the matrix's 1 MiB + 16 (inference: the T14 compares
  more address bits than 11:0; not verified).
- F: no candidate qualifies alone. `down` (SSE2 from the top) is flat at 140 on the AMD (1.56x of 90,
  over the 1.5x bound by 5 ns at the clock's 10 ns step) and 121-183 on the T14 (over 1.1x of libc
  where libc is fast). Routed (rep movsb, `down` at short distances): T14 bound holds at every row;
  AMD 140 against 135 at d=16. Implemented as routed; the round-3 rule states its 1.6x bound openly.

## Round 3, the fix's host checks (x86_64-apple-darwin under Rosetta, the host being arm64)
- libc-x86-rosetta.log: the four copy tests pass, exit 0.
- mutation-guard: the overlap guard removed reds `an_overlapping_forward_copy_a_page_apart_agrees`.
- mutation-head: the descending loop's last head store misplaced reds both forward-copy tests.
Base-against-fix metal rule: round-3-ab-rule.txt.

# PR #1075, round 2: TCTL keeping the part's MULR, against main's whole write (2026-10-28)

One session on the T14: Linux, then A1 B1 A2 B2 A3 B3 A4 B4, then Linux (`session/t14-linux-1`, `-2`).
B is `f9563de4f`; A is `f9563de4f` with TCTL written whole as on main (`control-tctl-whole.patch`).
ToyOS logs cut to osbench's, the runner's and the I219's TCTL lines; masked as before. `judge/` is the
harness's own judgement of each readback (`cargo test --test toyos-build -- --metal --metal-readback
<dir> osbench_lan`, A's with the control patch applied): every one PASS.

| pair | TCTL after bring-up A / B | upload p50 A / B MB/s | frames on the wire A / B | ring full A / B | cwnd-held A / B |
|---|---|---|---|---|---|
| 1 | 0x0003f0fa / 0x3003f0fa | 58 / 87 | 617,591 / 911,686 | 10.28 / 8.74 s | 2.62 / 4.06 s |
| 2 | 0x0003f0fa / 0x3003f0fa | 56 / 86 | 626,374 / 906,574 | 10.55 / 8.62 s | 2.26 / 4.12 s |
| 3 | 0x0003f0fa / 0x3003f0fa | 55 / 82 | 624,199 / 869,913 | 10.39 / 8.28 s | 2.34 / 4.53 s |
| 4 | 0x0003f0fa / 0x3003f0fa | 56 / 85 | 621,168 / 899,513 | 10.28 / 8.61 s | 2.48 / 4.20 s |

- The part kept MULR (bit 28) and RRTHRESH (bits 30:29, 01b) under B, and the bring-up cleared both under A.
- B is faster in every pair; over the eight runs the exact rank test's one-sided p is 1/70.
- No completion was unreported at a full answer in any run. ToyOS resent one segment in each of A2 and
  A4, none under B. Linux read 111 and 110 MB/s, resending none.

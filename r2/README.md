# PR #1132 r2: stage 2's T14 boot (B arm)

- Revision `display-stage2-ab` df14d21d6: display-stage2 b0c58dc88 plus stage 1's named-only `display_energy` row.
- Image sha256 d269de8bcefdf690…, which the orchestrator verified. The orchestrator ran it: exit 0, verdict passed, 201 s.
- Lines: `t14-stage2-b-lines.txt`. Verdict and timings: `t14-stage2-b-verdict.txt`.
- The comparison is stage 1's B rerun, `display-stage1-ab` d0dc7c34a (pr-1125 evidence r4).

What the boot shows:

- `tgl-display: DMC package 0002000c, main program 00010002 at 0x80000 for revision 0x01`. Revision 1h is display stepping C0.
- PWR_WELL_CTL1 went from 0x55 to 0x05 and PWR_WELL_CTL2 from 0xff to 0x0f, so PG1 and PG2 are on and PG3 and PG4 are off. DC_STATE_EN went from 0 to 2 (up to DC6). Each read back after the writes.
- No DMA fault, fault record, NotIsolated or NOT HANDED OVER line.
- The WM levels and the claim path read the same as stage 1.

| row | stage 1 B | stage 2 B |
| --- | --- | --- |
| idle PC2 / PC3 mean | 346 / 646 ‰ | 346 / 646 ‰ |
| wake_10ms package mean | 2647 mW | 2643 mW |
| wake_10ms PC2 / PC3 mean | 433 / 493 ‰ | 433 / 492 ‰ |
| spin.t1 package mean | 8158 mW | 8197 mW |
| idle package mean (p50) | 6625 (6054) mW | 7016 (5855) mW |

How the rows are judged:

- **PG3/PG4 off saves nothing this bench can resolve.** The 10 ms sleeper's 30-sample series spans 2594-2683 mW, and the two means differ by 4 mW.
- The idle package row is not a comparator in either run. Its series swings 4.2-17.7 W.
- With the pipe lit and no PSR, the engine does not enter DC5 or DC6 (Vol 12), and the residency did not move. That was the expected result.
- **The scan-out is still reading.** This rests on two things: the PC2/PC3 residency is identical to stage 1, and nothing faulted. It is an inference. Stopping the plane's fetches altogether gave 338/656 ‰ (pr-1100 r7), close to this boot's figures, so residency separates the two weakly. Nobody looked at the panel during this boot.
- `hda` is not in this image, so the PG3/display-codec risk is not tested here.

Only extracted lines are published. The raw log carries a MAC and partition GUIDs, and the boot record names the machine.

# PR #1125 r2: stage 1's T14 A/B

Two T14 boots at `display-stage1-ab` bb1f335f7, which is #1125's stage 1 merged with #1100's energy bench. Each is `osbench energy` on the bench image. The driver holds its claim for the whole boot, so A and B could not share one.

- **A**, `energybenchcase`: no display driver. Exit 0, 223 s, verdict passed. Image sha256 d4d61e82caaaa08e74d9224024569e9514c1dc086190f95ed9623709d3d9eefd.
- **B**, `displayenergycase`: `tgl-display` added. Exit 0, 227 s, verdict passed. Image sha256 fede1f946b570e009e57b9d54c39214a153526152097cb93926524b378da1485.

`*-lines.txt` are each boot's energy, driver and claim lines, extracted from the kernel log.

## What the driver did (B)

- The claim kept the RMRR: "domain3 keeps 00:02.0's reserved 0x9c000000..0xa0800000 at its own address", then "00:02.0 moves to domain3".
- Measured pixel rate: 138745 kHz. LINK M/N × 270 MHz gives 138778 kHz, a difference of 0.02 %.
- Latencies and SAGV block time are as the scout read them.
- WM levels went from `80004011 00004011 00004007 ×6` to `80004011 80010041 ×4 80014051 80020081 80020081`. These are exactly the host model's expected words.
- No fault records in either boot.
- **Not observed:** the panel itself. No camera or capture device watches it. That scan-out continued rests on two things: no DMA fault, and the package residency below.

## Energy (per-second p50, with min..max)

| row | A | B | change |
| --- | --- | --- | --- |
| idle package, mW | 6583 (4035..13312), mean 7092 | 6062 (4100..14244), mean 6749 | −521 at p50, −343 at the mean |
| idle PC2 ‰ | 995 | **346** | |
| idle PC3 ‰ | 0 | **648** | |
| idle PC6/PC7 ‰ | 0 | 0 | |
| 10 ms sleeper package, mW | 2860 (2846..2940) | **2691** (2664..2784) | −169, ranges disjoint |
| 10 ms sleeper PC2 / PC3 ‰ | 941 / 0 | 428 / 512 | |
| spin 1 thread, mW | 8196 | 8419 | +223 |
| spin 8 threads, mW | 18258 | 18299 | +41 |

## Judgement

- **The track's exit for this stage holds as far as the NVMe allows.**
  - The package leaves PC2 for PC3 with the panel lit.
  - That matches what stopping the plane's fetches altogether gave in pr-1100 r7: PC2 338 ‰ and PC3 656 ‰.
  - So the watermarks release everything the display held at this level.
- **PC3 is the cap, and it is the NVMe's.** Linux with APST off loses everything deeper than PC3 (r7). The comparison against Linux's 1622 mW idle waits for APST.
- **The idle row's power change is within its spread** in one boot each. The idle rows are bimodal, with a min near 4 W and max spikes above 13 W, so only the residency shift is established there.
- **The 10 ms sleeper's 169 mW saving is established:** its two ranges do not overlap.
- **The spin rows show no saving and are not judged**, which is expected because no package C-state is reached under load. The +223 mW at one thread is unexplained; it is one boot each.

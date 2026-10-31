# PR #1100 phase 3: what holds the T14's package in PC2

These are measurement scouts on the T14, not the PR's code. Every step had rc=0.

- `linux/`: the Linux runs.
  - `<step>.txt` is osbench's output, with one link name masked (`<vpn>`).
  - `pmc-package-cstates.txt` gives the PMC's PC2-PC10 residency (µs) gained across each step.
- `toyos/`: the ToyOS scout boot (`power-scout` `9fd3114fc`, verdict passed).
  - `scout-lines.txt` holds its osbench lines and the kernel's register and toggle lines.

## Linux, one condition at a time

The package figures are each row's per-second p50 and mean, in mW.

| step | idle p50 | idle mean | idle PC2 ‰ | deepest PC (PMC) | 10 ms sleeper p50 |
| --- | --- | --- | --- | --- | --- |
| A0 base | 1622 | 2533 | 100 | PC8 (most of the run) | 1224 |
| A1 NVMe APST off | **5127** | 6330 | 280 | **PC3**: no PC6-PC10 at all | 2521 |
| A3 e1000e unbound | 1740 | 2663 | 100 | PC8 | 1234 |
| A6 display off (DPMS) | 1204 | 1402 | 17 | PC8 | 1123 |
| B0 `nomodeset` boot | **2796** | 3277 | **976** | **PC2**: no PC3-PC10 at all | **2864** |

Void steps:

- **A2 (NVMe ASPM off) is void.** The kernel has no `link/` sysfs for the device, and `lspci` after the step still shows L1 enabled.
- **A4/A5 (PSR) are void.** The DRM device was `card1`, so `dri/0` named nothing.

Per `lspci`, Linux's NVMe link has ASPM L1 and all four L1 substates enabled and LTR on, on both ends. ToyOS's register dump shows the same link state: firmware leaves it so, and ToyOS does not change it.

## ToyOS scout (benchcase without netstack, 30 s each)

The toggles are cumulative.

| step | p50 | mean | PC2 ‰ | PC3 ‰ |
| --- | --- | --- | --- | --- |
| 0 base | 6550 | 7983 | 995 | 0 |
| wake 1 ms | 3215 | 3215 | 660 | 0 |
| wake 10 ms | **2831** | 2831 | 927 | 0 |
| wake 100 ms | 15424 | 14708 | 988 | 0 |
| wake 1 s | 12129 | 10928 | 994 | 0 |
| 1 I219 in D3hot | 6422 | 7999 | 995 | 0 |
| 2 NVMe LTR enable cleared | 6410 | 8701 | 995 | 0 |
| 3 pipe A's planes off | **5571** | 6808 | **338** | **656** |
| 4 pipe A's transcoder off | 5625 | 6598 | 338 | 656 |

PP0 was 290-582 mW and PP1 at most 30 mW in every row.

The firmware's display state, read before the display steps:

- One plane: PLANE_CTL_1_A = 84000008, X-tiled.
- Transcoder A drives DDI A (TRANS_DDI_FUNC_CTL_A = 8a000002).
- DC_STATE_EN = 0, so DC5/DC6 are not allowed.
- PWR_WELL_CTL2 = ff.

## What it says

- **The graphics left as firmware programmed them hold the package in PC2.**
  - Linux with no graphics driver goes from PC8 to PC2 and from 1622 to 2796 mW idle. Its 10 ms sleeper, 2864 mW, matches ToyOS's 2831 mW to within 1 %.
  - On ToyOS, stopping the plane's memory fetches alone releases PC2: 995 to 338 ‰, with PC3 at 656 ‰.
- **The NVMe without APST holds the package at PC3 at best and costs about 3.5 W when nothing wakes.**
  - Linux with APST off loses all PC6-PC10 and goes from 1622 to 5127 mW. That is the same shape as ToyOS's: high when idle, much lower under a 10 ms sleeper.
  - ToyOS with its planes off stopped at PC3, which is the cap APST-off puts on Linux.
- **The I219 is not a factor.** Unbinding it on Linux, or parking it on ToyOS, changed nothing.
- **Not explained:** ToyOS's 100 ms and 1 s wake rows drew 12-15 W. Linux has no rows to compare.

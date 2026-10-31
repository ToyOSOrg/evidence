# T14 idle power: two blockers, and a Tiger Lake display driver (proposal for the owner)

Evidence: pr-1100 r7. All figures are the T14's idle package power (per-second p50, in mW) unless a row says otherwise.

| | idle | 10 ms sleeper | deepest package state |
| --- | --- | --- | --- |
| Linux | 1622 | 1224 | PC8 |
| Linux, NVMe APST off | 5127 | 2521 | PC3 |
| Linux, no graphics driver (`nomodeset`) | 2796 | 2864 | PC2 |
| ToyOS (no APST, no graphics driver) | 6550 | 2831 | PC2 |
| ToyOS, display planes off | 5571 | — | PC3 |

## Blocker 1, the larger: NVMe APST, about 3.5 W at idle

- **Owner**: the NVMe driver, on the approved track `issues/diskserver-drives-nvme-apst.md`. This needs no new decision.
- **Prediction** (an inference): APST takes ToyOS's idle from about 6.5 W to about 2.8 W, the `nomodeset` figure.
- **Latency cost**: a non-operational state's exit latency, which the drive reports in its own table, lands on the first I/O after an idle period. The track's latency bound decides it. That cost goes on the scoreboard before landing, per your constraint.

## Blocker 2: the display left as the GOP programmed it, about 1.2 W at idle and 1.6 W under a 10 ms sleeper

- Stopping the scan-out's memory reads alone releases PC2 on ToyOS (995 to 338 ‰).
- Linux reaches PC8 with the panel lit, because its driver reprograms the display.
- Turning the panel off is not the fix: the fair state is lit on both.

### Proposal: a userland Tiger Lake display driver

It claims 00:02.0 with an ordinary device claim. It keeps the firmware's mode and surface (your ruling: GOP is the floor and the mode is the firmware's) and adds only power programming, from Intel's published Tiger Lake PRM (IHD-OS-TGL-Vol 12-12.21, Vol 2c):

1. **Watermarks and SAGV** (Vol 12, "Display Watermark Programming" and "SAGV").
   - Read the memory latencies from pcode, compute watermark levels 0-7 for the live plane by Intel's algorithm, and program PLANE_WM, WM_LINETIME and the DBUF allocation.
   - Intel: "The default settings ... will not allow the display engine to operate ... [they] must be properly calculated and programmed ... to achieve optimum power."
   - Expected: memory self-refresh with the panel lit, so PC3 to PC8 (an inference).
2. **DMC firmware, then DC5/DC6** (Vol 12, "Display C5 and C6").
   - Load Intel's signed DMC program into CSR storage over MMIO (no DMA), then set DC_STATE_EN. Today it reads 0.
   - DC6 is required for S0ix.
   - The payload ships pinned by version and hash, with a NOTICE entry under Intel's redistribution licence (as linux-firmware carries it). The driver loads it, per root's firmware rule.
3. **PSR on the eDP panel**, over AUX/DPCD.
   - The datasheet's Table 3-5 requires the display in PSR or off for PC9/PC10. Table 3-6 gives PC10 with PSR and PC8 without.

Each stage lands alone and is measured by `osbench_energy` against Linux.

### What it removes

ToyOS's last driverless dependency on the firmware's display programming for power, and the PC2 floor.

### Tradeoffs and costs

- **New code**: a driver of moderate size. Intel's watermark and SAGV algorithms are specified in the PRM, so no other implementation is needed.
- **A firmware payload** in the image.
- **The claim's IOMMU domain must keep the firmware's stolen-memory framebuffer** (the RMRR, 0x9c000000-0xa07fffff) mapped from the hand-over on.
- **Latency.** Stages 1 and 2 slow no work. In DC5/DC6, the driver's own MMIO accesses are slower (Vol 12: disable DC states around programming). PSR adds an exit latency on the first frame after a static period: a visible-latency cost, to be measured and reported in absolute terms before PSR lands.

### Uncertain, and the cheap check first

- I have not read the GOP's watermark state. The next scout reads PLANE_WM_1_A, WM_LINETIME and DBUF (read-only, one boot) to confirm that the GOP leaves the low-power watermark levels disabled before any driver is written.
- Whether stage 1 alone reaches PC8 is an inference. The scout's PC3 cap was the NVMe's, as Linux's APST-off step shows.

## Recommended order

1. APST, on its existing track. It is the larger share and needs no decision.
2. The read-only watermark scout.
3. Your decision on the display driver and the DMC payload.
4. The driver, by stage.
5. PMC instruments: not needed. These experiments named both blockers without them.

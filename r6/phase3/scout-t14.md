# T14 phase 3: ToyOS scout boot (measurement only)

- Branch `power-scout` at `9fd3114fc`, worktree `../toyos-power-scout`. Not for landing.
- Image `scoutcase/image.img`, sha256 388c76c0b1f67836bf100eff004a455c94f98ed36bf166e73df81883edc53c89.
- One boot. The command is in `request.txt` and runs from `../toyos-power-scout`.
- Row `power_scout`. The judge holds only that `osbench_scout` ran to its end.

The image is benchcase without netstack, so the I219 stays as firmware left
it. The kernel is test-actuators. The boot runs about 7 min after quiet:
nine 30 s rows plus the quiet wait of at most 120 s.

1. Wait for quiet, then the kernel logs every PCI function's PCIe power registers (`scout: power PCI ...`):
   - PMCSR;
   - Link Capabilities, Control and Status, which hold ASPM;
   - Device Capabilities 2 and Control 2, which hold LTR;
   - the L1 PM Substates capability and control;
   - the LTR capability's maximum latencies.
2. `energy.scout.0_base`: idle, without netstack. Compare it with the 7.1 W idle that had netstack.
3. `energy.scout.0_wake_{1ms,10ms,100ms,1s}`: one thread waking at each period. These size the surcharge on full idle; 10 ms with netstack was 2.86 W.
4. `1_i219_d3hot`: the I219 (00:1f.6) parked.
5. `2_nvme_ltr_off`: the NVMe's (04:00.0) LTR Mechanism Enable cleared. The note answers 1 if it had been set.
6. `3_planes_off`: pipe A's enabled planes disabled. Per Intel, "plane memory fetches cease". The panel shows the pipe's background, likely black.
7. `4_transcoder_off`: pipe A's transcoder disabled, which stops the timing generator.
8. The registers again.

Every toggle is cumulative and none is undone. The boot ends in its usual reboot.

What it separates:

- **I219 under netstack**: `0_base` against the netstack idle (7.1 W).
- **I219 driverless**: step 4.
- **NVMe LTR**: step 5.
- **Display scan-out's memory reads**: step 6.
- **The pipe running**: step 7.

The register dump, set beside Linux's `lspci -vvv` (`linux-ab/`), says
whether ToyOS leaves a link's ASPM or L1 substates off where Linux enables
them (datasheet 631121 Table 3-8: L0 caps the package at PC3).

Risks:

- The display steps write the iGPU's registers: PLANE_CTL, PLANE_SURF and TRANS_CONF of pipe A only. Each is bounded by a 70 ms ceiling.
- If the GOP drives another pipe, the stage logs `trans_conf_a` disabled, answers NotFound, and touches nothing.
- An ASPM toggle is deliberately absent. Changing the boot NVMe's link blind could lose the log volume, so it waits for the dump.

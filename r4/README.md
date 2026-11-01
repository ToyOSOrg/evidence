# pr-1136 r4: the T14 boot of f714a5161

- Request: `request.txt`, with `display_output_presents` and `psr_exit_latency` on one metalcase boot. The image sha256 is in `image.sha256` (`faf2bc9d…`).
- The orchestrator ran it on the T14 with EXIT=0, and the harness verdict is `passed` (`verdict.txt`). The boot's timings are in `boot-timings.txt`, without the machine identity lines.
- `display-lines.log` holds every tgl-display and compositor line of the kernel log.

## Verdict

**The T14's panel does not support PSR.** PSR1 cannot be measured on this machine.

- **DPCD.** `00000h [11, 0a, 82, 41, 00, 00, 01, 40, 02, 02, 00, 00, 00, 03, 00, 00], 00070h [00, 00], 00700h [01, 00], 02006h [00, 00, 00, 00]`
  - 00070h PSR_SUPPORT is 00, "no PSR" (brief C4).
  - 00700h is 01, eDP 1.2 (brief C10). PSR1 is an eDP 1.3 feature (C4).
  - The read made no AUX fault, so these are the panel's answers.
- **Link state.** PSR was never enabled ("PSR stays off — the panel names no PSR version"). SRD_STATUS read 04000000 after each present: state 0, IDLE, and link 01, full on (E3). It never entered.
- **Exit latency.** None, since PSR never entered.
- **Presents without PSR.** Four presents took 14.28, 15.85, 15.40 and 15.33 ms to their vblanks. These match r2's 14.5–15.9 ms. The first present was answered at pipe A frame 401, after the DC6 allow at frame 400. No present was dropped.

The DPCD repeats r2's reading (823066157), and this boot is the rebased head.

# PR #1136 r2: the T14 boot of display-stage4 823066157, and the restage

- The image (sha256 138f52a241b3efc9…) was run by the orchestrator: exit 0, verdict passed. That verdict covers the boot and its jobs, not the rows.
- `t14-stage4-lines.txt`: the boot's display, hda, soundserver and job lines, masked.
- `judge-r1.txt`: both rows judged offline at 823066157. Both FAIL. `display_output_presents` failed on the tone judge's spawn rule, now fixed. `psr_exit_latency` failed for want of the DPCD line.
- `judge-r2.txt`: the same readback at 56f391fe1 plus the DPCD logging. `display_output_presents` PASS (frames 408 to 409). `psr_exit_latency` FAIL, since PSR never started.

## What the boot shows

- **PSR stayed off:** `tgl-display: PSR stays off — the panel names no PSR version`. DPCD 00070h read 0 with no AUX fault, and the driver said nothing more of the panel. So neither the link state on entry and exit nor an exit latency was observed.
- **Without PSR**, the four presents took 14.52, 15.87, 15.35 and 15.24 ms from arrival to the vblank that carried them: p50 about 15.3 ms, max 15.87 ms, at a refresh interval of 16.672 ms. Four samples give no p99. SRD_STATUS read 04000000 after each: state IDLE, link full on.
- **DC6 and the scan-out:** the DC6 line (DDI 0x1, CTL 0x05/0x0f, DC_STATE_EN 2, AUDIO_PIN_BUF_CTL bit 31 clear) came at pipe A frame 408, and the first present was answered at frame 409.
- **The tone:** `tone_after_dc6` played whole after the DC6 line (no underrun, `tone done`). hda had offered its output at 11.436 s, before PG3 went down at 11.930 s.

## What changed, and the restage

A zero at 00070h means either a panel without PSR or an AUX path answering zeros, and this boot cannot tell them apart.
- `psr::read_sink` reads the panel apart from `prepare`, adds 00000h-0000Fh (the receiver capabilities, whose DPCD revision is never 0 from a receiver that answered), and refuses a zero revision by name.
- tgl-display says every byte before anything decides on them.

The next boot will say which of the two it is.

Paths and machine strings are masked.

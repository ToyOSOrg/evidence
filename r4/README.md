# pr-1137 r4: the T14 boot of 2831e6e52

The request was r3's `t14-request.txt`: one metalcase boot carrying `igd_opregion_window` and `display_output_presents`, image sha256 `a9d59a73…`. The orchestrator ran it on the T14 with rc=0, and the harness verdict is `passed` (`verdict.txt`). The boot's timings are in `boot-timings.txt`, without the machine identity lines. `display-lines.log` holds the tgl-display, compositor, iGPU pcidev, hda, soundserver and tone lines.

Each row's judge was applied to the log by hand, since the harness has no judge-from-readback mode. The checks follow the code of `igd_opregion_window` and `display_output_presents` in `tests/toyos.rs`, and of `audio::tone_played`.

## igd_opregion_window: PASS

`tgl-display: IGD OpRegion, 8192 bytes at offset 0x18 of its pages; OVER 02010000, MBOX 0000001d, VBT mailbox 6144 bytes`

This shows the window granted at the mint, mapped, and the driver's copy valid. The kernel's checks held: the signature, 8 KB, and every page firmware's own and no RAM, BAR or driven window. The driver's checks held: the size, and MBOX bit 3.
- **OVER `02010000`**, raw. Read as major 2, minor 1 if the specification's major/minor byte layout applies. That layout is not checked against §3.1 here.
- **MBOX `0000001d`**, bits 0, 2, 3 and 4. Bit 3 is mailbox 4, the VBT, which §3.1.7 requires. Bit 1 is clear. Bit 4 is one the 2016 revision calls reserved; the driver accepts it, as a later revision's mailbox.
- The window sits 0x18 bytes into its first page: ASLS is not page-aligned on this firmware.

## display_output_presents: PASS

- DMC: `DDI select 0x1;` and `… 00000002, AUDIO_PIN_BUF_CTL 300a7077; pipe A frame 418`. That is DC6 allowed on DDI A.
- The first present was answered at pipe A frame 451, later than the allow at 418.
- `compositor: a display driver scans out the 1920x1080 output` and `the display driver answered its first present, refreshing every 16665177 ns`.
- No line says the compositor dropped the driver, or that presents go unanswered.
- `test_rs_tone_after_dc6` exited 0. soundserver was playing to the offered output (11.099 s) before its client connected (11.664 s), and both of its stats lines say `underruns=0`.
- hda offered its output (11.099 s) before PG3 went down (11.592 s), as in r3 of #1134.

`opregion()` runs before the DMC stage and changed none of stages 2 and 3's readings.

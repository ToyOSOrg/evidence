# PR #1134 r3: the T14 boot of display-stage3 f256164ab

- The image (sha256 5c5332507551cc9a…) was run by the orchestrator: exit 0, verdict passed.
- `t14-stage3-lines.txt`: the boot's display, hda, soundserver and job lines, masked. The raw log carries a MAC and partition GUIDs, so it is not published.
- `judge.txt`: `display_output_presents`, judged offline on the readback at f256164ab plus the tone judge's fix (committed as f5668732e). PASS.

At f256164ab's own judge the row was red. `on_an_output` held hda's offer to before the tone job's spawn, and `tone_after_dc6` spawns at boot and waits for the DC6 line. Its stream opened after hda's offer. f5668732e judges at the stream's opening.

What the boot shows:
- The DC6 line: DDI select 0x1, PWR_WELL_CTL1/2 0x05/0x0f, DC_STATE_EN 2, AUDIO_PIN_BUF_CTL 300a7077 (bit 31 clear), pipe A frame 421.
- `compositor: a display driver scans out the 1920x1080 output`, then the first present answered at pipe A frame 453. The timing generator ran on after DC6 was allowed.
- `tone_after_dc6` waited for the DC6 line and played to its end (`tone done`, exit 0) with no underrun.
- hda walked its codecs (codec0 10ec:0257, codec2 8086:2812) and offered its output at 11.556 s, before PG3 went down at 12.057 s. So this boot shows the analog codec playing on after PG3 went down. It does not show hda walking its link with PG3 already off.

Paths and machine strings are masked.

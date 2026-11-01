# PR #1136 r1: PSR1's checks, at display-stage4 823066157

## Logs

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps green. It includes `toyos-tgl-display`'s 44 tests.
- Negative controls. Each patch is applied, `cargo test -p toyos-tgl-display` runs, and the patch is reverted in the same run. Each compiles, its run exits 101, and exactly the test aimed at it fails:
  - `mutation-link-off`: the panel told the main link goes off. `the_t14_panel_is_told_the_link_stays_active_then_enabled_and_srd_follows` fails.
  - `mutation-no-setup-check`: `a_setup_time_past_vertical_blank_is_refused` fails.
  - `mutation-no-retry`: one AUX attempt. `a_deferring_panel_is_asked_again_and_a_silent_one_is_refused` fails.
  - `mutation-sink-errors-ignored`: `a_panel_without_psr_or_with_errors_is_left_unconfigured` fails.

  They ran on the tree before the commit. The later edits are to main's logging and the metal judge, which none of them reaches.
- `metal-readback.log`: the T14 boot staged with `display_output_presents` and `psr_exit_latency`, image sha256 138f52a241b3efc9…. Exit 2 is staged, not run.

## Source facts: the PRM against the clean-room brief

Every Tiger Lake register fact in the code is the PRM's (IHD-OS-TGL-Vol 2c-12.21 and Vol 12-12.21), cited at its site. Where they disagree, the brief (`psr-facts/facts.md`) is outranked:

| Subject | Brief | PRM | Code |
| --- | --- | --- | --- |
| Link during SRD on transcoder A | F4: no link standby on TGL; the link goes off and retrains (vendor code, mailing list) | Vol 2c SRD_CTL Link Ctrl: "ignored by transcoder A/B/C since they only operate in standby"; "Only pixel data fetches are disabled when the link is in standby" | The panel is told the main link stays active (00170h bit 1). SRD_CTL bit 27 stays 0, which both allow. The boot reads SRD_STATUS state (010b link-off entry, 111b link-on entry) and link field on entry and exit. |
| VSC SDP | D6: hardware data, software header (select 10b), software writes HB0-HB3 | Vol 2c VIDEO_DIP_CTL VSC select 00b: hardware "will send PSR1 header and data values when PSR1 is enabled", "Recommended for use when PSR is enabled" | Select 00b, so no header bytes from the brief are used. |
| Front-buffer change through PSR | E15/F9: CURSURFLIVE = 0 (WA #0884) | Flips are frame-update events (Vol 12 ASFU's "mask flips from being frame update events") | PLANE_SURF rewritten with its own value. |
| AUX while PSR is on | Q3 open, a conservative rule suggested | Vol 12 "AUX Functional Sequence" step 2: "Disable PSR1/SRD, PSR2 and GTC ... Disable DC5 and DC6" | Every AUX transaction comes before DC6 and PSR, and none after. |
| Fast-wake sync pulse count | B4: 18 pulses (field 17) | Vol 2c DDI_AUX_CTL 9:5: "SW must always program this field to the value of decimal 7" | 7. |
| AUX timeout | B3/B4: maximum | Vol 12 AUX sequence step 4: the maximum, 4000 µs | The maximum. |
| AUX data byte order | B2: big-endian | Vol 2c DDI_AUX_DATA: "The MSbyte is transmitted first" | Agrees. |
| SRD_CTL fields | E1 | Vol 2c SRD_CTL 31, 29, 24:20, 11, 9:8, 7:6 ("Always program TP4 to 11b"), 5:4, 3:0 | The PRM's. Its bit 12 ("skip AUX on exit") is reserved in Vol 2c and not used. |
| PSR_IIR/IMR | E5 | Vol 2c PSR_IIR: 2 PSR Aux Error, 1 PSR Exit ("first blank start after PSR exit"), 0 PreWarn | Agrees. |
| PSR_MASK | E8/F5 | Vol 2c PSR_MASK: 28 max sleep, 26 memup, 25 hotplug; 27 LPSP "ignored by transcoder A/B/C" | 28, 26 and 25 masked. |
| Setup time against vblank | F2 | Vol 2c SRD_CTL: "must not be enabled when the PSR Setup time from DPCD 00071h is greater than the time for vertical blank minus one line" | Agrees. |
| PSR1 disable bound | F10 | Vol 12: one frame + 6 ms + 1.5 ms | Vol 12's. |

## Facts only the brief supports, used by the code

None is in an Intel document. These are VESA facts in secondary quotation, or vendor-code facts:
- **AUX framing:** A1-A3 (request header layout, native commands 8h and 9h) and A5 (the reply code in bits 5:4).
- **AUX retry and spacing:** A8/A11 (the reply time-out before the next request) and A9 (retrying DEFER, NACK and short replies). The 32 attempts are a policy choice.
- **DPCD addresses and fields:**
  - C4, 00070h PSR version (0 is none);
  - C5, the 00071h setup-time table (330 µs less 55 µs a step, 7 reserved);
  - C8, 00170h bit 0 enable and bit 1 main link active;
  - C9, 00600h D0;
  - C10, 00700h-00701h with bit 7 SET_POWER capable;
  - C12, 02006h bits 0-2;
  - C14, 02008h state 7 internal error;
  - C15, 02009h bits 3:0 synchronisation latency.
- **The sink programming order (F3):** configuration bits, then enable, then D0.
- **The minimum of 6 idle frames (F6/J5).**

The brief's workarounds J1 and J2 (GEN8_CHICKEN_DCPR_1) are not in the PRM. Their conditions are refused by name instead: a delayed vblank, or a disabled watermark level.

## Not used from the brief

- PSR2 and selective fetch (G, J4): out until PSR1 is measured.
- The VBT PSR block (G9): no ToyOS mechanism reaches the IGD OpRegion.
- CRC (F6, H4): off.
- The HPD-driven sink error handling (H2): PSR_IIR's AUX error disables PSR, and no IRQ_HPD path exists yet.

Paths are masked.

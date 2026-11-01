# Provenance for facts.md (evidence only; never shown to the implementer)

Primary repository: Linux mainline, https://github.com/torvalds/linux, commit cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a (2026-10-31). It was sparse-cloned to
<scratch>/src/linux.

Abbreviations:
- PSR = drivers/gpu/drm/i915/display/intel_psr.c
- PSRR = intel_psr_regs.h
- AUX = intel_dp_aux.c
- AUXR = intel_dp_aux_regs.h
- DPH = include/drm/display/drm_dp.h
- HLP = drivers/gpu/drm/display/drm_dp_helper.c
- DPC = intel_dp.c
- HDMI = intel_hdmi.c
- DREG = intel_display_regs.h
- ALPM = intel_alpm.c
- BIOS = intel_bios.c
- VBT = intel_vbt_defs.h
- IRQ = intel_display_irq.c
- DEV = intel_display_device.c and .h
- WA = intel_display_wa.c
- PWR = intel_display_power.c
- LT = intel_dp_link_training.c
- CDCLK = intel_cdclk.c
- PLR = skl_universal_plane_regs.h
- PL = skl_universal_plane.c
- CUR = intel_cursor_regs.h
- DPCDI = intel_dpcd.h

All files other than DPH and HLP are under drivers/gpu/drm/i915/display/.

Intel code (i915) is vendor code, rank 2. drm_dp.h and drm_dp_helper.c are DRM core, rank 3, although many entries carry eDP/DP version annotations.

| Fact | Source | Confidence basis |
|---|---|---|
| A1–A3 | AUX header packing and transfer request sizes (around lines 530–580); DPH lines 85–102 | V + O |
| A4 | DPH DP_AUX_MAX_PAYLOAD_BYTES = 16; AUX 20-byte limits | V + O |
| A5 | DPH reply masks; AUX reply = rxbuf[0] >> 4 | V + O |
| A6 | HLP drm_dp_dpcd_access (lines 590–655): an ACK with ret != size gives -EPROTO and a retry | O |
| A7 | AUX write path: rxsize 2, "Number of bytes written in a short write" | V + O |
| A8 | WebSearch summary of intel-gfx mailing-list threads (lists.freedesktop.org/archives/intel-gfx/2022-July/301798.html, 300860, 300789, 302298), quoting DP CTS 1.2 and later revisions. Direct fetch returned 403. Secondary only. | S (secondary) |
| A9 | HLP lines 562 (AUX_RETRY_INTERVAL 500 µs) and 615–645 (32 retries, comment on raising from 7) | O |
| A10 | HLP lines 1995–2002 (comment: spec requires at least 7 retries on I2C DEFER) | S via O |
| A11 | AUX transfer comment citing "DP CTS 1.2 Core Rev 1.1, 4.2.1.1 & 4.2.1.2 400us delay" | S via V |
| B1, B3 | AUXR (_DPA_AUX_CH_CTL 0x64010, DATA1 0x64014, bit definitions); TGL selects DP_AUX_CH_CTL for AUX_CH_A; AUX init selects ver ≥ 12 accessors | V |
| B2 | AUX pack/unpack (big-endian) | V |
| B4 | AUX sync-length helpers (precharge 16 + preamble 16; fast-wake precharge 10 + preamble 8; AUO quirk comment); SKL+ send-ctl (TIME_OUT_MAX, "ICL+: 4ms"); SKL+ clock-divider comment | V |
| B5 | AUX transfer, comment "By BSpec: Message sizes of 0 or >20 are not allowed." | V (Bspec quoted) |
| B6 | AUX transfer loop and the 10 ms wait-done | V |
| B7 | AUX transfer: power domain, PPS lock/VDD, cpu_latency_qos, eDP exempt from disconnect check | V |
| B8 | AUX "FIXME PSR should be disabled here"; PSR comment in enable_source "SKL+ use hardcoded values PSR AUX transactions" | V |
| C1 | DPH 0x002/0x003 | V/O |
| C2, C3, C7 | DPH 0x02e, 0x02f, 0x116, 0x117; ALPM sink enable writes ALPM_ENABLE \| LOCK_ERROR_IRQ_HPD_ENABLE | V/O |
| C4, C5 | DPH 0x070/0x071 definitions; HLP setup-time table. WebSearch result (kernel commit "drm/psr: Fix missed entry in PSR setup time table", maintainer statement that the table is verified in eDP 1.3, 1.4 and 1.4a; AMD commit text "Display driver shall read DPCD 00071h[3:1]… setup time requirement on the VSC SDP entry packet") | V/O + S (secondary) |
| C6 | PSR SU granularity code ("Spec says that if the value read is 0 the default granularity should be used") | V |
| C8 | DPH 0x170 bits; PSR sink enable. The bit 3 semantics are inferred from its use with entry_setup_frames. | V/O + I |
| C9, C10 | DPH 0x600, 0x700, 0x701 | V/O |
| C11–C17 | DPH 0x201, 0x2006–0x200b; PSR short-pulse handling and capability-change check (write-back clears); ALPM error clear | V/O |
| C18 | DPCDI 0x3f0; PSR scanline-indication workaround (display version ≥ 14 only) | V |
| D1–D3 | DPC VSC computation (comments cite DP 1.4 table 2-118 and eDP 1.4 table 6-11); HLP VSC pack | V |
| D4 | DPC colorimetry branch; HLP revisions 0x5/0x7 | V + I |
| D5 | DPH comment block on struct dp_sdp (db layout) and the EDP_VSC_PSR_* bits | V/O |
| D6 | HDMI hsw_write_infoframe sets VSC_DIP_HW_DATA_SW_HEA for DP_SDP_VSC; the VSC payload beyond the header is zero | V |
| D7 | DPC set_infoframes (VSC disabled when there is no PSR); PSR get_config | V |
| E1 | PSRR SRD_CTL bits; TGL transcoder A offset 0x60000 (DEV TRANSCODER_A_OFFSET), so _SRD_CTL_A = 0x60800 | V |
| E2 | PSRR SRD_AUX defines; PSR enable_source (ver < 9 only) | V |
| E3, E4 | PSRR SRD_STATUS and SRD_PERF_CNT | V |
| E5 | PSRR _PSR_IMR_A/_PSR_IIR_A and the TGL comment; PSR IRQ bit getters (ver ≥ 12 unshifted); IRQ DE misc handler (GEN8_DE_EDP_PSR bit 19, TRANS_PSR_IIR read-modify-write clear); DREG 0x44464/68/6c | V |
| E6 | PSR interrupt error check comment | V |
| E7 | PSRR PSR_EVENT; PSR IRQ handler reads and writes back. W1C is inferred. | V + I |
| E8 | PSRR SRD_DEBUG bits; PSR top-of-file mask comments | V |
| E9 | PSRR PSR2_CTL bits; PSR2 activation (ver 10–12 Y-coordinate, SU track for ver < 14 excluding ADL-P) | V |
| E10 | PSRR PSR2_MAN_TRK_CTL; PSR man_trk_ctl calculation (TGL path /4 + 1; partial bit "has to be set even on full update") | V |
| E11, E12 | PSRR PSR2_SU_STATUS and PSR2_STATUS; PSR psr2-ready comment about bit 4 of the state (= register bit 31) | V |
| E13 | DREG CHICKEN_PAR1_1 0x42080, IGNORE_PSR2_HW_TRACKING bit 1; PSR enable_source | V |
| E14 | DREG 0x60200 (_HSW_VIDEO_DIP_CTL_A), 0x60320 (VSC data), 0x60344 (VSC ECC), DIP bits, VIDEO_DIP_VSC_DATA_SIZE 36; HDMI hsw_write_infoframe ordering and zero-fill "to force correct ECC calculation". Little-endian byte order is inferred from the u32* cast on x86. | V + I |
| E15 | CUR _CURASURFLIVE 0x700ac; PSR force-update comment (Display WA #0884, tested to display 13) | V |
| E16 | DREG GEN8_CHICKEN_DCPR_1 0x46430 bits | V |
| E17 | PLR SEL_FETCH_PLANE_* offsets; PL selective-fetch noarm/arm programming | V |
| F1 | PSR init DPCD (SET_POWER_CAP check); PSR compute_config (interlace, joiner, VRR); PSR post-plane update (active planes) | V |
| F2 | PSR entry setup frames; intel_crtc.c usecs-to-scanlines; WebSearch-surfaced kernel commit quoting Bspec ("SRD must not be enabled when the PSR Setup time from DPCD 00071h is greater than the time for vertical blank minus one line") | V + S (Bspec, secondary) |
| F3 | PSR sink enable (two writes) and enable_sink (SET_POWER D0) | V |
| F4 | PSR init (link_standby only for ver < 12). WebSearch summary of patchwork 11111037 (Lucas De Marchi 2019): "PSR link standby is not supported anymore on TGL+… if link standby is set on TGL+, PSR will not be enabled". The direct fetch was blocked by Anubis; the claim comes from the search-result summary. | V + secondary |
| F5 | PSR enable_source (mask bits and comment "Per Spec: Avoid continuous PSR exit by masking MEMUP and HPD"); IRQ control | V |
| F6 | PSR1 activation, idle-frames computation (comment on min 6 for the HW off-by-one), PSR1 TP-time selection, psr_safest_params; DEV ver ≥ 10 TPS3 | V |
| F7 | PSR top-of-file DOC and mask comments; IRQ handler "entry attempt in 2 vblanks"; the step sequence is partly inferred | V + I |
| F8 | IRQ enable_vblank comments ("frame counter can get stuck when PSR is active") | V |
| F9 | PSR invalidate/flush handling ("On older platforms using PSR exit was seen causing problems") | V |
| F10 | PSR exit, wait-exit (2000 ms), disable (DPCD 0x170 = 0, 0x116 = 0); PSR_IDLE_TIMEOUT_MS comment quoting Bspec; pre-plane update reasons; CDCLK pause/resume | V |
| F11 | PSR psr1/psr2 ready-for-pipe-update | V |
| F12 | LT retrain check comment; PSR enable_locked link_ok comment | V |
| G1 | PSR init DPCD (version ≥ 3, y_req && ALPM aux-wake), with its GTC comment | V |
| G2 | PSR2 config validity (ver 12–14: 5120×3200, 30 bpp; transcoder A; DSC); selective-update config validity; granularity check; selective-fetch plane/pipe supported checks | V |
| G3 | PSR SDP prior scanline indication ("From spec: ((60 / number of lanes) + 11) * 1000 / symbol clock frequency MHz"; "Not supported <13") | V |
| G4 | PSR sink enable (has_sel_update branch); ALPM sink enable | V |
| G5 | ALPM compute params (eDP spec constants, TGL IO buffer wake 10, max 12 lines, "Bspec lower limit should be set as 7 lines"); AUX fast-wake length | V |
| G6 | PSR block count, frames before SU entry, PSR2 activation (SRD_CTL = 0 comment "PSR2 HW is incorrectly using EDP_PSR_TP1_TP3_SEL and BSpec is recommending keep this bit unset"); wake lines fit into vblank | V |
| G7 | PSR2 activation (MAN_TRK_CTL handling), enable_source CHICKEN_PAR1_1, full-frame update configuration, flush handling; PL selective fetch; DEV HAS_PSR2_SEL_FETCH ver ≥ 12; display params enable_psr2_sel_fetch default true | V |
| G8 | PSR wait-exit (PSR2 status) and disable | V |
| G9 | BIOS PSR parsing; VBT psr_table/bdb_psr; PSR global-enable default VBT | V |
| H1 | PSR IRQ handler (mask comment), IRQ handling (disable, sink_not_reliable, SET_POWER D0) | V |
| H2 | PSR short pulse, ALPM check, capability-changed check; ALPM error getter; DPC short-pulse call site | V |
| H3 | PSR sink_not_reliable usage in compute_config and post-plane update | V |
| H4 | PSR sink enable (CRC_VERIFICATION, IRQ_HPD_WITH_CRC_ERRORS); D5 layout; partly inferred | V + I |
| J1, J2 | PSR watermark-optimization workaround and disable path | V |
| J3 | WA 16011181250 platform list; PSR SU-area workarounds (Wa_14014971492: TGL with splitter) | V |
| J4 | WebSearch results: lkml.iu.edu/hypermail/linux/kernel/2202.0/07553.html (fetched: Lyude Paul, 2022-02-07, "Disable PSR2 selective fetch for all TGL steps", X1 Carbon Gen 9, Wa_14010254185/Wa_14010103792 for A0–C0); Ubuntu SRU lists.ubuntu.com/archives/kernel-team/2021-July/122519.html (search summary: PSR2 disabled for TGL display stepping A0–B1, flicker/screen shift). Current code (commit above) has no TGL exclusion in the selective-fetch config check. The default param is true. | V (historic, mailing lists) + current code |
| J5 | PSRR TRANS_EXITLINE; DEV HAS_DC3CO (ver ≥ 35); PWR DC3CO compute; PSR enable_locked "DC5/DC6 requires at least 6 idle frames" | V |
| J6 | PSR, WA for 16025596647 and 18037818876 (ver 20 / 30 conditions) | V |
| K1–K6 | Derived from F1–F6, G, J above; K6 from absence of any DP_PSR_NO_TRAIN_ON_EXIT use (grep over drivers/gpu/drm/i915) | V + I |

Search queries (WebSearch):
1. "intel-gfx-prm-osrc-tgl-vol12-displayengine pdf PSR". No PRM PDF was obtained; a manuals.plus mirror had no preview.
2. A DP AUX timeout/defer query. It returned secondary kernel and mailing-list summaries only.
3. "eDP TCON datasheet DPCD 00170h …". It returned kernel commits only.

No public VESA document or TCON datasheet was obtained. Intel's TGL PRM Vol 2c/12 was not downloaded, so every register fact above rests on Intel's code rather than the PRM. A PRM cross-check is the remaining step.

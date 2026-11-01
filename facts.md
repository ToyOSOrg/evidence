# Tiger Lake eDP Panel Self Refresh: derived facts

Scope: Intel Tiger Lake display (display version 12, PCI 8086:9a49), internal eDP panel on pipe A / transcoder A / DDI A / AUX channel A.
Every fact is numbered. A confidence tag follows each fact:
- [S]: stated by a published specification or vendor document, here reached only through secondary quotation (no VESA text was available).
- [V]: stated or implied by Intel's own driver for another OS. These are hardware facts as Intel programs them, not specification text.
- [O]: established only by other (non-Intel) code.
- [I]: inferred. The reasoning is given.

All MMIO offsets are relative to the display MMIO base (GTTMMADR BAR 0). "Transcoder A instance" means the TGL instance is at the listed offset. For transcoder B, add 0x1000; transcoder A is the only PSR2-capable one on TGL.

---

## A. DP AUX native transaction framing (sink-protocol side)

A1. An AUX request starts with a 4-bit command, followed by a 20-bit DPCD address and an 8-bit length field. On the wire and in the hardware data FIFO the bytes are:
- byte 0: command in bits 7:4, address bits 19:16 in bits 3:0;
- byte 1: address bits 15:8;
- byte 2: address bits 7:0;
- byte 3: (number of data bytes − 1).

Write requests append the data bytes after byte 3. [V][O]

A2. Command values: native write = 0x8, native read = 0x9. I2C-over-AUX write = 0x0, read = 0x1, write-status-update = 0x2. The I2C "middle of transaction" flag is 0x4, ORed into the I2C command. [V][O]

A3. An address-only transaction (zero data bytes) is 3 bytes: bytes 0–2 only, with no length byte. A read request with a non-zero length is 4 bytes (header only). A write request is 4 bytes plus the data. [V][O]

A4. The maximum AUX payload is 16 data bytes per transaction. The read reply is therefore at most 17 bytes (1 reply-code byte plus 16 data bytes). The write request is at most 20 bytes (4 header bytes plus 16 data bytes). [V][O]

A5. Reply byte 0 carries the reply code in its upper nibble:
- bits 5:4 hold the native reply: 00 = ACK, 01 = NACK, 10 = DEFER;
- bits 7:6 hold the I2C reply: 00 = ACK, 01 = NACK, 10 = DEFER.

The lower nibble is reserved and should be ignored. [V][O]

A6. Native read reply: the reply byte is followed by the data bytes. A reply that is ACK but carries fewer data bytes than requested is a short read. Linux treats it as a protocol error and retries the whole transaction. [O]

A7. Native write reply: an ACK with no further bytes means every byte was written. A reply with one extra byte gives the number of bytes actually written (a partial write, normally seen with NACK). The source receives either 1 or 2 reply bytes for a write. [V][O]

A8. Reply timeout: a requester that receives no reply must wait a reply time-out period of 400 µs before starting the next AUX request. The 300 µs figure is the replier's own response window, not the requester's retry delay. Later spec revisions reportedly raised the requester timeout to 3.2 ms, related to LTTPRs; this applies when repeaters are present. [S]

A9. Retry rules as Intel and Linux implement them:
- Native transactions are retried up to 32 times in total. DEFER, NACK and short replies all count as failures and are retried.
- Between attempts the source waits 500–600 µs, except after a hardware reply timeout, whose own ≥400 µs timeout already provides the spacing.
- The first error seen is the one reported.
- The spec gives no recommended native retry count. The 32-attempt limit was raised from 7 for real sinks and is a Linux choice. [O]

A10. I2C-over-AUX must be retried at least 7 times on AUX_DEFER. [S, quoted in vendor code]

A11. After a receive error, the next attempt must wait at least 400 µs (DP CTS 1.2 core rev 1.1, sections 4.2.1.1 and 4.2.1.2, as cited by Intel). A hardware timeout error already satisfies this wait. [S via V]

## B. Tiger Lake AUX channel A registers (software AUX)

B1. AUX A control register DDI_AUX_CTL_A is at 0x64010. Its data registers DDI_AUX_DATA_A_0..4 are five 32-bit registers at 0x64014, 0x64018, 0x6401C, 0x64020 and 0x64024, 20 bytes in total. The same 20-byte FIFO holds both send and receive data. AUX B is +0x100 (0x64110). [V]

B2. Data packing is big-endian within each data register: message byte 4n goes in bits 31:24 of data register n, byte 4n+1 in bits 23:16, and so on. Received bytes unpack the same way. [V]

B3. DDI_AUX_CTL bit fields on TGL:
- bit 31, SEND_BUSY: write 1 to start; reads 1 while busy.
- bit 30, DONE: write 1 to clear.
- bit 29, INTERRUPT: interrupt on done.
- bit 28, TIMEOUT_ERROR: write 1 to clear.
- bits 27:26, TIMEOUT value: 00 = 400 µs, 01 = 600 µs, 10 = 800 µs, 11 = maximum, which is 4 ms on ICL and later (including TGL).
- bit 25, RECEIVE_ERROR: write 1 to clear.
- bits 24:20, MESSAGE_SIZE: number of bytes to send when written. On completion it reads back the number of bytes received.
- bit 15: AKSV select (HDCP).
- bit 14: PSR data AUX register select (SKL and later).
- bit 13: FS data select.
- bit 12: GTC data select.
- bit 11: TBT IO (Type-C ports only).
- bits 9:5: fast-wake sync pulse count minus 1.
- bits 4:0: sync pulse count minus 1.

On SKL and later there is no AUX clock divider to program; hardware derives the AUX clock from CDCLK. [V]

B4. Intel's values for TGL:
- Sync pulse count 32, from 16 precharge pulses plus a 16-pulse preamble; the field holds 31.
- Fast-wake sync pulse count 18, from 10 precharge pulses plus an 8-pulse preamble; the field holds 17.
- Timeout set to maximum (11).
- Every transaction writes 1s to DONE, TIMEOUT_ERROR and RECEIVE_ERROR together with SEND_BUSY, to clear them.

The eDP specification allows a precharge range of 10–16 pulses. A precharge of 12 (fast-wake total 20) is still within the eDP range and was needed by one AUO panel; larger values broke other panels. [V]

B5. Received message size 0 or greater than 20 is forbidden by Bspec. Intel treats it as a busy/retry condition. [V, Bspec quoted]

B6. Intel's software sequence for one transaction:
1. Wait for SEND_BUSY to be clear from previous activity (3 polls, 1 ms apart).
2. Load the data registers.
3. Write CTL.
4. Wait up to 10 ms for SEND_BUSY to clear.
5. Write the read status back with the three status bits set, to clear them.

On TIMEOUT_ERROR it retries immediately. On RECEIVE_ERROR it waits 400–500 µs and retries. On DONE with neither error it accepts the result. It makes up to 5 hardware attempts per software transaction ("must try at least 3 times according to DP spec"). Above this layer the native retry policy of A9 applies. [V]

B7. Preconditions for eDP AUX:
- The AUX A power well/domain must be enabled.
- Panel VDD must be on, either forced through the panel power sequencer or with the panel powered.
- Intel requests minimal CPU wake latency for the duration, because AUX is sensitive to interrupt latency.

The source does not drop AUX on a disconnected eDP port (that check exists only for external DP). [V]

B8. The PSR hardware and software AUX share AUX channel A. On SKL and later, the PSR hardware sends its own AUX messages (sink wake and power state) with hardcoded contents. Intel's driver carries an unresolved note that PSR should be disabled during software AUX to avoid simultaneous use, and it does not actually serialize the two. [V; the collision behavior itself is unknown, see open question Q3]

## C. Sink DPCD registers relevant to PSR

C1. 0x00002 MAX_LANE_COUNT: bit 6 = TPS3 supported (DP 1.2 and later); bit 7 = enhanced framing. 0x00003 bit 7 = TPS4 supported. [V][O]

C2. 0x0002E RECEIVER_ALPM_CAP (eDP 1.4):
- bit 0 = ALPM capable (AUX-wake ALPM);
- bit 1 = PM state 2a supported (eDP 1.5);
- bit 2 = AUX-less ALPM capable (eDP 1.5). [V][O]

C3. 0x0002F SINK_DEVICE_AUX_FRAME_SYNC_CAP (eDP 1.4): bit 0 = AUX frame sync capable. [V][O]

C4. 0x00070 PSR_SUPPORT, the PSR version:
- 0x00 = no PSR;
- 0x01 = PSR1 (eDP 1.3);
- 0x02 = PSR2 (eDP 1.4);
- 0x03 = PSR2 with Y-coordinate (eDP 1.4a);
- 0x04 = PSR2 with Y-coordinate and early transport (eDP 1.5, adopted eDP 1.4b SCR).

Any non-zero value means PSR1 is supported. [V][O]

C5. 0x00071 PSR_CAPS:
- bit 0 = link training not required on PSR exit ("no train on exit").
- bits 3:1 = PSR setup time, the setup time the sink requires on the VSC SDP entry packet: 0 = 330 µs, 1 = 275 µs, 2 = 220 µs, 3 = 165 µs, 4 = 110 µs, 5 = 55 µs, 6 = 0 µs, 7 = reserved (invalid). These values appear identically in eDP 1.3, 1.4 and 1.4a.
- bit 4 = PSR2 SU Y-coordinate required (eDP 1.4a).
- bit 5 = PSR2 SU granularity required (eDP 1.4b).
- bit 6 = PSR2 SU AUX frame sync not needed (eDP 1.5 / adopted 1.4b SCR). [V][O][S for the setup-time table]

C6. 0x00072–0x00073 PSR2_SU_X_GRANULARITY is a 16-bit little-endian value. 0x00074 PSR2_SU_Y_GRANULARITY is 8 bits. Both are meaningful only when 0x00071 bit 5 is set. Without bit 5, the defaults are X = 4 and Y = 4. If bit 5 is set and X reads 0, use 4. If Y reads 0, use 1. [V]

C7. 0x00116 RECEIVER_ALPM_CONFIG:
- bit 0 = ALPM enable;
- bit 1 = ALPM lock-error IRQ_HPD enable (eDP 1.5);
- bit 2 = AUX-less ALPM mode (eDP 1.5).

0x00117 bit 0 = AUX frame sync enable. [V][O]

C8. 0x00170 PSR_EN_CFG:
- bit 0 = PSR enable.
- bit 1 = source keeps the main link active during PSR (link standby) when set. When clear, the main link is turned off.
- bit 2 = CRC verification enable (sink checks the source-sent frame CRC in the VSC SDP).
- bit 3 = frame capture indication: when set, the sink captures the frame after the first SDP rather than immediately. It goes with multi-frame entry setup.
- bit 4 = SU region scan-line capture indication, i.e. the SDP is sent before the SU region's first scanline (eDP 1.4a).
- bit 5 = IRQ_HPD on CRC errors (eDP 1.4a).
- bit 6 = PSR2 enable (eDP 1.4a).
- bit 7 = SU region early transport enable (eDP 1.5). [V][O; the bit 3 semantics are partly inferred]

C9. 0x00600 SET_POWER: 0x1 = D0, 0x2 = D3, 0x5 = D3 with AUX on; the field mask is 0x3 plus higher bits. [V][O]

C10. 0x00700 eDP DPCD revision:
- 0x00 = eDP 1.1;
- 0x01 = 1.2;
- 0x02 = 1.3;
- 0x03 = 1.4;
- 0x04 = 1.4a;
- 0x05 = 1.4b;
- 0x06 = 1.5;
- 0x07 = 2.0.

0x00701 eDP general capability 1: bit 7 = SET_POWER capable. [V][O]

C11. 0x00201 DEVICE_SERVICE_IRQ_VECTOR: bit 6 = sink-specific IRQ. Its ESI mirror is 0x02003. [V][O]

C12. 0x02006 PSR_ERROR_STATUS:
- bit 0 = link CRC error;
- bit 1 = RFB storage error;
- bit 2 = VSC SDP uncorrectable error (eDP 1.4).

Bits are cleared by writing the read value back. [V][O]

C13. 0x02007 PSR_ESI: bit 0 = PSR capability changed. It is cleared by writing the read value back. [V][O]

C14. 0x02008 PSR_STATUS, sink state in bits 2:0:
- 0 = inactive;
- 1 = active, transitioning to PSR / display from source;
- 2 = active, display from RFB (self-refresh);
- 3 = active, sink-synced, capturing a single frame;
- 4 = transitioning to inactive / resynchronizing;
- 5–6 = reserved;
- 7 = sink internal error. [V][O]

C15. 0x02009 SYNCHRONIZATION_LATENCY_IN_SINK (eDP 1.4):
- bits 3:0 = maximum resynchronization frame count;
- bits 7:4 = last actual synchronization latency.

If it cannot be read, assume 8 frames. [V]

C16. 0x0200A LAST_RECEIVED_PSR_SDP, debug echo of the last VSC PSR SDP:
- bit 0 = PSR state;
- bit 1 = update RFB;
- bit 2 = CRC valid;
- bit 3 = SU valid;
- bit 4 = first scan line of SU region;
- bit 5 = last scan line of SU region;
- bit 6 = Y-coordinate valid. [V][O]

C17. 0x0200B RECEIVER_ALPM_STATUS: bit 0 = ALPM lock timeout error. It is cleared by writing the read value back. [V][O]

C18. 0x003F0 is an Intel source-vendor-specific DPCD register ("Intel WA register caps"), meaningful only to Intel sources. Bits 1:0: 0 = fall back to PSR1, 1 = PSR2 with early scanline SDP, 2 = PSR2 without early scanline. Intel's driver uses it only on display version 14 and later, for the SDP-prior-scanline feature. It is not relevant to TGL. [V]

## D. VSC SDP for PSR

D1. The VSC SDP header bytes are:
- HB0 = 0x00 (secondary-data packet ID);
- HB1 = 0x07 (packet type VSC);
- HB2 = revision;
- HB3 = number of valid data bytes. [V][O]

D2. PSR1 (DP 1.4 table 2-118, "3D stereo + PSR", eDP 1.3 and later): HB2 = 0x02, HB3 = 0x08. [V]

D3. PSR2 without colorimetry (eDP 1.4 table 6-11, "3D stereo + PSR/PSR2 + Y-coordinate"): HB2 = 0x04, HB3 = 0x0E. [V]

D4. Revision 0x05 (or 0x07) is the colorimetry VSC (pixel encoding in DB16–DB18). When colorimetry signalling is needed together with PSR, the colorimetry header is used instead. That case does not arise for an RGB eDP panel. [V][I]

D5. PSR VSC payload layout:
- DB0 = stereo interface (0 when there is no stereo);
- DB1 bit 0 = PSR state (1 = active), bit 1 = update RFB, bit 2 = CRC values valid;
- DB2/DB3 = CRC of the R or Cr component, bits 7:0 then 15:8;
- DB4/DB5 = CRC of G/Y;
- DB6/DB7 = CRC of B/Cb;
- DB8–DB31 reserved for PSR1.

PSR2 adds the SU-valid, first/last SU scan line and Y-coordinate signalling in DB1 and the following bytes (eDP 1.4 table 6-11). [V header-level, payload partly O; exact PSR2 DB layout open, Q5]

D6. On Tiger Lake the PSR VSC data bytes are generated by hardware; software supplies only the header. The VSC DIP select field must be set to "hardware data, software header" (value 2, see E14). Software writes the 4 header bytes and zeros for the remaining bytes. [V]

D7. The source must transmit the VSC SDP from the time PSR is enabled. Intel enables the VSC DIP at encoder enable whenever the configuration has PSR, before PSR itself is enabled, and disables it when the configuration has no PSR. Hardware sends the PSR-entry VSC, SU and exit packets at the right frames on its own. [V]

## E. Tiger Lake source PSR registers (transcoder A instances)

E1. SRD_CTL (EDP_PSR_CTL) A, at 0x60800:
- bit 31: PSR enable.
- bit 30: single-frame update (BDW and later).
- bit 29: restore PSR-active context. Hardware owned; software must preserve it (read-modify-write).
- bit 27: link standby. Must be 0 on TGL; see F4.
- bits 26:25: minimum link entry time: 0 = 8 lines, 1 = 4, 2 = 2, 3 = 0. Intel programs it only on HSW; it stays 0 on TGL.
- bits 24:20: maximum sleep time.
- bit 12: skip AUX on exit.
- bit 11: training pattern select: 0 = TP1 then TP2, 1 = TP1 then TP3.
- bit 10: CRC enable.
- bits 9:8: TP2/TP3 time: 0 = 500 µs, 1 = 100 µs, 2 = 2500 µs, 3 = 0 µs.
- bits 7:6: TP4 time; ICL and later program 3 = 0 µs.
- bits 5:4: TP1 time: 0 = 500 µs, 1 = 100 µs, 2 = 2500 µs, 3 = 0 µs.
- bits 3:0: idle frames, the number of identical frames before entry. [V]

E2. SRD_AUX_CTL / SRD_AUX_DATA exist at 0x60810 / 0x60814+ only in the HSW/BDW layout. SKL and later use hardcoded PSR AUX transactions and these registers are not programmed. On TGL the offsets 0x60814 and 0x60818 are the PSR IMR and IIR (E5). [V]

E3. SRD_STATUS A, at 0x60840:
- bits 31:29, state: 0 = IDLE, 1 = SRDONACK, 2 = SRDENT, 3 = BUFOFF, 4 = BUFON, 5 = AUXACK, 6 = SRDOFFACK.
- bits 27:26, link: 0 = full off, 1 = full on, 2 = standby.
- bits 24:20: maximum sleep timer.
- bits 19:16: count.
- bit 15: AUX error.
- bit 12: AUX sending.
- bit 9: sending idle pattern.
- bit 8: sending TP2/TP3.
- bit 4: sending TP1.
- bits 3:0: idle frame counter. [V]

E4. SRD_PERF_CNT A, at 0x60844, bits 23:0: PSR residency counter. [V]

E5. PSR interrupts on TGL are per transcoder. PSR_IMR A is at 0x60814 and PSR_IIR A at 0x60818. Bits:
- bit 2 = PSR error, an AUX error during a hardware PSR transaction;
- bit 1 = post-exit (PSR exit completed);
- bit 0 = pre-entry ("PSR entry attempt in 2 vblanks").

On TGL and later these bits are unshifted in each transcoder's own register. Before TGL there was one shared register with per-transcoder 8-bit shifts. The IIR is cleared by writing back the set bits. All of a transcoder's PSR events summarise into DE_MISC_IIR (0x44468) bit 19, with IMR at 0x44464 and IER at 0x4446C. [V]

E6. A PSR error bit in PSR_IIR survives driver reload and the display IRQ reset. If PSR is enabled while it is set, the screen freezes the first time the hardware tries to enter PSR. The source must check PSR_IIR bit 2 before enabling PSR and must not enable PSR if it is set. [V]

E7. PSR_EVENT A, at 0x60848, records exit causes. It is cleared by writing back the read value (inferred write-1-to-clear). Bits:
- bit 17 = PSR2 watchdog timer expired;
- bit 16 = PSR2 disabled;
- bit 15 = SU dirty FIFO underrun;
- bit 14 = SU CRC FIFO underrun;
- bit 12 = graphics reset;
- bit 11 = PCH interrupt;
- bit 10 = memory up;
- bit 9 = front buffer modify;
- bit 8 = watchdog timer expired;
- bit 6 = pipe registers update;
- bit 5 = register update (reserved on ICL and later);
- bit 4 = HDCP enable;
- bit 3 = KVMR session enable;
- bit 2 = VBI enable;
- bit 1 = LPSP mode exit;
- bit 0 = PSR disable. [V; W1C inferred]

E8. PSR_MASK (SRD_DEBUG) A, at 0x60860. A set bit masks that event so it does not cause a PSR exit or block entry:
- bit 28 = max sleep;
- bit 27 = LPSP;
- bit 26 = memory up;
- bit 25 = HPD;
- bit 24 = FBC modify;
- bit 17 = KVMR session enable;
- bit 15 = exit on pixel underrun (SKL and later).

Bits 23–16 other than 17 are HSW/BDW-only. On ICL and later, the display-register-write mask bit 16 no longer exists and is effectively always set. [V]

E9. PSR2_CTL A, at 0x60900:
- bit 31: PSR2 enable.
- bit 30: SU tracking enable (up to ADL-P, so set on TGL).
- bit 28: block count: 0 = 2 blocks, 1 = 3 blocks.
- bit 25: Y-coordinate enable on display versions 10–12, so set on TGL.
- bits 24:20: maximum SU disable time.
- bits 15:13: IO buffer wake, in lines − 5 (TGL encoding, lines 5..12).
- bits 12:10: fast wake, in lines − 5 (TGL encoding).
- bits 9:8: TP2 time: 0 = 500 µs, 1 = 100 µs, 2 = 2500 µs, 3 = 50 µs.
- bits 7:4: frames before SU entry.
- bits 3:0: idle frames. [V]

E10. PSR2_MAN_TRK_CTL A, at 0x60910 (TGL layout; ADL-P and later moved the fields):
- bit 31 = manual tracking (selective fetch) enable;
- bits 30:21 = SU region start address;
- bits 20:11 = SU region end address;
- bit 3 = single full frame;
- bit 2 = continuous full frame;
- bit 1 = partial frame update. This bit must be set even for a full-frame update.

On TGL the start and end addresses are in 4-line blocks with a +1 bias: start = y_start/4 + 1, end = y_end_exclusive/4 + 1. Both y values must be multiples of 4. [V]

E11. PSR2_SU_STATUS A starts at 0x60914 as three consecutive registers. Each holds three 10-bit per-frame SU block counts at shifts 0, 10 and 20, covering the last 8 frames. Frame n is in register n/3 at shift (n%3)×10. [V]

E12. PSR2_STATUS A, at 0x60940, bits 31:28 hold the PSR2 state. Value 0x8 = DEEP_SLEEP. Every state higher than DEEP_SLEEP also has bit 31 set, so "bit 31 clear" means "below deep sleep" and the pipe is ready for an update. All four bits zero means idle. [V]

E13. CHICKEN_PAR1_1 is at 0x42080. Bit 1 = ignore PSR2 hardware tracking. Set it when PSR2 uses selective fetch (manual tracking); clear it when PSR2 uses hardware tracking. [V]

E14. TRANS_VIDEO_DIP_CTL A is at 0x60200:
- bit 20 = VSC DIP enable;
- bits 26:25 = VSC select: 0 = hardware header and data, 1 = hardware header with software data, 2 = hardware data with software header, 3 = software header and data;
- bit 27 = PSR VSC bit 7 set;
- bits 28, 24, 16, 12, 8, 4 and 0 are the other DIP types (DRM, PPS, GCP, AVI, VS, GMP, SPD).

The VSC DIP data registers are at 0x60320, nine 32-bit registers (36 bytes). The VSC ECC is at 0x60344.

Writing the VSC DIP takes these steps:
1. Clear the VSC enable bit.
2. Write the data registers in increasing order. Each register is little-endian in the packet bytes: register 0 = HB0 | HB1<<8 | HB2<<16 | HB3<<24.
3. Write all remaining registers up to 36 bytes with 0. This is needed so the hardware computes the ECC correctly.
4. Set the VSC enable bit together with VSC select = 2.
5. Do a posting read. [V; byte order inferred from a little-endian host]

E15. CURSURFLIVE for pipe A is at 0x700AC. Writing 0 to it forces the PSR hardware to exit and send an update; this is documented Display WA #0884 for SKL and later. It is the mechanism Intel uses to push a front-buffer (non-flip) change through while PSR stays enabled. Intel tested it working up to display version 13. [V]

E16. GEN8_CHICKEN_DCPR_1 is at 0x46430. Bits 23, 24, 25 and 31 are "latency reporting removed" for pipes A, B, C and D. [V]

E17. The selective-fetch plane registers for TGL pipe A are:

| Plane | CTL | POS | SIZE | OFFSET |
|---|---|---|---|---|
| 1 | 0x70890 | 0x70894 | 0x70898 | 0x7089C |
| 2 | 0x708B0 | 0x708B4 | 0x708B8 | 0x708BC |

Planes 5 and 6 have their CTL at 0x70920 and 0x70940, with the same +4/+8/+0xC pattern.

- CTL bit 31 enables selective fetch for the plane.
- POS = (y << 16) | x, where y = plane y + clip y1.
- OFFSET = ((surface y + clip y1) << 16) | surface x.
- SIZE = ((clip height − 1) << 16) | (width − 1).
- Writing CTL arms the update. Planes outside the update are written with CTL = 0. [V]

## F. Source-side PSR1 enable sequence (TGL)

F1. Prerequisites:
- The eDP panel advertises PSR (0x00070 ≠ 0).
- The panel has SET_POWER capability (0x00701 bit 7). Intel refuses PSR without it.
- The pipe and transcoder are enabled, the main link is trained, and the VSC DIP is enabled (D7).
- At least one plane is active. Intel keeps PSR disabled with all planes off.
- The mode is not interlaced, VRR is not active, and joined pipes are not in use. Intel excludes all of these.
- The PSR error bit in PSR_IIR is clear (E6). [V]

F2. Setup-time check: convert the sink's PSR setup time (C5) to scanlines, rounding up: lines = ceil(setup_µs × pixel_clock_kHz / (1000 × htotal)). If lines > (vtotal − vdisplay − 1), PSR must not be enabled on TGL. Multi-frame entry setup exists only on Lunar Lake and later. Bspec states the same constraint: SRD must not be enabled when the setup time exceeds the vertical blank minus one line. [V][S]

F3. Order of sink programming:
1. Write 0x00170 with the configuration bits but without bit 0.
2. Write 0x00170 again with the same bits plus bit 0 (enable).
3. Write 0x00600 = 0x01 (D0).

For PSR1 on TGL the configuration bits are CRC verification (bit 2) only. Bit 1 (main link active) is 0 because TGL uses link-off PSR. For PSR2, write ALPM config first (G4). [V]

F4. Link standby (main link kept active during PSR, SRD_CTL bit 27 / 0x00170 bit 1) is not supported on TGL and later; if link standby is set on TGL+, PSR will not be enabled. Intel's current driver never selects link standby on display version 12 and later, regardless of the firmware VBT "full link" flag. On TGL, PSR1 therefore always turns the main link fully off and retrains it on exit using the TP1/TP2-or-TP3 times. [V; mailing-list statement]

F5. Source programming before activation:
1. Write PSR_MASK (E8) with HPD (25), memory up (26), LPSP (27) and max sleep (28) set. Bspec says to mask MEMUP and HPD to avoid continuous exits; LPSP and max sleep are masked to rely on software tracking.
2. Unmask PSR_IMR bit 2 (error). Bits 0 and 1 are optional debug.
3. Program CHICKEN_PAR1_1 bit 1 according to E13 (PSR2 only).
4. Apply the workarounds in section J. [V]

F6. Activation, by read-modify-write of SRD_CTL that preserves bit 29:
- enable = 1;
- idle frames = max(6, firmware-VBT idle frames, sink sync latency (C15) + 1), capped at 15. Intel uses 6 as the minimum to cover a hardware off-by-one case.
- max sleep time = 0x1F;
- TP4 time = 3 (0 µs);
- TP1 time and TP2/TP3 time from the firmware VBT (G9). The safest values are 2500 µs each.
- TP select = TP1→TP3 if the sink supports TPS3 (0x00002 bit 6, with DPCD revision ≥ 1.2), else TP1→TP2;
- CRC enable = 1;
- link standby = 0.

Before activation both SRD_CTL bit 31 and PSR2_CTL bit 31 must be 0. [V]

F7. Once activated, hardware handles entry. After "idle frames" identical frames it sends the PSR-entry VSC SDP, waits the setup time, then turns the link off. It exits on unmasked events (E7/E8), on plane surface flips (PLANE_SURF writes trigger exit unless masked), and on writes covered by the pipe register-write mask. The pre-entry interrupt fires 2 vblanks before an entry attempt. [V][I]

F8. While PSR is active no frames are generated, so the pipe frame counter can stall. Software must resynchronise its vblank counter from timestamps when vblank interrupts are re-enabled. [V]

F9. Front-buffer rendering (CPU or GPU writing a scanned-out buffer without a flip) is not reliably tracked by hardware. Intel overrides it in software:
- At the start of dirtying, exit PSR by clearing SRD_CTL bit 31.
- At flush, write CURSURFLIVE = 0 (E15) and schedule re-activation once nothing is dirty.

Intel saw problems on older platforms when it used plain PSR exit for flush; for TGL flush it uses the CURSURFLIVE write. [V]

F10. Disable / exit:
1. Clear SRD_CTL bit 31 (read-modify-write).
2. Wait for SRD_STATUS bits 31:29 to read 0 (IDLE). Intel waits up to 2000 ms in the disable path and 50 ms before re-activation. Bspec gives the maximum time to idle as one frame time + 6 ms exit training + 1.5 ms AUX handshake.
3. On full disable, write 0x00170 = 0. For PSR2, also write 0x00116 = 0.

PSR must be disabled before the pipe is disabled, before a modeset, before M/N or refresh-rate changes, when PSR mode changes, and when all planes turn off. Intel pauses PSR (exit and wait idle) around CDCLK changes, while holding the AUX lock, and resumes afterwards. [V]

F11. A pipe update with vblank evasion while PSR1 is enabled first waits for SRD_STATUS state = IDLE, up to 50 ms. With PSR2 it waits for PSR2_STATUS bit 31 to clear (below deep sleep), also up to 50 ms. [V]

F12. Link retraining must not be attempted while source PSR is enabled. The PSR hardware controls the main link, so a retrain would fail or mix training patterns with frame data. A PSR exit retrains the link anyway. Some panels report a bad link status after PSR enable, so a link-status check is ignored until the first IRQ_HPD after enable. [V]

## G. PSR2 / selective update on TGL (separate from PSR1)

G1. TGL PSR2 sink requirements as Intel applies them:
- 0x00070 ≥ 0x03;
- 0x00071 bit 4 (Y-coordinate required) set;
- ALPM capable (0x0002E bit 0).

Intel does not support PSR2 version 0x02, or 0x03 without the Y-coordinate requirement, because those need GTC/AUX frame sync. [V]

G2. TGL PSR2 source limits:
- transcoder A only;
- no DSC;
- pipe bpp ≤ 30;
- without selective fetch, resolution ≤ 5120×3200;
- not with VRR, CMRR, pipe CRC, a pipe scaler or async flips;
- no plane with negative position, a scaler, or rotation (for selective fetch).

Granularity rules:
- hdisplay must be divisible by the X granularity, and vdisplay by the Y granularity.
- With hardware tracking, the sink's Y granularity must be exactly 4.
- With selective fetch on TGL, the Y alignment is 4 when the sink's Y granularity is ≤ 2. It is the sink's value when that is a multiple of 4. Any other value makes PSR2 unusable. [V]

G3. SDP-prior-scanline is not supported before display version 14. So on TGL PSR2 requires (hblank time − required time) > 100 ns, where:
- hblank time = 10⁶ × (hblank_end − hblank_start) / pixel_clock_kHz, in ns;
- required time = ((60 / lane_count) + 11) × 1000 / symbol_clock_MHz, in ns. [V, formula "from spec"]

G4. Sink programming for PSR2:
1. Write 0x00116 = 0x03 (ALPM enable, lock-error IRQ_HPD enable).
2. Write 0x00170 = bit 6 (PSR2) | bit 5 (IRQ_HPD on CRC errors).
3. Write 0x00170 again with bit 0 added.
4. Write 0x00600 = D0.

The VSC header is revision 0x04, length 0x0E (D3). [V]

G5. Wake-line computation (TGL), with all quantities in µs (1 AUX pulse = 1 µs):
- precharge = 10;
- preamble = 8;
- PHY wake = 4 (eDP spec);
- fast-wake exit latency = 20 (eDP spec);
- TGL IO buffer wake time = 10.

IO wake time = max(precharge, IO buffer wake) + preamble + PHY wake + exit latency = 42 µs. Fast wake time = precharge + preamble + PHY wake + exit latency = 42 µs.

Convert each to lines by rounding up. If either exceeds 12 lines on TGL, PSR2 is not possible. Program max(lines, 7); Bspec gives the lower limit as 7 lines. [V]

G6. Further PSR2 fields and constraints:
- Block count = 3 if either wake-line count is ≥ 9, else 2. The corresponding line count (8 or 12) must fit in vblank (vblank_end − vblank_start); otherwise PSR2 is not possible.
- Frames before SU entry = max(sink sync latency + 1, 2).
- Idle frames as in F6.
- TP2 time from the firmware VBT PSR2 value, where VBT 3 means 50 µs.
- SU tracking enable = 1 and Y-coordinate enable = 1 (E9).
- Before writing PSR2_CTL, write SRD_CTL = 0, because PSR2 hardware wrongly honours SRD_CTL's TP1/TP3 select and Bspec says to keep it 0 while PSR2 is enabled. [V]

G7. Selective fetch versus hardware tracking on TGL:
- With selective fetch, PSR2_MAN_TRK_CTL bit 31 must already be set when PSR2 is activated, and CHICKEN_PAR1_1 bit 1 must be set.
- With hardware tracking, PSR2_MAN_TRK_CTL is written 0 and CHICKEN_PAR1_1 bit 1 is cleared.
- Per update with selective fetch, compute the damaged SU line range aligned to G2's Y alignment. Program E10 and the plane selective-fetch registers (E17) for each plane intersecting the area, then arm.
- For a forced full update, set bits 1|2|3 (partial, continuous full, single full) in PSR2_MAN_TRK_CTL together with enable, then write CURSURFLIVE = 0.
- Keep continuous-full-frame set while front-buffer rendering is in progress. [V]

G8. PSR2 disable: clear PSR2_CTL bit 31, wait for PSR2_STATUS bits 31:28 = 0 (up to 2000 ms), then write 0x00170 = 0 and 0x00116 = 0. [V]

G9. Firmware VBT PSR block (BDB block 9; Intel's VBT from the option ROM / ACPI OpRegion), per panel type (16 entries):
- full_link (bit 0);
- require_aux_to_wakeup (bit 1);
- idle_frames (4 bits);
- lines_to_wait (3 bits);
- tp1_wakeup_time (u16);
- tp2_tp3_wakeup_time (u16).

For VBT version ≥ 205 on display version ≥ 9, the TP values encode 0 = 500 µs, 1 = 100 µs, 2 = 2500 µs, 3 = 0 µs; any other value means 2500 µs. Older VBTs give the time in multiples of 100 µs. For VBT version ≥ 226, a u32 after the 16 tables holds 2 bits per panel of PSR2 TP2/TP3 time: 0 = 500 µs, 1 = 100 µs, 2 = 2500 µs, 3 = 50 µs. Otherwise the PSR1 value is reused. Whether PSR is enabled by default on eDP follows the VBT PSR enable. [V]

## H. Errors and recovery

H1. PSR_IIR error interrupt:
1. Mask PSR_IMR bit 2 immediately. Otherwise it interrupts continuously and starves the handling work.
2. Disable PSR (F10/G8).
3. Treat the sink as unreliable and do not re-enable PSR until the next full mode set.
4. Write 0x00600 = D0 to make sure the sink is awake. [V]

H2. On every IRQ_HPD (short HPD pulse) from the eDP sink while PSR is enabled:
1. Read 0x02008 and 0x02006.
2. If the sink state is 7 (internal error), or any of 0x02006 bits 0–2 is set, disable PSR and mark the sink unreliable.
3. Clear 0x02006 by writing back the read value.
4. For PSR2, read 0x0200B. On a lock-timeout error, disable PSR and clear it by write-back.
5. Read 0x02007. If bit 0 (capability changed) is set, disable PSR, mark the sink unreliable, and clear it by write-back. [V]

H3. Intel does not attempt automatic PSR re-enable after a sink error. Recovery is a full disable followed by a fresh enable at the next modeset. [V]

H4. Sink CRC: with SRD_CTL CRC enable and 0x00170 bit 2 set, the source puts frame CRCs in the VSC SDP (DB2–DB7). The sink reports mismatches as 0x02006 bit 0. With PSR2 and 0x00170 bit 5, it raises IRQ_HPD on a CRC error. [V][I]

## J. Tiger Lake specific workarounds and conditions (Intel code)

J1. Wa_16013835468 (display version 12): while PSR is enabled on a pipe whose vblank start ≠ vdisplay (i.e. there is a delayed vblank / non-zero set-context latency), set GEN8_CHICKEN_DCPR_1 "latency reporting removed" for that pipe (bit 23 for pipe A). Clear it otherwise and on PSR disable. [V]

J2. Wa_14015648006 (display versions 11–14): while PSR is enabled and the pipe's watermark configuration has a level disabled, set the same bit as J1. [V]

J3. Wa_16011181250 makes PSR2 defeatured on RKL, ADL-S and DG2. It does not apply to TGL. Wa_14014971492 forces the SU region to start at line 0 on TGL only when the eDP MSO splitter is in use. [V]

J4. Early TGL steppings A0 through C0 lacked Wa_14010254185 and Wa_14010103792, so PSR2 selective fetch was disabled there. TGL PSR2 hardware tracking showed momentary flicker and screen shift on display stepping A0 through B1, so PSR2 was disabled on those steps. In February 2022, PSR2 selective fetch was disabled on all TGL steps for severe flicker (reproduced on a ThinkPad X1 Carbon Gen 9 by moving the cursor along the left screen edge). Current Intel code carries no TGL exclusion and defaults selective fetch on for display version 12 and later. Whether production TGL selective fetch is now reliable is unsettled; see Q1. [V; mailing list; current code]

J5. DC3CO (a TGL-era PSR2 power state using TRANS_EXITLINE 0x60018: bit 31 enable, bits 12:0 exit line) is gated in current Intel code to display version 35 and later. Current Intel code does not use DC3CO on TGL. DC5/DC6 require at least 6 idle frames. [V]

J6. Intel's current code requires no TGL-specific DMC/PSR interaction beyond J1/J2. The package C-state and DMC workarounds (Wa_16025596647, Wa_18037818876) are for display version 20 and later. [V]

## K. Summary of eDP requirements the source must satisfy before entering PSR (as derived)

K1. The link must be trained. PSR is never enabled with an untrained link. [V]

K2. The VSC SDP must already be transmitted with the PSR header. [V]

K3. Before entry there must be at least "idle frames" (≥ 6, ≥ sink resync latency + 1) unchanged frames. [V]

K4. The sink's PSR setup time must fit within vblank − 1 line. [V][S]

K5. The sink must be in D0, with SET_POWER capability. [V]

K6. Retraining on exit uses the TP1 and TP2/TP3 durations. Training on exit can be skipped only when the sink sets 0x00071 bit 0. Intel's current code does not consult that bit and always uses the VBT TP times; see Q6. [V][I]

---

## Open questions

Q1. Is PSR2 selective fetch reliable on production TGL (T14 stepping)? Current Intel code enables it, while 2022 evidence showed flicker. PSR1 is the conservative first step. Measuring it on metal is the only remaining check.

Q2. The meaning and units of SRD_CTL max sleep time (0x1F) and PSR2_CTL max SU disable time are not established. Intel always writes 0x1F and masks max sleep in PSR_MASK.

Q3. What happens when a software AUX transaction collides with a hardware-initiated PSR AUX transaction on AUX A? Intel's driver leaves this unresolved. A conservative rule is to exit PSR and wait for idle (F10 steps 1–2) before any software AUX transaction while PSR is enabled; this is inferred, not Intel's practice.

Q4. Exact VESA text for native AUX DEFER retry limits, and for the 3.2 ms timeout's applicability without LTTPRs. No public VESA text was obtained; the values are secondary quotations.

Q5. The exact byte layout of the PSR2 VSC payload (eDP 1.4 table 6-11: SU valid, SU first/last scan line and Y-coordinate fields) was not obtained. Hardware generates it on TGL (D6), so the implementer needs only the header.

Q6. Whether the TP1/TP2 times may be reduced (to 0 µs) when the sink sets 0x00071 bit 0 ("no train on exit") is not established. Intel ignores the bit.

Q7. The T14 panel's actual 0x00070/0x00071/0x0002E/0x00700/0x02009 values, and its VBT PSR entry, must be read on the machine.

Q8. Whether the PSR_EVENT register is strictly write-1-to-clear (E7) is inferred from Intel's read-and-write-back.

Q9. The exact behaviour of 0x00170 bit 3 (frame capture) on pre-eDP-1.5 sinks. Intel sets it only with multi-frame entry setup, which is not available on TGL, so TGL leaves it 0.

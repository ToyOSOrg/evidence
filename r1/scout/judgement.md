# T14 display scout, run 1: judgement

- Run: rc=0, verdict passed. Revision `display-scout` 22e638ae7; image sha256 a1e72dbb…0f1ff831.
- Source: `run1/kernel.log`, lines 393-479 (read 0) and 503 onward (read 1, after 30 s idle).
- The two reads agree on every register except the frame counters, so the firmware's state does not move at idle.
- Field layouts are from Vol 2c-12.21.

## Plane and timing

| Register | Value | Means |
| --- | --- | --- |
| PLANE_CTL_1_A | 84000008 | Enabled. Format 27:23 = 01000b, RGB 8:8:8:8. Tiling 12:10 = 000b, **linear**; bit 3 is "Allow Double Buffer Update Disable", whose default is 1. The earlier "X-tiled" reading was wrong. |
| PLANE_STRIDE_1_A | 0x78 | 120 × 64 B = 7680 B, which is 1920 × 4. That confirms linear. |
| PLANE_SIZE_1_A | 0437077f | 1920×1080 |
| TRANS_HTOTAL / VTOTAL | 081f077f / 04570437 | htotal 2080, vtotal 1112 |
| Measured refresh | 30 frames in 500 ms | about 60 Hz |
| Pixel rate | — | 2080 × 1112 × 60 = 138.8 MHz (derived) |
| LINK M/N | 0x041cac / 0x80000 | 0.51400. × 270 MHz (HBR) = 138.78 MHz, which agrees with the measurement. |
| DATA M/N | 0x62b020 / 0x800000, TU 64 | 0.771, which fits 24 bpp on 2 lanes at HBR |
| WM_LINETIME_A | 0x78 | 120 × 0.125 µs = 15.0 µs. Vol 12: roundup(8 × 2080 / 138.78) = 120. **The GOP's value is correct.** |

## Watermarks, which confirm the design's inference

| Register | Value | Means |
| --- | --- | --- |
| PLANE_WM_0_1_A | 80004011 | Enabled, 1 line, 17 blocks |
| PLANE_WM_1..7_1_A | 00004011, then 00004007 ×6 | All **disabled** |
| PLANE_WM_TRANS_1_A | 00004007 | Disabled |
| PLANE_BUF_CFG_1_A | 02a90000 | Start 0, end 681 |
| Cursor and planes 2-7 | — | Disabled; all their WMs are at the defaults (4007) |

So the GOP enables watermark level 0 only. The display can never let memory reach a low-power latency level.

## Memory values from pcode (all mailbox replies 00h, success)

- **Latencies:** set 1 = 33333300, set 2 = 706b4633. That is L0..L7 = 0, 51, 51, 51, 51, 70, 107, 112 µs. Vol 12 says that when L0 is 0, add 3 µs to each valid level, giving **3, 54, 54, 54, 54, 73, 110, 115 µs**.
- **SAGV block time:** 0x0b = **11 µs**.
- **MemSS global info:** 0x410. DDR type 0 (DDR4), 1 populated channel, 4 QGV points.
- **QGV points** (Dclk × 16.667 MHz; tRP, tRCD, tRDPRE, tRAS in DCLKs):

  | Point | Dclk | tRP | tRCD | tRDPRE | tRAS |
  | --- | --- | --- | --- | --- | --- |
  | 0 | 128, about 2133 | 15 | 15 | 8 | 35 |
  | 1 | same as point 0 | | | | |
  | 2 | 192, about 3200 | 22 | 22 | 12 | 52 |
  | 3 | 160, about 2667 | 19 | 19 | 10 | 43 |

  Points 2 and 3 differ and every reply succeeded, so the inferred PARAM2 position (23:16) is consistent with working. That points 0 and 1 are equal is not explained by the reply alone.

## What stage 1 computes from these inputs (Vol 12 "Watermark Algorithm", worked by hand)

- Inputs: linear, 4 Bpp, block size 512, plane blocks per line ceil(7680/512) + 1 = 16, line time 14.99 µs, allocation 682.
- Level 0 with SAGV (3 + 11 = 14 µs): method 2 = ceil(14 × 138.78 / 2080) × 16 = 16, so 17 blocks, 1 line. **That equals the GOP's WM0**, and the plane tolerates SAGV, so SAGV stays unmasked.
- Levels 1-4 (54 µs): 65 blocks, 4 lines. Level 5 (73 µs): 81 blocks, 5 lines. Level 6 (110 µs): 129 blocks, 8 lines. Level 7 (115 µs): 129 blocks, 8 lines.
- Every level fits: result < 682, lines ≤ 31, and minimum allocation ceil(129 × 1.1) = 142 < 682. **No DBUF reallocation is needed** for this mode.
- Transition WM: the level-0 result 16 + 4 (minimum) + an amount, + 1, enabled.

## Power state

| Register | Value | Means |
| --- | --- | --- |
| DC_STATE_EN | 0 | DC5 and DC6 not allowed |
| 45520h | 0 | Vol 12's step 3 "set bits 1:0" has not been done |
| PWR_WELL_CTL1 | 0x55 | |
| PWR_WELL_CTL2 | 0xff | Every well requested. DC5 needs PG3 and above off. |
| CSR storage, 80000h | 0c004040 00010002 | Non-zero. **Whether a program is loaded cannot be told from this alone.** The DMC header's MMIO writes and a version register would say. Stage 2 resolves it. |
| SRD_CTL_A | 00100001 | Bit 31 is 0: **PSR1 off** |
| PSR2_CTL_A | 00004811 | Bit 31 is 0: **PSR2 off** |
| SRD_STATUS / PSR2_STATUS | 04000000 each | |
| DBUF_CTL_S1 and S2 | c060c000 each | Both slices requested and powered |
| ARB_CTL2 | a8090e00 | |
| CDCLK_CTL | 00380158 | |

## Scan-out path

- **The scan-out goes through the RMRR.** PLANE_SURF_1_A = 0 (GGTT offset 0), and its GGTT PTE is 000000009c800001: valid, physical 0x9c800000. 0x9c800000 is the BDSM (config C0h, 9c800001), inside rmrr0 0x9c000000..0xa07fffff (scope 00:02.0). A claim domain that lacks the RMRR would fault every scan-out read.
- PCICMD is 0x0006: memory decode and Bus Master on. The device has an MSI capability at ACh.

## Energy (same boot, panel lit, no driver)

- idle p50 6514 mW, PC2 995 ‰, PC3 0. This matches pr-1100 r7's base.

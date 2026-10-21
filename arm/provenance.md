# Arm bit positions used by PR #984, and where each was read

Both documents were downloaded from Arm on 2026-10-21 with the build's user-agent
and read locally (page text extracted with macOS PDFKit; the XML read as XML).

| Document | URL | SHA-256 |
|---|---|---|
| Arm Architecture Reference Manual for A-profile, DDI 0487 M.d (PDF, 17150 pages) | https://documentation-service.arm.com/static/6abbec2a6db85c5e6614a4a1 | 80d589a4645feba6bdb9d77edfaf04d4394d5d5444a4c41f97cf4fdd20eee3d5 |
| Arm A-profile system register XML, 2023-12 (DDI 0601's source) | https://developer.arm.com/-/media/developer/products/architecture/armv9-a-architecture/2023-12/SysReg_xml_A_profile-2023-12.tar.gz | 4e211f1a56f62311cf7a65d1e5504ad5bfdfe2ed142020a76d4130318103e401 |

| Fact | Where |
|---|---|
| `SCTLR_EL1.WXN` is bit 19; "Any region that is writable in the EL1&0 translation regime is forced to XN for accesses from software executing at EL1 or EL0"; permitted to be cached in a TLB | `SysReg_xml_A_profile-2023-12/AArch64-sctlr_el1.xml`, field WXN, msb = lsb = 19 |
| WXN removes PrivExecute from a PrivWrite region and UnprivExecute from an UnprivWrite one, whatever PXN/UXN say | DDI 0487 M.d D8.4.1.2.4 "Preventing execution from writable locations", p. D8-7758 |
| Descriptor type: bit 0 valid; below level 3 bit 1 set = table, clear = block; at level 3 bit 1 set = page, clear = reserved and treated as invalid | DDI 0487 M.d D8.3, Table D8-48, p. D8-7735 |
| Stage 1 block/page: UXN bit 54, PXN bit 53, AP[2] bit 7, AP[1] bit 6, AF bit 10, nG bit 11, SH 9:8, AttrIndx 4:2; 4 KiB page OA 47:12 | DDI 0487 M.d D8.3, Table D8-52, pp. D8-7742 to D8-7744 |
| TTBR1_ELx translates the upper VA range, (2^64 - 2^(64-T1SZ)) to 0xFFFF_FFFF_FFFF_FFFF | DDI 0487 M.d D8.2.4, p. D8-7701 |

The AArch64 register descriptions are not in the DDI 0487 M.d PDF (only AArch32's
are, chapter G8), which is why `SCTLR_EL1.WXN`'s position is cited from the
system register XML.

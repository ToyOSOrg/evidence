# Intel AX200 and AX210: the device's interface

Revision 1. The readers' specification for the W stages of ToyOS's Wi-Fi track (`issues/there-is-no-wifi.md`; the design is ToyOS pull request 876). A writer writes the driver from this document and the public standards alone.

## 0. This revision

### What it covers

- **W1's device inputs** (§11): how the device hands over a received frame, its descriptor, lengths, header padding, decryption state, CCMP header and MIC, A-MSDU, reordering data and duplicates. The frame formats themselves are IEEE Std 802.11-2020's and are not restated here.
- **W2's inputs about peers** (§13): what the access points the demo met were measured to do, and what no run measured.
- **The device from its PCI function to a passive scan** (§1 to §10, §12), which W3 types and W5 drives: identity, registers, bring-up, interrupts, the firmware files, loading, the command and receive channels, the commands and notifications through a passive scan, and error reporting.

Later revisions carry association, the transmit path, key installation, block-ack sessions, rate control, transmit power limits and their platform tables, power save, 6 GHz and firmware restart.

### Sources, in #876 §7's order

1. **Intel's firmware-interface definitions decide what they state.** These are the definitions Intel publishes for these parts under BSD-3-Clause (dual-licensed with GPL-2.0), read at a pinned release, and cited here as `[Intel n]`. Another reference disagreeing does not reopen what they state; the bench checks it.
2. **Other references fill what those leave unsaid**: another operating system's driver for these parts, which this document calls **the reference driver**, with its 802.11 layer; an access-point implementation; and the demo's driver. Each is cited as `[Ref n]`.
3. **The firmware containers**, read under the licence bound below.
4. **Measurements**: S1 on the T14 (`s1/` and `s1-r2/` on this branch); the demo's runs on the AMD bench, AX200, masked whole under `spec/runs/`; the AMD bench's configuration-space dump, decoded in `spec/evidence/ax200-config-space.log`.
5. **Standards**: IEEE Std 802.11-2020.

- **Each key's document, file, lines and pinned commit are in `spec/provenance.md`**, the readers' record. This document names no reference's file, and a writer needs none: the facts are stated here.
- **Of Intel's definitions, only dual-licensed files were read**; no GPL-only file was read beyond its licence line.

A fact the references disagree on, or all leave unsaid, is listed in §14 and stays open until a reader's scout measures it.

### Citation keys

| Key | Means |
|---|---|
| `[Intel n]` | Intel's firmware-interface definitions, entry n of `spec/provenance.md` |
| `[Ref n]` | another reference, entry n of `spec/provenance.md` |
| `C77 @off`, `C89 @off`, `CPN @off` | the record at byte offset `off` of `iwlwifi-cc-a0-77.ucode`, `iwlwifi-ty-a0-gf-a0-89.ucode` or `iwlwifi-ty-a0-gf-a0.pnvm`, as `spec/evidence/container-*.log` reads it |
| `C77 v(g,i)`, `C89 v(g,i)` | that file's declared versions for group `g`, identifier `i` (Appendix A) |
| `Runnn:line` | line of `spec/runs/demo-vnn.log`, a demo run on the AX200 |
| `S1 file:line` | line of an S1 log on this branch |
| `P:line` | line of `spec/evidence/ax200-config-space.log` |
| `[I]` | this reader's inference, stated as such |

### Conventions

- Every multi-byte field is little-endian unless its row says otherwise.
- Offsets and widths are in bytes, decimal. Bit *n* is the value 2^*n*.
- A register address is an offset into BAR 0, in hex.
- A **periphery address** is an address in the device's internal register space, reached through the window of §3.4.
- A **device-memory address** is an address in the device's internal memory, reached through the window of §3.4.
- A layout's rows tile it: each row starts where the previous one ends, and the heading gives the total.
- Names of registers, fields, commands and notifications are this document's own.

### The licence bound

`LICENCE.iwlwifi_firmware` permits use and redistribution "without modification" and says "No reverse engineering, decompilation, or disassembly of this software is permitted" (`spec/evidence/firmware-files.log`). Of each file this reader read only what a loader parses: record kinds and lengths, each section's 4-byte load address, and the records that declare versions, capabilities, counts and SKUs. No byte of a section's or an image loader's contents was read. Each file was hashed whole only to name it.

## 1. The parts

| | AX200 | AX210 | Source |
|---|---|---|---|
| PCI vendor:device | `8086:2723` | `8086:2725` | P:45; S1 `s1/judge.log`:56 |
| Subsystem vendor:device | `8086:0084` on the AMD bench | unmeasured (§14) | P:45 |
| Revision ID | `0x1a` on the AMD bench | unmeasured | P:45 |
| Class | `02:80:00` | `02:80:00` | P:45; S1 `s1/judge.log`:56 |
| Hardware revision register (BAR 0 + 0x028) | `0x00000340` on the AMD bench | unmeasured (§14) | Run11:479 |
| RF identity register (BAR 0 + 0x09c) | `0x0010a100` on the AMD bench | unmeasured (§14) | Run11:479 |
| Firmware file | `iwlwifi-cc-a0-77.ucode` | `iwlwifi-ty-a0-gf-a0-89.ucode` | `spec/evidence/firmware-files.log` |
| Platform-NVM file | none | `iwlwifi-ty-a0-gf-a0.pnvm` | `spec/evidence/firmware-files.log` |
| Loading generation (§7) | first: one context-information block | second: context information, peripheral scratch, image loader and platform NVM | [Ref 1] |

- **The MAC type is bits 15:4 of the hardware revision register, and the RF type is bits 23:12 of the RF identity register.** [Intel 1].
- **Each firmware file declares the hardware it is for**: its hardware-type record names MAC type `0x34` and RF type `0x10a` for the AX200's file, and MAC type `0x42` and RF type `0x10d` for the AX210's. C77 @0x05b960; C89 @0x06a020.
- **The AX200 read MAC type `0x34` and RF type `0x10a`**, which match its file's record. Run11:479.
- **Intel's definitions name the AX210's MAC type `0x42`** (revision value `0x420`) and its RF type `0x10d` (RF identity value `0x0010D000`), which match its file's record. [Intel 2].
- **A part is served only when its PCI device ID is one of the two above and its MAC and RF types equal its file's hardware-type record**; anything else is refused by name. This is the track's rule (W3); the matching values are the sources' above.
- **The reference driver picks the file by device and subsystem.** It maps `8086:2723` to the cc-a0 file [Ref 2]. It maps `8086:2725` with subsystem `0x0090` to an `so-a0-gf-a0` file [Ref 3], and `8086:2725` with subsystems `0x0020`, `0x2020`, `0x0024`, `0x0310`, `0x0510`, `0x0A10`, `0xE020`, `0xE024`, `0x4020`, `0x6020`, `0x6024`, `0x1673` and `0x1674` to the ty-a0-gf-a0 file [Ref 4]. The T14's subsystem ID is unmeasured (§14).
- **The reference driver's device list names** `0x2723` the AX200 and `0x2725` the AX210. [Ref 5].
- **Both parts are discrete** (not integrated in the SoC), with no LTR apply delay, no crystal latency and no low-latency crystal. [Ref 6].
- **The AX210 supports the 6 GHz band; the AX200 does not.** [Ref 7].

### Whether each part verifies its file

- **No reference read states that either part verifies its firmware file's signature.**
- **The container gives**:
  - the AX210 file's name string is `release/core86:signed_remote:b20dcd1f`, and the AX200 file's is `release/core74::563a6e92`. C89 header; C77 header.
  - Intel's definitions name three secure-section record kinds (24, 25, 26), and neither file carries any of them. [Intel 3]; C77 and C89 record counts.
  - Intel's paging definitions count 32 data blocks and one CSS block. [Intel 4].
- **None of these is a vendor statement that the part verifies the file**, which the track requires before a file ships (W3). This stays open (§14).

## 2. The PCI function

| Fact | AX200 (AMD bench) | AX210 (T14) | Source |
|---|---|---|---|
| BARs | BAR 0 only | BAR 0 only | P:46; Run11:471; S1 `s1/judge.log`:57 |
| BAR 0 | 16 KiB, 64-bit memory, not prefetchable | 16 KiB, 64-bit memory, not prefetchable | P:46; Run11:471; S1 `s1/judge.log`:57 |
| MSI-X | 16 entries; table BAR 0 + 0x2000; PBA BAR 0 + 0x3000 | 16 entries; table BAR 0 + 0x2000; PBA BAR 0 + 0x3000 | P:51; S1 `s1/judge.log`:59 |
| MSI | 1 vector, 64-bit, no per-vector mask | 1 vector, 64-bit, no per-vector mask | P:49; S1 `s1/judge.log`:58 |
| PCI Express capability | at 0x40 | unmeasured | P:50 |
| Configuration byte 0x41 | read `0x80` | unmeasured | P:47 |
| Device control 2, LTR enable (bit 10) | set | unmeasured | P:50; Run11:478 |
| Upstream bridge | root complex bridge `00:02.2`, forwarding 1 MiB | root port `00:1c.4`, forwarding 1 MiB | `e13-amd-ax200-bar.log`; S1 `s1/judge.log`:60 |
| ACPI device | unmeasured | `\_SB_.PC00.RP05.PXSX` | S1 `s1-r2/wifi-s1-b-kernel.log`:511 |

- **The reference driver clears configuration byte 0x41**, by clearing bits 15:8 of the dword at 0x40, so that PCI retries do not interfere with the CPU's C3 state. [Ref 8].
- **The reference driver reads two PCI Express fields at bring-up**:
  - the link control register's L0s enable, which it only records;
  - device control 2's LTR enable, which gates the latency-tolerance command (§10.9).
  - [Ref 9].
- **The reference driver establishes one MSI-X vector, vector 0**, and maps every cause to it. [Ref 10].

## 3. BAR 0

### 3.1 Map

| BAR 0 range | Holds | Source |
|---|---|---|
| 0x000-0x3FF | control and status registers (§3.2) | [Intel 5] |
| 0x400-0x4FF | host-bus windows into device memory and the periphery, and the transmit write pointer (§3.4) | [Intel 6] |
| 0x1C80 + 4·q | write-index trigger of receive queue q's free-buffer ring | [Intel 7] |
| 0x2000-0x20FF | MSI-X table, 16 entries | P:51; S1 `s1/judge.log`:59; [Intel 8] |
| 0x2800-0x2813 | MSI-X cause, mask and automask registers (§5) | [Intel 9] |
| 0x2880-0x28BF | MSI-X cause-to-vector maps (§5) | [Intel 10] |
| 0x3000 | MSI-X pending-bit array | [Intel 11]; P:51 |

- **The 4 KiB page holding the MSI-X table (0x2000-0x2FFF) also holds the device's own MSI-X cause, mask and vector-map registers.** A driver using MSI-X writes that page (§5). [Intel 12].

### 3.2 Control and status registers

Read and written directly; Intel's definitions say they are reachable whenever the platform powers the device, with no access request. [Intel 13].

| Offset | Register | Bits used | Meaning | Source |
|---|---|---|---|---|
| 0x000 | interface configuration | 1:0 MAC dash, 3:2 MAC step, 11:10 PHY type, 13:12 PHY dash, 15:14 PHY step | the host writes the MAC step and dash and the radio type, step and dash here on the AX200 (§4.2 step 9) | [Intel 14]; [Ref 11] |
| 0x000 | | 8 MAC SI, 9 radio SI | cleared with the fields above on the AX200 | [Intel 15]; [Ref 12] |
| 0x000 | | 19 | set to let the management bus wake the link from L1A | [Intel 16]; [Ref 13] |
| 0x000 | | 22 | the host sets it and reads it back set when the device is ready; Intel names it the PCI ownership bit | [Intel 17]; [Ref 14] |
| 0x000 | | 27 | the host sets it to prepare a device that did not report ready | [Intel 18]; [Ref 15] |
| 0x000 | | 28 | set with bit 27 when stopping, to enable PME | [Intel 19]; [Ref 16] |
| 0x000 | | 30 | persistence | [Intel 20] |
| 0x000 | | 1 (AX210) | automatic function boot enable: on the AX210 this register is also the boot control register | [Intel 21] |
| 0x004 | interrupt coalescing | 7:0 | accumulation time in 32 µs units; 0x40 (2,048 µs) is Intel's default | [Intel 22] |
| 0x005 | periodic interrupt (byte) | 7:0 | 0x00 disables the periodic receive interrupt; 0xFF fires it after about 8 ms | [Intel 23] |
| 0x008 | interrupt status | see §5.3 | MSI-mode causes, acknowledged by writing 1s | [Intel 24] |
| 0x00C | interrupt mask | | MSI-mode enables | [Intel 25] |
| 0x010 | flow-handler interrupt status | 0, 1 transmit channels; 16, 17 receive channels; 30 high-priority receive; 31 error | acknowledged by writing 1s | [Intel 26] |
| 0x020 | reset | 7 software reset, 8 bus master disabled (read), 9 stop bus master | | [Intel 27] |
| 0x024 | general-purpose control | 0 MAC clock ready, 2 init done, 3 access request, 4 going to sleep, 26 RF-kill wake from L1A enable, 27 hardware RF-kill switch state | see §3.3 and §12.4 | [Intel 28] |
| 0x028 | hardware revision | 1:0 dash, 3:2 step, 15:4 MAC type | identifies the part (§1) | [Intel 29] |
| 0x03C | GIO | 1 | L0s disabled; the reference driver always sets it | [Intel 30]; [Ref 17] |
| 0x040 | context-information address (AX200) | 64 bits | DMA address of the context information, written as two 32-bit writes, low dword first | [Intel 31]; [Ref 18] |
| 0x054 | firmware mailbox 1 | 1 software RF-kill, 2 command blocked | | [Intel 32] |
| 0x058 | firmware mailbox 1 set | | writing 1s sets bits of 0x054 | [Intel 33] |
| 0x05C | firmware mailbox 1 clear | | writing 1s clears bits of 0x054 | [Intel 34] |
| 0x088 | mailbox set | 5 | the host sets it once the device reports ready | [Intel 35]; [Ref 19] |
| 0x09C | RF identity | 3:0 flavor, 7:4 dash, 11:8 step, 23:12 RF type, 28 CDB, 29 jacket | identifies the radio (§1) | [Intel 36] |
| 0x0A0 | interrupt cause table | 31 enable, 28 write pointer, 27 wrap check | the host-memory interrupt cause table (§5.4); the reference driver ORs these bits with the table's 4 KiB-aligned address shifted right by 12 | [Intel 37]; [Ref 20] |
| 0x0A8 | MAC shadow register control | | The reference driver sets bits `0x800FFFFF` | [Intel 38]; [Ref 21] |
| 0x0D4 | LTR long value | 31 no-snoop request, 28:26 no-snoop scale, 25:16 no-snoop value, 15 snoop request, 12:10 snoop scale, 9:0 snoop value | a discrete part's boot-time latency tolerance (§7.2) | [Intel 39]; [Ref 22] |
| 0x100 | GIO chicken bits | 23 | disables L0s on receive without affecting L1 | [Intel 40]; [Ref 23] |
| 0x118 | context-information address (AX210) | 64 bits | written as two 32-bit writes | [Intel 41]; [Ref 24] |
| 0x120 | image-loader address (AX210) | 64 bits | written as two 32-bit writes | [Intel 42]; [Ref 25] |
| 0x128 | image-loader size (AX210) | 32 bits | in bytes | [Intel 43]; [Ref 26] |
| 0x12C | image-loader response (AX210) | | | [Intel 44] |
| 0x240 | debug HPET memory | | The reference driver writes `0xFFFF0000`, the flow handler's maximum wait threshold | [Intel 45]; [Ref 27] |
| 0x250 | link power management | 31 | link power management disabled | [Intel 46] |
| 0x380, 0x384 | MAC address, one-time-programmable words | | §10.5 | [Intel 47]; [Ref 28] |
| 0x388, 0x38C | MAC address, strap words | | §10.5 | [Intel 47]; [Ref 28] |

- **The MAC address registers start at 0x380 on these parts.** Intel's definitions give their offsets from a per-device base, and the reference driver gives that base. [Intel 47]; [Ref 28].

### 3.3 The access request

- **Device memory and periphery registers are reachable only while the access request is granted.** Intel's definitions: the host must wait for the clock-ready bit, with the going-to-sleep bit clear, before it touches any register beyond §3.2's. [Intel 48].
- **Taking the access request**: set bit 3 of 0x024, wait 2 µs, then poll until bit 0 is set and bit 4 is clear, for up to 150 ms. [Ref 29].
- **Releasing it**: clear bit 3 of 0x024. [Ref 30].
- **Measured**: after a firmware assert and a stop, the access request was not granted within 150 ms, and 0x024 read `0x08040008`. Run11:607-611.

### 3.4 The host-bus windows

| Offset | Register | Meaning | Source |
|---|---|---|---|
| 0x40C | memory read address | device-memory address of the next read | [Intel 49] |
| 0x410 | memory write address | device-memory address of the next write | [Intel 50] |
| 0x418 | memory write data | each write stores a dword and advances the address by one dword | [Intel 51] |
| 0x41C | memory read data | each read returns a dword and advances the address by one dword | [Intel 52] |
| 0x444 | periphery write address | the periphery address in the low bits (width below); bits 24-25 the byte count minus one, 3 for a dword | [Intel 53] |
| 0x448 | periphery read address | as 0x444 | [Intel 54] |
| 0x44C | periphery write data | | [Intel 55] |
| 0x450 | periphery read data | | [Intel 56] |
| 0x460 | write pointer | a queue's new write index and the queue's number (§8.3) | [Intel 57] |

- **Periphery address width**: Intel's definitions give bits 0-15 for the address, but the periphery addresses they define are wider (§3.5). The reference driver masks periphery addresses to 20 bits on the AX200 and 24 bits on the AX210, and always writes 3 into bits 24-25. [Intel 58]; [Ref 31].
- **UMAC periphery offset**: on the AX210, the reference driver adds `0x300000` to the address of each register it calls a UMAC periphery register (the user-register chicken, CPU init run, doorbell, and receive DMA configuration and status registers below). [Ref 32]. Intel's definitions have a per-device offset for UMAC periphery addresses and leave its value to their configuration code. [Intel 59].
- **Window writes are ordered**: the reference driver places a write barrier between the address write and the data write. [Ref 33].

### 3.5 Periphery registers

| Periphery address | Register | Bits used | Source |
|---|---|---|---|
| 0xA05C00 (UMAC) | user-register chicken | 24 MSI enable, 25 MSI-X enable | [Intel 60] |
| 0xA05C04 (UMAC) | doorbell to the firmware | 20 platform NVM ready (§7.4) | [Intel 61] |
| 0xA05C44 (UMAC on the AX210) | CPU init run | writing 1 starts the firmware's self-load (§7) | [Intel 62]; [Ref 34] |
| 0xA03440 | power-management debug | 12 persistence | [Intel 63] |
| 0xA04D00 | write protection | 12 power-management register access protected | [Intel 64] |
| 0xA09808 | receive DMA status (AX200) | 31 receive DMA idle | [Intel 65] |
| 0xA07824 (UMAC) | receive DMA status (AX210) | 31 receive DMA idle | [Intel 66]; [Ref 35] |
| 0xA09820 | receive DMA configuration (AX200) | writing 0 stops receive DMA | [Intel 67]; [Ref 36] |
| 0xA07880 (UMAC) | receive DMA configuration (AX210) | writing 0 stops receive DMA | [Intel 68]; [Ref 37] |

"(UMAC)" marks the registers the reference driver offsets by `0x300000` on the AX210 (§3.4).

## 4. Bring-up

### 4.1 Once per function

1. **Clear configuration byte 0x41** (§2). [Ref 8].
2. **Mask and acknowledge every MSI-mode interrupt**: write 0 to 0x00C, then all ones to 0x008 and to 0x010. [Ref 38].
3. **Read the hardware revision (0x028) and RF identity (0x09C) registers**, and refuse the part unless they match its file (§1). [Ref 39]; [Intel 69].

### 4.2 Each start, in order

| Step | Action | Condition and bound | Source |
|---|---|---|---|
| 1 | **Ready handshake.** Set bit 22 of 0x000 and poll it for up to 50 µs; once it reads set, set bit 5 of 0x088 | if it never reads set: set bit 31 of 0x250, wait 1 ms, then up to 10 times set bit 27 of 0x000 and poll as before every 200 µs for up to 150 ms in total, waiting 25 ms between rounds; still not set: the start fails | [Ref 40] |
| 2 | **AX200 only: clear the persistence bit.** Read periphery 0xA03440; if it is not `0xa5a5a5a0` and bit 12 is set, read periphery 0xA04D00, and if its bit 12 is set the start fails, else write 0xA03440 back with bit 12 clear | | [Ref 41]; [Intel 70] |
| 3 | **Software reset.** Set bit 7 of 0x020 | The reference driver then waits a fixed 5 ms; no reference names a completion signal (§14) | [Ref 42]; [Intel 71] |
| 4 | **Power up.** Set bit 23 of 0x100; set `0xFFFF0000` in 0x240; set bit 19 of 0x000; set bit 1 of 0x03C; read the PCI Express link control and device control 2; set bit 2 of 0x024 | poll bit 0 of 0x024 for up to 25 ms; not set: the start fails | [Ref 43] |
| 5 | **MSI-X setup** (§5.2) | | [Ref 44] |
| 6 | **RF-kill interrupt.** Unmask only the RF-kill cause (§5.1), set bit 26 of 0x024, and read the switch (§12.4) | | [Ref 45] |
| 7 | **Quiesce.** Write all ones to 0x008; mask every MSI-X cause the setup enabled; write bit 1, then bit 2, to 0x05C | | [Ref 46] |
| 8 | **Power up again** as step 4 | | [Ref 47] |
| 9 | **AX200 only: interface configuration.** Into 0x000 write the hardware revision's step and dash as the MAC step and dash, and the PHY configuration word's radio type, step and dash (§6.3) as the PHY type, step and dash; clear bits 8 and 9 | | [Ref 48] |
| 10 | **Coalescing and shadow registers.** Write `0x40` to byte 0x004; set bits `0x800FFFFF` in 0x0A8 | | [Ref 49] |
| 11 | **Firmware-load interrupts.** Unmask only the alive cause among the hardware causes; leave every flow-handler cause the setup enabled unmasked | | [Ref 50] |
| 12 | **Load the image** (§7.2 on the AX200, §7.3 on the AX210) | the alive cause within 1 s, else the start fails | [Ref 51] |
| 13 | **On the alive cause, post receive buffers** (§9.3) | | [Ref 52] |
| 14 | **Read the alive notification** (§7.5); a status other than `0xCAFE` fails the start | | [Ref 53]; [Intel 72] |
| 15 | **Release the image copies**: the LMAC and UMAC section buffers and the image loader's buffer; keep the paging buffers until the device stops | | [Ref 54] |
| 16 | **AX210 only: platform NVM** (§7.4) | its notification within 2 s, else the start fails | [Ref 55] |
| 17 | **Enable interrupts** (§5.3); the reference driver also programs the interrupt cause table here (§5.4) | | [Ref 56] |
| 18 | **Initialisation exchange**: the init-flags command (§10.2), then the NVM-done command (§10.3) | the init-complete notification (§10.4) within 2 s, else the start fails | [Ref 57] |
| 19 | **The NVM-info request** (§10.5) and the MAC address | | [Ref 58] |
| 20 | **Runtime configuration**, in this order: transmit antennas (§10.6); coexistence (§10.7); platform latency (§10.8); latency tolerance (§10.9) when device control 2 enables LTR; temperature thresholds (§10.10) when capability 74 is set; device power (§10.11); country update (§10.12) when the NVM-info answer enables LAR and capability 1 is set; scan configuration (§10.13); beacon filter off (§10.14) | each command's answer within 1 s (§8.4) | [Ref 59] |

- **Not sent to these parts**:
  - the PHY-configuration command, which the reference driver sends only to parts with transmit SISO diversity, and neither part has it [Ref 60];
  - the dynamic-queue enable command, which the reference driver sends only when capability 12 is set, and neither file sets it [Ref 61; Appendix B].
- **The reference driver starts twice.** Its first start reads the NVM (steps 1-19) and stops the device; it then starts again (steps 1-18) and configures (step 20). [Ref 62].
- **Measured: one start through step 20 reached a passive scan on the AX200.** Run13:483-638.
- **Measured AX200 timings**:
  - the alive cause arrived 46 to 52 ms after the load was started, and the alive notification was read 136 to 141 ms after it. Run11:494, 550, 588-590; Run13:495, 556, 594-596.
  - The init-complete notification arrived 65 to 67 ms after the NVM-done command. Run11:592-593; Run13:598-599.
  - The whole sequence through step 20 took 235 ms. Run13:617.

### 4.3 Stop

| Step | Action | Source |
|---|---|---|
| 1 | mask every MSI-X cause | [Ref 63] |
| 2 | under the access request, write 0 to the receive DMA configuration register (§3.5) and poll its status register's bit 31 every 10 µs, up to 1,000 times | [Ref 64] |
| 3 | release the access request | [Ref 65] |
| 4 | power down: set bit 31 of 0x250; set bits 27 and 28 of 0x000; wait 1 ms; clear bit 31 of 0x250; wait 5 ms; set bit 9 of 0x020 and poll its bit 8 for up to 100 µs; clear bit 2 of 0x024 | [Ref 66] |
| 5 | software reset (§4.2 step 3) | [Ref 67] |
| 6 | redo the MSI-X cause-to-vector maps, because a stop erases them | [Ref 68] |
| 7 | mask every cause again; unmask the RF-kill cause; read the switch; do the ready handshake | [Ref 69] |
| 8 | free the paging buffers and the platform-NVM buffers | [Ref 70] |

## 5. Interrupts

The design runs the radio on one MSI-X vector (#876 §3). This section describes MSI-X mode; §5.4 notes what differs in MSI mode, which the demo ran.

### 5.1 Registers

| Offset | Register | Meaning | Source |
|---|---|---|---|
| 0x2800 | flow-handler causes | a cause's bit is set when it fires; writing the read value back clears it | [Intel 73]; [Ref 71] |
| 0x2804 | flow-handler mask | a set bit masks its cause: unlike MSI mode, a cause is enabled when its mask bit is clear | [Intel 74]; [Ref 72] |
| 0x2808 | hardware causes | as 0x2800, for the hardware causes | [Intel 75] |
| 0x280C | hardware mask | as 0x2804, for the hardware causes | [Intel 76] |
| 0x2810 | automask status | the device sets a vector's bit when it sends that vector's message and holds further messages on it until the host writes the bit to clear it | [Intel 77]; [Ref 73] |
| 0x2880 + q | receive queue q's vector map (byte) | the vector number in bits 0-6; bit 7 set: the cause is not cleared automatically | [Intel 78] |
| 0x2890 + c | cause c's vector map (byte) | as above, for the other causes, indexed by the table below | [Intel 79] |

| Flow-handler cause bit | Meaning | Source |
|---|---|---|
| 0 | receive queue 0 | [Intel 80] |
| 1 | receive queue 1 | [Intel 81] |
| 16 | device-to-host DMA channel 0: a firmware chunk loaded | [Intel 82]; [Ref 74] |
| 17 | device-to-host DMA channel 1 | [Intel 83] |
| 19 | host-to-device DMA | [Intel 84] |
| 21 | flow-handler error | [Intel 85] |

| Hardware cause bit | Meaning | Source |
|---|---|---|
| 0 | alive | [Intel 86] |
| 1 | wake-up; Intel also names it the image-loader cause | [Intel 87] |
| 2 | reset done | [Intel 88] |
| 3 | top-level fatal error | [Intel 89] |
| 5 | Intel names it the software error of a later family; the reference driver maps it as a second software error | [Intel 90]; [Ref 75] |
| 6 | critical temperature (CT) kill | [Intel 91] |
| 7 | RF-kill switch changed | [Intel 92] |
| 8 | periodic | [Intel 93] |
| 25 | software (firmware) error | [Intel 94] |
| 26 | scheduler | [Intel 95] |
| 27 | flow-handler transmit | [Intel 96] |
| 29 | hardware error | [Intel 97] |
| 30 | HAP | [Intel 98] |

The vector-map index of each non-receive cause is given only by the reference driver: [Ref 76].

| Cause | Map index (byte at 0x2890 + index) |
|---|---|
| device-to-host channel 0 | 0x00 |
| device-to-host channel 1 | 0x01 |
| host-to-device | 0x03 |
| flow-handler error | 0x05 |
| alive | 0x10 |
| wake-up | 0x11 |
| reset done | 0x12 |
| hardware cause bit 5 | 0x15 |
| CT kill | 0x16 |
| RF kill | 0x17 |
| periodic | 0x18 |
| software error | 0x29 |
| scheduler | 0x2a |
| flow-handler transmit | 0x2b |
| hardware error | 0x2d |
| HAP | 0x2e |

### 5.2 Setup, one vector

Each step is the reference driver's. [Ref 44].

1. Under the access request, set bit 25 (MSI-X enable) of the user-register chicken register (§3.5).
2. Write all ones to 0x2804 and to 0x280C.
3. Write `0x80` (vector 0, not auto-cleared) to the maps of receive queues 0 and 1 (0x2880, 0x2881), and clear bits 0 and 1 of 0x2804.
4. Write `0x80` to the map of every cause in the index table above.
5. Clear bits 16, 17, 19 and 21 of 0x2804, and bits 0, 1, 2, 5, 6, 7, 8, 25, 26, 27, 29 and 30 of 0x280C.
6. Read 0x2804 and 0x280C back. Their complements are the causes enabled from now on: the reference driver keeps them as the cause sets that later steps unmask and mask.

### 5.3 Handling

1. Read 0x2800 and 0x2808 and write each value back to clear it. [Ref 77].
2. Keep only the causes currently unmasked. [Ref 78].
3. Act, in the reference driver's order:
   - receive queue 0 or 1: drain the receive ring (§9);
   - top-level fatal error, flow-handler error or software error: §12;
   - RF-kill: §12.4;
   - hardware error: §12;
   - alive: post receive buffers (§9.3).
   [Ref 79].
4. Write 1 (bit 0, vector 0) to 0x2810 to re-enable the vector. [Ref 73].

### 5.4 MSI mode and the interrupt cause table

- **In MSI mode**:
  - the user-register chicken register takes bit 24 instead of bit 25 [Ref 80];
  - causes arrive in 0x008, masked by 0x00C, with the bits of [Intel 99].
- **Measured in MSI mode on the AX200**:
  - the alive cause read `0x00000001` from 0x008 [Run11:550];
  - a firmware error read `0x02000000`, bit 25 [Run11:605].
- **The reference driver programs a 4 KiB host-memory interrupt cause table after every alive**, in MSI-X mode too (0x0A0, §3.2). [Ref 81]. Whether MSI-X mode needs it is open (§14).

## 6. The firmware file

### 6.1 Header (88 bytes)

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | zero | 0: distinguishes this format from an older one | [Intel 100] |
| 4 | 4 | magic | `0x0a4c5749` | [Intel 101] |
| 8 | 64 | name | human-readable build name, NUL-padded | [Intel 102] |
| 72 | 4 | version | the firmware's API number in this format | [Intel 103] |
| 76 | 4 | build | build number | [Intel 104] |
| 80 | 8 | ignored | | [Intel 105] |

| | AX200 file | AX210 file | Source |
|---|---|---|---|
| name | `release/core74::563a6e92` | `release/core86:signed_remote:b20dcd1f` | C77 header; C89 header |
| version | 77 | 89 | C77 header; C89 header |
| build | 1446669970 | 2987248927 | C77 header; C89 header |
| version record (kind 36) | major 77, minor `0x563a6e92`, local 0 | major 89, minor `0xb20dcd1f`, local 0 | C77 @0x00006c; C89 @0x00006c |

### 6.2 Records

| Offset in record | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | kind | the record's kind (§6.3) | [Intel 106] |
| 4 | 4 | length | the contents' length, excluding these 8 bytes | [Intel 107] |
| 8 | length | contents | | [Intel 108] |

- **Records follow the header back to back, each padded to a multiple of 4 bytes.** [Intel 109].
- **Both pinned files end exactly at the end of their last record.** C77 and C89: no truncation or trailing bytes reported.
- **The reference driver refuses a record whose length runs past the file's end.** [Ref 82].

### 6.3 Record kinds in the pinned files

| Kind | Meaning (Intel's, unless said) | AX200 file | AX210 file | Loader | Source |
|---|---|---|---|---|---|
| 6 | probe request maximum length, u32 | 512 | 512 | bounds the scan's probe template (§10.15) | [Intel 110]; C77 @0x000508; C89 @0x00060c; [Ref 83] |
| 7 | memory descriptor; empty in both files | 1 | 1 | ignored | [Intel 111]; C77 @0x000514; C89 @0x000618 |
| 18 | flags word, u32 | `0xfbfb4b7f` | `0xdbfb4b7f` | read: bit 2 management-frame protection, bit 24 U-APSD ([Intel 112]) | C77 @0x0003b0; C89 @0x000418 |
| 19 | runtime image section (§6.4) | 50 | 58 | loaded (§7.1) | [Intel 113] |
| 22 | default calibration: image type, flow trigger, event trigger, 3 × u32 | 1 | 1 | not sent to these parts (§4.2) | [Intel 114]; C77 @0x000058; C89 @0x000058 |
| 23 | PHY configuration word, u32 | `0x330018` | `0x330018` | §4.2 step 9; §10.6 | [Intel 115]; C77 @0x0004ac; C89 @0x000524 |
| 27 | CPU count, u32 | 2 | 2 | checked | [Intel 116]; C77 @0x00051c; C89 @0x000620 |
| 29 | API word: index u32, 32 flag bits u32 | 3 records | 3 records | read (Appendix B) | [Intel 117] |
| 30 | capability word: index u32, 32 bits u32 | 4 records | 5 records | read (Appendix B) | [Intel 118] |
| 31 | scan channel count, u32 | 67 | 67 | bounds the scan's channel list (§10.15) | [Intel 119]; C77 @0x05b994; C89 @0x06a054 |
| 32 | paging memory size, u32 | 585,728 | 761,856 | not needed by the loader [I] | [Intel 120]; C77 @0x0be8ac; C89 @0x0df728 |
| 36 | firmware version: major, minor, local, 3 × u32 | §6.1 | §6.1 | read | [Intel 121] |
| 48 | command versions (§6.5) | 192 entries | 218 entries | read | [Intel 122]; C77 @0x0000a8; C89 @0x0000a8 |
| 51 | debug memory segment | 4 | 4 | ignored | [Intel 123] |
| 52 | image loader | absent | 13,944 bytes | loaded (§7.3) | [Intel 124]; C89 @0x0669a0 |
| 54 | UMAC debug addresses: error table address, print buffer address | `0x00880128` | `0x00471488` | error table (§12.2) | [Intel 125]; [Intel 126]; C77 @0x05b974; C89 @0x06a034 |
| 55 | LMAC debug addresses, the first being the error table address | `0x004dff20` | `0x004f2358` | error table (§12.2) | [Intel 127]; [Intel 128]; C77 @0x000080; C89 @0x000080 |
| 57 | recovery information | 1 | 1 | ignored | [Intel 129] |
| 58 | hardware type: MAC type u16, RF type u16 | `0x34`, `0x10a` | `0x42`, `0x10d` | §1 | [Intel 130]; C77 @0x05b960; C89 @0x06a020 |
| 60 | sequencer version | 1 | 1 | ignored | [Intel 131] |
| 61 | PHY integration version | 1 | 1 | ignored | [Intel 132] |
| 68 | current program counter | 1 | 1 | ignored | [Intel 133] |
| 69 | not in Intel's list; the reference driver calls it undocumented | absent | 132 bytes | ignored | C89 @0x000530; [Ref 84] |
| 0x100 | station count, u32 | 15 | 15 | read | [Intel 134] |
| 0x101 | link count, u32 | 4 | 4 | ignored | [Intel 135] |
| 0x102 | beacon count, u32 | 1 | 1 | ignored | [Intel 136] |
| 0x1000005 to 0x100000a | debug configuration records | present | present | ignored | [Intel 137] |
| 0x100000b, 0x100000c | not in Intel's list; the reference driver calls them undocumented | present | present | ignored | [Ref 85] |

Counts per kind: C77 and C89, "record kinds and counts".

### 6.4 Sections

| Offset in contents | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | load address | where the device places the section, or a separator value | [Intel 138]; [Ref 86] |
| 4 | length − 4 | section | the section's bytes, loaded unread | [Ref 87] |

- **Two separator records split the kind-19 records into three images.** Load address `0xFFFFCCCC` ends the LMAC image, and `0xAAAABBBB` ends the UMAC image; the records after it are the paging image. [Intel 138]; [Ref 88].
- **Each separator record carries 4 content bytes, which the loader ignores.** C77 @0x05f72c, @0x0be8b8; C89 @0x072b30, @0x0df734.

| | AX200 file | AX210 file | Source |
|---|---|---|---|
| LMAC image | 14 sections, 373,648 bytes | 15 sections, 418,496 bytes | C77, C89 "runtime image sections" |
| UMAC image | 15 sections, 389,308 bytes | 16 sections, 445,224 bytes | same |
| paging image | 19 sections, 587,384 bytes | 25 sections, 763,512 bytes | same |
| largest section | 32,768 bytes | 32,768 bytes | same |
| first section of each image | 1,656 bytes | 1,656 bytes | C77 @0x000528, @0x05f73c, @0x0be8c8; C89 @0x00062c, @0x072b40, @0x0df744 |

- **Each paging image is 1,656 bytes larger than its file's paging-size record**, the size of its first section. Intel's paging definitions count one CSS block beside 32 data blocks [I]. C77 @0x0be8ac; C89 @0x0df728; [Intel 4].

### 6.5 Declared versions

- **Each entry of a kind-48 record is 4 bytes**: command identifier, group, command version, notification version. [Intel 139].
- **The value 99 marks an unknown version.** [Intel 140]. An entry with command version 99 names a notification the host never sends, and one with notification version 99 has no notification of its own [I].
- **A command a file does not list is sent at the one layout Intel's definitions give it.** Each such command in §10 says so, and the bench checks it.
- Appendix A lists every entry of both files.

## 7. Loading the image

### 7.1 The images in host memory

- **Copy each section of the three images whole into its own physically contiguous DMA buffer**; separators are not copied. [Ref 89].
- **Intel's definitions say each map entry stands for a host-memory chunk of at most 32 KB**, and no section is larger (§6.4). [Intel 141].
- **Each image's map holds at most 64 entries.** [Intel 142].
- **Fill the three maps in file order**: the LMAC image's sections into the LMAC map, the UMAC image's into the UMAC map, and the paging image's into the paging map. [Ref 90].
- **The image buffers may be freed after the alive notification; the paging buffers stay until the device stops.** [Ref 91].

### 7.2 AX200: context information (1,792 bytes)

Layout: [Intel 143].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | MAC identity | the SKU and revision identity; the reference driver writes the low 16 bits of the hardware revision register | [Intel 144]; [Ref 92] |
| 2 | 2 | version | 0 | [Ref 93] |
| 4 | 2 | size | the structure's size in dwords: 448 | [Intel 145]; [Ref 94] |
| 6 | 2 | reserved | | |
| 8 | 4 | control flags | the table below | [Intel 146] |
| 12 | 4 | reserved | | |
| 16 | 8 | reserved | | |
| 24 | 8 | free-buffer ring address | §9.1 | [Intel 147] |
| 32 | 8 | used-buffer ring address | §9.1 | same |
| 40 | 8 | receive status address | §9.1 | same |
| 48 | 8 | command queue address | the command queue's descriptor ring (§8.1) | [Intel 148] |
| 56 | 1 | command queue size | the ring's entry count as log2 minus 3: 5 for 256 entries | [Intel 149]; [Ref 95] |
| 57 | 7 | reserved | | |
| 64 | 16 | reserved | | |
| 80 | 8 | core dump address | not used here | [Intel 150] |
| 88 | 4 | core dump size, dwords | | same |
| 92 | 4 | reserved | | |
| 96 | 8 | early debug address | not used here | [Intel 151] |
| 104 | 4 | early debug size, dwords | | same |
| 108 | 4 | reserved | | |
| 112 | 8 | platform NVM address | not used on the AX200 | [Intel 152] |
| 120 | 4 | platform NVM size, dwords | | same |
| 124 | 4 | reserved | | |
| 128 | 64 | reserved | | |
| 192 | 512 | UMAC image map | 64 × 8-byte DMA addresses | [Intel 153] |
| 704 | 512 | LMAC image map | 64 × 8-byte DMA addresses | same |
| 1216 | 512 | paging image map | 64 × 8-byte DMA addresses | same |
| 1728 | 64 | reserved | | |

| Control flag bits | Meaning | The reference driver writes | Source |
|---|---|---|---|
| 0 | the firmware does not wait before signalling init done | 0 | [Intel 154] |
| 1 | early debug | 0 | [Intel 155] |
| 2 | core dump | 0 | [Intel 156] |
| 7:4 | receive ring size as log2, 8 to 2,048 entries | 9 (512 entries) | [Intel 157]; [Ref 96] |
| 8 | long transmit descriptor format; Intel's definitions call the short one unsupported by their driver | 1 | [Intel 158] |
| 12:9 | receive buffer size: 1 = 1K, 2 = 2K, 4 = 4K, 8 = 8K, 9 = 12K, 10 = 16K, … 14 = 32K | 4 | [Intel 159] |

- **Measured: the AX200 loaded and reached alive with control flags `0x990`.** Run11:492, 588.

**Starting the load** ([Ref 97]):

1. Write the context information's address to 0x040 as two 32-bit writes, low dword first. The reference driver does so because a single 64-bit write fails on some devices. [Ref 18].
2. Take the access request (§3.3).
3. Write the boot latency tolerance to 0x0D4 (below).
4. Write 1 to CPU init run (periphery 0xA05C44).
5. Release the access request.

- **Boot latency tolerance.** The reference driver sets about 250 µs, as a workaround for hardware latency during boot; the firmware sets it again later. [Ref 98].
  - Intel's definitions place the scale fields at bits 28:26 and 12:10 and the value fields at bits 25:16 and 9:0; the microsecond scale is 2. [Intel 160].
  - Intel's fields encode 250 µs with both requests as `0x88FA88FA` [I].
  - The reference driver shifts its scale by 24 and by 8, outside those fields, and so writes `0x80FA80FA` [I]. [Ref 99].
  - Intel's fields decide (§14).

### 7.3 AX210: context information, peripheral scratch and image loader

**Peripheral scratch (1,724 bytes).** Layout: [Intel 161].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | MAC identity | The reference driver writes the low 16 bits of the hardware revision register | [Intel 162]; [Ref 100] |
| 2 | 2 | version | 0 | [Ref 101] |
| 4 | 2 | size | the structure's size in dwords | [Intel 163]; [Ref 102] |
| 6 | 2 | reserved | | |
| 8 | 4 | control flags | the table below | [Intel 164] |
| 12 | 4 | extended control flags | 0 here | [Intel 165] |
| 16 | 8 | platform NVM address | §7.4 | [Intel 166] |
| 24 | 4 | platform NVM size | in bytes | same |
| 28 | 4 | reserved | | |
| 32 | 8 | hardware monitor address | not used here | [Intel 167] |
| 40 | 4 | hardware monitor size, dwords | | same |
| 44 | 4 | debug token configuration | | same |
| 48 | 8 | free-buffer ring address | §9.1 | [Intel 168] |
| 56 | 4 | reserved | | |
| 60 | 8 | reduced-power table address | not used here | [Intel 169] |
| 68 | 4 | reduced-power table size | | same |
| 72 | 4 | reserved | | |
| 76 | 8 | step configuration | two dwords; 0 here | [Intel 170] |
| 84 | 4 | sequencer override | | [Intel 171] |
| 88 | 4 | step analog parameters | | same |
| 92 | 32 | reserved | | same |
| 124 | 512 | UMAC image map | 64 × 8-byte DMA addresses | [Intel 172] |
| 636 | 512 | LMAC image map | 64 × 8-byte DMA addresses | same |
| 1148 | 512 | paging image map | 64 × 8-byte DMA addresses | same |
| 1660 | 64 | sequencer image map | 8 × 8-byte DMA addresses; not used here | same |

| Control flag bits | Meaning | The reference driver writes | Source |
|---|---|---|---|
| 1 | IMR debug | 0 on these parts | [Intel 173]; [Ref 103] |
| 16 | 4 KiB receive buffers (2 KiB when clear) | 1 | [Intel 174] |
| 17 | completion format: 1 for the legacy response format, 0 for completion descriptors | 1 | [Intel 175] |
| 19:18 | transmit descriptor size: 3 = 256 bytes | 3 | [Intel 176] |

- **The reference driver's control flags word is `0x000F0000`.** [Ref 104].

**Peripheral information (16 bytes):** boot stage mirror, IPC status mirror, sleep notification and a reserved dword, each a u32. [Intel 177].

- **The reference driver gives it a 4 KiB page.** It uses that page's second half as the transfer-ring tail index array, at offset 2,048, and the completion-ring tail index array, at offset 3,072, which the hardware touches although the reference driver does not use them. [Ref 105].

**Context information (104 bytes).** Layout: [Intel 178].

| Offset | Width | Field | The reference driver writes | Source |
|---|---|---|---|---|
| 0 | 2 | version | 0 | [Intel 179] |
| 2 | 2 | size | 0 | [Intel 180] |
| 4 | 4 | configuration | 0 | [Intel 181] |
| 8 | 8 | peripheral information address | the page above | [Intel 182]; [Ref 106] |
| 16 | 8 | completion-ring head index array address | the receive status area (§9.1) | [Intel 183]; [Ref 107] |
| 24 | 8 | transfer-ring tail index array address | peripheral information page + 2,048 | [Intel 184]; [Ref 108] |
| 32 | 8 | completion-ring tail index array address | peripheral information page + 3,072 | [Intel 185]; [Ref 109] |
| 40 | 8 | transfer-ring head index array address | 0 | [Intel 186] |
| 48 | 2 | completion-ring index array size | 0 | [Intel 187] |
| 50 | 2 | transfer-ring index array size | 0 | [Intel 188] |
| 52 | 8 | message transfer ring address | the command queue's descriptor ring (§8.1) | [Intel 189]; [Ref 110] |
| 60 | 8 | message completion ring address | the used-buffer ring (§9.1) | [Intel 190]; [Ref 111] |
| 68 | 2 | message transfer ring size | 5: 256 entries as log2 minus 3 | [Intel 191]; [Ref 112] |
| 70 | 2 | message completion ring size | 9: 512 entries as log2 | [Intel 192]; [Ref 113] |
| 72 | 2 | transfer ring doorbell vector | 0 | [Intel 193] |
| 74 | 2 | completion ring doorbell vector | 0 | [Intel 194] |
| 76 | 2 | transfer ring MSI vector | 0 | [Intel 195] |
| 78 | 2 | completion ring MSI vector | 0 | [Intel 196] |
| 80 | 1 | transfer descriptor optional header size, dwords | 0 | [Intel 197] |
| 81 | 1 | transfer descriptor optional footer size, dwords | 0 | [Intel 198] |
| 82 | 1 | completion descriptor optional header size, dwords | 0 | [Intel 199] |
| 83 | 1 | completion descriptor optional footer size, dwords | 0 | [Intel 200] |
| 84 | 2 | message rings control flags | 0 | [Intel 201] |
| 86 | 2 | peripheral information MSI vector | 0 | [Intel 202] |
| 88 | 8 | peripheral scratch address | the scratch above | [Intel 203]; [Ref 114] |
| 96 | 4 | peripheral scratch size | Intel's definitions: in dwords; the reference driver writes the size in bytes (§14) | [Intel 204]; [Ref 115] |
| 100 | 4 | reserved | | [Intel 205] |

**Starting the load** ([Ref 116]):

1. Refuse a file without an image loader.
2. Copy the image loader's contents (kind 52) into a DMA buffer.
3. Write the context information's address to 0x118, two 32-bit writes, low dword first.
4. Write the image loader's address to 0x120 the same way, and its length in bytes to 0x128.
5. Set bit 1 of 0x000, automatic function boot.
6. Take the access request.
7. Write the boot latency tolerance to 0x0D4 (§7.2).
8. Write 1 to CPU init run (periphery 0xA05C44, UMAC).
9. Release the access request.

### 7.4 AX210: platform NVM

**The file** is a sequence of records as §6.2 describes, with no header. [Ref 117]; [Intel 206].

- **A SKU record (kind 64) starts a block.** Its 12 bytes hold three u32 SKU words. [Ref 118].
- **Within a block**:
  - a hardware-type record (kind 58) names a MAC type and RF type;
  - a version record (kind 62) holds a u32;
  - each payload record (kind 19) holds a 4-byte word, then a payload.
  - [Ref 119].

| | Block 1 | Block 2 | Block 3 | Block 4 | Source |
|---|---|---|---|---|---|
| SKU words | `0x000610d0 0 0` | `0x000510d0 0 0` | `0x004510d0 0 0` | `0x004610d0 0 0` | CPN @0x000000, @0x0035a0, @0x006b74, @0x00a148 |
| hardware type | `0x42`, `0x10d` | `0x42`, `0x10d` | `0x42`, `0x10d` | `0x42`, `0x10d` | CPN @0x000014, @0x0035b4, @0x006b88, @0x00a15c |
| version | `0xe1c4fa8e` | `0xe1c4fa8e` | `0xe1c4fa8e` | `0xe1c4fa8e` | CPN @0x000028, @0x0035c8, @0x006b9c, @0x00a170 |
| payload 1 | word `0xcafedead`, 1,656 bytes | word `0xcafedead`, 1,656 bytes | word `0xcafedead`, 1,656 bytes | word `0xcafedead`, 1,656 bytes | CPN @0x000034, @0x0035d4, @0x006ba8, @0x00a17c |
| payload 2 | word `0xdeadcafe`, 11,996 bytes | word `0xdeadcafe`, 12,048 bytes | word `0xdeadcafe`, 12,048 bytes | word `0xdeadcafe`, 12,000 bytes | CPN @0x0006b8, @0x003c58, @0x00722c, @0x00a800 |

- **Two payloads per block** match Intel's count of unfragmented payloads. [Intel 207].
- **The reference driver skips a payload whose word is `0xddddeeee`**, a deprecated separator. [Ref 120].

**Choosing the block.** [Ref 121]:

1. The block whose three SKU words equal the alive notification's SKU identity (§7.5), and whose hardware type equals the part's MAC and RF types.
2. A SKU identity of all zeros skips the platform-NVM step.
3. The T14's SKU identity is unmeasured (§14).

**Handing it over.** [Ref 122]:

- **Capability 32 set**: the firmware accepts a fragmented platform NVM [Intel 208], and the AX210 file sets it (Appendix B).
  - Each payload goes into its own DMA buffer.
  - A 512-byte array holds their 64 addresses. Intel names this array; each address starts one payload. [Intel 209].
  - The peripheral scratch's platform NVM address is the array's address, and its size is the payloads' total length in bytes.
- **Capability 32 clear**: the payloads are concatenated in one buffer, and that buffer's address and total length go into the scratch.

**Telling the firmware.** [Ref 123]:

1. Take the access request.
2. Write bit 20 to the doorbell (periphery 0xA05C04, UMAC). The reference driver rings it also when no block matched, so that the firmware proceeds without one.
3. Wait up to 2 s for the platform-NVM-loaded notification (group 0x0c, identifier 0xfe): one u32, the platform NVM's loading status, 4 bytes, declared version 1 in the AX210 file. [Intel 210]; C89 v(0x0c,0xfe).
4. Release the access request.

### 7.5 The alive notification

Group 0x00, identifier 0x01. Both files declare notification version 6: C77 v(0x00,0x01); C89 v(0x00,0x01). Intel's definitions give version 6 the layout below, 144 bytes. [Intel 211].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | status | `0xCAFE` alive, `0xDEAD` error | [Intel 72] |
| 2 | 2 | flags | bit 0: RF-kill | [Intel 212] |
| 4 | 4 | LMAC 0 major | | [Intel 213] |
| 8 | 4 | LMAC 0 minor | | same |
| 12 | 1 | LMAC 0 version subtype | | same; [Intel 214] |
| 13 | 1 | LMAC 0 version type | | same; [Intel 215] |
| 14 | 1 | LMAC 0 MAC | | same |
| 15 | 1 | LMAC 0 option | | same |
| 16 | 4 | LMAC 0 timestamp | | same |
| 20 | 4 | LMAC 0 error table address | device-memory address of the LMAC error table (§12.2) | [Intel 128] |
| 24 | 4 | LMAC 0 event log address | | same |
| 28 | 4 | LMAC 0 CPU register address | | same |
| 32 | 4 | LMAC 0 debug configuration address | | same |
| 36 | 4 | LMAC 0 alive counter address | | same |
| 40 | 4 | LMAC 0 scheduler base address | | same |
| 44 | 4 | LMAC 0 store-and-forward address | | same |
| 48 | 4 | LMAC 0 store-and-forward size | | same |
| 52 | 48 | LMAC 1 | as offsets 4 to 51 | [Intel 216] |
| 100 | 4 | UMAC major | | [Intel 217] |
| 104 | 4 | UMAC minor | | same |
| 108 | 4 | UMAC error table address | device-memory address of the UMAC error table (§12.2) | same |
| 112 | 4 | UMAC print buffer address | | same |
| 116 | 12 | SKU identity | three u32 words (§7.4) | [Intel 218] |
| 128 | 8 | IMR base address | | [Intel 219] |
| 136 | 4 | IMR size | | same |
| 140 | 4 | IMR enabled | | same |

- **Measured on the AX200**:
  - the payload was 144 bytes, status `0xCAFE`, LMAC version 77.`0x563a6e92` and UMAC version 25.0 [Run11:588];
  - its error table addresses `0x4dff20` and `0x880128` equal the file's debug-address records [Run11:588; C77 @0x000080, @0x05b974].
- **The reference driver takes the error table addresses and the SKU identity from version 6.** [Ref 124].

## 8. The command channel

### 8.1 The command queue

- **Commands travel on transmit queue 0**, a ring of 256 transfer descriptors whose address is given to the device in the context information (§7.2, §7.3). [Ref 125]; [Ref 126].
- **Intel's definitions**: a ring is 256 descriptors of 256 bytes on these families, and at most 255 of them may be pending at once. [Intel 220].
- **The reference driver aligns the ring to 256 bytes.** [Ref 127].
- **The command queue has no byte-count table**: the context information names none, and the reference driver updates none for commands. [Ref 128].

**Transfer descriptor (256 bytes)**: [Intel 221].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | buffer count | bits 4:0 the number of buffer entries in use; bits 15:5 reserved | [Intel 222] |
| 2 | 250 | buffers | 25 entries of 10 bytes, below | [Intel 223] |
| 252 | 4 | padding | | [Intel 224] |

**Buffer entry (10 bytes, unaligned)**: [Intel 225].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | length | the buffer's length in bytes | [Intel 226] |
| 2 | 8 | address | the buffer's DMA address | same |

### 8.2 A command

**Header (8 bytes), followed by the payload, both in host memory.** [Intel 227].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 1 | identifier | the command's identifier within its group | [Intel 228] |
| 1 | 1 | group | the command's group | same |
| 2 | 2 | sequence | bits 7:0 the descriptor's slot, bits 12:8 the queue (0), bits 14:13 reserved, bit 15 clear | [Intel 229]; [Ref 129] |
| 4 | 2 | length | the payload's length in bytes | [Intel 230] |
| 6 | 1 | reserved | | [Intel 231] |
| 7 | 1 | version | The reference driver writes 0 for every command | [Intel 232]; [Ref 130] |

- **The sequence is the host's**: the firmware does not use it and returns it in the answer. [Intel 233].
- **A command whose group is 0 is sent in group 1, with the same identifier.**
  - Firmware of API 50 or later rejects a group-0 command with a bad-command firmware error. [Ref 131].
  - Intel's definitions make group 1 the default for legacy identifiers. [Intel 234].
  - Both files declare their legacy commands in group 1 (Appendix A), and the AX200 answered such commands in group 1. Run11:597-602.
- **Placing a command**: the reference driver points the first buffer entry at the command's first `min(20, total)` bytes and, when the command is longer, the second entry at the rest of the same contiguous buffer. [Ref 132]; [Ref 133]. Whether one entry for the whole command is accepted is open (§14).
- **The reference driver aligns its command buffers to 64 bytes** and bounds a payload at 4,096 − 8 bytes. [Ref 134]; [Ref 135].
- **Measured**: the AX200 accepted payloads of 4 to 1,940 bytes in two buffer entries. Run13:597-621.

### 8.3 The write pointer

- **After filling a slot, write the queue's new write index and the queue's number to 0x460.**
  - Intel's definitions put the queue number at bit 16 and numbers receive queues from 512. [Intel 235].
  - Its older description gives the index as bits 7:0 and the queue as bits 11:8. [Intel 236].
- **The reference driver writes `(queue << 16) | index`.** [Ref 136].
  - On the AX200 the index is the next slot, modulo 256.
  - On the AX210 the index is a 16-bit counter, modulo 65,536, whose value modulo 256 is the next slot.
  - [Ref 137]; [Ref 138].

### 8.4 Answers

- **An answer is a receive packet (§9.4) whose sequence equals the command's, with bit 15 clear.** It carries the command's group and identifier, and for a legacy command, group 1. [Intel 229]; Run11:591-602.
- **The reference driver treats bit 6 of an answer's group byte as a failed command.** [Ref 139]; [Ref 140].
- **The reference driver waits 1 s for each answer.** [Ref 141].
- **Measured AX200 answer times** ranged from 270 µs to 8.2 ms through the bring-up and the scan request. Run13:597-621.

## 9. The receive channel

### 9.1 Rings and status

The reference driver runs one receive queue, queue 0, of 512 buffers of 4,096 bytes. [Ref 142]; [Ref 143].

| Structure | AX200 | AX210 | Source |
|---|---|---|---|
| free-buffer ring | 512 entries of 8 bytes, 256-byte aligned | 512 transfer descriptors of 16 bytes, 256-byte aligned | [Ref 144] |
| used-buffer ring | 512 entries of 4 bytes, 256-byte aligned | 512 completion descriptors of 32 bytes, 256-byte aligned | [Ref 145] |
| status area | a 12-byte status block, 16-byte aligned | a 2-byte index, 16-byte aligned | [Ref 146]; [Intel 237] |

**AX200 free-buffer entry (8 bytes)**: bits 63:12 hold the buffer's address and bits 11:0 its identifier, so a buffer is 4 KiB-aligned [I]. [Ref 147].

**AX210 transfer descriptor (16 bytes)**: [Ref 148].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 2 | identifier | the buffer's tag; the reference driver uses the ring slot |
| 2 | 6 | reserved | |
| 8 | 8 | address | the buffer's DMA address |

**AX210 completion descriptor (32 bytes)**: [Ref 149].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | reserved | |
| 4 | 2 | identifier | the tag of the filled buffer |
| 6 | 1 | flags | bit 0: fragmented |
| 7 | 25 | reserved | |

**AX200 status block (12 bytes)**: [Intel 237].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 2 | closed buffer index | bits 11:0: the index of the last buffer the device closed |
| 2 | 2 | closed frame index | bits 11:0 |
| 4 | 2 | finished buffer index | bits 11:0: the buffer in which the last frame was written |
| 6 | 2 | finished frame index | bits 11:0 |
| 8 | 4 | spare | |

- **On the AX210 the status area holds the completion ring's head index**, of which the reference driver uses bits 11:0. [Ref 150].
- **The reference driver reads neither used ring.** It takes buffers in ring order up to the status index, so it relies on the device filling them in order [I]. [Ref 151].
- **The AX200's 4-byte used-ring entry has no layout in any reference** (§14).

### 9.2 Draining

[Ref 152].

1. Read the status index (§9.1), keep bits 11:0, and reduce it modulo 512.
2. Process the buffers from the next unread slot up to, not including, that index.
3. Write `((index − 1) mod 512)`, rounded down to a multiple of 8, to the free-ring write-index trigger 0x1C80. The reference driver aligns this write to 8, noting the hardware misbehaves otherwise.

### 9.3 Posting at alive

- **The free ring is filled only after the alive cause**: the reference driver notes the firmware has configured the receive flow handler by then. [Ref 153].
- **On the alive cause**, write all 512 free-ring entries, then write 8 to 0x1C80. [Ref 52].
- **Measured**: the AX200 delivered the alive notification after 8 buffers were handed over this way. Run11:550, 588.
- **A buffer whose packet the host keeps** is replaced in its slot before the slot is handed back. [Ref 154].

### 9.4 Packets in a buffer

**A packet** is a 4-byte length-and-flags word, then a 4-byte header, then the payload. [Intel 238].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | length and flags | bits 13:0 the packet's length after this word, header included; bits 21:16 the receive queue; bits 22-31 flags | [Intel 239] |
| 4 | 1 | identifier | the notification's or answered command's identifier | [Intel 240] |
| 5 | 1 | group | its group | same |
| 6 | 2 | sequence | bit 15 set: the firmware originated it; clear: it answers the command in queue bits 12:8, slot bits 7:0 | [Intel 229] |
| 8 | length − 4 | payload | | [Intel 241] |

- **The next packet starts at this one's start plus 4 plus its length, rounded up to 64 bytes.** [Intel 242]; [Ref 155].
- **The packets end at the first of these**: a length-and-flags word of `0x55550000`; a header whose identifier, group and sequence are all zero; or too little room left in the 4,096-byte buffer for a word and a header. [Intel 243]; [Ref 156].
- **The AX210 puts one packet in each buffer; the AX200 may put several.** [Ref 157].
- **Measured**: the AX200's notifications carried `0xc0` or `0x80` as the sequence's high byte, so bit 15 was always set and bit 14 varied. Run13:595, 668.

## 10. Commands and notifications through a passive scan

Groups: 0x00 legacy, 0x01 long, 0x02 system, 0x03 MAC configuration, 0x04 PHY operations, 0x05 data path, 0x0c regulatory and NVM, 0x0f debug, 0x10 statistics. [Intel 244]. "Declared" is each file's entry (Appendix A); "c" is the command version and "n" the notification version.

### 10.1 Summary

| § | Message | Group, identifier | Direction | AX200 declares | AX210 declares | Layout |
|---|---|---|---|---|---|---|
| 7.5 | alive | 0x00, 0x01 | notification | n6 | n6 | 144 bytes |
| 10.2 | init flags | 0x02, 0x03 | command; 4-byte answer | none | none | 4 bytes |
| 10.3 | NVM done | 0x0c, 0x00 | command | c1 | c1 | 4 bytes |
| 10.4 | init complete | 0x00, 0x04 | notification | none | none | not used |
| 10.5 | NVM info | 0x0c, 0x02 | command; answer | c1 n4 | c1 n4 | 4; 468 bytes |
| 10.6 | transmit antennas | 0x01, 0x98 | command | c1 | c1 | 4 bytes |
| 10.7 | coexistence | 0x01, 0x9b | command | c6 | c6 | 8 bytes |
| 10.8 | platform latency | 0x02, 0x01 | command | c2 | c2 | 8 bytes |
| 10.9 | latency tolerance | 0x01, 0xee | command | c3 | c3 | 32 bytes |
| 10.10 | temperature thresholds | 0x04, 0x04 | command | c1 | c1 | 20 bytes |
| 10.11 | device power | 0x01, 0x77 | command | c6 | c7 | 4 bytes |
| 10.12 | country update | 0x01, 0xc8 | command; answer | c1 n5 | c1 n6 | 28 bytes; 20 + 4 per channel |
| 10.12 | country change | 0x00, 0xc9 | notification | none | none | 4 bytes |
| 10.13 | scan configuration | 0x01, 0x0c | command | c5 | c5 | 12 bytes |
| 10.14 | beacon filter | 0x01, 0xd2 | command | c4 | c4 | 60 bytes |
| 10.15 | scan request | 0x01, 0x0d | command | c15 | c17 | 1,940 bytes |
| 10.17 | scan abort | 0x01, 0x0e | command | c1 | c1 | 8 bytes |
| 10.16 | scan iteration done | 0x00, 0xb5 | notification | none | none | 16 + 8 per channel |
| 10.16 | scan done | 0x00, 0x0f | notification | none | none | 16 bytes |
| 7.4 | platform NVM loaded | 0x0c, 0xfe | notification | n1 | n1 | 4 bytes |
| 11 | received frame | 0x00, 0xc1 | notification | n4 | n5 | §11 |
| 12.3 | command error | 0x00, 0x02 | notification | none | none | 20 bytes |
| 12.5 | thermal shutdown | 0x04, 0xfe | notification | n2 | n2 | 4 bytes |

- **The group-0 commands of this table are sent in group 1** (§8.2).
- **Notifications with a legacy identifier arrive in group 0.** The AX200's did wherever the demo logged the group [Run11:589; Run13:622, 648], and the reference driver matches the rest in group 0 too [Ref 158]. The demo accepted groups 0 and 1 alike for legacy identifiers, so its logs do not show the group of the scan and country notifications [Ref 159].
- **Every declared notification without a section here arrives only as a count**: §10.18.

### 10.2 Init flags (group 0x02, identifier 0x03)

Neither file declares it. Intel's definitions give one layout, which they name version 1. [Intel 245].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | flags | bit 0: a debug configuration follows; bit 1: NVM access commands follow; bit 2: the PHY configuration command follows | [Intel 245] |

- **The reference driver sends bit 1.** [Ref 160]; [Ref 161].
- **Measured: the answer was 4 bytes, value 0.** Run11:591; Run13:597.

### 10.3 NVM done (group 0x0c, identifier 0x00)

Version 1; one reserved u32, 4 bytes. [Intel 246].

- **Measured: the answer was empty.** Run11:592; Run13:598.

### 10.4 Init complete (group 0x00, identifier 0x04)

- **The firmware sends it when initialisation ends**, and Intel names it. [Intel 247].
- **The reference driver waits for it after the NVM-done command and reads none of its payload.** [Ref 162].

### 10.5 NVM info (group 0x0c, identifier 0x02)

**Request**: one reserved u32, 4 bytes, version 1. [Intel 248].

**Answer**, version 4, 468 bytes. [Intel 249].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | general flags | bit 0: the OTP is empty | [Intel 250] |
| 4 | 2 | NVM version | | same |
| 6 | 1 | board type | | same |
| 7 | 1 | address count | reserved MAC addresses | same |
| 8 | 4 | MAC SKU flags | bit 0 2.4 GHz, 1 5 GHz, 2 11n, 3 11ac, 4 11ax, 5 MIMO disabled, 8 WAPI, 14 regulatory checker, 15 API lock | [Intel 251] |
| 12 | 4 | transmit chains | bit 0 chain A, bit 1 chain B | [Intel 252] |
| 16 | 4 | receive chains | as above | same |
| 20 | 4 | LAR enabled | nonzero: location-aware regulatory is on | [Intel 253] |
| 24 | 4 | channel count | valid entries in the profile | same |
| 28 | 440 | channel profile | 110 u32 entries, one per channel in the order below | [Intel 254] |

- **Profile index to channel number** (the reference driver): indices 0-13 are 2.4 GHz channels 1-14; indices 14-50 are 5 GHz channels 36, 40, … 64, 68, … 144, 149, … 181; and on parts with 6 GHz, indices 51-109 are 6 GHz channels 1, 5, … 233. [Ref 163].
- **The reference driver uses the 51-entry list on the AX200 and the 110-entry list on the AX210.** [Ref 164].

| Profile entry bit | Meaning | Source |
|---|---|---|
| 0 | valid for this SKU and country | [Intel 255] |
| 1 | IBSS (deprecated under LAR) | same |
| 2 | active scan allowed, AP only at 20 MHz | same |
| 3 | active scan allowed; clear: passive only | same |
| 4 | radar detection required | same |
| 5 | indoor only | same |
| 6 | GO concurrent | same |
| 7 | uniform spreading | same |
| 8 | 20 MHz allowed | same |
| 9 | 40 MHz allowed | same |
| 10 | 80 MHz allowed | same |
| 11 | 160 MHz allowed | same |
| 12 | DC high | same |
| 13 | 6 GHz VLP client | same |
| 14 | 6 GHz AFC client | same |
| 15 | 6 GHz VLP AP not allowed | same |

- **The reference driver marks a 5 GHz entry invalid when the MAC SKU lacks 5 GHz.** [Ref 165].
- **The reference driver's bits 7 and 8 differ from Intel's**; Intel's decide. [Ref 166].
- **Measured on the AX200**: the answer was 468 bytes; NVM version `0x1235`; MAC SKU flags `0x1f`; transmit and receive chains `0x3`; LAR on; 38 valid channels, 25 of them passive. Run11:594-596.

**The MAC address** is read from the registers of §3.2 under the access request. [Ref 167].

1. Read the strap words, 0x388 then 0x38C.
2. The address's bytes are the first word's bytes 3, 2, 1, 0, then the second word's bytes 1, 0, each word taken little-endian.
3. If that address is valid, use it. Valid means not `02:cc:aa:ff:ee:00`, not all ones, not all zeros, and not multicast.
4. Otherwise read the one-time-programmable words, 0x380 then 0x384, the same way.
5. The reference driver refuses a part with no valid address.

### 10.6 Transmit antennas (group 0x01, identifier 0x98)

Version 1: one u32, the valid transmit antenna mask, 4 bytes. [Intel 256].

- **The reference driver sends** the PHY configuration word's transmit chains (bits 19:16), ANDed with the NVM-info answer's transmit chains. [Ref 168]; [Intel 257].
- **Measured: accepted, with an empty answer.** Run13:603.

### 10.7 Coexistence (group 0x01, identifier 0x9b)

Version 6, 8 bytes. [Intel 258].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | mode | 0 disabled, 1 NW, 2 Bluetooth, 3 Wi-Fi |
| 4 | 4 | modules | bit 0 MPLUT, 1 MPLUT boost, 2 sync-to-SCO, 3 co-running, 4 high-band retention |

- **The reference driver sends mode 3 with no modules.** [Ref 169].
- **Measured: accepted.** Run13:604.

### 10.8 Platform latency (group 0x02, identifier 0x01)

Version 2, 8 bytes. [Intel 259].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | flags | bit 0 discrete; bit 1 low-latency crystal; bits 3:2 LTR apply delay: 0 none, 1 200, 2 2500, 3 1820 |
| 4 | 4 | latency | the time the SoC needs for stable power and crystal |

- **In version 1 the firmware reads the flags as an integer; in version 2 as bits.** [Intel 260].
- **The reference driver sends flags 1 and latency 0 to these discrete parts.** [Ref 170].
- **Measured: accepted.** Run13:605.

### 10.9 Latency tolerance (group 0x01, identifier 0xee)

Declared version 3 in both files. Intel's definitions give a 12-byte layout, which they name version 1, and the 32-byte layout below, which they name version 2. [Intel 261].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | flags | bit 0 enable; 1 hardware off on shadow access; 2 short write-through; 3 hardware off D0 to D3; 4 static short; 5 static long; 6 deny C10 on power-down; 7 update values |
| 4 | 4 | static long | |
| 8 | 4 | static short | |
| 12 | 16 | values | four u32 µs values: transmit, receive, short idle, long idle; used with flag bit 7 |
| 28 | 4 | short idle timeout | µs; used with flag bit 7 |

- **The reference driver sends flag bit 0 only, and only when device control 2 enables LTR.** [Ref 171].
- **Measured: the AX200 accepted the 32-byte layout at its declared version 3.** Run13:606. The AX210 is unmeasured (§14).

### 10.10 Temperature thresholds (group 0x04, identifier 0x04)

Version 1, 20 bytes: a u32 count, then eight 16-bit thresholds. [Intel 262].

- **The reference driver sends it all zero**, so that the firmware owns thermal shutdown and transmit back-off, and only when capability 74 (CT kill by firmware) is set. Both files set capability 74. [Ref 172]; [Intel 263].
- **Measured: accepted.** Run13:607.

### 10.11 Device power (group 0x01, identifier 0x77)

4 bytes: flags u16 and a reserved u16. Intel names this layout version 7. [Intel 264].

| Flags bit | Meaning |
|---|---|
| 0 | power save allowed |
| 1 | memory retention |
| 7 | no sleep until D3 entry completes |
| 12 | the external 32 kHz clock is valid |

- **The reference driver sets bit 0 when power management is on**, which it is by default. [Ref 173].
- **The design keeps the radio awake until W8** (#876 §4); bit 0 clear does that [I].
- **Measured: the AX200 accepted the 4-byte layout at its declared version 6.** Run13:608.

### 10.12 Country update (group 0x01, identifier 0xc8) and country change (group 0x00, identifier 0xc9)

**Command**: Intel names this layout version 2, 28 bytes. [Intel 265].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 2 | country | two ASCII letters, the first in the high byte; `ZZ` asks for the NVM's default profile; `00` is the world domain |
| 2 | 1 | source | 0x10 asks for the current country ([Intel 266]) |
| 3 | 1 | reserved | |
| 4 | 4 | key | integrity key for OEM testing |
| 8 | 20 | reserved | |

- **The reference driver sends `ZZ`**, with source 0x10 when API bit 9 or capability 29 is set, else source 0. Both files set API bit 9, and neither sets capability 29. The reference driver sends it only when the NVM-info answer enables LAR and capability 1 is set. [Ref 174]; [Intel 267]; Appendix B.
- **Measured: a 32-byte command made the AX200's firmware assert** (§12.2), and the 28-byte command was accepted. Run11:604; Run13:609.

**Answer.**

- **Neither declared version (5 on the AX200, 6 on the AX210) has a layout in Intel's definitions**, which gives versions 3, 4 and 8. [Intel 268].
- **The reference driver reads the version-4 layout when capability 89 is set**, which both files set, and refuses versions 8 and above. [Ref 175].
- **Measured: the AX200's answer had the version-4 layout**: 224 bytes, which is 20 plus 51 channels of 4; status 1; country `00`; capabilities `0x3f`; source 7. Run13:609-610.
- **The AX210's version-6 answer is unmeasured** (§14).

| Offset | Width | Field | Meaning (version 4) |
|---|---|---|---|
| 0 | 4 | status | 0 new profile, 1 same profile, 2 invalid, 3 NVM disabled, 4 illegal, 5 low priority, 6 to 8 test modes ([Intel 269]) |
| 4 | 2 | country | as in the command |
| 6 | 2 | capabilities | for every channel of the country |
| 8 | 2 | time | since the MCC test began, in 30 s units |
| 10 | 2 | geographic information | bit 0: ETSI 5 GHz WMM limits |
| 12 | 1 | source | [Intel 266] |
| 13 | 3 | reserved | |
| 16 | 4 | channel count | |
| 20 | 4 per channel | channels | the low 16 bits of each are flags as the NVM profile's (§10.5), in its order |

**Country change notification**: 4 bytes, the country u16, source u8 and a reserved u8. Neither file declares it. [Intel 270].

- **Intel's definitions: with this notification the firmware asks the host to request a regulatory update for the given country.** [Intel 271].
- **Measured: after its first scan, the AX200 sent country `NL` with source 5 (Wi-Fi).** Run13:637. The firmware derived a country from what it received [I], which bears on W6's transmit limits.

### 10.13 Scan configuration (group 0x01, identifier 0x0c)

Version 5, 12 bytes. [Intel 272].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 1 | CAM mode | |
| 1 | 1 | promiscuous mode | |
| 2 | 1 | broadcast station | deprecated from version 5 |
| 3 | 1 | reserved | |
| 4 | 4 | transmit chains | the valid transmit antennas (§10.6) |
| 8 | 4 | receive chains | the valid receive antennas, computed as the transmit ones from bits 23:20 |

- **The reference driver requires API bit 56** (reduced scan configuration), which both files set. It leaves the broadcast station 0 from version 5. [Ref 176]; [Intel 273].
- **Measured: accepted.** Run13:612.

### 10.14 Beacon filter (group 0x01, identifier 0xd2)

Version 4, 60 bytes: fifteen u32 fields. [Intel 274].

- **The reference driver sends it all zero, which turns filtering off.** [Ref 177].
- **Measured: accepted.** Run13:613.

### 10.15 Scan request (group 0x01, identifier 0x0d)

- **Intel's definitions give one layout for versions 14 to 17**, 1,940 bytes; the AX200 declares 15 and the AX210 17. [Intel 275].
- **Measured: the AX200 accepted the 1,940-byte layout at its declared version 15** and scanned 38 channels passively. Run13:620-636.

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 4 | identifier | the scan's identifier: type in bits 7:0, sequence from bit 8 | [Intel 276] |
| 4 | 4 | out-of-channel priority | 0 lowest to 7 highest | [Intel 277] |
| 8 | 2 | general flags | the table below | [Intel 278] |
| 10 | 1 | reserved | | same |
| 11 | 1 | MAC identity | reports the scan start against this MAC's TSF | same |
| 12 | 2 | active dwell | per LMAC, low band then high band | same |
| 14 | 1 | adaptive dwell, 2.4 GHz | default number of APs | same |
| 15 | 1 | adaptive dwell, 5 GHz | default number of APs | same |
| 16 | 1 | adaptive dwell, social channels | default number of APs on channels 1, 6 and 11 | same |
| 17 | 1 | flags 2 | bit 2: do not toggle antennas (version 11 only) | [Intel 279] |
| 18 | 2 | adaptive dwell budget | maximum TUs adaptive dwell adds | [Intel 280] |
| 20 | 8 | maximum out-of-channel time | per LMAC, u32 each | same |
| 28 | 8 | suspend time | per LMAC, u32 each | same |
| 36 | 4 | scan priority | | same |
| 40 | 2 | passive dwell | per LMAC | same |
| 42 | 2 | fragments | per LMAC | same |
| 44 | 1 | channel flags | bit 0 EBS, 1 EBS accurate, 2 cache add, 3 EBS fragmented, 4 force EBS, 5 enable channel order, 6 6 GHz PSC no filter | [Intel 281] |
| 45 | 1 | channel count | | same |
| 46 | 2 | APs override | two values for adaptive dwell | same |
| 48 | 536 | channels | 67 entries of 8 bytes, below | [Intel 282] |
| 584 | 8 | schedules | two entries: interval in seconds u16, iteration count u8 (0xff forever), reserved u8 | [Intel 283] |
| 592 | 2 | delay | seconds before the first iteration | [Intel 284] |
| 594 | 2 | reserved | | same |
| 596 | 4 | probe header segment | offset u16 and length u16 of the MAC header in the buffer below | [Intel 285] |
| 600 | 12 | probe band segments | three segments as above: 2.4 GHz, 5 GHz, 6 GHz | same |
| 612 | 4 | probe common segment | | same |
| 616 | 512 | probe buffer | the probe request template | [Intel 286] |
| 1128 | 1 | short SSID count | | [Intel 287] |
| 1129 | 1 | BSSID count | | same |
| 1130 | 2 | reserved | | same |
| 1132 | 680 | directed SSIDs | 20 entries: element ID u8, length u8, SSID of 32 bytes | [Intel 288] |
| 1812 | 32 | short SSIDs | 8 u32 | [Intel 289] |
| 1844 | 96 | BSSIDs | 16 entries of 6 bytes | [Intel 290] |

| General flag bit | Meaning | Source |
|---|---|---|
| 0 | periodic | [Intel 291] |
| 1 | pass every beacon and probe response to the host | same |
| 2 | send the iteration-done notification after every iteration | same |
| 3, 4 | fragmented, per LMAC | same |
| 5 | match profiles | same |
| 6 | use all receive chains | same |
| 7 | adaptive dwell | same |
| 8 | preemptible | same |
| 9 | send a start notification | same |
| 10 | multiple SSIDs | same |
| 11 | every channel passive | same |
| 12-15 | 6 GHz and OCE options | same |

**Channel entry (8 bytes).** [Intel 292].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | flags | bits 19:0 directed-SSID bitmap; bit 20 + i: use APs override i; bits 31:30 band, in the version-5 form |
| 4 | 1 | channel | channel number |
| 5 | 1 | band (version 2 form) or highest PSD (version 5 form) | |
| 6 | 1 | iteration count | |
| 7 | 1 | iteration interval | |

- **Which form goes with which scan version is not in Intel's definitions.** The reference driver writes the version-2 form below version 17 (with API bit 58 set, as both files set it) and the version-5 form, with PSD −128, at 17. [Ref 178]; Appendix B.
- **Band values disagree within Intel's definitions.**
  - The PHY band values are 0 for 5 GHz, 1 for 2.4 GHz and 2 for 6 GHz [Intel 293], and the scan results use the same encoding [Intel 294].
  - The channel entry's own description gives 0 for 2.4 GHz and 1 for 5 GHz [Intel 295].
  - **Measured on the AX200 at version 15**: entries carrying band 1 for channels 1-13 and 0 for 5 GHz found the test network on channel 6. Run13:620-641; [Ref 179].
  - On the AX210 at version 17 the band sits in the flags (§14).

**What the reference driver and the demo sent.** [Ref 180]; Run13:620.

- out-of-channel priority 6;
- general flags bits 1, 2 and 7, with bit 11 when no SSID is directed;
- active dwell 10 and passive dwell 110 on both LMACs;
- adaptive dwell defaults 2 (2.4 GHz), 8 (5 GHz) and 10 (social), with a budget of 300 TU;
- scan priority 6;
- channel flags bit 5, and APs overrides 10 and 2;
- one schedule entry with iteration count 1;
- each channel in the NVM or country profile, up to the file's scan channel count (§6.3), with iteration count 1.

**The probe template** is the MAC header (24 bytes plus an empty SSID element), followed by the per-band rates elements and the common elements; the firmware fills the duration, the sequence and the SSID. [Ref 181].

- **Measured on the AX200**: 38 channels scanned passively in 4,337 ms, with 17 frames received and 15 networks found. Run13:620-636.

### 10.16 Scan notifications

**Iteration done (group 0x00, identifier 0xb5).** 16 bytes, then 8 bytes per channel. [Intel 296].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | identifier | the scan's identifier |
| 4 | 1 | channels scanned | the number of per-channel results that follow |
| 5 | 1 | status | 1 completed, 2 aborted ([Intel 297]) |
| 6 | 1 | Bluetooth status | |
| 7 | 1 | last channel | |
| 8 | 8 | start TSF | µs, against the MAC named in the request |
| 16 | 8 per channel | results | channel u8, band u8 (0 5.2 GHz, 1 2.4 GHz), probe status u8, probes not sent u8, duration in the channel in µs u32 |

**Scan done (group 0x00, identifier 0x0f).** 16 bytes. [Intel 298].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | identifier | |
| 4 | 1 | last schedule | |
| 5 | 1 | last iteration | |
| 6 | 1 | status | 1 completed, 2 aborted |
| 7 | 1 | EBS status | 0 success, 1 failed, 2 channel not found, 3 inactive ([Intel 299]) |
| 8 | 4 | time from last iteration | |
| 12 | 4 | reserved | |

- **Measured on the AX200**: iteration done with 38 channels and status 1, then scan done with status 1 and EBS status 3, both in the same millisecond. Run13:634-635.
- **Frames received during the scan** arrive as received-frame notifications (§11). [Intel 300].

### 10.17 Scan abort (group 0x01, identifier 0x0e)

Version 1, 8 bytes: the scan's identifier u32 and flags u32 (reserved). [Intel 301].

- **The status values are 0 aborted, 1 abort in progress, 2 nothing to abort.** [Intel 302].

### 10.18 Notifications counted, not decoded

**Measured on the AX200**:

| Group, identifier | Intel's name | AX200 declares | Measured | Source |
|---|---|---|---|---|
| 0x00, 0xb1 | loader (MFUART) status, 16 or 20 bytes | none | once after alive, 20 bytes | [Intel 303]; Run11:589; Run16:716 |
| 0x00, 0xf7 | firmware log message | none | once after the runtime configuration, 12 bytes | [Intel 304]; Run13:622; Run16:717 |
| 0x00, 0x9d | statistics | n15 | 480 bytes, once per beacon kept while associated (83 of each) | [Intel 305]; Run13:648; Run16:709, 715 |
| 0x05, 0xf7 | rate-control update | n3 | once after association, 20 bytes | [Intel 306]; Run13:658; Run16:718 |
| 0x05, 0xf8 | beacon pass-through | none | 82 times while associated, 8 bytes, sequence high byte `0x80` | [Intel 307]; Run13:668; Run16:719 |

- **Every other notification either file declares is listed in Appendix A.** A writer counts by kind any it receives outside this document.

## 11. Received frames: W1's device inputs

### 11.1 The received-frame notification (group 0x00, identifier 0xc1)

- **The AX200 file declares notification version 4, and the AX210 file version 5.** C77 v(0x00,0xc1); C89 v(0x00,0xc1).
- **Intel's definitions give the descriptor a 20-byte common part, then a tail.** The version-4 tail is 28 bytes, for a 48-byte descriptor; versions 3, 5 and 6 take a 44-byte tail, for a 64-byte descriptor. [Intel 308].
- **The reference driver reads 64 bytes on the AX210 and 48 on the AX200.** [Ref 182].
- **The frame follows the descriptor, and is exactly the descriptor's MPDU length long.** Bytes after it in the packet are not part of the frame (§11.7). [Ref 183].

**Common part.** [Intel 309].

| Offset | Width | Field | Meaning | Source |
|---|---|---|---|---|
| 0 | 2 | MPDU length | the frame's length in bytes | [Intel 310] |
| 2 | 1 | MAC flags 1 | bits 1:0 address type; bits 7:4 MIC and CRC length in 2-byte words | [Intel 311] |
| 3 | 1 | MAC flags 2 | bits 4:0 header length in 2-byte words; bit 5: two padding bytes follow the header; bit 6: an A-MSDU subframe | [Intel 312] |
| 4 | 1 | A-MSDU information | bits 6:0 subframe index; bit 7 last subframe | [Intel 313] |
| 5 | 2 | PHY information | bit 0 end of frame; 3 LDPC; 5 in an A-MPDU; 6 A-MPDU toggle; 7 short preamble (CCK only); 8 the TSF field carries PHY data | [Intel 314] |
| 7 | 1 | MAC, PHY and band | bits 3:0 MAC (or link); bits 5:4 PHY; bits 7:6 band | [Intel 315] |
| 8 | 2 | raw checksum | only with receive-path acceleration | [Intel 316] |
| 10 | 2 | L3/L4 flags, or PHY data 4 | | [Intel 317] |
| 12 | 4 | status | §11.2 | [Intel 318] |
| 16 | 4 | reorder data | §11.4 | [Intel 319] |

**AX200 tail, version 4 (descriptor 48 bytes).** [Intel 320].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 20 | 4 | PHY data 2, or RSS hash | |
| 24 | 4 | PHY data 3, or filter match | |
| 28 | 4 | rate and flags | the received rate's encoding |
| 32 | 1 | energy, chain A | |
| 33 | 1 | energy, chain B | |
| 34 | 1 | channel | channel number |
| 35 | 1 | MAC context mask | |
| 36 | 4 | arrival time | the device's GP2 timer at the frame's start |
| 40 | 8 | arrival TSF, or PHY data 0 and 1 | PHY data when PHY information bit 8 is set |

**AX210 tail, versions 3, 5 and 6 (descriptor 64 bytes).** [Intel 321].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 20 | 4 | PHY data 3, or filter match | |
| 24 | 4 | PHY data 2, or RSS hash | |
| 28 | 4 | partial hash | |
| 32 | 2 | raw checksum | big-endian |
| 34 | 2 | reserved | |
| 36 | 4 | rate and flags | |
| 40 | 1 | energy, chain A | |
| 41 | 1 | energy, chain B | |
| 42 | 1 | channel | channel number |
| 43 | 1 | MAC context mask | |
| 44 | 4 | arrival time | GP2 |
| 48 | 8 | arrival TSF, or PHY data 0 and 1 | as in version 4 |
| 56 | 4 | PHY data 5 | with PHY information bit 8 |
| 60 | 4 | reserved | |

- **Signal**: the reference driver takes the stronger of −energy A and −energy B in dBm, and reads 0 as no measurement. [Ref 184].
- **Band**: API bit 59, set in both files, marks firmware that reports the band in this notification. [Intel 322]; Appendix B. The band field's encoding is not stated; the PHY band values of §10.15 are the likely one [I].

### 11.2 Status

[Intel 318].

| Bit | Meaning |
|---|---|
| 0 | CRC OK |
| 1 | no overrun |
| 2 | the transmitter is a known station |
| 3 | a key is valid for it |
| 5 | ICV OK |
| 6 | MIC OK |
| 7 | replay error, under API bit 41, which both files set; otherwise TTAK OK |
| 10:8 | security: 0 none, 1 WEP, 2 CCM, 3 TKIP, 4 extended, 5 GCM, 6 CMAC or GMAC, 7 unknown or error |
| 11 | decrypted |
| 15 | robust management frame |
| 16 | checksum done |
| 17 | checksum OK |
| 22 | duplicate |
| 28:24 | station identifier |

- **Bit 7's meaning under API bit 41** is from [Intel 323] and [Intel 324].
- **Status words measured on the AX200**:
  - `0x00001007` on unprotected frames from the joined AP;
  - `0x00007a5f` on CCMP-protected frames that decrypted;
  - `0x0000101b` on a beacon from another BSS.
  - Run16:655-657, 684.
- **Bits 4, 12, 13 and 14 were set in some of those words, and no source names them** (§14).

**Acceptance, in the reference driver's order.** [Ref 185].

1. Drop a frame without CRC OK and no overrun.
2. Drop one shorter than a minimal 24-byte header, or longer than its packet.
3. Remove header padding (§11.3).
4. Mark A-MSDU subframes (§11.5).
5. Check decryption (§11.3).
6. Drop duplicates (§11.6).
7. Reorder (§11.4).

### 11.3 Header, padding and protection

- **Header length**: MAC flags 2's header length counts the CCMP header on protected frames.
  - It read 12 words (24 bytes) on unprotected management and data frames. Run16:655-657, 663-664.
  - It read 16 words (32 bytes) on CCMP-protected non-QoS data frames, whose header plus CCMP header is 32 bytes. Run16:684-687, 694.
- **Padding**: with MAC flags 2 bit 5 set, two bytes of padding follow the 802.11 header, and on a CCM-protected frame they follow the CCMP header. [Intel 325]; [Ref 186].
  - The bit was clear on every frame the demo logged, none of them QoS data. Run14, Run15, Run16 `wifi-rx` lines.
- **Decryption**: the reference driver accepts a protected unicast or group frame under a CCMP key only when the security field reads 2 (CCM) and the decrypted and MIC-OK bits are both set. [Ref 187].
- **The CCMP header stays in the frame**: 8 bytes after the 802.11 header, carrying the packet number and the key ID. [Ref 188]. The reference driver refuses a frame whose header lacks the extended-IV bit (byte 3, bit 5). [Ref 189].
- **The MIC: measured, the AX200's firmware removes it.**
  - On every decrypted IPv4 frame the demo probed, the IP datagram's total length equalled the bytes after the LLC header, and no MIC followed. Run14:681, 689, 699; Run16:694, 696, 699, 725, 728, 734.
  - One 368-byte frame was 24 bytes of header, 8 of CCMP header, 8 of LLC, 20 of IPv4, 8 of UDP and 300 of DHCP. Run14:681; Run15:676.
  - MAC flags 1's MIC and CRC length read 0 on those frames. Same lines.
  - The reference driver keeps whatever trails the frame, because firmware versions differ on removing the MIC. [Ref 190].
  - The AX210 is unmeasured (§14).
- **Replay**: the reference driver checks the 48-bit packet number itself: CCMP header bytes 0, 1, 4, 5, 6 and 7, least significant first. A frame whose number is not above the last accepted for its key and TID is dropped; A-MSDU subframes after the first may repeat it. [Ref 191].
  - The reference driver does not read status bit 7. Whether the firmware checks packet numbers is open (§14).
- **Key ID**: byte 3 of the CCMP header, bits 7:6.
  - The reference driver's 802.11 layer takes a unicast frame's key as the pairwise key whatever its key ID says, and a group frame's by its key ID. [Ref 192].
  - What the AP sent is in §13.2.

### 11.4 Reordering: the host owns the window

- **The firmware reports, with each frame**: a block-ack session identifier (bits 30:24, `0x7f` for none), the frame's sequence number (bits 23:12), the next sequence number the window may release to (bits 11:0), and an "old" flag for a frame below the window (bit 31). [Intel 319].
- **Two notifications release frames**:
  - **frame release** (group 0x00, identifier 0xc3): the session identifier u8, a reserved u8 and the next sequence number u16. [Intel 326]; [Intel 327].
  - **block-ack-request release** (group 0x00, identifier 0xc2): station and TID u32 (TID bits 3:0, station bits 8:4), then block-ack information u32 (next sequence number bits 11:0, sequence number bits 23:12, session identifier bits 29:24). [Intel 328]; [Intel 329].
- **The reference driver holds a reorder buffer per session.** [Ref 193].
  - It releases frames up to the next sequence number the firmware reports.
  - It releases on block-ack requests and on a timeout.
  - It drops duplicates and old frames.
  - It holds an A-MSDU's subframes until the last, because the next sequence number advances on the first subframe.
  - It reorders only unicast QoS data and block-ack requests.
- **So the reorder window is the host's**, fed by the firmware's per-frame data and release notifications. This answers #876 §11's question for W1. The session identifier comes from the receive block-ack setup, which a later revision gives.

### 11.5 A-MSDU

- **The hardware splits an A-MSDU.** Each subframe arrives as its own received-frame notification, with the MPDU's 802.11 header copied in front of it, MAC flags 2 bit 6 set, and the subframe index and last-subframe flag in the A-MSDU information byte. [Intel 330]; [Ref 194].
- **The reference driver clears the A-MSDU-present bit in each copy's QoS control.** It notes that the AX200 devices it tested already left the bit clear. It also lets subframes after the first repeat the sequence number and packet number. [Ref 195].
- **Whether each subframe's bytes still begin with its A-MSDU subframe header** (destination, source, length) is open. The reference driver hands subframes to its 802.11 layer as ordinary frames once the bit is clear, which implies they do not [I] (§14).
- **No A-MSDU arrived in the demo's runs**: the A-MSDU information byte read 0 on every probed frame. Run14, Run15, Run16 `wifi-rx` lines.

### 11.6 Duplicates

- **Status bit 22 flags a duplicate.** [Intel 331].
- **The reference driver drops a duplicate the firmware flags within a reorder session.** It also drops a retried unicast frame whose sequence number and subframe index repeat the last ones for its TID. [Ref 196].

### 11.7 Frames measured on the AX200

"Bytes after the descriptor" is the packet's payload minus the 48-byte descriptor, from the demo's logged packet length.

| Frame | Status | MAC flags 1, 2 | MPDU length | Bytes after the descriptor | Source |
|---|---|---|---|---|---|
| beacon of the joined AP | `0x00001007` | `0x02`, `0x0c` | 241 | 248 | Run16:655 |
| beacon of another BSS | `0x0000101b` | `0x02`, `0x0c` | 370 | 376 | Run16:656 |
| authentication from the AP | `0x00001007` | `0x00`, `0x0c` | 30 | 36 | Run16:657 |
| EAPOL-Key message 1 | `0x00001007` | `0x00`, `0x0c` | 131 | 132 | Run16:664 |
| protected group data, ARP | `0x00007a5f` | `0x02`, `0x10` | 68 | 68 | Run16:687 |
| protected group data, the station's own echoed | `0x00007a5f` | `0x02`, `0x10` | 368 | 368 | Run16:685 |

- **Unprotected frames were followed by 1 to 7 more bytes in their packet; decrypted ones by none.** Same lines. The frame is the MPDU length; the rest is not part of it.
- **MAC flags 1's address type read 2 on group-addressed frames and 0 on frames addressed to the station** [I from these values].

## 12. Errors

### 12.1 Causes

- **The reference driver treats four causes as fatal**: the software error (hardware cause 25), the flow-handler error (flow-handler cause 21), the top-level fatal error (hardware cause 3) and the hardware error (hardware cause 29). It restarts the device on each. [Ref 197].
- **In MSI mode the software and hardware errors are interrupt status bits 25 and 29.** [Intel 332].
- **Measured, MSI mode**: the AX200's firmware assert read `0x02000000`. Run11:605.

### 12.2 Error tables

- **The LMAC table** is at the alive notification's LMAC 0 error-table address; **the UMAC table** at its UMAC error-table address (§7.5). The files' debug-address records give the same addresses. Run11:588; C77 @0x000080, @0x05b974.
- **The reference driver reads each table through the memory window (§3.4)**, dword by dword, under the access request. It refuses an address below `0x400000`, and reads a first dword of 0 as an empty table. [Ref 198].
- **Read the tables before stopping.** After the AX200 stopped, the access request was not granted and both tables were unreadable. Run11:603-611.

**LMAC table, 152 bytes.** [Ref 199].

| Offset | Width | Field |
|---|---|---|
| 0 | 4 | valid (0: empty) |
| 4 | 4 | error identifier |
| 8 | 4 | TRM hardware status 0 |
| 12 | 4 | TRM hardware status 1 |
| 16 | 4 | branch link 2 |
| 20 | 4 | interrupt link 1 |
| 24 | 4 | interrupt link 2 |
| 28 | 4 | data 1 |
| 32 | 4 | data 2 |
| 36 | 4 | data 3 |
| 40 | 4 | beacon time |
| 44 | 4 | TSF low |
| 48 | 4 | TSF high |
| 52 | 4 | GP1 |
| 56 | 4 | GP2 |
| 60 | 4 | firmware revision type |
| 64 | 4 | firmware major |
| 68 | 4 | firmware minor |
| 72 | 4 | hardware version |
| 76 | 4 | board version |
| 80 | 4 | log program counter |
| 84 | 4 | frame pointer |
| 88 | 4 | stack pointer |
| 92 | 4 | last host command header |
| 96 | 20 | interrupt status 0 to 4 |
| 116 | 4 | last command identifier |
| 120 | 4 | wait-event caller |
| 124 | 4 | L2P control |
| 128 | 4 | L2P duration |
| 132 | 4 | L2P MH valid |
| 136 | 4 | L2P address match |
| 140 | 4 | LMPM PMG select |
| 144 | 4 | compile time stamp |
| 148 | 4 | flow handler pointers and credit |

**UMAC table, 60 bytes.** [Ref 200].

| Offset | Width | Field |
|---|---|---|
| 0 | 4 | valid (0: empty) |
| 4 | 4 | error identifier |
| 8 | 4 | branch link 1 |
| 12 | 4 | branch link 2 |
| 16 | 4 | interrupt link 1 |
| 20 | 4 | interrupt link 2 |
| 24 | 4 | data 1 |
| 28 | 4 | data 2 |
| 32 | 4 | data 3 |
| 36 | 4 | UMAC major |
| 40 | 4 | UMAC minor |
| 44 | 4 | frame pointer |
| 48 | 4 | stack pointer |
| 52 | 4 | last host command header |
| 56 | 4 | interrupt status |

**Error identifiers**, with bits 31:28 masked off (the reference driver's names). [Ref 201].

| Value | Name |
|---|---|
| 0x34 | watchdog NMI |
| 0x35 | system assert |
| 0x37 | firmware version mismatch |
| 0x38, 0x39 | bad command |
| 0x3C | data action point NMI |
| 0x3D | fatal error |
| 0x46 | TRM hardware error NMI |
| 0x4C | TRM NMI |
| 0x54 | breakpoint NMI |
| 0x5C | receive FIFO full watchdog |
| 0x64 | receive FIFO full without buffers watchdog |
| 0x66 | host NMI |
| 0x70 | LMAC fatal |
| 0x71 | UMAC fatal |
| 0x73 | other LMAC fatal |
| 0x7C | action point NMI |
| 0x84 | unknown NMI |
| 0x86 | instruction action point NMI |
| any other | advanced system assert |

- **Measured: a wrongly sized command made the AX200's firmware assert, and its tables named the command.** Run11:603-604.
  - The demo sent the country update at 32 bytes where its layout is 28.
  - The LMAC table read valid 6, error identifier `0x71` (UMAC fatal) and hardware version `0x340`.
  - The UMAC table read error identifier `0x201002fd`. Data 1 and the last host command header were both `0x000901c8`: the command's first header dword (identifier `0xc8`, group `0x01`, sequence `0x0009`). Data 2 read 28 and data 3 read 32.
  - The 28-byte command was then accepted (Run13:609), so data 2 holds the expected length and data 3 the length sent [I].

### 12.3 The command-error notification (group 0x00, identifier 0x02)

20 bytes. [Intel 333]; [Intel 334].

| Offset | Width | Field | Meaning |
|---|---|---|---|
| 0 | 4 | error type | |
| 4 | 1 | command identifier | the failed command's |
| 5 | 1 | reserved | |
| 6 | 2 | sequence | the failed command's |
| 8 | 4 | error service | only with error type 2 |
| 12 | 8 | time stamp | TSF in µs |

- **The reference driver logs it.** [Ref 202].
- **No run on record showed one.**

### 12.4 RF-kill

- **Bit 27 of 0x024 reflects the platform's hardware RF-kill switch.** [Intel 335].
- **The reference driver reads the radio as disabled when the bit is clear**, the inverse of what the bit's name suggests. [Ref 203].
- **Measured**: the AX200 with its radio enabled read bit 27 set, with 0x024 at `0x08040000` before the start and `0x0c040005` after. Run11:479, 491.
- **A change raises hardware cause 7**, or interrupt status bit 7 in MSI mode. The reference driver re-reads the switch and restarts. [Intel 336]; [Ref 204].
- **The alive notification's flags bit 0 reports RF-kill.** [Intel 212].
- **The reference driver keeps the RF-kill cause unmasked while the device is stopped.** [Ref 205].

### 12.5 Thermal shutdown (group 0x04, identifier 0xfe)

- **Both files declare notification version 2.** C77 v(0x04,0xfe); C89 v(0x04,0xfe).
- **4 bytes**: the temperature in °C (u16); in version 2 a sensor bitmap (u8: bit 0 top master, 1 PA chain A master, 2 PA chain B master, 3 top slave, 4 PA A slave, 5 PA B slave); in version 2 the scheme (u8: 0 software, 1 hardware). [Intel 337].
- **Hardware cause 6 is CT kill.** [Intel 91].
- **The reference driver stops the device on this notification and restarts it later.** [Ref 206].

## 13. The access points: W2's inputs

### 13.1 An access point echoes the station's own group frames — measured

- **What arrived**: after the station broadcast (its DHCP discovers, then its ARP), group-addressed FromDS data frames whose third address (the source) was the station's own. Each was protected with the group key (key ID 1), decrypted and MIC-OK.
  - Seen in three runs: Run14:681, 689, 699 (netstack refused each as its own source); Run15:676, 681, 688, 697; Run16:684, 698, 701, 702, 704, 707, 722.
  - In Run16, six of them came within 4 s. Run16:714.
- **The reference driver's 802.11 layer discards a group frame whose third address is the station's own**, as the AP's relay of the station's own frame. [Ref 207].

### 13.2 Key IDs — measured, and what was not

- **Measured**: the AP sent unicast protected data frames under key ID 0, and group frames under key ID 1.
  - Unicast, key ID 0: Run16:694, 696, 699, 723, 725, 728, 734.
  - Group, key ID 1: Run16:684, 686, 689, 692, 698, 701.
  - The demo installed the pairwise key under key ID 0 and the group key from message 3 under key ID 1. Run14:668, 671; Run16:671, 674.
- **Not measured**: no run on record shows an AP sending a unicast frame under a key ID other than 0.
  - #876 §1 says the runs fixed that "a unicast frame's key ID selects nothing". That is the reference driver's receive rule (§11.3), not a measurement (§14).
  - The standard's rule for the key ID of individually addressed frames is IEEE Std 802.11-2020's, for W2 to read there.

### 13.3 A retransmitted message 1 — a reference's behaviour, not measured

- **The reference access-point implementation assigns the ANonce once per 4-way handshake**, choosing it at random against precomputation attacks. [Ref 208].
- **It sends every retry of message 1 with that same ANonce.** [Ref 209].
- **It increments the replay counter for every EAPOL-Key frame it sends.** [Ref 210].
- **So an access point running it resends message 1 under a higher replay counter with an unchanged ANonce.**
- **No run on record measured an AP doing so.** #876 §1 says the runs fixed it (§14).

### 13.4 The handshake as the demo saw it — measured

- **Messages 1 and 3 of the 4-way handshake** arrived as unprotected FromDS data frames from the AP to the station, with ethertype `0x888e`. Their frames were 131 and 187 bytes, and they arrived 12 to 29 ms apart. Run14:663, 667; Run15:657, 666; Run16:663, 670.
- **No group-key handshake and no retransmitted message was seen in these runs.** Run14, Run15, Run16.

### 13.5 Other traffic while associated — measured

- **The AP's beacons kept arriving after association**: 83 kept in about 9 s.
- **Frames from other transmitters kept arriving too**: 166.
- Run16:709, 713.

## 14. Open

| # | Open fact | Where | What decides it |
|---|---|---|---|
| 1 | whether each part verifies its firmware file, by which vendor statement; the track ships no file without one | §1 | a vendor statement; until then the owner |
| 2 | the T14 AX210's subsystem ID, hardware revision, RF identity and SKU identity | §1, §7.4 | a read on the T14, by a reader's scout or W5's first boot |
| 3 | the AX210's country-update answer at version 6, its latency-tolerance command at version 3, and its scan request at version 17 with band-in-flags channel entries | §10.9, §10.12, §10.15 | W5's first T14 run |
| 4 | the peripheral scratch size's unit: Intel's definitions say dwords, the reference driver writes bytes | §7.3 | Intel's definitions decide; the bench checks it first |
| 5 | the boot latency-tolerance word: Intel's fields encode 250 µs as `0x88FA88FA`, the reference driver writes `0x80FA80FA` | §7.2 | Intel's fields decide; the bench checks |
| 6 | The reference driver's fixed waits with no completion signal in any source: 5 ms after a software reset; 1 ms and 5 ms in power-down; 2 µs after the access request; 25 ms between ready rounds | §4 | a hardware document or a measured condition, before ToyOS waits a fixed time |
| 7 | whether MSI-X mode needs the interrupt cause table | §5.4 | a scout |
| 8 | whether the command queue accepts a command in one buffer entry | §8.2 | a scout |
| 9 | the AX200's 4-byte used-ring entry, and whether buffers always complete in order | §9.1 | a scout |
| 10 | received-frame status bits 4, 12, 13 and 14, seen set and named nowhere | §11.2 | a scout |
| 11 | whether the AX210's firmware removes the CCMP MIC | §11.3 | W5's or W6's T14 run |
| 12 | whether the firmware checks data frames' packet numbers | §11.3 | a scout replaying a frame |
| 13 | what an A-MSDU subframe's bytes begin with | §11.5 | a run with an AP sending A-MSDUs |
| 14 | an AP's unicast key ID other than 0, and a retransmitted message 1: #876 §1 lists both as fixed by the demo's runs, and no run on record measured either | §13.2, §13.3 | an AP the harness commands (`issues/no-access-point-answers-to-the-harness.md`) |
| 15 | which MAC, link and station commands the AX210's version-89 firmware takes | Appendix A | W6's revision |
| 16 | whether one start suffices on the AX210 (the reference driver starts twice) | §4.2 | W5's first T14 run |

- **Item 15 in detail.** The AX210 file declares no version for the older MAC-context (0x01, 0x28), binding (0x01, 0x2b), station (0x01, 0x18) or station-key (0x01, 0x17) commands, all of which the AX200 file declares. It declares MAC-configuration-group (0x03) entries instead. Both files set capability 110 (the MLD API). The reference driver uses that API only on later parts, because version-77 firmware on older parts claims it without implementing it. [Ref 211].
## Appendix A. Declared versions

Every entry of both files' command-version records, from C77 @0x0000a8 and C89 @0x0000a8: group, identifier, then "c" the command version and "n" the notification version; 99 is unknown, and — means the file has no entry.

| Group | Identifier | AX200 file | AX210 file |
|---|---|---|---|
| 0x00 | 0x00 | — | c0 n0 |
| 0x00 | 0x01 | c99 n6 | c99 n6 |
| 0x00 | 0x2a | c99 n2 | c99 n2 |
| 0x00 | 0x4a | c99 n1 | c99 n1 |
| 0x00 | 0x56 | c99 n5 | c99 n5 |
| 0x00 | 0x9d | c99 n15 | — |
| 0x00 | 0xa2 | — | c99 n4 |
| 0x00 | 0xa5 | c99 n2 | c99 n3 |
| 0x00 | 0xad | c99 n3 | c99 n3 |
| 0x00 | 0xb1 | c99 n2 | c99 n2 |
| 0x00 | 0xc1 | c99 n4 | c99 n5 |
| 0x00 | 0xc4 | c99 n8 | c99 n9 |
| 0x00 | 0xc5 | c99 n5 | c99 n5 |
| 0x00 | 0xce | c99 n5 | c99 n5 |
| 0x00 | 0xed | c99 n1 | — |
| 0x01 | 0x08 | c4 n0 | c4 n0 |
| 0x01 | 0x09 | c1 n0 | c1 n0 |
| 0x01 | 0x0c | c5 n0 | c5 n0 |
| 0x01 | 0x0d | c15 n0 | c17 n0 |
| 0x01 | 0x0e | c1 n0 | c1 n0 |
| 0x01 | 0x17 | c3 n0 | — |
| 0x01 | 0x18 | c12 n2 | — |
| 0x01 | 0x19 | c2 n0 | — |
| 0x01 | 0x1c | c9 n7 | c10 n7 |
| 0x01 | 0x1e | c2 n1 | c2 n1 |
| 0x01 | 0x28 | c5 n0 | — |
| 0x01 | 0x2b | c2 n1 | — |
| 0x01 | 0x2c | c2 n1 | — |
| 0x01 | 0x40 | c1 n0 | c1 n0 |
| 0x01 | 0x41 | c99 n1 | c99 n1 |
| 0x01 | 0x42 | c99 n2 | c99 n2 |
| 0x01 | 0x43 | c2 n0 | c2 n0 |
| 0x01 | 0x48 | c2 n0 | c2 n0 |
| 0x01 | 0x4f | c2 n0 | c2 n0 |
| 0x01 | 0x55 | c1 n0 | c1 n0 |
| 0x01 | 0x5d | c2 n0 | c2 n0 |
| 0x01 | 0x6a | c3 n0 | c3 n0 |
| 0x01 | 0x6e | c3 n0 | c3 n0 |
| 0x01 | 0x77 | c6 n0 | c7 n0 |
| 0x01 | 0x83 | c1 n0 | c1 n0 |
| 0x01 | 0x88 | c3 n3 | c3 n3 |
| 0x01 | 0x91 | c13 n0 | c13 n0 |
| 0x01 | 0x98 | c1 n0 | c1 n0 |
| 0x01 | 0x9b | c6 n0 | c6 n0 |
| 0x01 | 0x9c | c2 n0 | — |
| 0x01 | 0x9f | c5 n0 | c8 n0 |
| 0x01 | 0xa9 | c1 n0 | c1 n0 |
| 0x01 | 0xae | c1 n0 | c2 n0 |
| 0x01 | 0xb9 | — | c2 n0 |
| 0x01 | 0xbd | c88 n1 | c88 n1 |
| 0x01 | 0xc8 | c1 n5 | c1 n6 |
| 0x01 | 0xcb | — | c2 n0 |
| 0x01 | 0xd0 | c1 n0 | c1 n0 |
| 0x01 | 0xd1 | c3 n0 | c3 n0 |
| 0x01 | 0xd2 | c4 n0 | c4 n0 |
| 0x01 | 0xd3 | c4 n0 | c4 n0 |
| 0x01 | 0xd4 | c4 n0 | c4 n0 |
| 0x01 | 0xd5 | c1 n4 | — |
| 0x01 | 0xe0 | c3 n0 | c3 n0 |
| 0x01 | 0xe1 | c6 n0 | c6 n0 |
| 0x01 | 0xe2 | c5 n0 | c5 n0 |
| 0x01 | 0xe4 | c4 n0 | c4 n0 |
| 0x01 | 0xe5 | c1 n12 | — |
| 0x01 | 0xee | c3 n0 | c3 n0 |
| 0x01 | 0xf1 | c88 n3 | c88 n3 |
| 0x01 | 0xf2 | c7 n0 | c7 n0 |
| 0x01 | 0xf6 | c7 n0 | c7 n0 |
| 0x02 | 0x00 | c99 n3 | c99 n4 |
| 0x02 | 0x01 | c2 n0 | c2 n0 |
| 0x02 | 0x02 | — | c1 n0 |
| 0x02 | 0x0b | c2 n0 | c3 n0 |
| 0x02 | 0x0c | c99 n1 | c99 n1 |
| 0x02 | 0x0d | — | c1 n0 |
| 0x02 | 0x0e | c1 n0 | c1 n0 |
| 0x02 | 0x0f | — | c1 n0 |
| 0x02 | 0xfd | — | c99 n1 |
| 0x02 | 0xff | c99 n1 | c99 n1 |
| 0x03 | 0x05 | c1 n0 | c2 n0 |
| 0x03 | 0x06 | — | c2 n0 |
| 0x03 | 0x08 | c1 n0 | c2 n0 |
| 0x03 | 0x09 | — | c2 n0 |
| 0x03 | 0x0e | — | c3 n0 |
| 0x03 | 0x10 | — | c1 n0 |
| 0x03 | 0xf8 | — | c99 n1 |
| 0x03 | 0xf9 | c99 n1 | c99 n2 |
| 0x03 | 0xfb | c99 n2 | c99 n3 |
| 0x03 | 0xff | — | c99 n3 |
| 0x04 | 0x00 | c1 n1 | c1 n1 |
| 0x04 | 0x03 | c1 n0 | c1 n0 |
| 0x04 | 0x04 | c1 n0 | c1 n0 |
| 0x04 | 0x05 | c4 n1 | c5 n1 |
| 0x04 | 0x07 | c1 n0 | c5 n0 |
| 0x04 | 0x08 | c1 n0 | — |
| 0x04 | 0x0a | c99 n0 | c99 n0 |
| 0x04 | 0x0c | — | c1 n0 |
| 0x04 | 0xfe | c99 n2 | c99 n2 |
| 0x05 | 0x04 | c1 n0 | c1 n0 |
| 0x05 | 0x07 | c2 n0 | — |
| 0x05 | 0x08 | c2 n0 | c2 n0 |
| 0x05 | 0x09 | c99 n99 | c99 n99 |
| 0x05 | 0x0b | c99 n99 | c99 n99 |
| 0x05 | 0x0d | — | c1 n0 |
| 0x05 | 0x0f | c4 n0 | c4 n0 |
| 0x05 | 0x11 | c99 n0 | c1 n0 |
| 0x05 | 0x16 | c2 n1 | c2 n1 |
| 0x05 | 0x17 | c3 n2 | c3 n2 |
| 0x05 | 0x18 | c1 n0 | c1 n0 |
| 0x05 | 0xf3 | — | c99 n1 |
| 0x05 | 0xf5 | — | c99 n3 |
| 0x05 | 0xf7 | c99 n3 | c99 n3 |
| 0x05 | 0xf8 | — | c99 n2 |
| 0x06 | 0xfb | — | c99 n1 |
| 0x08 | 0x00 | c13 n1 | c13 n1 |
| 0x08 | 0x04 | c9 n0 | c9 n0 |
| 0x08 | 0x05 | c3 n0 | c3 n0 |
| 0x08 | 0x06 | c1 n0 | c6 n0 |
| 0x08 | 0x07 | — | c1 n0 |
| 0x08 | 0xfb | c99 n2 | c99 n2 |
| 0x08 | 0xfe | c99 n3 | c99 n4 |
| 0x08 | 0xff | c99 n9 | c99 n9 |
| 0x0b | 0xfb | c99 n1 | c99 n1 |
| 0x0b | 0xfc | c99 n1 | c99 n1 |
| 0x0b | 0xfd | c99 n1 | c99 n3 |
| 0x0b | 0xfe | c99 n1 | c99 n1 |
| 0x0b | 0xff | c99 n4 | c99 n4 |
| 0x0c | 0x00 | c1 n0 | c1 n0 |
| 0x0c | 0x01 | c6 n0 | c8 n0 |
| 0x0c | 0x02 | c1 n4 | c1 n4 |
| 0x0c | 0x03 | c4 n0 | c4 n0 |
| 0x0c | 0x04 | c2 n0 | c2 n0 |
| 0x0c | 0x05 | — | c1 n0 |
| 0x0c | 0x06 | — | c1 n0 |
| 0x0c | 0x08 | — | c1 n0 |
| 0x0c | 0xfe | c99 n1 | c99 n1 |
| 0x0e | 0x00 | c2 n3 | c2 n4 |
| 0x0e | 0x05 | c1 n0 | c2 n0 |
| 0x0e | 0x06 | c99 n5 | c99 n6 |
| 0x0e | 0x07 | c1 n0 | c4 n0 |
| 0x0e | 0x08 | c1 n0 | c1 n0 |
| 0x0e | 0x09 | c1 n0 | c1 n0 |
| 0x0e | 0x0b | c1 n0 | c1 n0 |
| 0x0e | 0x0d | c1 n0 | c1 n0 |
| 0x0e | 0x0e | c1 n0 | c1 n0 |
| 0x0e | 0x10 | c1 n2 | c1 n2 |
| 0x0e | 0x11 | c1 n0 | c1 n0 |
| 0x0e | 0x12 | c99 n1 | c99 n1 |
| 0x0e | 0x13 | c2 n0 | c2 n0 |
| 0x0e | 0x15 | c1 n0 | c1 n0 |
| 0x0e | 0x16 | c99 n0 | c99 n0 |
| 0x0e | 0x17 | c99 n1 | c99 n1 |
| 0x0e | 0x18 | c1 n0 | c1 n0 |
| 0x0e | 0x1a | c1 n0 | c1 n0 |
| 0x0e | 0x1b | c1 n0 | c1 n0 |
| 0x0e | 0x1c | c99 n1 | c99 n1 |
| 0x0e | 0x1d | c5 n1 | c5 n1 |
| 0x0e | 0x1e | c1 n0 | c1 n0 |
| 0x0e | 0x20 | c1 n0 | c1 n0 |
| 0x0e | 0x21 | c99 n2 | c99 n2 |
| 0x0e | 0x22 | c1 n0 | c1 n0 |
| 0x0e | 0x24 | c2 n0 | c2 n0 |
| 0x0e | 0x25 | c1 n0 | c2 n0 |
| 0x0e | 0x26 | c1 n0 | c1 n0 |
| 0x0e | 0x27 | c1 n0 | — |
| 0x0e | 0x28 | c99 n1 | c99 n1 |
| 0x0e | 0x2a | c3 n0 | c3 n0 |
| 0x0e | 0x2b | c1 n0 | c1 n0 |
| 0x0e | 0x2c | c1 n0 | c1 n0 |
| 0x0e | 0x2d | c4 n0 | c4 n0 |
| 0x0e | 0x2e | c1 n0 | c1 n0 |
| 0x0e | 0x2f | c4 n0 | c4 n0 |
| 0x0e | 0x30 | c4 n0 | c4 n0 |
| 0x0e | 0x31 | c2 n0 | c2 n0 |
| 0x0e | 0x32 | c7 n0 | c8 n0 |
| 0x0e | 0x33 | c4 n0 | c4 n0 |
| 0x0e | 0x34 | c1 n1 | c1 n1 |
| 0x0e | 0x35 | c4 n3 | c4 n3 |
| 0x0e | 0x36 | c2 n0 | c2 n0 |
| 0x0e | 0x37 | c1 n88 | c1 n88 |
| 0x0e | 0x38 | c6 n0 | c6 n0 |
| 0x0e | 0x39 | c99 n5 | c99 n9 |
| 0x0e | 0x3b | c1 n1 | c1 n1 |
| 0x0e | 0x3c | c1 n0 | c99 n0 |
| 0x0e | 0x3d | c99 n99 | c99 n99 |
| 0x0e | 0x3e | c2 n0 | c2 n0 |
| 0x0e | 0x3f | c99 n2 | c99 n2 |
| 0x0e | 0x40 | c1 n0 | c1 n0 |
| 0x0e | 0x41 | c99 n1 | c99 n1 |
| 0x0e | 0x42 | c1 n0 | c1 n0 |
| 0x0e | 0x43 | c1 n0 | c1 n0 |
| 0x0e | 0x44 | c99 n1 | c99 n1 |
| 0x0e | 0x45 | c1 n0 | c1 n0 |
| 0x0e | 0x46 | c99 n1 | c99 n1 |
| 0x0e | 0x47 | c99 n1 | c99 n1 |
| 0x0e | 0x48 | c1 n0 | c1 n0 |
| 0x0e | 0x49 | c99 n1 | c99 n1 |
| 0x0e | 0x4a | c1 n0 | c1 n0 |
| 0x0e | 0x4c | c1 n0 | c1 n0 |
| 0x0e | 0x4d | c1 n0 | c1 n0 |
| 0x0e | 0x4e | c99 n1 | c99 n1 |
| 0x0e | 0x4f | c99 n0 | c99 n0 |
| 0x0e | 0x50 | c99 n99 | c99 n99 |
| 0x0e | 0x51 | c1 n0 | c1 n0 |
| 0x0e | 0x53 | c1 n0 | c1 n0 |
| 0x0e | 0x54 | — | c99 n99 |
| 0x0e | 0x55 | — | c0 n1 |
| 0x0e | 0x57 | — | c2 n0 |
| 0x0e | 0x58 | — | c99 n2 |
| 0x0e | 0x59 | — | c1 n2 |
| 0x0e | 0x5a | c1 n0 | c1 n0 |
| 0x0e | 0x5b | c1 n0 | c1 n0 |
| 0x0e | 0x5c | c1 n1 | c1 n1 |
| 0x0e | 0x5d | c1 n0 | c1 n0 |
| 0x0e | 0x5e | c1 n0 | c1 n0 |
| 0x0e | 0x64 | — | c1 n0 |
| 0x0e | 0x65 | — | c99 n1 |
| 0x0e | 0x66 | — | c1 n1 |
| 0x0e | 0x67 | — | c2 n0 |
| 0x0e | 0x68 | — | c1 n0 |
| 0x0e | 0xfc | c99 n1 | c99 n1 |
| 0x0e | 0xfd | c99 n0 | c99 n0 |
| 0x0e | 0xfe | c99 n0 | c99 n0 |
| 0x0f | 0x01 | c1 n0 | c1 n0 |
| 0x0f | 0x09 | c1 n1 | c1 n1 |
| 0x0f | 0x0a | c99 n3 | c99 n3 |
| 0x0f | 0xff | c99 n88 | c99 n88 |
| 0x10 | 0x00 | — | c99 n3 |
| 0x10 | 0x01 | — | c99 n4 |
| 0x10 | 0x02 | — | c99 n5 |
| 0x10 | 0x03 | — | c99 n4 |
| 0x10 | 0x04 | — | c99 n4 |
| 0x10 | 0x05 | — | c99 n1 |

## Appendix B. API and capability bits

From C77 and C89, the bit numbers each file sets in its API words (kind 29) and capability words (kind 30).

- **API bits set in both files**: 0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 23, 24, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65.
- **API bits set only in the AX200 file**: none.
- **API bits set only in the AX210 file**: 66, 67, 68.
- **Capability bits set in both files**: 1, 2, 3, 4, 5, 6, 8, 9, 16, 17, 18, 19, 21, 22, 23, 24, 26, 27, 28, 31, 33, 34, 35, 37, 38, 39, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 56, 57, 58, 59, 60, 61, 63, 64, 65, 67, 68, 70, 71, 73, 74, 75, 77, 78, 79, 80, 84, 87, 88, 89, 91, 92, 94, 95, 98, 99, 101, 103, 105, 108, 110, 117.
- **Capability bits set only in the AX200 file**: 0, 97.
- **Capability bits set only in the AX210 file**: 32, 96, 100, 104, 107, 111, 112, 113, 114, 116, 120, 123, 124, 129.

| Bit | Meaning | AX200 file | AX210 file | Source |
|---|---|---|---|---|
| API 9 | country updates carry a source | set | set | [Intel 338] |
| API 41 | status bit 7 of a received frame means replay error | set | set | [Intel 324] |
| API 48 | the NVM-info answer has version 4 | set | set | [Intel 339] |
| API 56 | the reduced scan configuration | set | set | [Intel 273] |
| API 58 | extended channel configuration in scan requests | set | set | [Intel 340] |
| API 59 | the band is reported in received-frame notifications | set | set | [Intel 322] |
| Capability 1 | location-aware regulatory (LAR) | set | set | [Intel 341] |
| Capability 2 | UMAC scan | set | set | [Intel 342] |
| Capability 12 | dynamic queue allocation | clear | clear | [Intel 343] |
| Capability 29 | LAR with several country sources | clear | clear | [Intel 344] |
| Capability 32 | a fragmented platform NVM | clear | set | [Intel 208] |
| Capability 68 | multi-queue receive | set | set | [Intel 345] |
| Capability 74 | the firmware handles critical-temperature kill | set | set | [Intel 263] |
| Capability 89 | the country-update answer carries 11ax capabilities | set | set | [Intel 346] |
| Capability 110 | the MLD API | set | set | [Intel 347] |

## Appendix C. Evidence on this branch

| File | What it holds |
|---|---|
| `spec/ax2xx.md` | this specification |
| `spec/provenance.md` | each `[Intel n]` and `[Ref n]` key's document, file and lines, and the pinned commits; the readers' record, which no writer needs |
| `spec/evidence/firmware-files.log` | the three pinned files' and the licence's SHA-256, the licence's text, and WHENCE's lines for them |
| `spec/evidence/container-cc-a0-77.log` | the AX200 file's container read-out (C77), with the reader's source |
| `spec/evidence/container-ty-a0-gf-a0-89.log` | the AX210 file's container read-out (C89), with the reader's source |
| `spec/evidence/container-ty-a0-gf-a0-pnvm.log` | the platform-NVM file's container read-out (CPN), with the reader's source |
| `spec/evidence/ax200-config-space.log` | the AMD bench AX200's configuration space, decoded (P) |
| `spec/runs/demo-v11.log` | the demo's v11 boot on the AMD bench: bring-up to the runtime configuration, and a firmware assert on a wrongly sized command |
| `spec/runs/demo-v13.log` | the v13 boot: bring-up, a passive scan, association and keys |
| `spec/runs/demo-v14.log` | the v14 boot: the first protected data |
| `spec/runs/demo-v15.log` | the v15 boot: the access point's echo of the station's group frames |
| `spec/runs/demo-v16.log` | the v16 boot: every received frame's fate, and a DHCP lease |
| `spec/tools/` | the scripts that staged these files and checked this document's layout tables |
| `s1/judge.log`, `s1-r2/wifi-s1-b-kernel.log` | S1 on the T14: the AX210's PCI read-out and its ACPI names |
| `e13-amd-ax200-bar.log` | the AX200's BAR and the bridge in front of it on the AMD bench |

- **The run logs are masked whole.** Machine identifiers, addresses and the demo's build identity are replaced; no SSID or passphrase was ever logged.

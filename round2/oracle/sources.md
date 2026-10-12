# The oracle of `toyos-cpuvuln::invlpg_misses_global`, as read for PR #873 round 2

Each document was fetched on the development machine with `curl -A 'toyos-build (https://github.com/ToyOSOrg/ToyOS)'`
and read as text (pypdf, in a scratch virtualenv). The documents are Intel's and are not copied here: what follows
is each one's identity, its hash as fetched, and the lines the verdict and its tests rest on, quoted by page.

| document | number, revision | fetched from | sha256 of the PDF |
|---|---|---|---|
| 12th Generation Intel Core Processor Specification Update (Alder Lake S, H, U, P, HX) | 682436-040, September 2026 | https://cdrdv2.intel.com/v1/dl/getContent/682436 | 79752bb75aac2618c96062a514e59883b8a97a5411f27d9ab2c55c6f006ef0bd |
| 13th Generation Intel Core, Core 14th Generation, Core (Series 1) and (Series 2), Xeon E 2400 and Xeon 6300 Specification Update (Raptor Lake) | 740518-031 | https://cdrdv2.intel.com/v1/dl/getContent/740518 | 9ad272edeec520051732a149a15762515861564258c960d37661ac5c20ca4521 |
| Intel Processor and Intel Core i3 and Core 3 N-Series Specification Update (Alder Lake-N, Twin Lake) | 764616-004, January 2025 | https://cdrdv2.intel.com/v1/dl/getContent/764616 | 4e50a4974c47b0f11122524dfc60f87b535c2b74ce00211bc8375b4245ae8e54 |

## 682436-040 (ADL063)

- p. 8, Table 2-1: `ADL-S 8+8, ADL-HX 8+8 0x90672`; `ADL-S 6+0 0x90675`; `ADL-H 6+8, ADL-P 6+8 0x906A3`;
  `ADL-U15W 2+8, ADL-U9W 2+8 0x906A4`.
- p. 14, codes: "Fixed — This erratum has been previously fixed in Intel hardware, firmware, or software."
- p. 17, summary, columns S, H/P, U, HX: `ADL063 Fixed Fixed Fixed Fixed INVLPG May Invalidate Global TLB Entries Only For The Current PCID`.
- pp. 35-36, the erratum: "The INVLPG instruction should invalidate any global TLB entries for the specified linear
  address, regardless of PCID (Process-Context Identifier). Due to this erratum, INVLPG may fail to invalidate TLB
  entries for global pages with PCIDs different from the current PCID value." ... "This erratum does not apply in VMX
  non-root operation. It applies only when PCIDs are enabled and either in VMX root operation or outside VMX
  operation." ... "Workaround: It may be possible for BIOS to contain a workaround for this erratum. Alternatively,
  this can be worked around by software using INVPCID type 2 instead of INVLPG."
- p. 7: "Hardware and software designed to be used with any given stepping must assume that all errata documented for
  that stepping are present on all devices." The S column covers both S signatures, 0x90672 and 0x90675.

## 740518-031 (RPL043; RPL042 before revision 018 renumbered it)

- pp. 8-9, Table 2-1: `RPL-S 8P+16E`, `RPL-S Refresh 8P+16E`, `RPL-HX 8P+16E`, `RPL-HX Refresh 8P+16E`, `RPL-E 8P+0E`,
  `RPL-E Refresh 8P+0E`: `B0671h`; `RPL-S 8P+8E`, `RPL-S Refresh 8P+8E`, `RPL-HX 8P+8E`: `B06F2h`;
  `RPL-S 6P+0E`, `RPL-S Refresh 6P+0E`: `B06F5h`; `RPL-P 6P+8E`, `RPL-H 6P+8E`, `RPL-H Refresh 6P+8E`: `B06A2h`;
  `RPL-U 2P+8E`, `RPL-U Refresh 2P+8E`: `B06A3h`.
- p. 14, summary columns: `S/S Refresh` 8+16, 8+8, 6+0; `E/E Refresh` 8+0; `P/H/H Refresh` 6+8; `HX/HX Refresh` 8+16,
  8+8; `U/U Refresh` 2+8.
- p. 17: `RPL043 Fixed Fixed N/A Fixed Fixed Fixed Fixed Fixed INVLPG May Invalidate Global TLB Entries Only For The
  Current PCID` — N/A under S 6+0, signature B06F5h.
- p. 32, the erratum: the same text as ADL063, the same workaround.

## 764616-004 (Alder Lake-N)

- p. 6, Table 2-1: `0xB06E0` alone.
- pp. 8-9, the errata summary lists 001 to 020; none is the INVLPG erratum.

## The fixed revisions

No specification update carries a microcode revision. Intel's, one per model, are in Pawan Gupta's reply on
linux-kernel, Message-ID `20240325231300.qrltbzf6twm43ftb@desk`
(https://lore.kernel.org/all/20240325231300.qrltbzf6twm43ftb@desk/), DKIM-signed by intel.com: "I have checked this
internally, the minimum microcode version that fixed this issue are as below": ALDERLAKE (06-97) 0x2e, ALDERLAKE_L
(06-9A) 0x42c, ATOM_GRACEMONT (06-BE) 0x11, RAPTORLAKE (06-B7) 0x118, RAPTORLAKE_P (06-BA) 0x4117, RAPTORLAKE_S
(06-BF) 0x2e. Linux carries them as `invlpg_miss_ids` (commit f24f669d03f8), a copy and not an oracle.

## The SDM and the APM

- SDM Vol. 3A §12.11.7.1: the revision is `IA32_BIOS_SIGN_ID`'s upper dword after writing the MSR 0 and executing
  CPUID.01H. Table 12-7: an update revision is a signed 32-bit number.
- SDM Vol. 3A §4.10.4.1: INVPCID type 2 invalidates every mapping, global ones included; type 3 every one but the
  global; MOV to CR3 with CR4.PCIDE clear every one of PCID 000H but the global; a MOV to CR4 that changes PGE every
  one. APM Vol. 2 §5.5.2: a CR3 load leaves global pages; toggling CR4.PGE flushes them.

## The T14

`kernel/cpuvuln/fixtures/t14/`: CPUID.1:EAX 0x000806c1 (Tiger Lake, on no row) and MSR 8BH 0x000000be00000000 on every
CPU, as Linux read them; `cpuinfo.txt`'s flags carry `pcid` and `invpcid`.

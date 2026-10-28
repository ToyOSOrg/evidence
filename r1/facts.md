# AMD (and Intel) processor idle states: fact specification

Clean-room fact sheet for acpiserver's `_CST`/`_LPI` handling. Every fact names its
source class:

- **[V]** vendor document (AMD PPR/BKDG/APM, Intel spec/SDM). It may be cited at the site.
- **[S]** governing specification (ACPI). It may be cited at the site.
- **[VC]** the vendor's own code, written by its engineers, including for another OS or for
  firmware. Provenance is in `evidence.md` only and is not to be cited in the repository.
- **[OC]** other code (neither the vendor nor its engineers). Same rule.
- **[M]** measurement or readback from our own machines. It ranks last.

"Zen" means AMD Family 17h, 19h and 1Ah (Zen 1 to Zen 5). Hygon Family 18h is called out
where a source covers it. "Not established" means no source in hand states it. Nothing in this
sheet is inferred and then presented as fact. Inferences are labelled **Inference**.

---

## A. What ACPI itself requires

A1 [S] ACPI 6.5 §8.1.4 (p.546; same text in 6.6 p.521): in a C3 state the caches keep their
state, but the processor is not required to snoop bus-master or other processors' memory
accesses. "OSPM is responsible for ensuring that the caches maintain coherency." On a
uniprocessor this is done with PM2_CNT.ARB_DIS. On a multiprocessor "the processors' caches can
be flushed and invalidated" before entry. The spec names two mechanisms: an OSPM flush, or
hardware that stops bus masters (uniprocessor only).

A2 [S] Same section: OSPM uses BM_STS (optional) for the C2/C3 policy. Bus-master activity
demotes to C2 (or C1). BM_RLD, when set, makes bus-master requests exit the Cx state. OSPM "can
optionally" set it for C3.

A3 [S] ACPI 6.5 §8.2: when C3 is supported without ARB_DIS, the hardware must provide a
flush-and-invalidate. The FADT WBINVD flag says the platform supports WBINVD properly.

A4 [S] ACPI 6.5 §8.4.1.1 Table 8.2: the `_CST` Type (1, 2 or 3) "conveys the semantics to be
used by OSPM when entering/exiting the C state". Those semantics are §8.1.2 to §8.1.4. Register
is "the register that OSPM must read to place the processor in the corresponding C state".
Latency is the worst-case enter-plus-exit time in µs.

A5 [S] ACPI 6.5 §5.2.3.1 (p.163): FFH may be declared by firmware "only as indicated by the CPU
Manufacturer". Its meaning is defined by the CPU manufacturer, not by ACPI.

A6 [S] The ACPI coherency duty in A1 attaches to the `_CST` Type (C3 semantics). An `_LPI`
sub-package (ACPI 6.5 §8.4.3.3, p.562) has no Type field. ACPI defines no cache-coherency,
ARB_DIS, BM_STS or BM_RLD duty for LPI states. Its only per-state OSPM duties are these:
- Flags bit 0 (enabled).
- "Arch. Context Lost Flags". §8.4.3.3.5 (p.572): "For Intel based systems the value of this
  flags register is 0". ACPI says nothing for AMD.
- The entry method, a Register() to read or an Integer composed into a register.
- Min residency and worst-case wake latency.
- Enabled Parent State, residency and usage counters, and RDI/wake rules.

---

## B. AMD Zen I/O-based C-states: cache coherency and flush (gap 1)

### What AMD's documents say

B1 [V] No AMD document in hand states, for any Zen family, whether an I/O-trapped C-state keeps
the caches coherent without an OS flush. Documents checked:
- PPR 55772 (17h M20h)
- PPR 55922 (17h M60h)
- OSRR 56255 (17h M00h–2Fh)
- PPR 55901 vols 1–6 (19h M11h)
- PPR 57896 (1Ah M44h)
- APM Vol 2 r3.45 and Vol 3 r3.36

These Zen PPRs have no C-state chapter. They define only these items:
- MSRC001_0073 CStateBaseAddr: the core traps I/O reads of CstateAddr..CstateAddr+7 as C-state
  entry requests, and 0 disables trapping.
- CPUID Fn0000_0005.
- HWCR[INVDWBINVD]: must be 1 "when … CC6 is enabled", among other conditions.

The PPR glossary defines C-states only as "ACPI defined core power states".

B2 [V] The pre-Zen BKDGs describe the same I/O interface (MSRC001_0073), and only for their own
families:
- 15h M00h–0Fh §2.5.3.3
- 15h M30h–3Fh §2.5.3.2.3
- 16h M30h–3Fh §2.5.3.2.3

In these families, a core in a non-C0 state either has probes serviced (the clock is ramped up)
or has flushed its caches in hardware, after which it gets no probes. CC6 entry flushes the
caches in hardware: L1→L2 on 16h, L1/L2→DRAM on 15h M30h. Offsets 2–7 alias offset 2, so there
are three I/O C-states.

These BKDGs tell BIOS to declare `_CST` as a single entry: Register = CstateAddr+1, **Type = 2**,
latency 400 (100 on 15h M00h). The FADT P_LVL3_LAT is 1001, which declares no C3. They never
declare an I/O C-state as Type 3.

B3 [V] PPR 55901 Vol 5 (19h M11h, FCH ACPI registers, pp.314–339):
- PMACONTROL arb_dis: "under this current AMD C state implementation, this is no longer used
  and should not be reported to OS".
- PM1 control bmrld: "This is no longer needed for current C state implementation".
- PM1 status bmstatus (BM_STS): "no longer used except for server CPU … in conjunction with
  IDLE_EXIT# pin".
- MaskArbDis (reset 1): "ArbDis is not really used, but it still needs to be accessible by OS".

No such statement was found in the 17h or 1Ah PPRs in hand.

### What AMD engineers' code says

B4 [VC] An AMD engineer's change to the Linux ACPI idle code, Acked by the x86 maintainer, was
later ported to Xen. A second AMD engineer reviewed the Xen port, which extends the rule to
Hygon. It sets this rule for every CPU from Family 17h on ("Zen or newer"):
- Software must not flush the caches when entering a Type-3 `_CST` state. The rationale given
  is: "All Zen or newer CPU which support C3 shares cache."
- ARB_DIS "is not used with current AMD C state implementation", so it is not required at C3
  entry.

Linux now keys the rule on a "Zen" CPU feature. That feature is set for AMD from Family 17h on
and for Hygon.

B5 [VC] The first version of B4 applied to all AMD CPUs. The x86 maintainer asked about older
implementations. AMD replied that it was "internally discussing" older parts and narrowed the
rule to Family ≥17h. The rule is therefore not established for Family ≤16h. B2 covers 15h/16h
from their own documents.

B6 [VC] Another AMD engineer (Linux) states this for Zen: after the I/O read that requests an
I/O C-state, no extra dummy I/O delay is needed. That delay is a legacy read of the ACPI PM
timer, made to wait for STPCLK#. On Zen it was measured to inflate residency badly. Linux now
skips it on everything except Intel.

B7 [VC] AMD-partner engineers wrote coreboot's AMD `_CST` generation, which carries these
statements:
- One version matches the objects of AMD's FSP binary.
- The C3 values "match the majolica UEFI firmware". Majolica is an AMD reference board.

The `_CST` it generates is:
- C1: FFH (see C2).
- C2: SystemIO byte read of CstateAddr+1, **Type 2**.
- C3: SystemIO byte read of CstateAddr+2, **Type 3**, latency 350 µs. Coreboot declares C3 for
  the SoCs it calls Cezanne, Mendocino, Phoenix, Glinda and Strix Halo. Picasso gets only C1
  and C2.
- C2 latency 18 µs on those parts, 400 µs on Picasso.
- `_CSD` HW_ALL.

For Genoa and Turin servers, "only the following 2 C-states [are] reported by the reference
firmware": C1 FFH, and C2 I/O with latency 18 or 100 µs.

So AMD's own firmware declares the third I/O C-state as ACPI Type 3 on Zen client parts.

### What OS code does with it (generic, for comparison)

B8 [OC] Linux (generic code, not AMD-authored) applies the B4 flags to a Type-3 `_CST` state on
Zen in this way:
1. It accepts C3 without ARB_DIS only when `_CST` exists. Without `_CST`, C3 "requires BM
   control" and is rejected.
2. At initialisation it sets BM_RLD=1, documented as harmless where it is a no-op.
3. At each C3 entry, if the state did not opt out (only an Intel FFH state with Arg1 bit 1 clear
   opts out), it reads BM_STS. If BM_STS is set, it clears it and demotes to the deepest
   non-C3 state.
4. It does no ARB_DIS write and no cache flush.
5. It then reads the I/O port.

When a CPU goes offline ("play dead") in any C-state, Linux and Xen always write back and
invalidate the caches first. On AMD, Xen then loops on the I/O read.

B9 [VC]/[OC] Whether BM_STS demotion (B8.3) is needed on Zen is **not established**. AMD's code
(B4) is silent on it. AMD's 19h M11h document (B3) says BM_STS is unused except on server CPUs.

### Summary for gap 1

- **Established, from AMD engineers' code:** on Family 17h, 19h and 1Ah (and Hygon), a Type-3
  I/O C-state needs no software cache flush and no ARB_DIS. AMD's own firmware declares such
  states.
- **Established, from an AMD document, for 19h M11h only:** ARB_DIS and BM_RLD are unused, and
  BM_STS is used only on server CPUs.
- **Not established:** any AMD *document* that states the no-flush property for Zen I/O
  C-states.
- **Not established:** per-family confirmation beyond the generic family-≥17h rule.
- **Not established:** whether BM_STS checking is needed on Zen.

---

## C. AMD FFH encoding for `_CST` (gap 2)

C1 [V] No AMD document defining an FFH encoding (vendor code, class code, Arg0, Arg1) was found.
None of these define one: the PPRs and BKDGs in B1/B2, APM Vol 2/3, or the BKDG `_PCT` text,
which says only "Functional Fixed Hardware". A web search found no AMD FFH specification.

C2 [VC] AMD's firmware encodes `_CST` C1 as an FFH Register() with these fields:
- Register_Bit_Width (the vendor-code position in Intel's layout) = **2**.
- Register_Bit_Offset (the class) = **2**.
- Address (Arg0) = **0**.
- Access_Size (Arg1) = **0**.
- Type 1, latency 1.

The sources are the coreboot code in B7, which matches AMD FSP output, and the firmware in C3.
In Intel's layout (E1), class 2 is "native C-state instruction (MWAIT)" with Arg0 as the hint.
Vendor 2 has no published AMD definition. **Inference:** firmware uses vendor code 2 for AMD.

C3 [M] The AMD bench's firmware (OEM "LENOVO", table ID "CB-01") declares C1 exactly as in C2:
FFH 2/2/0/0. Linux on that bench labels it "ACPI FFH MWAIT 0x0".

C4 [VC] AMD-authored Linux changes:
- 2017: AMD C1 FFH uses the *same* MWAIT path as Intel. AMD BIOSes declare C1 as FFH; otherwise
  the OS uses HLT. Without a valid entry the OS falls back to HLT.
- 2022: "AMD Family 17h onwards supports MWAIT as well as MWAIT C1". Families 10h–15h support
  MWAIT but not MWAIT C1.

The same MWAIT path is used by Hygon (a Hygon engineer's change).

C5 [OC] The OS-side entry rule for that path ignores the vendor code. It works as follows:
- **Accept only if:**
  - Bit_Offset (class) == 2.
  - CPUID.5 is present.
  - CPUID.5:ECX[0] (EMX) and ECX[1] (IBE) are set.
  - CPUID.5:EDX reports a nonzero sub-state count for C-state ((Arg0>>4)&0xF)+1.
- **Enter:** MONITOR, then MWAIT with EAX = Arg0 and ECX = 1 (interrupt break).
- **If C1 is rejected:** fall back to HLT.

On AMD, Arg1 is not interpreted. Linux reads Arg1 bit 1 only for Intel.

C6 [V] APM Vol 3 r3.36, MWAIT (p.420): EAX[7:4] carries the C-state request, with
C-state = EAX[7:4]+1. C1 is 0 and C0 is F. Other EAX bits should be zero for a C1 request.
ECX bit 0 lets interrupts wake MWAIT even with IF=0, and it is enumerated by
CPUID.5:ECX[IBE]. Setting an unsupported ECX bit raises #GP.

C7 [V] CPUID Fn0000_0005_EDX on Zen:
- Fixed 0000_0011h (one C0 and one C1 MWAIT sub-state, all higher fields reserved) in PPR
  55922, 55772, OSRR 56255 and 55901.
- Fixed 0000_0021h (**two** C1 sub-states) in PPR 57896 (1Ah M44h).
- ECX = 3 (EMX and IBE) in all of them.

So on Zen, MWAIT reaches only C1. No AMD FFH state deeper than C1 exists in the documents.

The encoding that selects 1Ah's second C1 sub-state (presumably EAX[3:0]) is **not
established**: APM Vol 3 defines only EAX[7:4].

C8 Not established:
- Any AMD meaning for Arg1 (Intel's bit 0 hardware-coordinated and bit 1 bus-master avoidance).
  AMD firmware writes 0.
- Any AMD FFH class other than 2.
- Any AMD FFH encoding for Type 2 or 3.

Coreboot's generator emits FFH only for Type 1, and I/O for every other type.

---

## D. `_LPI` on x86 / AMD (gap 3)

D1 [S] `\_SB._OSC`, platform-wide UUID 0811B06E-4A27-44F9-8D60-3CBBC22E7B48, Revision 1,
Count 2. DWORD 2 (ACPI 6.5 §6.2.11.2 Table 6.13, p.432–433) has two LPI bits:
- Bit 7, "Platform Coordinated Low Power Idle Support".
- Bit 8, "OS Initiated Low Power Idle Support".

The platform clears the bits it does not support. If both remain set, the default is
platform-coordinated, and OSPM switches to OS-initiated "via a processor architecture specific
mechanism". "By setting either flag 7 or 8 or both, the OSPM is asserting it supports any
objects associated with Low Power Idle states (see Section 8.4.3.3, Table 8.16, and Section
7.2.5), and supports a Processor Container Device."

D2 [S] Processor Container Device (ACPI 6.5 §8.4.2.1, p.555):
- `_HID` ACPI0010, optionally `_CID` PNP0A05.
- It must supply a `_UID` that is unique in the processor-container hierarchy.
- It must contain processor devices or other containers.
- It may contain `_LPI`, `_RDI` (top-level container only) and `_STA`.

Several top-level containers are allowed.

D3 [S] `_LPI` (ACPI 6.5 §8.4.3.3, p.562 onward):
- **Package:** `{Revision (WORD, currently 0), LevelID (QWORD, 0 if only platform-coordinated),
  Count (WORD), LPI[1..N]}`.
- **Each LPI sub-package:** `{MinResidency µs, WorstCaseWakeLatency µs, Flags (bit0 enabled),
  ArchContextLostFlags, ResidencyCounterFrequency, EnabledParentState, EntryMethod
  (Register() buffer or Integer), ResidencyCounterRegister, UsageCounterRegister, StateName}`.
- **Indexing:** states are 1-indexed, and LPI0 is running. EPS is a 1-based index of the
  deepest parent state the state enables. 0 means the parent must be running.
- **Ordering:** states are listed shallowest first, in power order.
- **Containers:** if a container has `_LPI`, all its children must have one.
- **Disabled states:** a disabled state keeps its index and must not be requested.

D4 [S] Entry-method composition (ACPI 6.5 §8.4.3.3.4):
1. A processor-level state always gives a Register, which is the base.
2. A parent level may give either of these:
   - An Integer, added to the base address. An Integer of 0 marks the state "autopromotable":
     the platform enters it on its own.
   - A Register, which replaces the base. It must imply the lower-level choices.
3. In OS-initiated mode, the LevelID of the highest level at which the caller is last to idle
   is also added.
4. To enter, OSPM *reads* the composed register.
5. Latencies add across levels. Minimum residencies apply per level.

D5 [S] ACPI 6.5 §8.4.3.5 (p.577): a platform may expose both `_CST` and `_LPI`. "If OSPM
supports _LPI, then it should be used in preference to _CST." At run time only one methodology
may be used across the whole processor hierarchy, never a mixture.

D6 [S] For x86, ACPI defines only these:
- Arch Context Lost Flags = 0 for Intel-based systems.
- An unnamed "processor architecture specific mechanism" to switch to OS-initiated mode.

ACPI points to ARM FFH, PSCI and RISC-V FFH documents for those architectures. It names no x86
FFH or OSI-switch document. An x86 OS-initiated switch mechanism is **not established**.

D7 [V] No AMD document in hand mentions `_LPI`, processor containers or an AMD meaning for LPI
context-loss flags.

D8 [VC] An AMD engineer's Linux change found the following: when an x86 platform with `_LPI`
sees the OS confirm bit 7, but the OS has no x86 LPI entry support, "this leads to high power
consumption on X86 platforms". Linux therefore uses `_LPI` only where the architecture provides
FFH LPI entry, which today means arm64 and RISC-V. On x86 it falls back to `_CST`.

D9 [OC] Linux nonetheless sets bit 7 (PCLPI) in `\_SB._OSC` on x86 (see D11). As of 2026-07, its
`_LPI` parser ignores LPI states whose entry method is SystemIO, because it enters LPI states
only through FFH.

D10 [M] On the AMD bench (Lenovo "CB-01" firmware), every processor's `_LPI` (Revision 0,
LevelID 0, Count 3) is:

| State | MinRes µs | Wake µs | ArchCtx | EPS | Entry method |
|---|---|---|---|---|---|
| "C1" | 0 | 1 | 0 | 0 | FFH 2/2/0/0 |
| "C2" | 60 | 18 | 0 | 0 | SystemIO byte read 0x414 |
| "C3" | 1000 | 350 | 0 | 1 | SystemIO byte read 0x415 |

The residency and usage registers are the null SystemMemory descriptor, and the flags are
enabled. The DSDT contains an ACPI0010 device. Another SSDT also has an `_LPI` (its contents
were not decoded here).

The same processors' `_CST` has three states:
- C1: FFH 2/2/0/0.
- C2: 0x414, Type 2, 400 µs.
- C3: 0x415, Type 3, 350 µs.

Their `_CSD` is HW_ALL (0xFE) with NumProcessors 2.

D11 [M] On that bench, Linux 7.2 claimed platform `_OSC` support mask 0x006e7eff, which
includes bit 7. Linux still ran acpi_idle from `_CST` and listed C1 FFH, C2 IOPORT 0x414 and C3
IOPORT 0x415 as states, with its latency reordering applied.

D12 **Inference:** under `_LPI`, ACPI itself places no flush or BM duty on the bench's
SystemIO 0x415 state (A6). The no-flush property of the underlying I/O C-state still rests on
B4. ACPI's silence is not an AMD statement.

---

## E. Intel equivalents (gap 4)

E1 [V] Intel 302223-007 §3.1 Table 2 sets the Intel FFH GAS layout:
- Register_Bit_Width = vendor code (Intel = 0x01).
- Register_Bit_Offset = class code.
- Access_Size = Arg1 (8 bits).
- Address = Arg0 (64 bits).

All-zero fields mean the OS has implicit knowledge.

`_CST` encodings (§3.3, Table 4):

| Entry | Vendor | Class | Arg0 | Arg1 |
|---|---|---|---|---|
| C1 Halt (STI;HLT) | 0 | 0 | 0 | 0 |
| C1 I/O then Halt | 1 | 1 | I/O port, byte read before STI;HLT | 0 |
| Native C-state (MWAIT) | 1 | 2 | [31:0] MWAIT hint (EAX) | see below |

For the native C-state, Arg1 bit 0 = hardware-coordinated, and bit 1 = "OSPM should use Bus
Master avoidance for this C-state".

E2 [V] Intel 302223-007 §2.1–2.2: the processor-vendor `_OSC`/`_PDC` UUID is
4077A616-290C-47BE-9EBD-D87058713953, and its capability bits include these:
- Bit 1: C1 I/O then Halt.
- Bit 4: independent C2/C3 per processor.
- Bit 6: `_CSD` SW coordination.
- Bit 8: native C1 beyond halt.
- Bit 9: native C2/C3.

Firmware may expose FFH states only when the OS states these capabilities.

E3 [V] Intel SDM 325462-093, Vol 3B §17.7 (pp.17-35, 17-36): MWAIT C-states map to ACPI C-state
types through `_CST`, and the BIOS exposes that mapping. The processor will not go deeper than
the hint. SDM §20.19.6.4 (p.20-66) says only that cache data "may have been flushed to memory
during the process of entering the idle state" in package C-states. No Intel document in hand
states, for modern parts, that an MWAIT or I/O C3/C6 keeps caches coherent without an OS flush.

E4 [VC] Intel engineers' Linux code sets this rule for every Intel multiprocessor: "all MP CPUs
that support C3 share cache. And caches should not be flushed by software while entering C3".
It treats ARB_DISABLE as a no-op on Intel family >15 and on family 6 from Core 2 (Merom) on. It
skips the BM_STS check for an Intel FFH state whose Arg1 bit 1 is clear. Linux also limits the
legacy dummy PM-timer read after an I/O C-state request to Intel CPUs.

E5 Per-vendor rule shape this supports (a summary of E1–E4 and B4–B8, not a new fact):
- For both vendors, the "no software flush and no ARB_DIS at C3" rule is held by the vendor's
  engineers' code, not by a vendor document.
- Intel documents the FFH encoding (E1).
- AMD's FFH encoding is known only from AMD's firmware (C2), and on Zen it reaches only C1.

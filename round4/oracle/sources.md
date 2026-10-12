# The oracle of round 4's global discharge, as read for PR #873

The documents and hashes are round 2's (`round2/oracle/sources.md`, fetched then with
`curl -A 'toyos-build (https://github.com/ToyOSOrg/ToyOS)'`); this file keeps only what round 4's design rests on.
Round 2's verdict, its CPU rows and its fixed microcode revisions are deleted from the tree, and nothing here cites them.

| document | number, revision | sha256 of the PDF as fetched |
|---|---|---|
| 12th Generation Intel Core Processor Specification Update (Alder Lake) | 682436-040 | 79752bb75aac2618c96062a514e59883b8a97a5411f27d9ab2c55c6f006ef0bd |
| 13th Generation Intel Core ... Specification Update (Raptor Lake) | 740518-031 | 9ad272edeec520051732a149a15762515861564258c960d37661ac5c20ca4521 |

## ADL063 (682436-040, pp. 35-36) and RPL043 (740518-031, p. 32), the same text

- Problem: "The INVLPG instruction should invalidate any global TLB entries for the specified linear address,
  regardless of PCID (Process-Context Identifier). Due to this erratum, INVLPG may fail to invalidate TLB entries for
  global pages with PCIDs different from the current PCID value."
- Scope: "This erratum does not apply in VMX non-root operation. It applies only when PCIDs are enabled and either in
  VMX root operation or outside VMX operation."
- Workaround: "It may be possible for BIOS to contain a workaround for this erratum. Alternatively, this can be worked
  around by software using INVPCID type 2 instead of INVLPG."

The design takes the software workaround wherever `CR4.PCIDE` is set, on every CPU: a global discharge is INVPCID
type 2 there, and INVLPG only where PCIDs are not enabled, which the erratum's scope leaves out.

## SDM Vol. 3A §4.10.4.1

- INVPCID type 2 ("all-context invalidation, including global translations") invalidates every mapping, global ones
  included; type 3 every one but the global.
- INVLPG invalidates the page's mappings in the current PCID and its global mappings in every PCID; a MOV to CR3
  leaves global translations; a MOV to CR4 that changes PGE invalidates every one.
- INVPCID is available only where CPUID.(EAX=07H,ECX=0):EBX.INVPCID[bit 10] is 1: a CPU with PCID and without INVPCID
  has no type 2, so it is declared without `PCIDE`.

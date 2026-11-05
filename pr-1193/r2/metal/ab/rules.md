# Storm mask A/B: rules, written before any reading (2026-11-05)

A = this branch's head with the kernel masking commit reverted (the test
commit kept), B = this branch's head. Same tree otherwise, so the delta is the
change alone. Both on the T14, one boot per image per arm.

Rows: `i219_messages_on_its_msi_vector` (testcases), `mask_windows`
(windowscase), `osbench` (benchcase, its `files` group goes through the
NVMe claim's interrupts).

R1 storm (correctness, also the negative control for the new test):
  B: i219_msi says `storm: 10000 of 10000 forced causes asserted, N message(s)
     landed unread` with 1 <= N <= 64, and the post-storm force is 1 message.
  A: the same line with N > 64 (expected about 10000), so A's row reds on the
     storm check. If A's N <= 64, the test does not establish its claim: stop
     and investigate before landing.

R2 I219 per-interrupt cost: the eight `forced unmasked (n): K message(s) in
  X us` readings per arm (RXSEQ x4, LSC x4). Report each arm's median and the
  delta. Expected delta: one IRTE write plus one index-selective IEC
  invalidation and its wait in the handler, single-digit microseconds.
  Stop and report before landing if B's median exceeds A's by more than 20 us
  or by more than 50%.

R3 interrupts-off windows: `mask_windows`' `log write irqs_off_ns` and the
  herd's `irqs_off_ns` (longest window over every CPU), and every per-CPU
  `windows:` line's irqs_off max. Invalidation waits on the handler, the
  holder's read, and domain map/unmap now run with interrupts off.
  Stop and report before landing if B's log-write or herd irqs_off_ns exceeds
  A's by more than 2x and by more than 20 us, or if the row's own ceiling
  reds on B and not on A.

R4 NVMe path: osbench `files.*` medians, B against A. Evidence, one boot per
  arm. Stop and report if any files.* result regresses by more than 15% on B.
  A single-boot difference under that is noise, not a finding.

Nothing above is re-run to change a verdict; a red is investigated.

## Amendment (2026-11-05, before judging; review r1 of #1193 and the coordinator's ruling)

R1's bounds become: B lands 1 <= N <= 2, and A lands N > 2. Reason: with the
mask, the handler masks and drains before its end of interrupt, and a local
APIC holds one request per vector beside the one in service (Intel SDM Vol.
3A §11.8.4), so at most two deliveries can land; 64 was an estimate. This is a
threshold correction to the test, applied before the readbacks were judged;
R2-R4 are unchanged.

## Round 2 (2026-11-05, written before any reading of the new B)

Coordinator's ruling on R2: the gate masks only when a message lands while
the record still holds an unread count, the second message before a read.
`took_masking` alone changes; the gate, the backends and the loom shape
stay.

New arms: A2 = the new head with the kernel commits reverted (the storm test
kept); B2 = the new head. T14, rows `i219_messages_on_its_msi_vector` and
`mask_windows`, one boot per image per arm, judged under R1-R3 as amended.

R1's bound under the new trigger: B2 lands 1 <= N <= 3, A2 lands N > 3.
Derivation, the ruling's own: two messages land before the mask (the first
never masks, the second does), and the second's handler drains what the unit
already remapped before its end of interrupt, which a local APIC holds as one
more request for the vector (the SDM citation is verified against Intel's
text before the push). The post-storm force stays exactly 1. Keeping 2 would
red a kernel doing exactly what the ruling asks, so the bound moves with the
trigger; this is stated before reading and not fitted to it.

R2 and R3 as written. R4 is dropped for this round: the ruling names two rows.

Citation correction: the APIC rule is Intel SDM Vol. 3A, order number
325384-093US, §13.8.4 "Interrupt Acceptance for Fixed Interrupts" (verified
against Intel's PDF, sha256 77919be320f35da2782771ef2cb65a868cf68e62c8f8279f2ca61199cb70d1f8):
"the IRR and ISR can queue two interrupts for each interrupt vector: one in
the IRR and one in the ISR. Any additional interrupts issued for the same
interrupt vector are collapsed into the single bit in the IRR." The earlier
§11.8.4 was cited from memory and is that section's number in older revisions.

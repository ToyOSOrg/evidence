# Storm mask A/B round 2 verdict, against rules.md's round 2 section

Arms: A2 = d0dac12cf (kernel/ as #1188's 83ddb42f4 left it, the storm test
kept, bound 3), B2 = 3dc7e7bbb (mask from the second unread message). T14,
one boot per image per arm, run by the coordinator; every boot rc=0, boot
verdict passed. Judged at ebee4a61d (tests/ identical to both arms' trees in
the rows judged): logs/judge2-A2.log, logs/judge2-B2.log.

R1 storm (B2 1..=3, A2 > 3): HOLDS.
  A2: "storm: 10000 of 10000 forced causes asserted, 10000 message(s) landed unread",
      red on the storm check (the control).
  B2: "storm: 10000 of 10000 forced causes asserted, 2 message(s) landed unread";
      "after the storm's read, RXSEQ forced unmasked: 1 message(s)".

R2 I219 per-interrupt cost (stop if B over A by > 20 us or > 50%): HOLDS.
  "forced unmasked (n): 1 message(s) in X us", 8 readings per arm:
  A2: 32 59 63 65 66 66 69 69 -> median 65.5 us
  B2: 23 53 56 57 64 64 65 66 -> median 60.5 us
  delta -5 us: a driver that reads between messages pays no mask.

R3 interrupts-off windows (stop if > 2x and > 20 us longer, or the ceiling
reds on B only): HOLDS. mask_windows PASS on both arms.
  log write irqs_off_ns: A2 30248, B2 41885 (+11.6 us, x1.38)
  herd irqs_off_ns:      A2 21208, B2 26102 (+4.9 us, x1.23)
  Round 1's A read 42305 for the same log write, so the arms' spread is of
  the same order as the difference.

B2's i219_msi job ends "FAILED: the burst never filled the ring" after the
storm phase passed: the pre-existing sighting (ring full 0 times, 65 sent,
0 stranded), recorded in issues/the-intel-nics-room-and-wake-are-unread-on-hardware.md.
The row is therefore red on B2 for that reason and on A2 for the storm check.

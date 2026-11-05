# Storm mask A/B verdict against rules.md (as amended before judging)

Arms: A = c96f73d5d, B = 39cbe735d; T14, one boot per image, run by the
coordinator. AMD B-testcases too. Judged at 39cbe735d (no tests/ change
between the arms): logs/judge-t14-{A,B}.log, logs/judge-amd-B.log.

R1 storm: HOLDS.
  A: "storm: 10000 of 10000 forced causes asserted, 10000 message(s) landed unread",
     red on the storm check (the control).
  B: "storm: 10000 of 10000 forced causes asserted, 1 message(s) landed unread";
     "after the storm's read, RXSEQ forced unmasked: 1 message(s)".

R2 I219 per-interrupt cost: BREACHED. Stop and report before landing.
  "forced unmasked (n): 1 message(s) in X us", 8 readings per arm:
  A: 22 61 66 66 66 66 67 67 -> median 66 us
  B: 43 93 98 99 99 99 100 110 -> median 99 us
  delta +33 us (+50%) against a limit of 20 us or 50%.

R3 interrupts-off windows: HOLDS. mask_windows PASS on both arms.
  log write irqs_off_ns: A 42305, B 50298 (+8.0 us, x1.19)
  herd irqs_off_ns:      A 22323, B 31110 (+8.8 us, x1.39)

R4 NVMe path via osbench files: PREMISE NOT MET. Every files result on this
  image is fs.mem.* (the userland memory filesystem), so none crosses the NVMe
  claim. No result regressed (worst B/A 1.004, ab/files.txt). The NVMe path's
  only reading is R3's log write.

AMD bench B: amdvi_usbd_drives_its_own_entry and amdvi_remaps_the_boot_controller PASS.

Sighting, not this change: B's i219_msi job ends "FAILED: the burst never
filled the ring" (the ring full 0 times, 65 sent, 0 stranded). PR #1188's T14
run of the same row without the mask also shows "the ring full 0 time(s)",
having failed earlier on "no frame arrived". On this link the wire drains the
burst faster than the driver queues it.

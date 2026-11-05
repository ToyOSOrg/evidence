# Round 10 judged: code placement of the 256 KiB gap (B 85c7607d5, S 4f14822ce, H fb4ca4a2b), AMD

Nine boots in the order B S H S H B H B S, all verdict passed, every job exit 0. judge.txt is judge10.py,
written before the run, against rule.txt.

## As written
- Q1 holds: med_H(R) 34543 against med_B(R) 40016, 0.863.
- Q2 FAILS on two of its three clauses:
  - med_S(R) 32114 is not inside H's range [34397, 35068]; it is below it.
  - med_S(Q) 39255.5 is not inside H's range [32676.5, 38801.0]; it is above it.
  - med_S(R) < min_B(R) 38395 holds.
- Verdict by the rule: the gap is the PR's.

## What the rows show (reported, not judged)
- mem.memcpy.262144 (R): S, base code moved only, reads 32030-35364, 0.80 of B, as low as or lower than H
  (0.86). So on R the shift alone reproduces the gap and more. Q2 failed that clause because S was
  slower than H, which the range criterion did not anticipate.
- Placement rows (Q, place.txt): S reads 38.0-40.5k, about B's level (0.98). H reads ~32-34k at k >= 1 in
  boots 5 and 7, and ~38-40k in boot 3. So on Q the shift does not reproduce H's slowdown, and H's own
  boots split two to one (round 9's two head boots split the same way).
- Both instruments run the same memcpy on fresh 4 KiB-page mappings; they differ in the caller (mem.rs
  copy_from_slice against copyat's libc wrapper) and in the buffers' history.
- Other mem.memcpy rows: S within 1% of B everywhere; H 0.98-0.99 at 64 B-4 KiB as in round 9.

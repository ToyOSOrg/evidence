# pr-1150 r10: the holder-read fix, and metal round 5 judged

## The fix (review r9's blocker)
PR head `199228a81`: a holder read in `PagerObject::read` whose copy-out faults part-way now
answers `done` (or `BadAddress` at 0) only after the chunk's gone and written checks, as
every copied chunk's bytes are. Host `cargo run -- --ci host` at `199228a81`: rc=0, "108
step(s), all green" (run locally; log kept by the implementer). No guest row is re-run:
the change reorders one answer on a copy-fault path that no guest row reaches.

## Metal round 5 (images `e43c7cfea` and probe arms; rules in r9/ab5/rules.md)
Run by the orchestrator: 1-base, 2-head, 3-base, 4-head, 5-testcases on the AMD bench and
the T14; every boot verdict passed, hashes verified before flashing.
- `judge-amd.txt`, `judge-t14.txt`: `judge5.py` over the four benchcase boots, every row,
  with rule 1's verdicts and rule 3's probe lines.
- `testcases-judged-*.log`: the staging command re-run at `e43c7cfea` with each bench's
  readback in place: "15 passed, 0 failed, 1 boot(s)" on both.
- `*-excerpt.log`: each boot's osbench lines, exit lines, test markers and any panic line.
  Machine identity strings are masked.

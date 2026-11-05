# pr-1150 r12: metal round 6 judged (rules: r11/ab6/rules.md)

The orchestrator ran it: AMD 1-base 2-head 3-head 4-base 5-base 6-head 7-head 8-base 9-testcases;
T14 1-base 2-head 3-head 4-base 5-diag 6-diag 7-testcases. Every boot verdict passed, and hashes
were verified before flashing.
- `judge-*.txt`: `judge6.py`. AMD hot rows are judged by pair, each head against the base booted
  beside it; the T14 by range. Then every row, the named rows with each boot's `mhz`, and the
  probe's ns per call.
- `testcases-judged-*.log`: the staging command re-run at 378cea3a7 with each readback in place:
  "19 passed, 0 failed" on both benches.
- `*-excerpt.log`: each boot's osbench, exit, test-marker and panic lines. Machine identity strings
  are masked.

# pr-1150 r15: metal round 8 judged (rules: r14/ab8/rules.md)

The PR head at the images was bdec5ab36: x86-64 user leaves accessed, and dirty where writable.
The orchestrator ran it: AMD 1-base 2-head 3-head 4-base 5-cad 6-testcases; T14 1-base 2-head 3-head
4-base 5-testcases. Every boot passed, with hashes verified before flashing.
- `judge-*.txt`: `judge8.py`. AMD is judged by pair (1/2, 4/3), the T14 by range, then every row and
  the named rows with each boot's `mhz`.
- `amd-cad-per-spawn.txt`: the copy probe on head. 760 ns per page copied against round 7's 1871
  (head) and 685 (main). Rule 2's threshold is 800, so the accessed/dirty mechanism is CONFIRMED.
- `testcases-judged-*.log`: "19 passed, 0 failed" on both benches.
- `*-excerpt.log`: each boot's osbench, exit, test-marker and panic lines; machine identity masked.

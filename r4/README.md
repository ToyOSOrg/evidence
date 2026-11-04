# pr-1150 r4: round 3's metal read

- `ab3-table.txt`: round 3's metal A/B, judged by `r3/ab3-rules.md` with `r3/judge2.py`.
  Base a0e8f1333; b4096 5572386b8; b1024 the same head with `BOUNCE` = 1024. T14 and AMD,
  7 boots each, all passed.
- `ab3-futex.txt`: the pipe benchmark's `FUTEX_WAIT` per boot. The head makes 0-1 a run
  against base's 94-136, so rule 2 holds.
- `ab3-data.txt`: the T14's DATA volume. It mounted in boot 1 (base) and answered
  `BadMagic` from boot 2 on, base boot 4 included. AMD's mounted in every boot. So
  `/home` was absent in the T14's testcases boot, and `std_fs` failed making its
  working directory there. Every other member exited 0.

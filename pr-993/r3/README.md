# #993 review round 3

- `bench/`: the orchestrator's boots of both timing programs at 7a36687d0 (base b9e4c5862, before #990) on the T14 (Intel signature 0x806c1) and the AMD bench (0x860f01). The files hold the programs' lines and exit records only. Every judge verdict is `passed`, meaning the job ran and its controls held.
  - Fast program: every routine passes on both benches.
  - Curves program: every routine passes on AMD. On the T14, P-256 public key LEAKS (|t| 73.06, raw 66.87), P-256 agreement LEAKS (|t| 83.35, raw 76.04) and P-384 agreement LEAKS marginally (|t| 5.79). The controls held on the same boot.
  - Job CPU time: fast 970 s (T14) and 822 s (AMD); curves 7,036 s (T14) and 6,234 s (AMD). The bounds are each slower bench's time plus half.
- `controls/`: N1's negative control. Clearing `named_only` on the fixture's `beta_row` makes `checks::metal_words_take_rows_members_and_whole_boots` fail (exit 101). The patch was reverted in the same run, and the test is green again.

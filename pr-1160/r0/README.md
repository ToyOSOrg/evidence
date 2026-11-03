# pr-1160 r0: the counters_read silence

- `ab-unclamped/`: six interleaved rounds of the four virtsmpcase rows (base = main e3a421563, onecopy =
  the PR's change, tas = main with `patches/scout-tas.patch`), beside other worktrees' work, host load
  18 to 51; `tally.txt` is `tools/tally.py free` over them (each red is counted twice there, as its FAIL
  and its STALL line; rows are 24 per arm).
- `captures/`: gdbstub captures of silent guests (`patches/scout-harness.patch`). `bgmain-1.log` is
  main's kernel, harness under `taskpolicy -c background`; `bgmain-1.frames.txt` symbolises it against
  `kernel-main-default.nm`. `s9`-`s11` are single-threaded TCG on a scratch kernel with
  `patches/scout-held-and-spin.patch` (the lock probes are in `s11.log`).
- `clamp/`: the whole-process-clamp A/B (`tools/ab.sh`), base vs the change.
- Nothing here is committed to ToyOS: every patch is scratch.

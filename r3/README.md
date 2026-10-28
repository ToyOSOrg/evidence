# pr-1073 r3: third boots, review r2's fixes

- `readback-notes/`: the osbench lines from the third boots at `f6510defd`. On each bench the order was A*, B3, A*, B3; A* is the r2 A* image, with the deep states off and all else equal.
- `run3-out.txt`: `python3 -I run2.py <run3 dir>` over those readbacks.
- AMD `crunch.single.deflate` p50, with the CPU the thread ran on (from the `.cpus` notes in r2 and r3):
  - The two slow runs both ran on CPU 4: r2 B2 at 66.77 ms and r3 A* at 66.59 ms.
  - The six other runs, on CPUs 0, 2, 10 and 12, read 62.87 to 63.59 ms.
  - APERF/MPERF read 4214 to 4250 MHz in every run.
- `sdm/core-residency-sdm-quotes.txt` admits each core C6/C7 residency model (`MSR_CORE_C6_RESIDENCY` and `MSR_CORE_C7_RESIDENCY`, 3FDH and 3FEH) section by section, quoting the SDM Vol. 4 325462-093 text extraction.
- `mutations/` holds four mutations at `d286dddf3`. Each was a checked patch, applied, run and restored, and each exited 101 with its test red.
- `logs/ci-host-8.log`: `cargo run -- --ci host` at `d286dddf3`, exit 0, 104 steps.
- `request-B4.txt`: the B4 staging at `d286dddf3`, with benchcase and testcases.

Paths are masked as `<scratch>`, `<worktree>` and `<home>`.

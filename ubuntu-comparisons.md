# The T14 against Ubuntu: comparisons moved out of the speed track

These two items stood in `issues/toyos-uses-what-modern-hardware-offers-for-speed.md` at ToyOS `11be3ba557c25e67b5c8e32c7b0828ad16863834` under "Unexplained". Round 5's ruling 6 (https://github.com/ToyOSOrg/ToyOS/pull/887#issuecomment-6135434292) moves a comparison against another OS out of the tree into the evidence. Their source is the clock-and-contention scout, `wt/toyos-scout-clock` at `fa6a2a829`: https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119513916.

- **The T14's clock against Ubuntu's.** Over the `internet_download` row's
  download windows the medians read 2.67 against 3.08 GHz effective
  (`wt/toyos-scout-clock` at `fa6a2a829`). Ruled out: the power limits
  (5.65 W median against a 20 W PL1, no power, thermal or current limit
  bit logged), the HWP request (both `0x80002a04`) and C1E promotion (both
  allow it). The one limit bit ToyOS logged, multi-core turbo, Ubuntu logged
  in every window too. What differs: ToyOS's cores never go below C1/C1E and
  its package never leaves PC0, where Ubuntu's cores spend 57 to 79 % of a
  run in C7; and ToyOS's idle package draws 3.16 W against Ubuntu's 1.18 to
  1.57 W, which is `issues/idle-cpus-enter-the-c-states-cst-names.md`'s to
  answer. That the idle state reaches HWP's clock choice is inference, and
  the gap is not stable across sessions: round 1 of PR #861, `main`'s
  column, read ToyOS at 2.53 against Ubuntu's 2.03 GHz. Next: a T14 scout
  whose idle CPUs wait in a deep C-state, read against the same windows.
- **Cycles per MB.** ToyOS spends 1.98 times Ubuntu's C0 time per MB (6.09
  against 3.08 ms); the clock is about 1.15 of that and cycles per MB about
  1.58 (16.20 against 10.22 Mcyc), from about 1.17 times the instructions at
  an IPC of 0.94 against about 1.26 (Ubuntu's instructions derived from
  turbostat; ratios of medians). Next: cycles and instructions per MB split
  by where they run, app, network stack and kernel, on both systems.

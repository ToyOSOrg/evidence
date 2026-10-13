# A reading moved out of the speed track because no published figure is its target

This item stood in `issues/toyos-uses-what-modern-hardware-offers-for-speed.md` at ToyOS `b1c292c7679caafdae1be2544162712541eeff38` under "Unexplained". Round 6's review (https://github.com/ToyOSOrg/ToyOS/pull/887#issuecomment-6135739123, NOTE 1) asked that each "Unexplained" reading state the target it falls short of; the orchestrator's ruling on it gives this one no published figure to stand on, so it leaves the list for the evidence. Its source is the clock-and-contention scout, `wt/toyos-scout-clock` at `fa6a2a829`: https://github.com/ToyOSOrg/ToyOS/pull/866#issuecomment-6119513916.

- **Cycles per MB.** ToyOS spends 6.09 ms of C0 time and 16.20 Mcyc per MB
  over the same windows, at an IPC of 0.94. Next: cycles and instructions per
  MB split by where they run, app, network stack and kernel.

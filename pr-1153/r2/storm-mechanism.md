# wake.storm.drain's ab10 slowdown: mechanism reproduced in the simulator (scratch scenario, not committed)

Scenario: AMD shape, balancing off. A thread pins itself to cpu7, unpins, and spawns 16 threads, each of which parks at
once. Each spawn's CPU was printed from the simulator's `Vm::spawn`. Three seeds.

With `791d0a23b` (near term only):
  1 2 3 4 5 0 2 3 8 9 10 11 4 5 0 1
  1 2 3 4 5 0 1 3 5 0 1 3 5 0 1 3
  1 2 3 4 0 1 8 10 2 3 4 5 0 1 2 8

Without the near term (`near` = None, as #1117):
  1 2 3 4 5 8 9 10 11 12 13 14 15 0 2 3
  1 2 3 4 5 8 9 10 11 12 13 14 15 0 1 3
  1 2 3 4 8 10 11 12 13 14 15 0 1 2 4 8

A parked thread raises no published load, so with the near term the spawner's LLC kept looking free: 2-4 waiters shared
one CPU there, while without it they covered 14 CPUs. `501c228b3` adds the process's homes ahead of the LLC term. The
committed `scenarios::spawned_burst` (10 threads, 40 seeds) asserts that a burst lands on distinct CPUs. Without the homes
term it reds: `[1, 2, 3, 4, 5, 0, 2, 3, 8, 9]`.

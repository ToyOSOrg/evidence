# PR 1265: where the all-CPU build's time goes (boot 3 of the spawn diagnosis)

One boot a bench, verdict `passed` on both, from branch `spawnperf-split` at
c2f345b00758bac96b75c76f8b514b144143496d: origin/main 34cb4c918 with MEASUREMENT ONLY commits (never to land).
The job `test_rs_spawn_stages` runs the build-shaped set, 256 children each compressing a file, at `j1` and at one
child a CPU (`j8` on the T14, `j16` on the AMD bench), a warm-up round and three rounds each. Around each round it
asks the kernel (`SYS_DEBUG` 900) to start and then log a census of every contended `sync::Lock` wait by the site
that took it, and per CPU the ticks spent spinning on a lock, waiting on a shootdown as its initiator and serving
another CPU's. Each child's exit line carries, per system call number, `calls/wall_us/cpu_us/spin_us/shoot_us/split`
(spin and shootdown only of calls no scheduler pass split) and its faults' `fault_us`, `fault_spin_us`,
`fault_shoot_us` and `fault_split`.

`boot3/runs3/<bench>/kernel.log` holds only the lines the scripts read (the census, the children's exit lines and
the parent's `build` lines), cut from each boot's kernel log.

- `python3 -I attrib.py t14=runs3/t14/kernel.log amd=runs3/amd/kernel.log` -> `attrib.md` (exit 0): the children's
  CPU at each width and its growth split by system call, fault and lock spin; the contended lock sites; each system
  call at both widths. Means of rounds 1 to 3.
- `python3 -I split.py runs3/<bench>/kernel.log <bench>` -> `split-<bench>.txt` (exit 0): each round on its own.

Both regenerate the published files byte for byte from these lines.

Lock sites are where `sync::Lock::acquire` was called from: `kernel/src/mm/pmm.rs:93` is the frame allocator's one
lock (`try_with`, which every draw, free, promise and unpromise takes); `kernel/src/process.rs:488` the process table
in `process_data`; `kernel/src/mm/alloc.rs:560` and `:584` the kernel heap; `kernel/src/sync.rs:234` an
interrupt-masked lock reached through its wrapper, so its caller is not named.

The instrumentation adds a probe to every system call once it is on: the `j16` round's wall is 331 ms against boot
2's 313 to 316 ms without it.

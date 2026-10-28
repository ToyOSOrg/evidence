# pr-1073 r8: B7 at 18fe4e150

- **The judge** (`logs/judge-{t14,amd}.log`) exits 0 on both benches.
- **Readings.**
  - T14: deflate 54.60 ms; `cpu.clock` above 4100 at 10 of 17 group starts.
  - AMD: deflate 63.09 ms, on CPU 12, a fast boot; 17 of 17.
- **Instrument lines** (`readback-notes/*-B7`): 96 on the T14 and 192 on the AMD. None is refused, and every window lies between its row less `reads_us` and its row plus 10 ms. `reads_us` is at most 294 µs on the T14 and 1226 µs on the AMD.
  - The one non-acpiserver line per bench that contains "refused=" is `mem.munmap_touched_remote.4k`'s `windows_refused=0/10`, a field of that row, not an instrument refusal.
- **Figures.**
  - `aperf_mperf_permille` reads 188-1749 on the T14 and 776-2358 on the AMD. The deflate thread reads 1748 on the T14 and 2354 on the AMD.
  - Core C7 residency reads 0-999 permille on the T14 and is absent on the AMD, which documents no such counter.
  - No field from before the fix is printed.

Paths are masked.

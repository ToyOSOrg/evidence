# memperf diagnosis, 2026-11-11

Where the map/unmap rows' and the small-copy rows' time goes. One ToyOS boot and one Linux run per bench:
attribution, not a verdict.

- ToyOS: branch `memperf-measure` at 31eb5416b (main 422915e2c plus stage probes; measurement only, never lands),
  metal row `memprobe` (`osbench_system`, `osbench_mem`, `osbench_memprobe`). Both readbacks' verdict: passed.
- Linux: the same osbench, static musl, `./osbench memprobe`, exit 0 on both benches, clocksource tsc on both.
- `<bench>-toyos-1.txt`: the boot's `osbench` result lines and `mprobe` lines, nothing else of the log.
- `<bench>-linux-1.txt`: the run's result lines and its clocksource.
- `segments-<bench>.txt`: `segments.py <kernel.log>`, each probe segment in ns. A segment is the time from the
  previous probe on that CPU. A probe costs 6.5 ns on the T14 and 9 ns on the AMD bench.
- Guest row `memprobe_smoke` (plumbing only): run 43022964439, success, at 2dd8a88bf.

Machine and CPU model strings, host names and log prefixes are left out.

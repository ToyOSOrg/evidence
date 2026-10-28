# pr-1073 r7: B6 judged; the instrument on the ratio its vendors define

- **B6 at `55269e97f`** (`logs/judge-{t14,amd}.log`, `readback-notes/*-B6`).
  - The judge exits 0 on both benches.
  - No instrument line was refused, and every `window_us` is within 0.1 % of its `row_us`. The rows are 1 s and longer.
  - The "refused" lines in the boot logs are acpiserver's, not the instrument's.
  - `deep_ended_us` exceeded `window_us` on 13 T14 and 31 AMD lines. A deep period is credited whole when it ends, so that field was removed (`1d46a3ccc`).
- **B6 readings.**
  - T14: deflate 54.88 ms; `cpu.clock` above 4100 at 10 of 17 group starts.
  - AMD: deflate 65.72 ms on CPU 0; 16 of 17.
- **Review r5.** SDM Vol. 3B §17.2 and AMD APM Vol. 2 §17.3 define only the APERF/MPERF ratio. B6 still printed a busy fraction (989 ‰ for a fully busy T14 CPU) and a clock 1 % above `cpu.clock`, both from an assumed MPERF rate. At `862f68cb6` and `18fe4e150` the instrument prints the ratio instead.
  - The window stands only between the row less the two reads' cost and the row plus the kernel's 10 ms join. Stale CPUs are refused.
  - Sierra Forest leaves the residency counters, as its Table 2-57 counts at P1.
- **Checks.**
  - `mutations/`: four mutations, each exiting 101: join-unbounded, reads-unbounded, stale-ignored and afh-admitted.
  - `logs/ci-host-14.log`: `cargo run -- --ci host` at `18fe4e150`, exit 0, 104 steps.
  - `logs/qemu-osbench-b7.log`: the QEMU osbench check at `18fe4e150`, exit 0.
- `request-B7.txt`: B7 benchcase at `18fe4e150`.

Paths are masked.

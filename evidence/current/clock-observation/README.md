# Under-load clock observation for the pre-batch source

The orchestrator repeated the comparator at the pre-batch source
`af822f5cce8921bea903fd8acbba5a9fac473f6e` under the same min=max policy,
with turbostat busy-clock monitoring. r0017/r0018 retained valid benchmark
rows but failed to obtain sudo for the monitor: no clock evidence is claimed
from those attempts. Their complete outputs are retained separately.

r0019/r0020 each contain one seven-sample comparator repeat plus actual
clock-monitor output. All 1,050 benchmark rows per host independently validate
with `tools/analyze_ring.py --runs 1`. The clock parser verifies six T14
one-second CPU-2 intervals at 2400 MHz busy clock and eleven AMD intervals
at 1797 MHz. Aggregate rows are excluded to avoid counting intervals twice.
The full rows are retained in clock-analysis.json with their source hash.

These observations establish busy-clock behavior at one-second granularity
for these additional repeats. They do not measure cycles within each sample,
do not retroactively measure the earlier three repeats and do not qualify the
new batch candidate. Approximate clock-derived cycles for these observed
repeats may be reported with that resolution; the main 21-sample comparison
continues to report directly measured nanoseconds and unfiltered ratios.
Configured policy and observed clock remain distinct. Prior settings were
restored by the orchestrator, as recorded in environment.txt.

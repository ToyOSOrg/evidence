"""durations.py <log>...: scratch. Per guest ([serial N]) of each --nocapture log, the guest-clock span of
test_rs_counters_read from its TEST_START to its TEST_END, or 'none' where it never ended on the console."""
import sys, re
for log in sys.argv[1:]:
    start, end = {}, {}
    for line in open(log, errors="replace"):
        m = re.match(r"\S+ \[serial (\d+)\] \[\s*([\d.]+) test-runner\] ===TEST_(START|END) test_rs_counters_read", line)
        if m:
            (start if m.group(3) == "START" else end)[m.group(1)] = float(m.group(2))
    spans = []
    for g in sorted(start):
        spans.append(f"g{g}={end[g] - start[g]:.2f}s" if g in end else f"g{g}=none")
    print(log.rsplit("/", 1)[-1], " ".join(spans))

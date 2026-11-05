#!/usr/bin/env python3
"""cpdiff.py <log> <child>: median per-spawn deltas of the copy counters between consecutive exits of <child>."""
import sys, re, statistics
t = open(sys.argv[1], errors="replace").read(); child = sys.argv[2]
rows = []
for l in t.splitlines():
    if f"exit: {child} pid=" in l and "cp_rd=" in l:
        rows.append({k: tuple(map(int, v.split('/'))) for k, v in re.findall(r'cp_(\w+)=(\S+)', l)})
d = [{k: tuple(b[k][i] - a[k][i] for i in range(3)) for k in a} for a, b in zip(rows, rows[1:])]
print(f"{len(rows)} exits of {child}; median per spawn (calls/bytes/us, ns per call):")
for k in ["rd", "wr", "zr", "pf"]:
    c = statistics.median(x[k][0] for x in d); b = statistics.median(x[k][1] for x in d); n = statistics.median(x[k][2] for x in d)
    print(f"  {k}: {c:.0f} calls {b/1048576:.2f} MiB {n/1000:.0f} us  {n/c if c else 0:.0f} ns/call")

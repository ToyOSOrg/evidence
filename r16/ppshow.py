#!/usr/bin/env python3
"""ppshow.py <log>: the pipe probe's per-class bins at osbench_system's exit (the benchmark is the only
writer of 64/256/1024/4096-byte pipe writes in that boot)."""
import sys, re
t = open(sys.argv[1], errors="replace").read()
rows = {}
for l in t.splitlines():
    m = re.search(r'pipeprobe: osbench_system pid=\d+ class=(\d+) (.*)$', l)
    if m: rows[m[1]] = dict(re.findall(r'(\w+)=(\d+/\d+/\d+)', m[2]))
if not rows: sys.exit("no pipeprobe lines at osbench_system's exit")
for sz in ["64", "256", "1024", "4096"]:
    out = []
    for k in ["wt", "wb", "wl", "wk", "rt", "rl", "rc", "rk", "rf"]:
        c, b, n = map(int, rows[sz][k].split('/'))
        if c: out.append(f"{k}:{c}c {n/c:.0f}ns" + (f" {b/c:.0f}B" if k in ('rt','rl','rc','rf') else ""))
    w = list(map(int, rows[sz]['wt'].split('/'))); r = list(map(int, rows[sz]['rt'].split('/')))
    mb = w[1] / 1e6 if w[1] else 0
    tot = (w[2] + r[2]) / mb if mb else 0
    print(f"{sz:>5}: per MB written: write ns {w[2]/mb if mb else 0:.0f} read ns {r[2]/mb if mb else 0:.0f} sum {tot:.0f} | " + "  ".join(out))

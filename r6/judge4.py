#!/usr/bin/env python3
"""judge4.py <runs>/<bench>: ab4 rule 1 over 1-base, 2-head, 3-base, 4-head."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1])
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?p50=(\S+)')
HOT = {"pipe.throughput.64", "pipe.throughput.256", "pipe.throughput.1024", "pipe.throughput.4096", "ipc.reqrep.8", "ipc.reqrep.4096", "ipc.reqrep_handle.8"}
def rows(d):
    out = {}
    for l in (root / d / "kernel.log").read_text(errors="replace").splitlines():
        m = pat.search(l)
        if m and re.match(r'(pipe\.throughput|ipc)\.', m[1]):
            out[m[1]] = (m[2], float(m[3]))
    return out
b = [rows("1-base"), rows("3-base")]; h = [rows("2-head"), rows("4-head")]
print(f"{'row':24} {'unit':5} {'base':>15} {'head':>15} {'head/base':>9} verdict")
for k in b[0]:
    unit = b[0][k][0]; hb = unit.endswith("/s")
    bs = [r[k][1] for r in b]; hs = [r[k][1] for r in h]
    bm = sum(bs) / 2; d = (sum(hs) / 2 - bm) / bm * 100
    worse = (max(hs) < min(bs)) if hb else (min(hs) > max(bs))
    better = (min(hs) > max(bs)) if hb else (max(hs) < min(bs))
    v = "unchanged"
    if better: v = "MOVED better"
    if worse: v = "REGRESSION (hot)" if k in HOT else ("REGRESSION" if abs(d) > 5 else "MOVED worse")
    f = lambda xs: "/".join(f"{x:g}" for x in xs)
    print(f"{k:24} {unit:5} {f(bs):>15} {f(hs):>15} {d:+8.1f}% {v}{'  [hot]' if k in HOT and v=='unchanged' or k in HOT and 'better' in v else ''}")

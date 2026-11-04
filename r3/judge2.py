#!/usr/bin/env python3
"""judge2.py <runs>/<bench>: ab2 rules 1-3 over 1-base..6-b1024."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1])
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?p50=(\S+)')
def rows(d):
    out = {}
    for l in (root / d / "kernel.log").read_text(errors="replace").splitlines():
        m = pat.search(l)
        if m and re.match(r'(pipe\.throughput|ipc)\.', m[1]):
            out[m[1]] = (m[2], float(m[3]))
    return out
b = [rows("1-base"), rows("4-base")]; h = [rows("2-b4096"), rows("5-b4096")]; l = [rows("3-b1024"), rows("6-b1024")]
def moved(x, y, hb):  # y against x: 'better', 'worse' or None
    if min(y) > max(x): return "better" if hb else "worse"
    if max(y) < min(x): return "worse" if hb else "better"
    return None
print(f"{'row':24} {'unit':5} {'base':>15} {'b4096':>15} {'b1024':>15} {'4096/base':>9} verdict | b1024 vs b4096")
for k in b[0]:
    unit = b[0][k][0]; hb = unit.endswith("/s")
    bs = [r[k][1] for r in b]; hs = [r[k][1] for r in h]; ls = [r[k][1] for r in l]
    bm = sum(bs) / 2; d = (sum(hs) / 2 - bm) / bm * 100
    m = moved(bs, hs, hb); v = "unchanged"
    if m: v = "MOVED " + m
    if m == "worse" and abs(d) > 5: v = "REGRESSION"
    t = moved(hs, ls, hb) or "-"
    f = lambda xs: "/".join(f"{x:g}" for x in xs)
    print(f"{k:24} {unit:5} {f(bs):>15} {f(hs):>15} {f(ls):>15} {d:+8.1f}% {v:12} | {t}")

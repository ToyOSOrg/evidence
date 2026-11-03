#!/usr/bin/env python3
"""judge.py <runs>/<bench>: apply ab/rules.md rule 1 to boots 1-base..4-head."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1])
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?p50=(\S+)')
def rows(d):
    out = {}
    for l in (root / d / "kernel.log").read_text(errors="replace").splitlines():
        m = pat.search(l)
        if m and re.match(r'(pipe\.throughput|ipc|fs\.mem|fs\.disk|persist)\.', m[1]):
            out[m[1]] = (m[2], float(m[3]))
    return out
b1, h2, b3, h4 = (rows(d) for d in ("1-base", "2-head", "3-base", "4-head"))
print(f"{'row':38} {'unit':6} {'b1':>9} {'b3':>9} {'h2':>9} {'h4':>9} {'delta':>7} verdict")
for k in b1:
    if not all(k in r for r in (h2, b3, h4)):
        print(k, "MISSING in some boot"); continue
    unit = b1[k][0]
    hb = unit.endswith("/s")  # throughput: higher is better
    bs, hs = [b1[k][1], b3[k][1]], [h2[k][1], h4[k][1]]
    bm = sum(bs) / 2; hm = sum(hs) / 2
    d = (hm - bm) / bm * 100 if bm else 0
    above = min(hs) > max(bs); below = max(hs) < min(bs)
    v = "unchanged"
    if above or below:
        worse = below if hb else above
        v = "MOVED " + ("worse" if worse else "better")
        if worse and abs(d) > 5: v = "REGRESSION"
    print(f"{k:38} {unit:6} {bs[0]:9g} {bs[1]:9g} {hs[0]:9g} {hs[1]:9g} {d:+6.1f}% {v}")

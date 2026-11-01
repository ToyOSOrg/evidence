#!/usr/bin/env python3
"""judge.py <runs-dir> <claim-row> <ratio>: the A/B rules (rules.md), per bench."""
import re, sys, pathlib, statistics
runs, claim, ratio = pathlib.Path(sys.argv[1]), sys.argv[2], float(sys.argv[3])
def rows(f):
    out = {}
    for l in f.read_text(errors="replace").splitlines():
        m = re.search(r"bench=(\S+) unit=(\S+) .*?p50=([0-9.]+)", l)
        if m and re.match(r"(fs\.disk|fs\.mem|persist)\.", m.group(1)):
            out[m.group(1)] = (m.group(2), float(m.group(3)))
    return out
ok = True
for bench in sorted(p for p in runs.iterdir() if p.is_dir()):
    boots = sorted(p for p in bench.iterdir() if p.is_dir())
    base = [rows(b / "kernel.log") for b in boots if b.name.endswith("-base")]
    head = [rows(b / "kernel.log") for b in boots if b.name.endswith("-head")]
    print(f"== {bench.name}: {len(base)} base, {len(head)} head")
    for b in boots:
        print(f"   {b.name}: verdict {(b / 'verdict.txt').read_text().split()[0] if (b / 'verdict.txt').exists() else '?'}")
    names = sorted(set.intersection(*(set(r) for r in base + head)))
    for n in names:
        unit = base[0][n][0]
        bv = [r[n][1] for r in base]; hv = [r[n][1] for r in head]
        higher_better = unit not in ("ns", "us", "ms")
        bm, hm = statistics.mean(bv), statistics.mean(hv)
        lo, hi = min(bv), max(bv)
        moved_better = all((h > hi) if higher_better else (h < lo) for h in hv)
        moved_worse = all((h < lo) if higher_better else (h > hi) for h in hv)
        change = (hm - bm) / bm
        tag = ""
        if n == claim:
            met = moved_better and (hm <= ratio * bm)
            tag = "CLAIM " + ("MET" if met else "NOT MET")
            ok &= met
        elif moved_worse and abs(change) > 0.05:
            tag = "REGRESSION"
        elif moved_worse:
            tag = "moved worse <5%"
        elif moved_better:
            tag = "moved better"
        if tag:
            print(f"   {n:45s} {unit:5s} base {bv} head {hv}  {change:+.1%}  {tag}")
print("CLAIM MET ON EVERY BENCH" if ok else "CLAIM NOT MET SOMEWHERE")

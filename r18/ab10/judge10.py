#!/usr/bin/env python3
"""judge10.py <runs>/amd: round 10's rule over six adjacent base/head pairs."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1])
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) (.*?)$')
HOT = ["pipe.throughput.64", "pipe.throughput.256", "pipe.throughput.1024", "pipe.throughput.4096",
       "ipc.reqrep.8", "ipc.reqrep.4096", "ipc.reqrep_handle.8"]
PAIRS = [("1-base", "2-head"), ("4-base", "3-head"), ("5-base", "6-head"), ("8-base", "7-head"), ("9-base", "10-head"), ("12-base", "11-head")]
def rows(d):
    out = {}
    for l in (root / d / "kernel.log").read_text(errors="replace").splitlines():
        m = pat.search(l)
        if m:
            p = re.search(r'p50=([\d.]+)', m[3]); mhz = re.search(r' mhz=(\d+)', m[3])
            if p: out[m[1]] = (m[2], float(p[1]), mhz[1] if mhz else '-')
    return out
for b, h in PAIRS:
    for d in (b, h):
        print(d, (root / d / "verdict.txt").read_text().split()[0])
R = {d: rows(d) for p in PAIRS for d in p}
def change(k, b, h):
    unit, bv, _ = R[b][k]; hv = R[h][k][1]
    return (hv / bv - 1) if unit.endswith("/s") else (bv / hv - 1)
blocked = False
print("\nhot rows (pair change, negative = head worse):")
for k in HOT:
    ch = [change(k, b, h) for b, h in PAIRS]
    worse = sum(c < 0 for c in ch); mean = sum(ch) / len(ch)
    reg = worse >= 5 or mean < -0.01
    blocked |= reg
    why = (["(a) worse in %d of 6" % worse] if worse >= 5 else []) + (["(b) mean %.2f%%" % (mean * 100)] if mean < -0.01 else [])
    print(f"  {k:24} " + " ".join(f"{c*100:+6.1f}%" for c in ch) + f"  worse {worse}/6  mean {mean*100:+.2f}%  " + ("REGRESSION " + ", ".join(why) if reg else "pass"))
print("\nIPC values per boot (slow mode reads well above the fast cluster):")
for k in ["ipc.reqrep.8", "ipc.reqrep.4096", "ipc.reqrep_handle.8"]:
    print(f"  {k:24} " + " ".join(f"{d}={R[d][k][1]:g}" for p in PAIRS for d in p))
print("\nverdict:", "BLOCKED: a hot row regressed" if blocked else "every hot row passes")
print("\nother rows with mean pair change worse than -5%:")
for k in R["1-base"]:
    if k in HOT or not all(k in R[d] for p in PAIRS for d in p): continue
    try: ch = [change(k, b, h) for b, h in PAIRS]
    except ZeroDivisionError: continue
    mean = sum(ch) / len(ch)
    if mean < -0.05:
        print(f"  {k:36} mean {mean*100:+.1f}%  " + " ".join(f"{c*100:+.1f}%" for c in ch) + "  mhz " + " ".join(R[d][k][2] for p in PAIRS for d in p))

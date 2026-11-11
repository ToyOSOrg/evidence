#!/usr/bin/env python3
"""Grouped, probe-cost-subtracted view. usage: grp.py <log> <row> [min_share]"""
import re, sys, collections
sys.path.insert(0, __file__.rsplit("/",1)[0])
import importlib.util
spec = importlib.util.spec_from_file_location("seg", __file__.rsplit("/",1)[0] + "/seg.py")
src = open(__file__.rsplit("/",1)[0] + "/seg.py").read().split("rows = collections.OrderedDict()")[0]
g = {}; exec(src, g)
name, ops = g["name"], g["ops"]
def group(i):
    if i >= 512: return "futex" if i - 512 == 58 else "entry/exit+user"
    if i >= 256: return "entry/exit+user"
    if i in (1,2,3): return "entry/exit+user"
    if i in (10,17): return "futex"
    if i in (12,13,14,15,16,35): return "wait(register,prepare,commit)"
    if i in (18,19,20): return "post+kick"
    if 110 <= i <= 161: return "runqueue fine"
    if i in (40,41,42,43,44,45,46,47,48,49): return "runqueue(drain,leave,enter,pick,publish)"
    if i in (30,31,32,33,34,36,37,38,39): return "pass fixed"
    if i in (90,91,92,93,94,50,53): return "timer"
    if 60 <= i <= 67: return "switch"
    if i in (72,76,80): return "HALTED+irq entry"
    if i in (51,52,54,70,71,73,74,75,81,82): return "idle path"
    if 100 <= i <= 104: return "message"
    return "other"
log, want = sys.argv[1], sys.argv[2]
rows = collections.OrderedDict(); khz = None; probe = None
for line in open(log, errors="replace"):
    m = re.search(r"scoutseg tsc_khz=(\d+)", line)
    if m: khz = int(m.group(1))
    m = re.search(r"scoutseg row=(\S+) cpu=(\d+)((?: \d+:\d+:\d+)+)", line)
    if not m: continue
    for rec in m.group(3).split():
        i,c,s = map(int, rec.split(":"))
        rows.setdefault(m.group(1), {}).setdefault(int(m.group(2)), []).append((i,c,s))
        if m.group(1).startswith("calibrate") and i == 251: probe = s / c
ns = lambda t: t * 1e6 / khz
for row, cpus in rows.items():
    if want != row: continue
    n = ops(row) if len(sys.argv) < 4 else int(sys.argv[3])
    print(f"== {row}: per op over {n}; probe {ns(probe):.1f} ns subtracted per hit")
    for cpu, recs in sorted(cpus.items()):
        hits = sum(c for _,c,_ in recs)
        if hits / n < 3: continue
        gs = collections.defaultdict(float); detail = collections.defaultdict(list)
        for i,c,s in recs:
            net = ns(max(s - c * probe, 0)) / n
            gs[group(i)] += net; detail[group(i)].append((net, name(i), c / n))
        tot = sum(gs.values())
        print(f" cpu{cpu}: {tot:8.0f} ns/op net ({hits/n:.1f} probes/op)")
        for k, v in sorted(gs.items(), key=lambda kv: -kv[1]):
            parts = ", ".join(f"{nm} {x:.0f}" + (f" (x{cnt:.2f})" if abs(cnt - round(cnt)) > 0.05 or cnt < 0.5 else f" (x{cnt:.0f})") for x, nm, cnt in sorted(detail[k], reverse=True) if x >= 8)
            print(f"   {k:42s} {v:7.0f}  | {parts}")

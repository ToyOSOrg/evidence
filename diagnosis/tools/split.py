#!/usr/bin/env python3
"""Split the fine run-queue probes into drain/leave/park/enter/charge/pick/publish/put_back/yield.
usage: split.py <log> <row>...  (ns per op, probe cost subtracted per hit; per-hit ns in brackets)"""
import re, sys, collections
here = __file__.rsplit("/",1)[0]
src = open(here + "/seg.py").read().split("rows = collections.OrderedDict()")[0]
g = {}; exec(src, g); name, ops = g["name"], g["ops"]
CAT = [(110,115,"drain"),(120,124,"leave"),(125,126,"park"),(129,136,"enter"),(140,140,"doorbell"),
       (141,143,"charge"),(149,154,"pick"),(155,156,"publish"),(159,159,"put_back"),(160,161,"yield")]
def cat(i):
    for a,b,n in CAT:
        if a <= i <= b: return n
rows = collections.OrderedDict(); khz = None; probe = None
for line in open(sys.argv[1], errors="replace"):
    m = re.search(r"scoutseg tsc_khz=(\d+)", line)
    if m: khz = int(m.group(1))
    m = re.search(r"scoutseg row=(\S+) cpu=(\d+)((?: \d+:\d+:\d+)+)", line)
    if not m: continue
    for rec in m.group(3).split():
        i,c,s = map(int, rec.split(":"))
        rows.setdefault(m.group(1), collections.defaultdict(lambda: [0,0]))
        rows[m.group(1)][i][0] += c; rows[m.group(1)][i][1] += s
        if m.group(1).startswith("calibrate") and i == 251: probe = s / c
ns = lambda t: t * 1e6 / khz
print(f"probe {ns(probe):.1f} ns/hit subtracted; all cpus summed; per op")
for want in sys.argv[2:]:
    recs = rows[want]; n = ops(want)
    tot = collections.defaultdict(float); hits = collections.defaultdict(float)
    whole = sum(ns(max(s - c*probe,0)) for i,(c,s) in recs.items()) / n
    for i,(c,s) in recs.items():
        k = cat(i)
        if k is None: continue
        tot[k] += ns(max(s - c*probe,0)) / n
    rq = sum(tot.values())
    det = []
    for i,(c,s) in sorted(recs.items()):
        if cat(i): det.append(f"{name(i)} {ns(max(s-c*probe,0))/n:.0f}[{ns(max(s-c*probe,0))/c:.0f}]")
    print(f"\n== {want}: all probed {whole:.0f} ns/op; run-queue fine {rq:.0f} ns/op ({100*rq/whole:.0f}%)")
    print("   " + "  ".join(f"{k} {tot[k]:.0f}" for _,_,k in CAT if tot[k] >= 1))
    print("   " + ", ".join(det))

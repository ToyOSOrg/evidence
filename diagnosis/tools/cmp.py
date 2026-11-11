#!/usr/bin/env python3
import re, sys, statistics, glob
def rows(path):
    out = {}
    for line in open(path, errors="replace"):
        m = re.search(r"bench=(\S+) unit=(\S+) .*?p50=(\d+)", line)
        if m: out[m.group(1)] = (int(m.group(3)), m.group(2))
    return out
bench = sys.argv[1]
W = "wakeperf/runs/%s/%s/kernel.log"
plain, un, seg = (rows(W % (bench, a)) for a in ("plain", "unasserted", "seg"))
lin = {}
runs = [1,2,3,4,5] if bench == "t14" else [4,5]
for i in runs:
    for k, (v, u) in rows(f"score/runs/{bench}/linux-{i}.txt").items():
        lin.setdefault(k, []).append(v)
main = {}
for d in glob.glob(f"score/runs/{bench}/toyos-[1-4]"):
    for f in glob.glob(d + "/**/kernel.log", recursive=True):
        for k, (v, u) in rows(f).items():
            main.setdefault(k, []).append(v)
print(f"| row | unit | Linux ({'5 runs' if bench=='t14' else 'TSC runs 4,5'}) | main ad5db5a65, 4 boots | plain | unasserted | unasserted/plain | plain vs Linux | unasserted vs Linux | seg |")
print("|---|---|---|---|---|---|---|---|---|---|")
for k in plain:
    p, u = plain[k]
    a = un.get(k, (0,))[0]
    l = statistics.median(lin[k]) if k in lin else None
    m = statistics.median(main[k]) if k in main else None
    hi = u in ("MB/s",)
    def ratio(x):
        if not l or not x: return "-"
        r = (l / x) if hi else (x / l)
        return f"{r:.2f}x"
    print(f"| `{k}` | {u} | {l if l else '-'} | {m if m else '-'} | {p} | {a} | {a/p:.3f} | {ratio(p)} | {ratio(a)} | {seg.get(k,(0,))[0]} |")

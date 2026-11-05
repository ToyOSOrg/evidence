#!/usr/bin/env python3
"""judge5.py <runs>/<bench>: ab5 (r9) rules 1 and 3 over 1-base, 2-head, 3-base, 4-head."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1])
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?p50=(\S+)')
HOT = {"pipe.throughput.64", "pipe.throughput.256", "pipe.throughput.1024", "pipe.throughput.4096",
       "ipc.reqrep.8", "ipc.reqrep.4096", "ipc.reqrep_handle.8"}
def log(d): return (root / d / "kernel.log").read_text(errors="replace")
def rows(d):
    out = {}
    for l in log(d).splitlines():
        m = pat.search(l)
        if m: out[m[1]] = (m[2], float(m[3]))
    return out
for d in ["1-base", "2-head", "3-base", "4-head"]:
    print(d, (root / d / "verdict.txt").read_text().strip().splitlines()[0])
b = [rows("1-base"), rows("3-base")]; h = [rows("2-head"), rows("4-head")]
print(f"\n{'row':36} {'unit':8} {'base':>19} {'head':>19} {'head/base':>9} verdict")
for k in b[0]:
    if not all(k in r for r in b + h): print(f"{k:36} missing in an arm"); continue
    unit = b[0][k][0]; hb = unit.endswith("/s") or unit == "MHz"
    bs = [r[k][1] for r in b]; hs = [r[k][1] for r in h]
    bm = sum(bs) / 2; d = (sum(hs) / 2 - bm) / bm * 100 if bm else 0
    worse = (max(hs) < min(bs)) if hb else (min(hs) > max(bs))
    better = (min(hs) > max(bs)) if hb else (max(hs) < min(bs))
    pi = re.match(r'(pipe\.throughput|ipc)\.', k)
    v = "unchanged"
    if better: v = "MOVED better"
    if worse:
        if k in HOT: v = "REGRESSION (hot)"
        elif pi: v = "REGRESSION" if abs(d) > 5 else "MOVED worse"
        else: v = "REPORTED (worse >5%)" if abs(d) > 5 else "MOVED worse"
    f = lambda xs: "/".join(f"{x:g}" for x in xs)
    print(f"{k:36} {unit:8} {f(bs):>19} {f(hs):>19} {d:+8.1f}% {v}{'  [hot]' if k in HOT else ''}")
print("\nprobe (mean ns per call): READ=0 WRITE=1 SEND=133 RECV=159")
for d in ["1-base", "2-head", "3-base", "4-head"]:
    for l in log(d).splitlines():
        if 'probe_ns_per_call' in l and re.search(r'exit: (osbench_ipc|osbench_system)', l):
            name = re.search(r'exit: (\S+)', l)[1]; pid = re.search(r'pid=(\d+)', l)
            ns = dict(x.split(':') for x in re.search(r'probe_ns_per_call(.*)', l)[1].split() if ':' in x)
            if any(n in ns for n in ('0', '1', '133', '159')):
                print(f"  {d:7} {name:14} pid {pid[1] if pid else '?':>4} 0:{ns.get('0','-')} 1:{ns.get('1','-')} 133:{ns.get('133','-')} 159:{ns.get('159','-')}")

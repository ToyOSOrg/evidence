#!/usr/bin/env python3
"""judge8.py <runs>/<bench> <amd|t14>: ab6 rules 1-3."""
import sys, re, pathlib
root = pathlib.Path(sys.argv[1]); bench = sys.argv[2]
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) (.*?)$')
HOT = ["pipe.throughput.64", "pipe.throughput.256", "pipe.throughput.1024", "pipe.throughput.4096",
       "ipc.reqrep.8", "ipc.reqrep.4096", "ipc.reqrep_handle.8"]
def log(d): return (root / d / "kernel.log").read_text(errors="replace")
def rows(d):
    out = {}
    for l in log(d).splitlines():
        m = pat.search(l)
        if m and 'p50=' in m[3]:
            p = re.search(r'p50=([\d.]+)', m[3]); mhz = re.search(r' mhz=(\d+)', m[3])
            if p: out[m[1]] = (m[2], float(p[1]), mhz[1] if mhz else '-')
    return out
if bench == "amd":
    pairs = [("1-base", "2-head"), ("4-base", "3-head")]
else:
    pairs = [("1-base", "2-head"), ("4-base", "3-head")]
boots = sorted(d.name for d in root.iterdir() if d.is_dir())
for d in boots:
    print(d, (root / d / "verdict.txt").read_text().split()[0])
R = {d: rows(d) for d in boots if "testcases" not in d and "cad" not in d}
def hb(unit): return unit.endswith("/s") or unit == "MHz"
def judge(k):
    unit = R["1-base"][k][0]; up = hb(unit)
    bs = [R[b][k][1] for b, _ in pairs]; hs = [R[h][k][1] for _, h in pairs]
    bm = sum(bs) / len(bs); d = (sum(hs) / len(hs) - bm) / bm * 100 if bm else 0
    worse = lambda b, h: (h < b) if up else (h > b)
    better = lambda b, h: (h > b) if up else (h < b)
    if bench == "amd":
        ratios = [h / b for b, h in zip(bs, hs)]
        w = all(worse(b, h) for b, h in zip(bs, hs)); g = all(better(b, h) for b, h in zip(bs, hs))
        extra = " pairs " + " ".join(f"{(r-1)*100:+.1f}%" for r in ratios)
    else:
        w = (max(hs) < min(bs)) if up else (min(hs) > max(bs)); g = (min(hs) > max(bs)) if up else (max(hs) < min(bs))
        extra = ""
    pi = re.match(r'(pipe\.throughput|ipc)\.', k)
    if g: v = "MOVED better"
    elif w:
        if k in HOT: v = "REGRESSION (hot)"
        elif pi: v = "REGRESSION" if abs(d) > 5 else "MOVED worse"
        else: v = "REPORTED (worse >5%)" if abs(d) > 5 else "MOVED worse"
    else: v = "unchanged"
    f = lambda xs: "/".join(f"{x:g}" for x in xs)
    return unit, f(bs), f(hs), d, v, extra
print(f"\n{'row':36} {'unit':8} {'base':>27} {'head':>27} {'head/base':>9} verdict")
order = HOT + [k for k in R["1-base"] if k not in HOT]
for k in order:
    if not all(k in R[d] for p in pairs for d in p): continue
    unit, b, h, d, v, extra = judge(k)
    print(f"{k:36} {unit:8} {b:>27} {h:>27} {d:+8.1f}% {v}{'  [hot]' if k in HOT else ''}{extra}")
print("\nnamed rows with mhz per boot:")
for k in ["proc.spawn_wait.large", "thread.spawn_join", "thread.spawn_join.default", "thread.spawn_join.stack64k",
          "mem.malloc_churn.16.t1", "mem.malloc_churn.4096.t1", "mem.malloc_churn.16.t8", "mem.malloc_churn.4096.t8", "mem.malloc_churn.1048576.t1",
          "syscall.null", "persist.fsync_clean", "wake.storm.call.w1", "time.sleep_late.1us", "tail.stolen.10s"]:
    print(f"  {k:30} " + " ".join(f"{d}={R[d][k][1]:g}@{R[d][k][2]}" for d in R if k in R[d]))
print("\nprobe ns/call (READ 0, WRITE 1, SEND 133, RECV 159, PAGED_READ 156):")
for d in R:
    for l in log(d).splitlines():
        if 'probe_ns_per_call' in l and re.search(r'exit: (osbench_ipc|osbench_system|osbench_procs) ', l):
            name = re.search(r'exit: (\S+)', l)[1]
            ns = dict(x.split(':') for x in re.search(r'probe_ns_per_call(.*)', l)[1].split() if ':' in x)
            if any(n in ns for n in ('0', '1', '133', '159', '156')):
                print(f"  {d:8} {name:15} " + " ".join(f"{n}:{ns.get(n,'-')}" for n in ('0', '1', '133', '159', '156')))

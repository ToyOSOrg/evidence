#!/usr/bin/env python3
"""Scratch: tabulate `osbench pipeprobe` lines from ToyOS logs and Linux stdout.

usage: tab.py <label>=<file> ...   (several files per label allowed)
"""
import re, sys, collections, statistics

NAMES = {
    0: "sys_write", 1: "sys_read", 2: "sys_paged_read",
    10: "w.small copy-in", 11: "w.small proc-lock+put", 12: "w.small wake-readers",
    13: "w.lookup", 14: "w.turn+claim", 15: "w.supply-frames", 16: "w.fill-copy", 17: "w.commit", 18: "w.wake-readers",
    19: "w.parked", 30: "w.bounced-general",
    20: "r.small proc-lock+take", 21: "r.small copy-out", 22: "r.small wake-writers",
    23: "r.lookup", 24: "r.turn+claim", 25: "r.drain-copy", 26: "r.consume", 27: "r.wake-writers", 28: "r.parked",
    29: "r.general-small-take",
    31: "p.lock+pin", 32: "p.fault_in", 33: "p.copies", 34: "p.unpin", 35: "p.recheck", 36: "p.holder-lookup",
    40: "bytes written", 41: "bytes read", 42: "paged pages",
}

def fields(line):
    return dict(m.split("=", 1) for m in line.split() if "=" in m)

rows = collections.defaultdict(lambda: collections.defaultdict(list))   # bench -> label -> [fields]
stages = collections.defaultdict(lambda: collections.defaultdict(list))
staged_round = collections.defaultdict(lambda: collections.defaultdict(list))
for arg in sys.argv[1:]:
    label, path = arg.split("=", 1)
    for line in open(path, errors="replace"):
        i = line.find("osbench v=2 ")
        if i < 0:
            continue
        f = fields(line[i:])
        if "bench" in f and f["bench"].startswith("probe.") and "p50" in f:
            rows[f["bench"]][label].append(f)
        elif f.get("note") == "stages":
            stages[f["row"]][label].append(f)
        elif f.get("note") == "staged_round":
            staged_round[f["row"]][label].append(f)

labels = sorted({l for b in rows.values() for l in b})
extra = ["reads", "writes", "bytes_per_read", "reader_at", "writer_at", "switches"]
print("## rows (p50 per run; median of runs)\n")
print("| row | unit | " + " | ".join(labels) + " | notes |")
print("|---|---|" + "---|" * (len(labels) + 1))
for bench in rows:
    cells, notes = [], []
    for l in labels:
        runs = rows[bench].get(l, [])
        if not runs:
            cells.append("")
            continue
        p50s = [int(r["p50"]) for r in runs]
        cells.append(f"{int(statistics.median(p50s))} ({min(p50s)}-{max(p50s)}, n={len(p50s)})")
        r = runs[0]
        n = " ".join(f"{k}={r[k]}" for k in extra if k in r)
        if n:
            notes.append(f"{l}: {n}")
    unit = next(iter(rows[bench].values()))[0]["unit"]
    print(f"| `{bench}` | {unit} | " + " | ".join(cells) + " | " + "; ".join(notes) + " |")

print("\n## kernel stages (ToyOS), ns per call of the stage and per pass share\n")
for row in stages:
    for l, runs in stages[row].items():
        for f in runs:
            ns_per_tick = int(f["pass_ns"]) / int(f["pass_tsc"])
            print(f"### `{row}` [{l}] pass {int(f['pass_ns'])/1e6:.1f} ms")
            sr = staged_round[row].get(l)
            if sr:
                print("round: " + " ".join(f"{k}={v}" for k, v in sr[0].items() if k not in ("note", "row", "osbench", "v", "os")))
            print("| stage | calls | ns/call | total ms |")
            print("|---|---|---|---|")
            for k, v in f.items():
                if re.fullmatch(r"s\d+", k):
                    sid = int(k[1:])
                    cyc, cnt = map(int, v.split("/"))
                    if sid in (40, 41, 42):
                        print(f"| {NAMES.get(sid, k)} | {cnt} | {cyc/cnt:.0f} (units/call) | total {cyc} |")
                    else:
                        print(f"| {NAMES.get(sid, k)} | {cnt} | {cyc*ns_per_tick/cnt:.0f} | {cyc*ns_per_tick/1e6:.2f} |")
            print()

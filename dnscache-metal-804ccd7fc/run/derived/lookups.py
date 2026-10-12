"""Reads one arm's kernel.log: every lookup stamp, the fetches' J1/J2, the phases."""
import re
import statistics
import sys

path = sys.argv[1]
stamps, runs, phases = [], [], []
for line in open(path, encoding="utf-8", errors="replace"):
    if "netstack: stamp lookup " in line:
        kv = dict(re.findall(r"(\w+)=(\S+)", line.split("stamp lookup ", 1)[1]))
        stamps.append(kv)
    elif "https_download: setup run=" in line:
        kv = dict(re.findall(r"(\w+)=(\S+)", line.split("setup ", 1)[1]))
        runs.append(kv)
    elif "https_download: phase name=" in line:
        kv = dict(re.findall(r"(\w+)=(\S+)", line.split("phase ", 1)[1]))
        phases.append(kv)


def ms(a, b):
    return (int(b) - int(a)) / 1e6


def summary(name, xs):
    xs = sorted(xs)
    if not xs:
        print(f"{name}: n=0")
        return
    print(f"{name}: n={len(xs)} min={xs[0]:.4f} med={statistics.median(xs):.4f} max={xs[-1]:.4f}")


def phase_of(n1):
    for p in phases:
        if int(p["from"]) <= int(n1) <= int(p["to"]):
            return p["name"]
    return "-"


hits = [s for s in stamps if s.get("hit") == "1"]
miss = [s for s in stamps if s.get("hit") != "1"]
print(f"stamps={len(stamps)} hit=1:{len(hits)} other:{len(miss)}")
rows = {}
for s in stamps:
    key = (s.get("row", "-"), s.get("hit", "-"))
    rows[key] = rows.get(key, 0) + 1
print("by (row, hit):", rows)

print("\n-- every stamp that sent a query: phase, local parts, wire, keep_s")
for s in miss:
    print(
        f"{phase_of(s['n1'])}: acc->read {ms(s['n1'], s['n2']):.3f} read->query {ms(s['n2'], s['n3']):.3f}"
        f" wire {ms(s['n3'], s['n4']):.3f} wake {ms(s['n4'], s['n5']):.3f} reply->answer {ms(s['n5'], s['n6']):.3f}"
        f" clean={s.get('clean')} queries_between={s.get('queries_between')} row={s.get('row', '-')} keep_s={s.get('keep_s', '-')}"
    )

print("\n-- the fetches: J2-J1 and its parts")
for r in runs:
    j1, j2 = int(r["j1"]), int(r["j2"])
    inside = [s for s in stamps if j1 <= int(s["n1"]) <= j2]
    for s in inside:
        parts = f"client->acc {ms(j1, s['n1']):.3f} acc->read {ms(s['n1'], s['n2']):.3f}"
        if s.get("hit") == "1":
            parts += f" read->answer {ms(s['n2'], s['n6']):.4f}"
        else:
            parts += f" read->answer(incl. wire) {ms(s['n2'], s['n6']):.3f}"
        parts += f" answer->client {ms(s['n6'], j2):.3f}"
        print(f"run={r['run']} J2-J1 {ms(j1, j2):.3f} stamps={len(inside)} hit={s.get('hit', '-')} {parts}"
              f" acc+answer->client+client->acc {ms(j1, s['n1']) + ms(s['n1'], s['n2']) + ms(s['n6'], j2):.3f}")

print("\n-- hits, by phase")
by = {}
for s in hits:
    by.setdefault(phase_of(s["n1"]), []).append(s)
for name, ss in by.items():
    summary(f"{name} read->answer (n6-n2)", [ms(s["n2"], s["n6"]) for s in ss])
    summary(f"{name} accepted->read (n2-n1)", [ms(s["n1"], s["n2"]) for s in ss])
summary("ALL hits read->answer (n6-n2)", [ms(s["n2"], s["n6"]) for s in hits])
summary("ALL hits accepted->read (n2-n1)", [ms(s["n1"], s["n2"]) for s in hits])
summary("ALL stamps accepted->read (n2-n1)", [ms(s["n1"], s["n2"]) for s in stamps])
acc = sorted(ms(s["n1"], s["n2"]) for s in stamps)
print("accepted->read <0.25:", sum(1 for x in acc if x < 0.25), " >=0.25:", sum(1 for x in acc if x >= 0.25))

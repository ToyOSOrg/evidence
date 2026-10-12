"""Every lookup stamp's accepted->read (n2-n1) in one arm's kernel.log, the slow mode named by phase."""
import re
import sys

stamps, phases = [], []
for line in open(sys.argv[1], encoding="utf-8", errors="replace"):
    if "netstack: stamp lookup " in line:
        stamps.append(dict(re.findall(r"(\w+)=(\S+)", line.split("stamp lookup ", 1)[1])))
    elif "https_download: phase name=" in line:
        phases.append(dict(re.findall(r"(\w+)=(\S+)", line.split("phase ", 1)[1])))


def phase_of(n1):
    return next((p["name"] for p in phases if int(p["from"]) <= int(n1) <= int(p["to"])), "-")


xs = [((int(s["n2"]) - int(s["n1"])) / 1e6, phase_of(s["n1"]), s.get("hit", "-"), s.get("row", "-")) for s in stamps]
fast = sorted(x for x in xs if x[0] < 0.25)
slow = sorted(x for x in xs if x[0] >= 0.25)
print(f"stamps={len(xs)} fast={len(fast)} min={fast[0][0]:.4f} max={fast[-1][0]:.4f} slow={len(slow)}")
for x in slow:
    print(f"slow {x[0]:.4f} phase={x[1]} hit={x[2]} row={x[3]}")

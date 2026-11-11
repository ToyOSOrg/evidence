# ab.py <runs dir>: each fs.disk.* row's p50 per boot, H against B, by rules.txt.
# With 4 boots a side the exact two-sided Mann-Whitney test resolves at 0.05
# only on complete separation (p = 2/70); a row resolves when every H boot is
# below every B boot (faster) or every H boot above every B boot (slower).
import re, sys, statistics, pathlib
runs = pathlib.Path(sys.argv[1])
order = ["B-1", "H-1", "H-2", "B-2", "H-3", "B-3", "B-4", "H-4"]
rows = {}
for boot in order:
    text = (runs / boot / "diskbenchcase" / "kernel.log").read_text(errors="replace")
    for m in re.finditer(r"osbench v=2 os=toyos bench=(fs\.disk\.\S+) unit=(\S+) n=(\d+) .*?p50=(\d+)", text):
        name, unit, n, p50 = m.group(1), m.group(2), int(m.group(3)), int(m.group(4))
        rows.setdefault(name, {})[boot] = (p50, unit, n)
print("row | unit | " + " | ".join(order) + " | B median | H median | H/B | verdict")
for name in rows:
    r = rows[name]
    missing = [b for b in order if b not in r]
    b = [r[x][0] for x in order if x.startswith("B") and x in r]
    h = [r[x][0] for x in order if x.startswith("H") and x in r]
    unit = next(iter(r.values()))[1]
    cells = " | ".join(str(r[x][0]) if x in r else "-" for x in order)
    if missing:
        print(f"{name} | {unit} | {cells} | | | | missing {missing}")
        continue
    mb, mh = statistics.median(b), statistics.median(h)
    if max(h) < min(b):
        verdict = "resolves: H faster"
    elif min(h) > max(b):
        verdict = "resolves: H SLOWER"
    else:
        verdict = "unresolved"
    print(f"{name} | {unit} | {cells} | {mb:g} | {mh:g} | {mh/mb:.3f} | {verdict}")

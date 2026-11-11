"""usage: python3 -I table.py <t14 compare.md> <amd compare.md> <row regex>
A record's table: each bench's medians with run-to-run range, and ToyOS against Linux (>1 is slower)."""
import re, sys
LOWER = {"ns", "ps", "ns/MiB", "ns/page"}
def load(p):
    d = {}
    for l in open(p, encoding="utf-8"):
        c = [x.strip() for x in l.strip().strip("|").split("|")]
        if len(c) >= 11 and c[0] != "bench" and not c[0].startswith("-"):
            d[c[0]] = c
    return d
def cell(c):
    try:
        lm, tm = float(c[3]), float(c[6])
    except ValueError:
        return "-", "-", "-"
    w = tm / lm if c[1] in LOWER else lm / tm
    return f"{tm:,.0f} ({c[7]})", f"{lm:,.0f} ({c[4]})", f"{w:.2f}x"
t, a = load(sys.argv[1]), load(sys.argv[2])
print("| row | unit | T14 ToyOS | T14 Linux | T14 | AMD ToyOS | AMD Linux | AMD |\n|---|---|---|---|---|---|---|---|")
for name in t:
    if re.match(sys.argv[3], name) and name in a:
        print(f"| `{name}` | {t[name][1]} | " + " | ".join(cell(t[name]) + cell(a[name])) + " |")

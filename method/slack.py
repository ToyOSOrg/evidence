"""usage: python3 -I slack.py <compare.md> [<TSC run numbers, e.g. 4,5>]
ToyOS's timer rows against Linux with its timer slack at 1 ns (the `.slack1ns` rows), beside the reading
against Linux's default 50 us slack. The p is the exact two-sided Mann-Whitney test over the runs' p50s."""
import itertools, sys

def rows(path):
    d = {}
    for l in open(path, encoding="utf-8"):
        c = [x.strip() for x in l.strip().strip("|").split("|")]
        if len(c) >= 11 and c[0] != "bench" and not c[0].startswith("-"):
            d[c[0]] = c
    return d

def ints(s):
    return [int(x) for x in s.split(",") if x.strip()]

def med(v):
    v = sorted(v); n = len(v)
    return v[n // 2] if n % 2 else (v[n // 2 - 1] + v[n // 2]) / 2

def u(a, b):
    return sum((x > y) + 0.5 * (x == y) for x in a for y in b)

def p(a, b):
    allv = a + b; n = len(a); mid = n * len(b) / 2
    obs = abs(u(a, b) - mid); hit = tot = 0
    for idx in itertools.combinations(range(len(allv)), n):
        s = set(idx)
        x = [allv[i] for i in idx]; y = [allv[i] for i in range(len(allv)) if i not in s]
        tot += 1; hit += abs(u(x, y) - mid) >= obs - 1e-9
    return hit / tot

d = rows(sys.argv[1])
tsc = [int(i) - 1 for i in sys.argv[2].split(",")] if len(sys.argv) > 2 else []
head = "| row | ToyOS ns | Linux, default slack | ToyOS against it | Linux, slack 1 ns | ToyOS against it | p | reading |"
if tsc: head += " slack-free TSC runs |"
print(head); print("|" + "---|" * (head.count("|") - 1))
for name in sorted(d):
    if not name.endswith(".slack1ns"): continue
    base = name[: -len(".slack1ns")]
    t, l, s = ints(d[base][5]), ints(d[base][2]), ints(d[name][2])
    w0, w1, pv = med(t) / med(l), med(t) / med(s), p(t, s)
    reading = ("behind" if w1 > 1 else "ahead") if pv < 0.05 else ("at parity" if 1 / 1.1 <= w1 <= 1.1 else "unresolved")
    line = f"| `{base}` | {med(t):,.0f} | {med(l):,.0f} | {w0:.2f}x | {med(s):,.0f} | {w1:.2f}x | {pv:.3f} | {reading} |"
    if tsc: line += f" {', '.join(f'{s[i]:,}' for i in tsc)} |"
    print(line)

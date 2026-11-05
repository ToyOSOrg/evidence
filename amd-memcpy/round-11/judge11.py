# Round 11 (rule.txt): five B/H pairs on the 256 KiB placement rows. Usage: judge11.py <runs dir>
import os, re, statistics, sys
R = sys.argv[1]
res = re.compile(r"bench=(\S+) unit=\S+ .*?p50=(\d+)")
notes = re.compile(r"note=(copyat\.code|copyat\.place\.p\d\.at) (.*)$")
boots = {}
for d in os.listdir(R):
    m = re.fullmatch(r"(\d+)-([BH])", d)
    if not m: continue
    rows, nt = {}, []
    for line in open(os.path.join(R, d, "kernel.log"), errors="replace"):
        x = res.search(line)
        if x: rows[x.group(1)] = int(x.group(2))
        y = notes.search(line)
        if y: nt.append(f"{y.group(1)} {y.group(2).strip()}")
    boots[int(m.group(1))] = (d, m.group(2), rows, nt)
assert sorted(boots) == list(range(1, 11)), sorted(boots)
assert all(boots[i][1] == ("B" if i % 2 else "H") for i in boots)
def Q(rows): return statistics.median(rows[f"copyat.place.p{k}"] for k in range(8))
regress = 0
for p in range(5):
    b, h = boots[2 * p + 1], boots[2 * p + 2]
    qb, qh = Q(b[2]), Q(h[2]); r = qh < 0.95 * qb; regress += r
    print(f"pair {p+1} ({b[0]}, {h[0]}): Q_B {qb} Q_H {qh} ratio {qh/qb:.3f} {'REGRESSES' if r else 'ok'}")
print(f"pairs regressing: {regress} of 5 -> {'Regression: the drop is the PR' + chr(39) + 's' if regress >= 4 else 'Otherwise: per-boot noise; record and land'}")
print("Reported:")
for i in range(1, 11):
    d, arm, rows, nt = boots[i]
    print(f"  {d}: place {[rows[f'copyat.place.p{k}'] for k in range(8)]}  mem.memcpy.262144 {rows.get('mem.memcpy.262144')}  copyat.262144.d0 {rows.get('copyat.262144.libc.s0.d0')}")
    for n in nt: print(f"      {n}")

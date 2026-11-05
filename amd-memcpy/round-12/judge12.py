# Round 12 (rule.txt): find round 11's drop. Usage: judge12.py <runs dir>
import os, re, statistics, sys
R = sys.argv[1]
ORDER = "BHNS HNSB NSBH SBHN BNHS".split()
res = re.compile(r"bench=(\S+) unit=\S+ .*?p50=(\d+)")
runs = {}
for d in os.listdir(R):
    m = re.fullmatch(r"(\d+)-([BHNS])", d)
    if not m: continue
    rows = {}
    for line in open(os.path.join(R, d, "kernel.log"), errors="replace"):
        x = res.search(line)
        if x: rows[x.group(1)] = int(x.group(2))
    runs[int(m.group(1))] = (d, m.group(2), rows)
assert sorted(runs) == list(range(1, 21)), sorted(runs)
blocks = []
for i, order in enumerate(ORDER):
    blk = {}
    for j, arm in enumerate(order):
        n = 4 * i + j + 1
        assert runs[n][1] == arm, (n, runs[n][1], arm)
        blk[arm] = runs[n]
    blocks.append(blk)
def Q(rows): return statistics.median(rows[f"copyat.place.p{k}"] for k in range(8))
drops = {}
for arm in "HNS":
    reg = 0
    for i, blk in enumerate(blocks):
        qb, qx = Q(blk["B"][2]), Q(blk[arm][2]); r = qx < 0.95 * qb; reg += r
        print(f"block {i+1} {arm} ({blk[arm][0]} vs {blk['B'][0]}): {qx} / {qb} = {qx/qb:.3f} {'regresses' if r else 'ok'}")
    drops[arm] = reg >= 4
    print(f"{arm}: regresses in {reg} of 5 -> {'drops' if drops[arm] else 'clears'}")
premise = drops["H"]
med = lambda arm, k: statistics.median(b[arm][2][k] for b in blocks)
short = True
for n in (256, 1024, 2048):
    v, d0 = med("N", f"copyat.{n}.libc.s0.d16"), med("N", f"copyat.{n}.libc.s0.d0"); ok = v <= 1.5 * d0; short &= ok
    print(f"A short: N copyat.{n}.d16 {v} <= 1.5 x d0 {d0}: {ok}")
d0 = med("N", "copyat.8192.libc.s0.d0")
for s in (0, 16):
    for d in (16, 32, 64, 256, 384):
        k = f"copyat.8192.libc.s{s}.d{d}"; v = med("N", k); ok = v <= 1.3 * d0 + 10; short &= ok
        print(f"A short: N {k} {v} <= 1.3 x {d0} + 10: {ok}")
A = (not drops["N"]) and short
P = drops["S"]
print(f"premise (H drops): {premise}; A (N clears and fixes the stall): {A}; P (S drops): {P}")
if not premise: print("Outcome: the drop did not reproduce; reported, the orchestrator decides")
elif A: print("Outcome: ship N (the SSE2 loop for routed copies), focused review, land")
elif P: print("Outcome: code placement; record it and land #1133 as is")
else: print("Outcome: close #1133; record the measured stall and the 256 KiB cost as a finding")
print("Reported:")
for k in ["mem.memcpy.262144", "copyat.262144.libc.s0.d0", "mem.memcpy.64", "mem.memcpy.256", "mem.memcpy.1024", "mem.memcpy.4096"]:
    print(f"  {k}: " + "  ".join(f"{a} {[b[a][2][k] for b in blocks]}" for a in "BHNS"))

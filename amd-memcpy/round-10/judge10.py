# Round 10 (rule.txt): code placement of the 256 KiB gap. Usage: judge10.py <runs dir>
import os, re, statistics, sys
R = sys.argv[1]
pat = re.compile(r"bench=(\S+) unit=\S+ .*?p50=(\d+)")
boots = {"B": [], "S": [], "H": []}
for d in sorted(os.listdir(R)):
    arm = d.split("-", 1)[1] if "-" in d else None
    if arm not in boots: continue
    rows = {}
    for line in open(os.path.join(R, d, "kernel.log"), errors="replace"):
        m = pat.search(line)
        if m: rows[m.group(1)] = int(m.group(2))
    boots[arm].append((d, rows))
assert all(len(b) == 3 for b in boots.values()), {a: [d for d, _ in b] for a, b in boots.items()}
def R_(rows): return rows["mem.memcpy.262144"]
def Q_(rows): return statistics.median(rows[f"copyat.place.p{k}"] for k in range(8))
st = {}
for arm, bs in boots.items():
    r = [R_(x) for _, x in bs]; q = [Q_(x) for _, x in bs]
    st[arm] = dict(R=r, Q=q, medR=statistics.median(r), medQ=statistics.median(q))
    print(f"{arm}: boots {[d for d, _ in bs]}  R {r} med {st[arm]['medR']}  Q {q} med {st[arm]['medQ']}")
B, S, H = st["B"], st["S"], st["H"]
q1 = H["medR"] <= 0.95 * B["medR"]
print(f"Q1 premise med_H(R) {H['medR']} <= 0.95 x med_B(R) {B['medR']}: {'HOLDS' if q1 else 'FAILS'} (ratio {H['medR']/B['medR']:.3f})")
c1 = min(H["R"]) <= S["medR"] <= max(H["R"])
c2 = min(H["Q"]) <= S["medQ"] <= max(H["Q"])
c3 = S["medR"] < min(B["R"])
print(f"Q2 med_S(R) {S['medR']} in H's R [{min(H['R'])}, {max(H['R'])}]: {c1}; med_S(Q) {S['medQ']} in H's Q [{min(H['Q'])}, {max(H['Q'])}]: {c2}; med_S(R) < min_B(R) {min(B['R'])}: {c3}")
q2 = c1 and c2 and c3
print("Q2", "HOLDS" if q2 else "FAILS")
if not q1:
    d3 = H["medR"] >= B["medR"] / 1.1
    print("Verdict: gap did not reproduce; D3 on mem.memcpy.262144 by arm medians:", "HOLDS" if d3 else "FAILS")
elif q2:
    print("Verdict: code placement; record the sensitivity, D3 passes on mem.memcpy.262144")
else:
    print("Verdict: the gap is the PR's")
print("Reported:")
keys = sorted(k for k in boots["B"][0][1] if k.startswith("mem.memcpy.")) + ["copyat.262144.libc.s0.d0"]
for k in keys:
    print(f"  {k}: " + "  ".join(f"{a} {[x[k] for _, x in bs]}" for a, bs in boots.items()))

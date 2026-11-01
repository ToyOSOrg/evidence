# Scratch: the predeclared A/B over the parity rows of the cryptocase readbacks.
import re, sys
M = sys.argv[1]
P256 = {"p-256/ecdh", "ecdsa-p-256-sha-256/verify/64"}
def rows(path):
    out = {}
    for line in open(path, errors="replace"):
        m = re.search(r"parity: (\S+) row (\S+) ours=([\d.]+) .*verdict=(\S+)", line)
        if m:
            out[(m.group(1), m.group(2))] = (float(m.group(3)), line)
    return out
ok = True
for bench in ("t14", "amd"):
    pairs = []
    for k in (1, 2):
        b = rows(f"{M}/{bench}-base-{k}/cryptocase/kernel.log")
        h = rows(f"{M}/{bench}-head-{k}/cryptocase/kernel.log")
        assert b.keys() == h.keys() and b, (bench, k, len(b), len(h))
        pairs.append({key: h[key][0] / b[key][0] for key in b})
    keys = sorted(pairs[0])
    print(f"== {bench}: {len(keys)} rows (build, row): head/base pair 1, pair 2")
    for key in keys:
        r1, r2 = pairs[0][key], pairs[1][key]
        if key[1] in P256:
            verdict = "PASS" if r1 <= 0.90 and r2 <= 0.90 else "FAIL"
        else:
            verdict = "FAIL" if r1 > 1.05 and r2 > 1.05 else "ok"
        if verdict == "FAIL": ok = False
        if key[1] in P256 or "p-384" in key[1] or verdict != "ok" or max(r1, r2) > 1.03:
            print(f"  {verdict:4} {key[0]:10} {key[1]:40} {r1:.3f} {r2:.3f}")
    worst = max(keys, key=lambda k: min(pairs[0][k], pairs[1][k]))
    print(f"  worst non-improving row (min of pairs): {worst} {min(pairs[0][worst], pairs[1][worst]):.3f}")
print("A/B", "PASS" if ok else "FAIL")

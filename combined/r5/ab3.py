# Scratch: pair 3 judged by the rule restated in metal-r5/request.txt before the run.
import re, sys
CT = sys.argv[1]
P256 = {"p-256/ecdh", "ecdsa-p-256-sha-256/verify/64"}
def rows(path):
    out = {}
    for line in open(path, errors="replace"):
        m = re.search(r"parity: (\S+) row (\S+) ours=([\d.]+)", line)
        if m: out[(m.group(1), m.group(2))] = float(m.group(3))
    return out
ok = True
for bench in ("t14", "amd"):
    b = rows(f"{CT}/metal-r5/{bench}-base-3/cryptocase/kernel.log"); h = rows(f"{CT}/metal-r5/{bench}-head-3/cryptocase/kernel.log")
    assert b and b.keys() == h.keys(), (bench, len(b), len(h))
    old = []
    for k in (1, 2):
        ob = rows(f"{CT}/metal/{bench}-base-{k}/cryptocase/kernel.log"); oh = rows(f"{CT}/metal/{bench}-head-{k}/cryptocase/kernel.log")
        old.append({key: oh[key] / ob[key] for key in ob})
    print(f"== {bench}: {len(b)} cells")
    for key in sorted(b):
        r = h[key] / b[key]
        if (bench, key) == ("t14", ("unasserted", "ecdsa-p-256-sha-256/verify/64")): v = r <= 0.90; tag = "(a)"
        elif (bench, key) == ("amd", ("asserted", "chacha20-poly1305/key")): v = r <= 1.05; tag = "(a)"
        elif key[1] in P256: v = r <= 0.90; tag = "(b)"
        else:
            v = not (r > 1.05 and any(o.get(key, 0) > 1.05 for o in old)); tag = "(c)"
        if not v: ok = False
        if tag != "(c)" or not v or r > 1.05 or "p-384" in key[1]:
            print(f"  {tag} {'pass' if v else 'FAIL'} {key[0]:10} {key[1]:38} {r:.3f}  (pairs 1,2: {old[0].get(key, 0):.3f}, {old[1].get(key, 0):.3f})")
    print(f"  max other cell: {max(h[k] / b[k] for k in b if k[1] not in P256):.3f}")
print("PAIR 3", "PASS" if ok else "FAIL")

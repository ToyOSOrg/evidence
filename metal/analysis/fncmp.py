# fncmp.py <dis-B> <dis-H>: which functions' code differs between two objdump
# disassemblies once addresses are removed; and each function's address.
import re, sys
def parse(path):
    fns, cur, addr = {}, None, {}
    for line in open(path, errors="replace"):
        m = re.match(r"^([0-9a-f]+) <(.*)>:$", line)
        if m:
            cur = m.group(2); fns[cur] = []; addr[cur] = int(m.group(1), 16); continue
        if cur is None or not line.startswith(" "):
            continue
        parts = line.split("\t", 1)
        if len(parts) < 2:
            continue
        ins = parts[1].strip()
        ins = re.sub(r"<[^>]*>", "<>", ins)          # symbol+offset targets
        ins = re.sub(r"0x[0-9a-f]+", "N", ins)         # immediates and displacements
        ins = re.sub(r"\b[0-9a-f]{4,}\b", "N", ins)    # bare addresses
        fns[cur].append(ins)
    return fns, addr
b, ab = parse(sys.argv[1]); h, ah = parse(sys.argv[2])
only_b = sorted(set(b) - set(h)); only_h = sorted(set(h) - set(b))
diff = sorted(f for f in set(b) & set(h) if b[f] != h[f])
same = [f for f in set(b) & set(h) if b[f] == h[f]]
print(f"functions: B {len(b)}, H {len(h)}; same code {len(same)}, differing {len(diff)}, only in B {len(only_b)}, only in H {len(only_h)}")
moved = sum(1 for f in same if ab[f] != ah[f])
print(f"of those with the same code, {moved} sit at another address in H")
for title, names in (("differing", diff), ("only in B", only_b), ("only in H", only_h)):
    print(f"\n## {title}")
    for f in names:
        print(f"{len(b.get(f, []))}->{len(h.get(f, []))} {f[:220]}")

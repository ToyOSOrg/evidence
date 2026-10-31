import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from cmpfn_lib import syms, dis
sb, sh = syms(sys.argv[1]), syms(sys.argv[2])
todo, seen = list(sys.argv[3:]), set()
same = diff = 0
while todo:
    f = todo.pop()
    if f in seen or f not in sh: continue
    seen.add(f)
    nh, ch = dis(sys.argv[2], *sh[f])
    todo += [c for c in ch if not c.startswith('__rust') and c not in ('memcpy', 'memset', 'memmove')]
    if f not in sb:
        print(f'ONLY HEAD {len(nh):5} {f}'); diff += 1; continue
    nb, _ = dis(sys.argv[1], *sb[f])
    if nb == nh: same += 1; print(f'same      {len(nh):5} {f}')
    else:
        diff += 1
        d = sum(1 for a, b in zip(nb, nh) if a != b) + abs(len(nb) - len(nh))
        print(f'DIFFER    {len(nb):5}->{len(nh):<5} {d} lines {f}')
print(f'{same} identical, {diff} differ')

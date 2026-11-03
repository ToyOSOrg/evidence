"""ab11 judge: applies ab11/decision-rule.md to <runs>/<n>-<arm>/kernel.log, arms base and spawn. Usage: ab11.py <runs>"""
import re, sys, os, statistics as st
R = sys.argv[1]
boots = sorted(os.listdir(R), key=lambda d: int(d.split('-')[0]))
arm_of = {b: b.split('-', 1)[1] for b in boots}
by_arm = lambda a: [b for b in boots if arm_of[b] == a]
rows = {}
for b in boots:
    d = {}
    for line in open(f'{R}/{b}/kernel.log', errors='replace'):
        m = re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)', line)
        if m:
            d[m.group(1)] = dict(x.split('=', 1) for x in m.group(2).split() if '=' in x)
    rows[b] = d
p50 = lambda b, row: int(rows[b][row]['p50']) if row in rows[b] and rows[b][row].get('p50', '-') not in ('-', '') else None
unit = lambda row: rows[boots[0]].get(row, {}).get('unit', '')
slower = lambda r, row: r if unit(row) in ('ns', 'ps', 'ns/MiB', 'us') else 1 / r
def compare(row):
    va, vb = [p50(x, row) for x in by_arm('spawn')], [p50(x, row) for x in by_arm('base')]
    if not va or not vb or None in va or None in vb: return None
    return st.mean(va) / st.mean(vb), max(va) < min(vb) or max(vb) < min(va), va, vb
MODED = re.compile(r'^(tail\.|pipe\.|thread\.spawn_join|proc\..*spawn|ipc\.reqrep|fs\.disk\.|fs\.mem\.pread_8$|persist\.fsync_clean$|wake\.periodic\.idle$|crunch\.single\.deflate$|mem\.anon\.map$)')
print('boots:', ', '.join(boots))
print('\n## M: wake.storm homes and drain')
ok1 = True
for w in ('w4', 'w16'):
    row = f'wake.storm.drain.{w}'
    for b in boots:
        h = rows[b].get(row, {}).get('homes', '-')
        mx = int(re.search(r'_max(\d+)', h).group(1)) if '_max' in h else None
        if arm_of[b] == 'spawn' and (mx is None or mx > (1 if w == 'w4' else 2)): ok1 = False
        print(f'  {row:24s} {b:8s} p50={p50(b, row)} homes={h}')
    c = compare(row)
    print(f"  M2 {row}: spawn/base {c[0]:.3f} -> {'PASS' if c[0] <= 1.03 else 'FAIL'}" if c else f'  {row} missing')
print(f"  M1 {'PASS' if ok1 else 'FAIL'}")
print('\n## S1 pipe')
for size in (4096, 16384, 65536):
    row = f'pipe.throughput.{size}'
    def rounds(b):
        out = []
        for i, r in enumerate(rows[b].get(row, {}).get('rounds', '').split(',')):
            if not r or i == 0: continue
            parts = r.split('~')
            home = {p[0]: int(re.match(r'._c(\d+)', p).group(1)) for p in parts[1:] if re.match(r'[RW]_c\d+', p)}
            out.append((int(parts[0]), home.get('R', -99) // 8 != home.get('W', -99) // 8))
        return out
    same = [m for b in by_arm('base') for m, split in rounds(b) if not split]
    worst = max(sum(1 for _, split in rounds(b) if split) for b in by_arm('spawn'))
    sp = st.mean(p50(b, row) for b in by_arm('spawn'))
    print(f"  {row}: most split rounds in a spawn boot {worst}; spawn p50 {sp:.0f} vs base same-LLC median {st.median(same) if same else None}"
          f" -> {'PASS' if worst <= 1 and same and sp >= 0.95 * st.median(same) else 'FAIL'}")
print('\n## S2 / S3: rows that resolve (moded rows marked "m", not judged)')
for row in sorted(set.intersection(*(set(rows[b]) for b in boots))):
    c = compare(row)
    if c and c[1]:
        s = slower(c[0], row); moded = bool(MODED.match(row))
        bound = 1.02 if row in ('work.build_shaped.j16', 'ipc.reqrep.8') else 1.03
        flag = 'm' if moded else ('!' if s > bound else ' ')
        print(f'  {flag} {row:45s} {unit(row):6s} spawn/base {c[0]:.3f} (slower x{s:.3f}) base {c[3]} spawn {c[2]}')

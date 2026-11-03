"""ab10 judge: applies ab10/decision-rule.md to <runs>/<n>-<arm>/kernel.log, arms base, head, norule, spawn.
LLCs are CPUs 0-7 and 8-15. Usage: ab10.py <runs>"""
import re, sys, os, statistics as st
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
R = sys.argv[1]
boots = sorted(os.listdir(R), key=lambda d: int(d.split('-')[0]))
arm_of = {b: b.split('-', 1)[1] for b in boots}
by_arm = lambda a: [b for b in boots if arm_of[b] == a]
llc = lambda cpu: cpu // 8
rows = {}
for b in boots:
    d = {}
    for line in open(f'{R}/{b}/kernel.log', errors='replace'):
        m = re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)', line)
        if m:
            d[m.group(1)] = dict(x.split('=', 1) for x in m.group(2).split() if '=' in x)
    rows[b] = d

def p50(b, row):
    f = rows[b].get(row)
    return int(f['p50']) if f and f.get('p50', '-') not in ('-', '') else None

def side(text):
    m = re.match(r'c([\d*+]*)_m(\d+)-(\d+)_w(\d+)-(\d+)-(\d+)', text)
    if not m: return None
    picks = [tuple(map(int, p.split('*'))) for p in m.group(1).split('+') if p]
    return dict(home=picks[0][0] if picks else None, moves=int(m.group(2)), cross=int(m.group(3)), wakes=tuple(int(m.group(i)) for i in (4, 5, 6)))

def rounds(b, size):
    f = rows[b].get(f'pipe.throughput.{size}')
    if not f or 'rounds' not in f: return []
    out = []
    for i, r in enumerate(f['rounds'].split(',')):
        parts = r.split('~'); rd = wr = None
        for p in parts[1:]:
            if p.startswith('R_'): rd = side(p[2:])
            elif p.startswith('W_'): wr = side(p[2:])
        split = None if not (rd and wr and rd['home'] is not None and wr['home'] is not None) else llc(rd['home']) != llc(wr['home'])
        out.append(dict(i=i, warm=i == 0, mbps=int(parts[0]), split=split, rd=rd, wr=wr))
    return out

def compare(a, b, row):
    va = [p50(x, row) for x in by_arm(a)]; vb = [p50(x, row) for x in by_arm(b)]
    if not va or not vb or None in va or None in vb: return None
    resolves = max(va) < min(vb) or max(vb) < min(va)
    return st.mean(va) / st.mean(vb), resolves, va, vb

print('boots:', ', '.join(boots))
unit = lambda row: rows[boots[0]].get(row, {}).get('unit', '')
lower_better = lambda row: unit(row) in ('ns', 'ps', 'ns/MiB', 'us')
def slower(ratio, row):  # >1 means slower
    return ratio if lower_better(row) else 1 / ratio

common = sorted(set.intersection(*(set(rows[b]) for b in boots)))
for a, b, bound, label in (('norule', 'base', 1.02, 'P plumbing (norule/base)'), ('head', 'norule', 1.03, 'R rule (head/norule)'),
                           ('spawn', 'base', 1.03, 'S2 spawn fix (spawn/base)'), ('head', 'base', 1.03, 'whole #1129 (head/base)')):
    print(f'\n## {label}: rows that resolve; "!" marks a slowdown over {bound - 1:.0%}')
    for row in common:
        c = compare(a, b, row)
        if c and c[1]:
            s = slower(c[0], row)
            flag = '!' if s > bound and not row.startswith('tail.') else ' '
            print(f'  {flag} {row:45s} {unit(row):6s} {a}/{b} {c[0]:.3f} (slower x{s:.3f})  {b} {c[3]} {a} {c[2]}')

print('\n## ab9 blockers, classified')
for row in ['thread.spawn_join', 'fs.disk.seek', 'mem.anon.map', 'mem.munmap_touched_remote.4k', 'wake.storm.call.w64', 'wake.storm.drain.w4']:
    p = compare('norule', 'base', row); r = compare('head', 'norule', row)
    cls = ('P' if p and p[1] and slower(p[0], row) > 1.02 else '') + ('R' if r and r[1] and slower(r[0], row) > 1.03 else '')
    print(f"  {row:35s} norule/base {p[0]:.3f}{'*' if p[1] else ' '}  head/norule {r[0]:.3f}{'*' if r[1] else ' '}  -> {cls or 'neither'}" if p and r else f'  {row} missing')

print('\n## gain and build')
for row, a, b, bound in (('ipc.reqrep.8', 'head', 'norule', 0.90), ('work.build_shaped.j16', 'head', 'base', 1.015)):
    c = compare(a, b, row)
    print(f"  {row} {a}/{b} {c[0]:.4f} -> {'PASS' if c[0] <= bound else 'FAIL'}  {b} {c[3]} {a} {c[2]}" if c else f'  {row} missing')
for row in ('work.build_shaped.j16', 'thread.spawn_join'):
    print(f'  {row} parent:')
    for x in boots:
        print(f"    {x:9s} {rows[x].get(row, {}).get('parent', '-')}")

print('\n## pipe per class, and the spawn arm S1')
for size in (4096, 16384, 65536):
    print(f'== pipe.throughput.{size}')
    for x in boots:
        rs = rounds(x, size)
        nsplit = sum(1 for r in rs if not r['warm'] and r['split'])
        print(f"  {x:9s} p50={p50(x, f'pipe.throughput.{size}')} split={nsplit}/{sum(1 for r in rs if not r['warm'])} " +
              ' '.join(f"{r['mbps']}{'X' if r['split'] else 's'}[R{r['rd']['home'] if r['rd'] else '?'} W{r['wr']['home'] if r['wr'] else '?'}]" for r in rs if not r['warm']))
    med = {}
    for a in ('base', 'head', 'norule', 'spawn'):
        for cls, want in (('split', True), ('same', False)):
            vals = [r['mbps'] for x in by_arm(a) for r in rounds(x, size) if not r['warm'] and r['split'] is want]
            med[a, cls] = (st.median(vals) if vals else None, len(vals))
    print('  medians (value, rounds): ' + '; '.join(f'{a}/{c} {v}' for (a, c), v in med.items()))
    for cls in ('split', 'same'):
        h, n = med['head', cls], med['norule', cls]
        if h[1] >= 4 and n[1] >= 4:
            print(f"  head vs norule {cls}: {h[0] / n[0]:.3f} -> {'PASS' if h[0] >= 0.95 * n[0] else 'FAIL'}")
    s1_split = max((sum(1 for r in rounds(x, size) if not r['warm'] and r['split']) for x in by_arm('spawn')), default=None)
    sp = [p50(x, f'pipe.throughput.{size}') for x in by_arm('spawn')]
    same = med['base', 'same'][0]
    print(f"  S1: most split rounds in a spawn boot {s1_split}; spawn p50 mean {st.mean(sp) if sp and None not in sp else None} vs base same-LLC median {same}"
          f" -> {'PASS' if s1_split is not None and s1_split <= 1 and same and sp and st.mean(sp) >= 0.95 * same else 'FAIL'}")

"""ab9 judge: applies ab9/decision-rule.md to the boots under <runs>, each `<n>-<arm>/kernel.log`.
The AMD bench's LLCs are CPUs 0-7 and 8-15 (as every `ran=` field of ab5-ab8 read them). Usage: ab9.py <runs>"""
import re, sys, os, statistics as st

R = sys.argv[1]
boots = sorted(os.listdir(R), key=lambda d: int(d.split('-')[0]))
arm_of = {b: b.split('-', 1)[1] for b in boots}
llc = lambda cpu: cpu // 8

rows = {}
for b in boots:
    d = {}
    for line in open(f'{R}/{b}/kernel.log', errors='replace'):
        m = re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)', line)
        if m:
            d[m.group(1)] = dict(x.split('=', 1) for x in m.group(2).split() if '=' in x)
    rows[b] = d

def side(text):
    """c10*40+2*3_m1-1_w0-5-2 -> (home cpu, picks by cpu, moves, cross, wakes none/near/far)"""
    m = re.match(r'c([\d*+]*)_m(\d+)-(\d+)_w(\d+)-(\d+)-(\d+)', text)
    if not m: return None
    picks = [tuple(map(int, p.split('*'))) for p in m.group(1).split('+') if p]
    home = picks[0][0] if picks else None
    return dict(home=home, picks=picks, moves=int(m.group(2)), cross=int(m.group(3)),
                wakes=tuple(int(m.group(i)) for i in (4, 5, 6)))

def rounds(b, size):
    f = rows[b].get(f'pipe.throughput.{size}')
    if not f or 'rounds' not in f: return []
    out = []
    for i, r in enumerate(f['rounds'].split(',')):
        parts = r.split('~')
        mbps = int(parts[0])
        rd = wr = None; others = '-'; lost = '?'
        for p in parts[1:]:
            if p.startswith('R_'): rd = side(p[2:])
            elif p.startswith('W_'): wr = side(p[2:])
            elif p.startswith('o_'): others = p[2:]
            elif p.startswith('l'): lost = p[1:]
        split = None if not (rd and wr and rd['home'] is not None and wr['home'] is not None) else llc(rd['home']) != llc(wr['home'])
        out.append(dict(i=i, warm=(i == 0), mbps=mbps, rd=rd, wr=wr, others=others, lost=lost, split=split))
    return out

def p50(b, row):
    f = rows[b].get(row)
    return int(f['p50']) if f and f.get('p50', '-') not in ('-', '') else None

arms = ['base', 'head']
by_arm = lambda a: [b for b in boots if arm_of[b] == a]
print('boots:', ', '.join(boots))

print('\n## D0 / D2: pipe rounds, per class (timed rounds only)')
d0 = {}
d2 = True
for size in (4096, 16384, 65536):
    print(f'== pipe.throughput.{size}')
    for b in boots:
        rs = rounds(b, size)
        line = ' '.join(f"{'w' if r['warm'] else ''}{r['mbps']}{'X' if r['split'] else 's' if r['split'] is not None else '?'}"
                        f"[R{r['rd']['home'] if r['rd'] else '?'}m{r['rd']['moves'] if r['rd'] else '?'}w{'/'.join(map(str, r['rd']['wakes'])) if r['rd'] else '?'}"
                        f" W{r['wr']['home'] if r['wr'] else '?'}m{r['wr']['moves'] if r['wr'] else '?'}]" for r in rs)
        print(f'  {b:8s} {line}')
    for cls, want in (('split', True), ('same', False)):
        med = {}
        for a in arms:
            vals = [r['mbps'] for b in by_arm(a) for r in rounds(b, size) if not r['warm'] and r['split'] is want]
            med[a] = (st.median(vals) if vals else None, len(vals))
        ok = None
        if med['base'][1] >= 4 and med['head'][1] >= 4:
            ok = med['head'][0] >= 0.95 * med['base'][0]
            d2 &= ok
        print(f"  {cls:5s}: base median {med['base'][0]} over {med['base'][1]}, head {med['head'][0]} over {med['head'][1]}"
              f" -> {'PASS' if ok else 'FAIL' if ok is False else 'too few to judge'}")
    if size == 16384:
        for a in arms:
            exc = [(b, r['i'], r['mbps'], r['split']) for b in by_arm(a) for r in rounds(b, size) if not r['warm'] and r['split'] is not None
                   and ((r['split'] and r['mbps'] >= 5000) or (not r['split'] and r['mbps'] <= 7000))]
            unk = sum(1 for b in by_arm(a) for r in rounds(b, size) if not r['warm'] and r['split'] is None)
            d0[a] = exc
            print(f'  D0 {a}: exceptions {exc}, unclassified {unk}')
d0_ok = all(len(v) <= 1 for v in d0.values())
print(f"D0 {'CONFIRMED (exceptions to be explained by their records)' if d0_ok else 'NOT CONFIRMED'}")
print(f"D2 {'PASS' if d2 else 'FAIL'}")

def ratio(row):
    m = {a: [p50(b, row) for b in by_arm(a) if p50(b, row) is not None] for a in arms}
    if not m['base'] or not m['head']: return None, m
    return st.mean(m['head']) / st.mean(m['base']), m

print('\n## D1 work.build_shaped.j16')
r, m = ratio('work.build_shaped.j16')
print(f'  p50s {m}; head/base {r:.4f}' if r else f'  missing {m}')
print('  ' + ('PASS' if r and r <= 1.015 else 'FAIL' if r and r > 1.03 else 'UNRESOLVED'))
for b in boots:
    f = rows[b].get('work.build_shaped.j16', {})
    print(f"  {b:8s} parent={f.get('parent', '-')}")

print('\n## D3 ipc.reqrep.8')
r, m = ratio('ipc.reqrep.8')
print(f'  p50s {m}; head/base {r:.4f} ->', 'PASS' if r <= 0.90 else 'FAIL') if r else print(f'  missing {m}')

print('\n## D4 thread.spawn_join')
r, m = ratio('thread.spawn_join')
lo = lambda a: (min(m[a]), max(m[a]))
print(f'  p50s {m}; head/base {r:.4f}; ranges base {lo("base")} head {lo("head")}') if r else print(f'  missing {m}')
for b in boots:
    print(f"  {b:8s} parent={rows[b].get('thread.spawn_join', {}).get('parent', '-')}")

print('\n## D5 rows whose boot ranges do not overlap')
common = set.intersection(*(set(rows[b]) for b in boots))
for row in sorted(common):
    m = {a: [p50(b, row) for b in by_arm(a)] for a in arms}
    if any(v is None for a in arms for v in m[a]) or any(not m[a] for a in arms): continue
    if max(m['base']) < min(m['head']) or max(m['head']) < min(m['base']):
        unit = rows[boots[0]][row].get('unit', '')
        print(f"  {row:45s} {unit:6s} head/base {st.mean(m['head']) / st.mean(m['base']):.3f}  base {m['base']} head {m['head']}")

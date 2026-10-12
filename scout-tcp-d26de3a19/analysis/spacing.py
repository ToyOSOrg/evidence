"""The SYN round trip against what the uplink carried before the SYN, both OSes.

usage: python3 -I spacing.py <judge-1.log> <ubuntu dir>
"""
import re, sys, glob, statistics as st

judge, udir = sys.argv[1], sys.argv[2]

def words(s):
    return dict(w.split('=', 1) for w in s.split() if '=' in w)

print('Ubuntu: per fetch, SYN RTT (U4) against the gap since the previous download ended')
groups = {}
for f in sorted(glob.glob(udir + '/ubuntu-setup-[0-9]-*.txt')):
    prev_done = None
    for line in open(f):
        m = re.search(r'https_download: setup (.*)$', line)
        if not m:
            continue
        w = words(m.group(1))
        j = [int(w[f'j{k}']) for k in range(6)]
        u1 = (j[2] - j[1]) / 1e6
        u4 = int(w['tcpi_rtt_us']) / 1e3
        miss = u1 > 2.0
        gap = None if prev_done is None else (j[3] - prev_done) / 1e6
        kind = ('first' if prev_done is None else 'back-to-back') + (' +dns-miss' if miss else '')
        groups.setdefault(kind, []).append(u4)
        if not miss:
            groups.setdefault('no dns-miss, ' + ('first' if prev_done is None else 'back-to-back') + ', asked=' + w['asked'], []).append(u4)
        gs = 'after the idle window' if gap is None else f'{gap:.3f} ms'
        print(f"  {f.split('/')[-1]} run={w['run']} asked={w['asked']} U1={u1:.3f} U4={u4:.3f} syn after previous download: {gs} [{kind}]")
        prev_done = int(w['done'])
for k, v in sorted(groups.items()):
    print(f"  {k:<44} n={len(v)} min={min(v):.3f} med={st.median(v):.3f} max={max(v):.3f}")
first = groups['first'] + groups.get('first +dns-miss', [])
print(f"  first of each process (any DNS)              n={len(first)} med={st.median(first):.3f}")

print('\nToyOS: per fetch, syn_wire against the gap since the previous upstream frames')
stamps = []
setups = []
lan = []
for line in open(judge):
    m = re.search(r'\[stamp\] (\w+) (.*)$', line)
    if m:
        stamps.append((m.group(1), words(m.group(2))))
    m = re.search(r'\[download\] setup (.*)$', line)
    if m:
        setups.append(words(m.group(1)))
prev_done = None
for s in setups:
    j = [int(s[f'j{k}']) for k in range(6)]
    c = next(w for k, w in stamps if k == 'connect' and j[3] <= int(w['n1']) <= j[4])
    l = next(w for k, w in stamps if k == 'lookup' and j[1] <= int(w['n1']) <= j[2])
    sw = (int(c['n4']) - int(c['n3'])) / 1e6
    q = (int(c['n3']) - int(l['n3'])) / 1e6
    gap = None if prev_done is None else (int(c['n3']) - prev_done) / 1e6
    gs = 'after the LAN control' if gap is None else f'{gap:.3f} ms'
    print(f"  run={s['run']} syn_wire={sw:.3f} syn after its own DNS query: {q:.3f} ms; after previous download: {gs}")
    prev_done = int(s['done'])

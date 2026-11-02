import sys, re, os, itertools, statistics
root = sys.argv[1]
better = {}
runs = {'base': [], 'head': []}
for d in sorted(os.listdir(root)):
    arm = d.split('-')[1]
    vals = {}
    for line in open(os.path.join(root, d, 'kernel.log'), errors='replace'):
        m = re.search(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?p50=([0-9.]+)', line)
        if m:
            vals[m.group(1)] = (float(m.group(3)), m.group(2))
    runs[arm].append(vals)
def mw_p(a, b):
    # exact two-sided Mann-Whitney via permutation of ranks
    allv = a + b; n = len(a)
    def U(x, y): return sum((xi > yi) + 0.5 * (xi == yi) for xi in x for yi in y)
    u = U(a, b); mean = n * len(b) / 2
    cnt = tot = 0
    for idx in itertools.combinations(range(len(allv)), n):
        x = [allv[i] for i in idx]; y = [allv[i] for i in range(len(allv)) if i not in idx]
        tot += 1
        if abs(U(x, y) - mean) >= abs(u - mean) - 1e-9: cnt += 1
    return cnt / tot
higher_better = {'MB/s', 'ops/s', 'MHz', 'GB/s', 'Mbps', '/s'}
benches = sorted(set().union(*[r.keys() for r in runs['base'] + runs['head']]))
prefixes = tuple(sys.argv[2].split(',')) if len(sys.argv) > 2 else ()
for b in benches:
    a = [r[b][0] for r in runs['base'] if b in r]; h = [r[b][0] for r in runs['head'] if b in r]
    if len(a) < 4 or len(h) < 4: continue
    unit = runs['base'][0].get(b, (0, '?'))[1]
    ma, mh = statistics.median(a), statistics.median(h)
    p = mw_p(a, h)
    d = (mh - ma) / ma * 100 if ma else 0
    hb = unit in higher_better or unit.endswith('/s')
    worse = (d < 0) if hb else (d > 0)
    flag = ''
    if p < 0.05: flag = 'RESOLVED ' + ('WORSE' if worse else 'better')
    if prefixes and not b.startswith(prefixes) and not flag: continue
    print(f"{b:55s} {unit:6s} base {ma:12.3f} head {mh:12.3f} {d:+7.1f}% p={p:.3f} {flag}")

# Independent recomputation of each row from the printed samples, by stage 3's text.
import sys, math
def q(v, num, den):
    v = sorted(v); r = math.ceil(num * len(v) / den); return v[max(r, 1) - 1]
rows, mism = {}, 0
for line in open(sys.argv[1]):
    if 'parity: ' not in line: continue
    w = line.split('parity: ', 1)[1].split()
    build, kind = w[0], w[1]
    if kind == 'samples':
        d = dict(x.split('=') for x in w[3:]); s = {k: [float(t) for t in v.split(',')] for k, v in d.items()}
        assert all(len(s[k]) == 21 for k in s), w[2]
        spread = q([abs(a / b - 1) for a, b in zip(s['a'], s['b'])], 9, 10)
        ratio = q([o / ((a + b) / 2) for o, a, b in zip(s['ours'], s['a'], s['b'])], 1, 2)
        v = 'excluded' if w[2].startswith('ml-kem') else 'remeasure' if spread > 0.05 else 'pass' if ratio <= 1 + spread else 'fail'
        rows[(build, w[2])] = (spread, ratio, v)
    elif kind == 'row':
        d = dict(x.split('=') for x in w[3:]); sp, ra, v = rows[(build, w[2])]
        if v != d['verdict'] or abs(sp - float(d['spread'])) > 5e-5 or abs(ra - float(d['ratio'])) > 5e-4:
            mism += 1; print('MISMATCH', build, w[2], d, (sp, ra, v))
from collections import Counter
for b in ('asserted', 'unasserted'):
    print(b, dict(Counter(v for (bb, _), (_, _, v) in rows.items() if bb == b)))
print('rows', len(rows), 'mismatches', mism)

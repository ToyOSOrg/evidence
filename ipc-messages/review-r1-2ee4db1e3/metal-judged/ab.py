import re, sys, os
root = sys.argv[1]
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) n=\d+ .*?p50=(-?\d+) .*?p99=(-?\d+)')
def load(path):
    out = {}
    for line in open(path, errors='replace'):
        m = pat.search(line)
        if m: out[m.group(1)] = (m.group(2), int(m.group(3)), int(m.group(4)))
    return out
keep = re.compile(r'^(ipc\.|pingpong\.|fs\..*direct|futex)')
for bench in ('t14', 'amd'):
    d = os.path.join(root, bench)
    arms = {}
    for r in sorted(os.listdir(d)):
        m = re.match(r'(base|h1|h2)-\d+$', r)
        if m: arms.setdefault(m.group(1), []).append(load(os.path.join(d, r, 'kernel.log')))
    names = sorted(n for n in set().union(*[set(x) for v in arms.values() for x in v]) if keep.match(n))
    print(f'## {bench}: boots ' + ', '.join(f'{k}={len(v)} ({",".join(str(len(x)) for x in v)} rows)' for k, v in arms.items()))
    print(f'{"bench":46} {"base p50":>14} {"h1 p50":>14} {"h2 p50":>14} {"h1/b%":>7} {"h2/h1%":>7}')
    mean = lambda xs: sum(xs)/len(xs) if xs else None
    for n in names:
        v = {k: [x[n][1] for x in arms.get(k, []) if n in x] for k in ('base', 'h1', 'h2')}
        b, h1, h2 = (mean(v[k]) for k in ('base', 'h1', 'h2'))
        pct = lambda a, c: f'{100*(a-c)/c:+.1f}' if a and c else '-'
        f = lambda xs: ','.join(map(str, xs)) or '-'
        print(f'{n:46} {f(v["base"]):>14} {f(v["h1"]):>14} {f(v["h2"]):>14} {pct(h1,b):>7} {pct(h2,h1):>7}')
    print()

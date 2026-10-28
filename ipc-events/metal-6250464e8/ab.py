import re, sys, os
root = sys.argv[1]
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) n=\d+ .*?p50=(-?\d+) .*?p99=(-?\d+)')
def load(path):
    out = {}
    for line in open(path, errors='replace'):
        m = pat.search(line)
        if m:
            out[m.group(1)] = (m.group(2), int(m.group(3)), int(m.group(4)))
    return out
for bench in ('t14', 'amd'):
    runs = {r: load(os.path.join(root, bench, r, 'kernel.log')) for r in ('base1', 'base2', 'head1', 'head2')}
    names = sorted(set(runs['head1']) | set(runs['base1']))
    print(f'## {bench}: rows base1={len(runs["base1"])} base2={len(runs["base2"])} head1={len(runs["head1"])} head2={len(runs["head2"])}')
    print(f'{"bench":44} {"unit":6} {"base p50 (1,2)":>20} {"head p50 (1,2)":>20} {"d%":>7} {"base p99 (1,2)":>20} {"head p99 (1,2)":>20}')
    for n in names:
        vals = [runs[r].get(n) for r in ('base1', 'base2', 'head1', 'head2')]
        if None in vals[2:] and None in vals[:2]:
            continue
        unit = next(v[0] for v in vals if v)
        b50 = [v[1] for v in vals[:2] if v]; h50 = [v[1] for v in vals[2:] if v]
        b99 = [v[2] for v in vals[:2] if v]; h99 = [v[2] for v in vals[2:] if v]
        d = ''
        if b50 and h50 and sum(b50):
            d = f'{100*(sum(h50)/len(h50)-sum(b50)/len(b50))/(sum(b50)/len(b50)):+.1f}'
        fmt = lambda xs: ','.join(str(x) for x in xs) or '-'
        print(f'{n:44} {unit:6} {fmt(b50):>20} {fmt(h50):>20} {d:>7} {fmt(b99):>20} {fmt(h99):>20}')
    print()

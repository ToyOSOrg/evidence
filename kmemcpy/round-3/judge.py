import re, sys, collections
D = sys.argv[1]
def rows(b, r):
    out = {}
    for line in open(f'{D}/{b}/{r}/kernel.log', errors='replace'):
        m = re.search(r'bench=(\S+) unit=(\S+) .*?p50=(\d+)', line)
        if m: out[m.group(1)] = float(m.group(3))
    return out
T = {}
for b in ['t14', 'amd']:
    R = {r: rows(b, r) for r in ['1-base', '2-head', '3-head', '4-base']}
    names = [n for n in R['2-head'] if all(n in R[r] for r in R)]
    T[b] = {n: ((R['1-base'][n] + R['4-base'][n]) / 2, (R['2-head'][n] + R['3-head'][n]) / 2, [R[r][n] for r in R]) for n in names}
    print(b, len(names), 'rows in all four;', {r: len(R[r]) for r in R})
import json; json.dump({b: {n: v for n, v in T[b].items()} for b in T}, open(f'{D}/../table.json', 'w'))

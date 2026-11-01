import re, sys, os
root = sys.argv[1]
pat = re.compile(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) n=\d+ .*?p50=(-?\d+) .*?p99=(-?\d+)')
def load(path):
    out = {}
    for line in open(path, errors='replace'):
        m = pat.search(line)
        if m: out[m.group(1)] = int(m.group(3))
    return out
gate = re.compile(r'^(ipc\.reqrep\.(8|4096|65536)|ipc\.reqrep_handle\.8|fs\..*\.direct\..*)$')
keep = re.compile(r'^(ipc\.|pingpong\.|fs\.|futex|spawn|thread|mem|sched|wake)')
fails = []
for bench in ('t14', 'amd'):
    d = os.path.join(root, bench)
    arms = {}
    for r in sorted(os.listdir(d)):
        m = re.match(r'(base|head)-\d+$', r)
        if m: arms.setdefault(m.group(1), []).append((r, load(os.path.join(d, r, 'kernel.log'))))
    names = sorted(set().union(*[set(x) for v in arms.values() for _, x in v]))
    print(f'## {bench}: ' + ', '.join(f'{k}: ' + ','.join(f'{r}({len(x)} rows)' for r, x in v) for k, v in arms.items()))
    print(f'{"bench":46} {"base p50s":>16} {"head p50s":>16} {"ref":>9} {"head/ref%":>9} {"gate":>5} verdict')
    for n in names:
        b = [x[n] for _, x in arms['base'] if n in x]
        h = [x[n] for _, x in arms['head'] if n in x]
        if not b or not h:
            print(f'{n:46} missing base={b} head={h}'); 
            if gate.match(n): fails.append((bench, n, 'missing'))
            continue
        hm = sum(h) / len(h)
        bimodal = len(b) == 2 and max(b) > 1.25 * min(b)
        ref = min(b, key=lambda x: abs(x - hm)) if bimodal else sum(b) / len(b)
        pct = 100 * (hm - ref) / ref if ref else 0
        ok = hm <= ref * 1.05
        g = 'yes' if gate.match(n) else ''
        v = 'parity' if ok else 'WORSE>5%'
        if bimodal: v += ' (bimodal base, nearer)'
        if not ok: fails.append((bench, n, f'{pct:+.1f}%'))
        print(f'{n:46} {",".join(map(str,b)):>16} {",".join(map(str,h)):>16} {ref:>9.0f} {pct:>+9.1f} {g:>5} {v}')
    print()
print('rows worse than 5% (gate rows marked):')
for bench, n, p in fails: print(f'  {bench} {n} {p} {"GATE" if gate.match(n) else ""}')

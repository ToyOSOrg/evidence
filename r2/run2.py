"""Judge round-2 readbacks: python3 -I run2.py <run2 dir>"""
import sys, os, re, glob
sys.path.insert(0, os.path.dirname(__file__))
from osb import load

def notes(path):
    out = {}
    for line in open(path, errors='replace'):
        m = re.search(r'osbench v=2 os=toyos note=(\S+) (.*)', line)
        if m:
            kv = dict(x.split('=', 1) for x in m.group(2).split() if '=' in x)
            out.setdefault(m.group(1), []).append(kv)
    return out

root = sys.argv[1]
runs = {}
for d in sorted(glob.glob(root + '/*-*-*')):
    log = d + '/benchcase/kernel.log' if os.path.exists(d + '/benchcase/kernel.log') else d + '/kernel.log'
    if os.path.exists(log):
        runs[os.path.basename(d)] = log
for bench_machine in ('t14', 'amd'):
    names = [n for n in runs if n.startswith(bench_machine) and not n.endswith('B2t')]
    if not names: continue
    data = {n: load(runs[n]) for n in names}
    print(f'===== {bench_machine}: ' + ' '.join(names))
    keys = sorted(set().union(*[set(d) for d in data.values()]))
    print(f"{'group':7} {'bench':40} " + ' '.join(f'{n.split("-",2)[2]:>9}' for n in names))
    for k in keys:
        if not any(g in k[0] for g in ('sched', 'time', 'ipc', 'tail', 'crunch', 'mem', 'work')) and k[1] != 'cpu.clock':
            continue
        vals = [data[n].get(k, (None, {}))[1].get('p50' if k[1] != 'cpu.clock' else 'max', '-') for n in names]
        print(f'{k[0]:7} {k[1][:40]:40} ' + ' '.join(f'{v:>9}' for v in vals))
    for n in names:
        nt = notes(runs[n])
        for bench in [b for b in nt if b.endswith('.placement') and ('crunch.single' in b or 'malloc_churn' in b)]:
            row = bench[:-len('.placement')]
            cpus = nt.get(row + '.cpus', [])
            print(f'  {n} {row} placed={nt[bench][0]}')
            for c in cpus:
                if int(c.get('busy_permille', '0') if c.get('busy_permille', '-') != '-' else 0) > 50 or c.get('apic') in nt[bench][0].get('apic', ''):
                    print('     ', ' '.join(f'{k}={v}' for k, v in c.items()))

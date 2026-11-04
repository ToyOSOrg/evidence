import re,sys
N='<scratch>/orch/nightly/evidence/2026-10-31-2316'
R='<scratch>/agents/storage4/metal-final/osbench/runs'
for bench in ['t14','amd']:
    base={}
    for l in open(f'{N}/{bench}/compare.md'):
        c=[x.strip() for x in l.split('|')]
        if len(c)>8 and c[1].startswith('fs.disk.'):
            base[c[1]]=(c[2],c[4],c[7])
    ours={}
    for l in open(f'{R}/{bench}/kernel.log'):
        m=re.search(r'bench=(fs\.disk\.\S+) unit=(\S+) .*? p50=(\d+)',l)
        if m: ours[m.group(1)]=(m.group(2),int(m.group(3)))
    print(f'\n### {bench.upper()}\n')
    print('| row | unit | Linux | main (dc1a8642e) | #1152 (94fdd7faa) | #1152/main | #1152/Linux |')
    print('|---|---|---|---|---|---|---|')
    for row in sorted(set(base)|set(ours)):
        unit,lin,main=base.get(row,('','',''))
        u,v=ours.get(row,(unit,None))
        def f(x):
            try: return float(x)
            except: return None
        L,Mn=f(lin),f(main)
        higher_better = (u=='MB/s')
        def ratio(a,b):
            if a is None or b in (None,0): return '-'
            r = a/b
            return f'{r:.2f}'
        print(f'| {row} | {u} | {lin or "-"} | {main or "-"} | {v if v is not None else "-"} | {ratio(v,Mn)} | {ratio(v,L)} |')

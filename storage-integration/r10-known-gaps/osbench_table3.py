import re
N='$ORCH/nightly/evidence/2026-10-31-2316'
R1='$SCRATCH/metal-final/osbench/runs'
R8='$SCRATCH/metal-r9/runs'
def ours(path):
    o={}
    for l in open(path, errors='replace'):
        m=re.search(r'bench=(fs\.disk\.\S+) unit=(\S+) .*? p50=(\d+)',l)
        if m: o[m.group(1)]=(m.group(2),int(m.group(3)))
    return o
def f(x):
    try: return float(x)
    except: return None
for bench in ['t14','amd']:
    base={}
    for l in open(f'{N}/{bench}/compare.md'):
        c=[x.strip() for x in l.split('|')]
        if len(c)>8 and c[1].startswith('fs.disk.'):
            base[c[1]]=(c[2],c[4],c[7])
    r1=ours(f'{R1}/{bench}/kernel.log'); r8=ours(f'{R8}/{bench}/osbench/kernel.log')
    print(f'\n### {bench.upper()}\n')
    print('| row | unit | Linux | main (dc1a8642e) | #1152 r1 (94fdd7faa) | #1152 (a1f07627e) | /main | /Linux |')
    print('|---|---|---|---|---|---|---|---|')
    for row in sorted(set(base)|set(r8)):
        unit,lin,main=base.get(row,('','',''))
        u,v=r8.get(row,(unit,None)); _,a=r1.get(row,(unit,None))
        L,Mn=f(lin),f(main)
        ratio=lambda x,y: '-' if x is None or y in (None,0) else f'{x/y:.2f}'
        print(f'| {row} | {u} | {lin or "-"} | {main or "-"} | {a if a is not None else "-"} | {v if v is not None else "-"} | {ratio(v,Mn)} | {ratio(v,L)} |')

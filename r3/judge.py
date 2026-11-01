import re,sys,statistics as st
S,LD,b=sys.argv[1],sys.argv[2],sys.argv[3]
def rows(path,os_='toyos'):
    out={}
    for line in open(path,errors='replace'):
        m=re.search(r'os='+os_+r' bench=(\S+) unit=(\S+) n=\d+ min=(\d+) p50=(\d+).*? max=(\d+)',line)
        if m: out[m.group(1)]=(m.group(2),int(m.group(4)),int(m.group(5)))
    return out
def series(path,os_):
    for line in open(path,errors='replace'):
        if 'os='+os_ in line and 'note=energy.idle.series' in line:
            v=sorted(int(x) for x in line.split('mw=')[1].split()[0].split(','))
            p25=v[len(v)//4]; return p25,sum(1 for x in v if x>=p25+4000),sum(1 for x in v if x>=10000)
def med(x): return st.median(x)
print(f'# {b}\n\n## §1 idle and §1b excursions\n')
print('| run | idle p50 | mean | p25 | excursions (>= p25+4 W) | >= 10 W |')
print('|---|---|---|---|---|---|')
idle={'A':[],'B':[],'L':[]}; exc={'A':[],'B':[],'L':[]}
for arm in 'AB':
    for k in (1,2,3):
        f=f'{S}/{b}-{arm}-{k}/energybenchcase/kernel.log'
        r=rows(f); p25,e,z=series(f,'toyos'); x=r['energy.idle.package'][1]
        mean=re.search(r'bench=energy.idle.package .*mean=(\d+)',open(f,errors='replace').read()).group(1)
        idle[arm].append(x); exc[arm].append(e); print(f'| {arm}{k} | {x} | {mean} | {p25} | {e} | {z} |')
for k in (1,2,3):
    f=f'{LD}/energy-{k}.txt'
    got=series(f,'linux')
    if got is None:
        print(f'| Linux{k} | void (no output) | | | | |'); continue
    r=rows(f,'linux'); p25,e,z=got; x=r['energy.idle.package'][1]
    mean=re.search(r'bench=energy.idle.package .*mean=(\d+)',open(f).read()).group(1)
    idle['L'].append(x); exc['L'].append(e); print(f'| Linux{k} | {x} | {mean} | {p25} | {e} | {z} |')
A,B=idle['A'],idle['B']
print(f'\nmedian idle A {med(A)} B {med(B)} Linux {med(idle["L"])}; B-A {med(B)-med(A)}; B resolves higher: {min(B)>max(A)}; B resolves lower: {max(B)<min(A)}')
print(f'median excursions A {med(exc["A"])} B {med(exc["B"])} Linux {med(exc["L"])}')
print('\n## §2 latency (Linux parity)\n')
n='persist.write_4k_fsync_after_idle'; w='persist.write_4k_fsync'
DA=[rows(f'{S}/{b}-A-{k}/diskbenchcase/kernel.log') for k in (1,2)]
DB=[rows(f'{S}/{b}-B-{k}/diskbenchcase/kernel.log') for k in (1,2)]
LP=[r for r in (rows(f'{LD}/persist-{k}.txt','linux') for k in (1,2)) if 'persist.write_4k_fsync_after_idle' in r]
print(f'Linux persist runs with output: {len(LP)} of 2')
a=[r[n][1] for r in DA]; bb=[r[n][1] for r in DB]
lc=[r[n][1]-r[w][1] for r in LP]; lmax=max(r[n][2] for r in LP); bmax=max(r[n][2] for r in DB)
cost=med(bb)-med(a)
print(f'after_idle p50 A {a} B {bb}; B b2b write {[r[w][1] for r in DB]}; A b2b {[r[w][1] for r in DA]}')
print(f'Linux after_idle {[r[n][1] for r in LP]} b2b {[r[w][1] for r in LP]} -> cost {lc}')
print(f'cost B-A {cost/1e6:.2f} ms vs Linux median cost {med(lc)/1e6:.2f} ms: {"PASS" if cost<=med(lc) else "FAIL"}')
print(f'worst B {bmax/1e6:.2f} ms vs Linux worst {lmax/1e6:.2f} ms: {"PASS" if bmax<=lmax else "FAIL"}')
print('\n## §3 back-to-back\n')
reg=[]
for name in sorted(DA[0]):
    if not re.match(r'(fs\.disk\.|nvme\.|persist\.)',name) or name==n: continue
    if not all(name in r for r in DA+DB): continue
    unit=DA[0][name][0]; x=[r[name][1] for r in DA]; y=[r[name][1] for r in DB]
    hi=unit!='MB/s'; d=(med(y)-med(x))/med(x)*100; worse=d if hi else -d
    res=(min(y)>max(x)) if hi else (max(y)<min(x))
    if res and worse>5: reg.append((name,x,y,d))
    print(f'| {name} | {unit} | {x} | {y} | {d:+.1f}% | {"B worse" if res else ""} |')
print(f'\nregressions: {reg if reg else "none"}')

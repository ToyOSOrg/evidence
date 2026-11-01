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
            p25=v[len(v)//4]; return p25,sum(1 for x in v if x>=p25+4000)
med=st.median
n='persist.write_4k_fsync_after_idle'; w='persist.write_4k_fsync'
DA=[rows(f'{S}/{b}-A-{k}/diskbenchcase/kernel.log') for k in (1,2,3)]
DB=[rows(f'{S}/{b}-B-{k}/diskbenchcase/kernel.log') for k in (1,2,3)]
LP=[r for r in (rows(f'{LD}/persist-{k}.txt','linux') for k in (1,2,3)) if n in r]
print(f'# {b} (Linux persist runs: {len(LP)} of 3)\n')
cb=[r[n][1]-r[w][1] for r in DB]; ca=[r[n][1]-r[w][1] for r in DA]; cl=[r[n][1]-r[w][1] for r in LP]
ms=lambda v:[round(x/1e6,2) for x in v]
print(f'B after_idle {ms([r[n][1] for r in DB])} b2b {ms([r[w][1] for r in DB])} -> cost {ms(cb)}')
print(f'A after_idle {ms([r[n][1] for r in DA])} b2b {ms([r[w][1] for r in DA])} -> cost {ms(ca)}')
print(f'Linux after_idle {ms([r[n][1] for r in LP])} b2b {ms([r[w][1] for r in LP])} -> cost {ms(cl)}')
g1=med(cb)<=med(cl); print(f'G1 cost_B {med(cb)/1e6:.2f} ms vs cost_L {med(cl)/1e6:.2f} ms: {"PASS" if g1 else "FAIL"}   (B-A after_idle p50: {(med([r[n][1] for r in DB])-med([r[n][1] for r in DA]))/1e6:.2f} ms)')
bmax=max(r[n][2] for r in DB); lmax=max(r[n][2] for r in LP); g2=bmax<=lmax
print(f'G2 worst B {bmax/1e6:.2f} ms vs Linux worst {lmax/1e6:.2f} ms: {"PASS" if g2 else "FAIL"}')
reg=[]; worse=[]
for name in sorted(DA[0]):
    if not re.match(r'(fs\.disk\.|nvme\.|persist\.)',name) or name==n or not all(name in r for r in DA+DB): continue
    unit=DA[0][name][0]; x=[r[name][1] for r in DA]; y=[r[name][1] for r in DB]
    hi=unit!='MB/s'; d=(med(y)-med(x))/med(x)*100; wd=d if hi else -d
    res=(min(y)>max(x)) if hi else (max(y)<min(x))
    if res: worse.append(f'{name} {d:+.1f}%')
    if res and wd>5: reg.append(f'{name} {d:+.1f}%')
print(f'G3 regressions: {reg or "none"}; resolved worse within 5%: {worse or "none"}')
print(f'VERDICT {b}: {"PASS" if g1 and g2 and not reg else "FAIL"}\n')
print('Reported: idle package p50 and excursions')
for arm in 'AB':
    for k in (1,2):
        f=f'{S}/{b}-{arm}-{k}/energybenchcase/kernel.log'; r=rows(f); print(f'  {arm}{k} idle p50 {r["energy.idle.package"][1]} excursions {series(f,"toyos")[1]}')
for k in (1,2):
    f=f'{LD}/energy-{k}.txt'; s=series(f,'linux')
    if s: print(f'  Linux{k} idle p50 {rows(f,"linux")["energy.idle.package"][1]} excursions {s[1]}')

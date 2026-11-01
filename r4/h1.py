import re,sys,statistics as st
f=sys.argv[1]
txt=open(f,errors='replace').read().splitlines()
series=None; secs=[]; ev=[]
for l in txt:
    if 'note=energy.idle.series' in l: series=[int(x) for x in l.split('mw=')[1].split()[0].split(',')]
    if 'note=energy.idle.second' in l:
        d=dict(re.findall(r'(\w+)=(\S*)',l.split('note=energy.idle.second')[1])); secs.append(d)
    if 'nvme probe:' in l and 'state at each' not in l:
        for e in l.split('nvme probe: ')[1].split(';'):
            m=re.match(r'\s*(\d+)\.(\d+) (\w+) (idle (\d+) ms|busy) (\S+) (\d+) us',e)
            if m: ev.append((int(m.group(1))*10**9+int(m.group(2))*10**6, m.group(3), m.group(5), m.group(6), int(m.group(7))))
assert series and len(series)==len(secs),(len(series or []),len(secs))
v=sorted(series); p25=v[len(v)//4]; exc=[x>=p25+4000 for x in series]
print(f'{f.split("/stage/")[1]}: n={len(series)} p25={p25} excursions={sum(exc)} lost={sum(int(s["lost"]) for s in secs)}')
cands={}
def add(name,i,val): cands.setdefault(name,[False]*len(series))[i]=val
tasks=set()
for s in secs:
    for w in filter(None,s['wakes'].split(',')): tasks.add(w.split('@')[0])
ncpu=len(secs[0]['c0_permille'].split('/'))
c0=[[int(x) if x!='-' else 0 for x in s['c0_permille'].split('/')] for s in secs]
fires=[sum(int(x) for x in s['fires'].split('/')) for s in secs]; idles=[sum(int(x) for x in s['idles'].split('/')) for s in secs]
for i,s in enumerate(secs):
    ws=[w.split('@')[0] for w in filter(None,s['wakes'].split(','))]
    for t in tasks: add('wake '+t,i,t in ws)
    for c in range(ncpu): add(f'c0 cpu{c}>med+20',i,c0[i][c]>st.median(r[c] for r in c0)+20)
    add('fires>med',i,fires[i]>st.median(fires)); add('idles>med',i,idles[i]>st.median(idles))
    end=int(s['end_ns']); add('nvme event',i,any(end-10**9<e[0]<=end for e in ev)); add('nvme ps3/4 arrival',i,any(end-10**9<e[0]<=end and e[3] in('ps3','ps4') for e in ev))
    add('pc2<980',i,int(s['pc2'])<980 if s['pc2']!='-' else False)
E_=[i for i in range(len(series)) if exc[i]]; O=[i for i in range(len(series)) if not exc[i]]
print('| candidate | in excursion s | in other s | coincides |')
for k,vals in sorted(cands.items()):
    a=sum(vals[i] for i in E_)/max(1,len(E_)); b=sum(vals[i] for i in O)/max(1,len(O))
    print(f'| {k} | {a:.0%} | {b:.0%} | {"YES" if a>=0.8 and b<=0.3 else ""} |')
print('excursion seconds:', [ (i+1, series[i]) for i in E_])

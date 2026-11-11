import re,collections,sys
logs=sys.argv[1:]
rows=collections.OrderedDict(); cols=[]
for path in logs:
    b=path.split('/')[1]
    for line in open(path,errors='replace'):
        m=re.search(r'stages ([\w.]+): \[(.*?)\] p50=(-?\d+) min=(-?\d+) max=(-?\d+) n=(\d+)',line)
        if m:
            t,l,p,mn,mx,n=m.groups()
            if (b,t) not in cols: cols.append((b,t))
            rows.setdefault(l,{})[(b,t)]=(int(p),int(mn))
hot=[c for c in cols if not c[1].endswith('after_idle')]
for name,cs in (('hot (back to back)',hot),('after 2 ms idle',[c for c in cols if c not in hot])):
    print('#',name,'ns p50/min')
    print('%-58s'%'stage'+''.join('%19s'%(b+'.'+t.replace('.after_idle','')) for b,t in cs))
    for l,d in rows.items():
        print('%-58s'%l[:58]+''.join('%19s'%('%d/%d'%d[c] if c in d else '-') for c in cs))
    print()
for path in logs:
    b=path.split('/')[1]
    for line in open(path,errors='replace'):
        if re.search(r'stages [\w.]+: (reps|child faults|placement|address space|reap|absent|the diary)|image \w+: |build j\d+|bench=(proc|thread)|spawn_stages:',line):
            print(b, re.sub(r'^\[[^\]]*\] ','',line.strip())[:900])

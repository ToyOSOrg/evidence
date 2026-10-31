import re,sys,glob,itertools,collections
A=sys.argv[1]; bench=sys.argv[2]; pat=re.compile(sys.argv[3]) if len(sys.argv)>3 else None
def rows(side):
    out=[]
    for k in range(1,5):
        d={}
        for img in ['benchcase','testcases']:
            for l in open(f"{A}/{side}-{bench}/{img}-boot{k}/kernel.log",errors='replace'):
                m=re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)',l)
                if m:
                    f=dict(x.split('=',1) for x in m.group(2).split() if '=' in x)
                    d[m.group(1)]=f
                m=re.search(r'spawn_cost: (\S+) min (\d+)\S* .*?(p50|median)[ =](\d+)',l)
                m2=re.search(r'(spawn_cost: .*)',l)
                if m2: d.setdefault('_spawn_cost',{})['line']=m2.group(1)
        out.append(d)
    return out
def mw(a,b):
    # exact two-sided Mann-Whitney U
    n=len(a); allv=a+b
    def U(x,y): return sum((xi>yi)+0.5*(xi==yi) for xi in x for yi in y)
    u=U(a,b); obs=abs(u-n*len(b)/2)
    cnt=0;tot=0
    for c in itertools.combinations(range(len(allv)),n):
        x=[allv[i] for i in c]; y=[allv[i] for i in range(len(allv)) if i not in c]
        tot+=1; cnt+= abs(U(x,y)-n*len(y)/2)>=obs-1e-9
    return cnt/tot
B=rows('base'); H=rows('head')
names=sorted(set().union(*[d.keys() for d in B+H]))
for name in names:
    if pat and not pat.search(name): continue
    def vals(S,key='p50'):
        v=[]
        for d in S:
            f=d.get(name,{})
            if key in f:
                try: v.append(float(f[key]))
                except: pass
        return v
    if name=='_spawn_cost':
        for S,s in [(B,'base'),(H,'head')]:
            for d in S: print(s, d.get(name,{}).get('line'))
        continue
    b=vals(B); h=vals(H)
    ref=lambda S: sum(1 for d in S if 'refused' in d.get(name,{}))
    extra=''
    for key in ['placed_held','ran_on_busy']:
        if any(key in d.get(name,{}) for d in B+H):
            extra+=f" {key} base={[d.get(name,{}).get(key) for d in B]} head={[d.get(name,{}).get(key) for d in H]}"
    if b and h and len(b)==4 and len(h)==4:
        p=mw(b,h); med=lambda v: sorted(v)[len(v)//2-1]/2+sorted(v)[len(v)//2]/2
        unit=next((d[name].get('unit') for d in B if name in d),'')
        print(f"{name:45s} {unit:4s} base={[round(x) for x in sorted(b)]} head={[round(x) for x in sorted(h)]} ratio={med(h)/med(b):.3f} p={p:.3f}{' RESOLVED' if p<0.05 else ''}{extra}")
    else:
        print(f"{name:45s} base_n={len(b)} head_n={len(h)} refused base={ref(B)} head={ref(H)}{extra}")

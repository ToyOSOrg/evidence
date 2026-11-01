# Compare two arms' osbench rows from per-boot kernel.logs: exact two-sided Mann-Whitney on p50,
# plus each row's ran= placement (the top two processes' CPU/LLC) for the placement question.
import re,sys,itertools
R=sys.argv[1]; pat=re.compile(sys.argv[2]) if len(sys.argv)>2 else None
def rows(side):
    out=[]
    for k in range(1,5):
        d={}
        for l in open(f"{R}/{side}-{k}/kernel.log",errors='replace'):
            m=re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)',l)
            if m: d[m.group(1)]=dict(x.split('=',1) for x in m.group(2).split() if '=' in x)
        out.append(d)
    return out
def mw(a,b):
    n=len(a); allv=a+b
    U=lambda x,y: sum((xi>yi)+0.5*(xi==yi) for xi in x for yi in y)
    obs=abs(U(a,b)-n*len(b)/2); cnt=tot=0
    for c in itertools.combinations(range(len(allv)),n):
        x=[allv[i] for i in c]; y=[allv[i] for i in range(len(allv)) if i not in c]
        tot+=1; cnt+= abs(U(x,y)-n*len(y)/2)>=obs-1e-9
    return cnt/tot
def place(f):
    ran=f.get('ran')
    if not ran: return ''
    ps=[p for p in ran.split(',') if not p.startswith('log-inspect')]
    llcs=[re.search(r'llc(\d+|\?)',p).group(1) for p in ps[:2] if 'llc' in p]
    cpus=[re.search(r'@(cpu\d+)',p).group(1) for p in ps[:2] if '@' in p]
    tag='1cpu' if len(set(cpus))==1 and len(cpus)==2 else ('1llc' if len(set(llcs))==1 else 'SPLIT')
    return tag+':'+'+'.join(cpus)
B=rows('base'); H=rows('head')
names=sorted(set().union(*[d.keys() for d in B+H]))
for name in names:
    if pat and not pat.search(name): continue
    v=lambda S:[float(d[name]['p50']) for d in S if name in d and 'p50' in d[name]]
    b=v(B); h=v(H)
    pl=lambda S:' '.join(place(d.get(name,{})) for d in S)
    extra=''
    if any('ran' in d.get(name,{}) for d in B+H): extra=f"\n      base[{pl(B)}]\n      head[{pl(H)}]"
    if len(b)==4 and len(h)==4:
        p=mw(b,h); med=lambda x: (sorted(x)[1]+sorted(x)[2])/2
        print(f"{name:42s} base={[round(x) for x in sorted(b)]} head={[round(x) for x in sorted(h)]} ratio={med(h)/med(b):.3f} p={p:.3f}{' RESOLVED' if p<0.05 else ''}{extra}")
    else:
        print(f"{name:42s} base_n={len(b)} head_n={len(h)}{extra}")

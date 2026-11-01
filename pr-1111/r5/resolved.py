# Direction-aware resolved rows between two arms: <dir> holds base-1..4 and head-1..4 with kernel.log.
import re,sys
R=sys.argv[1]; watch=sys.argv[2:] 
def rows(side):
    out=[]
    for k in range(1,5):
        d={}
        for l in open(f"{R}/{side}-{k}/kernel.log",errors='replace'):
            m=re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)',l)
            if m: d[m.group(1)]=dict(x.split('=',1) for x in m.group(2).split() if '=' in x)
        out.append(d)
    return out
B=rows('base');H=rows('head'); tot=0; res=[]
med=lambda x:(sorted(x)[1]+sorted(x)[2])/2
for n in sorted(set(B[0])|set(H[0])):
    try: b=[float(d[n]['p50']) for d in B]; h=[float(d[n]['p50']) for d in H]
    except Exception: continue
    u=B[0][n].get('unit','?'); tot+=1; hi=u.endswith('/s')
    r=med(h)/med(b); sep=max(b)<min(h) or max(h)<min(b)
    tag=('head better' if (r>1)==hi else 'head WORSE') if sep else ''
    if sep: res.append(n)
    if sep or any(re.fullmatch(w,n) for w in watch):
        print(f"{n:40s} {u:6s} base={[round(x) for x in sorted(b)]} head={[round(x) for x in sorted(h)]} ratio={r:.3f} {'RESOLVED '+tag if sep else ''}")
print(f'rows compared {tot}, resolved {len(res)}, expected by chance about {tot*0.0286:.1f}')

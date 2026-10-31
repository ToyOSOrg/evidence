import re,sys,statistics as st
slow=set(sys.argv[1].split(',')); boots=sys.argv[2:]
data={}
for b in boots:
    name,path=b.split('=',1); rows={}
    for l in open(path,errors='replace'):
        m=re.search(r'osbench v=2 os=toyos bench=(\S+) unit=(\S*) n=\S+ min=(\S+) p50=(\S+)',l)
        if m and m.group(4)!='-': rows[m.group(1)]=float(m.group(4))
    data[name]=rows
names=sorted({n for r in data.values() for n in r})
out=[]
for n in names:
    s=[data[b][n] for b in data if b in slow and n in data[b]]; f=[data[b][n] for b in data if b not in slow and n in data[b]]
    if len(s)<2 or len(f)<2 or not min(f): continue
    # separated: every slow boot outside the fast boots' range
    sep = min(s)>max(f) or max(s)<min(f)
    if sep: out.append((st.median(s)/st.median(f),n,s,f))
for r,n,s,f in sorted(out,key=lambda x:-abs(x[0]-1)):
    print(f"{r:5.2f} {n}  slow={[round(x) for x in s]} fast-range={round(min(f))}..{round(max(f))}")

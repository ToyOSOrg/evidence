import re,sys
# usage: rows.py name=path ... -- bench-regex
args=sys.argv[1:]; i=args.index('--'); boots=args[:i]; pat=re.compile(args[i+1])
data={}
for b in boots:
    name,path=b.split('=',1); rows={}
    for l in open(path,errors='replace'):
        m=re.search(r'osbench v=2 os=toyos bench=(\S+) unit=(\S*) n=\S+ min=(\S+) p50=(\S+).*max=(\S+)',l)
        if m and m.group(4)!='-': rows[m.group(1)]=(m.group(3),m.group(4),m.group(5),m.group(2))
    data[name]=rows
names=sorted({n for r in data.values() for n in r if pat.search(n)})
for n in names:
    unit=next(r[n][3] for r in data.values() if n in r)
    print(f"{n} [{unit}] (min/p50/max)")
    for b,r in data.items():
        if n in r: print(f"   {b:12} {r[n][0]:>10} {r[n][1]:>10} {r[n][2]:>10}")

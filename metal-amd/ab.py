import re,sys,statistics as st
def rows(path):
    out={}
    for l in open(path,errors='replace'):
        m=re.search(r'osbench v=2 os=toyos bench=(\S+) unit=(\S*) n=\S+ min=(\S+) p50=(\S+)',l)
        if m and m.group(4)!='-': out[m.group(1)]=(m.group(2),float(m.group(4)),float(m.group(3)))
    return out
A=[rows(p) for p in sys.argv[1].split(',')]; B=[rows(p) for p in sys.argv[2].split(',')]
names=sorted(set().union(*A,*B))
print("| bench | unit | A p50s (4 boots) | B p50s (2 boots) | B/A medians |")
print("|---|---|---|---|---|")
for n in names:
    a=[r[n][1] for r in A if n in r]; b=[r[n][1] for r in B if n in r]
    unit=next(r[n][0] for r in A+B if n in r)
    ratio=f"{st.median(b)/st.median(a):.2f}" if a and b and st.median(a) else "-"
    f=lambda v:", ".join(f"{x:.0f}" for x in v)
    print(f"| {n} | {unit} | {f(a)} | {f(b)} | {ratio} |")

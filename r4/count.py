import re,sys
# count.py base1,base2 head1,head2: rows where both heads lie beyond both bases, each way
def rows(p):
    o={}
    for l in open(p):
        m=re.search(r'bench=(\S+) unit=(\S*) n=\S+ min=\S+ p50=(\S+)',l)
        if m and m.group(3)!='-': o[m.group(1)]=(m.group(2),float(m.group(3)))
    return o
base=[rows(p) for p in sys.argv[1].split(',')]; head=[rows(p) for p in sys.argv[2].split(',')]
worse=better=total=0
for n in base[0]:
    if not all(n in r for r in base+head): continue
    total+=1; u=base[0][n][0]; b=[r[n][1] for r in base]; h=[r[n][1] for r in head]
    hb='/s' in u or u.startswith('MB')
    lo,hi=(max(h)<min(b)),(min(h)>max(b))
    if (lo if hb else hi): worse+=1
    if (hi if hb else lo): better+=1
print(f"rows {total}: head worse in both {worse}, better in both {better}; chance alone gives about {total/6:.0f} each")

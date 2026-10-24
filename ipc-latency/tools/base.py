# usage: base.py <counts> <nm> : print the kernel load base
import sys, collections
nm={}
for l in open(sys.argv[2]):
    p=l.split(); nm[int(p[0],16)]=p[2]
starts=set(nm)
c=collections.Counter()
for l in open(sys.argv[1]):
    a=int(l.split()[0],16)
    if a>>48==0xffff:
        for s in (0x1000*k for k in range(1)):
            pass
        c[a]+=1
# candidate bases: a - start for function starts, page aligned
cand=collections.Counter()
addrs=list(c)
for a in addrs[:5000]:
    for s in starts:
        b=a-s
        if b & 0xfff == 0 and b>>48==0xffff: cand[b]+=1
print(hex(cand.most_common(1)[0][0]))

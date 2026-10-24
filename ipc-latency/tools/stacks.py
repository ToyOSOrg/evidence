# usage: stacks.py <stacks> <nm> <base-hex> <rounds> <period> [focus-substring]
import sys, bisect, subprocess, collections
f, nmf, base, rounds, period = sys.argv[1], sys.argv[2], int(sys.argv[3],16), int(sys.argv[4]), int(sys.argv[5])
focus = sys.argv[6] if len(sys.argv) > 6 else None
syms=sorted((int(l.split()[0],16), l.split()[2]) for l in open(nmf))
addrs=[a for a,_ in syms]; raw=[n for _,n in syms]
dm=subprocess.run(['rustfilt'],input='\n'.join(raw),capture_output=True,text=True).stdout.split('\n')
def short(n):
    # strip generic args for readability
    out=[];depth=0
    for ch in n:
        if ch=='<': depth+=1; 
        if depth==0: out.append(ch)
        if ch=='>': depth-=1
    s=''.join(out)
    return s if len(s)>8 else n[:120]
names=[short(d) for d in dm]
def sym(a, ret):
    if a>>48 != 0xffff: return '<user>'
    i=bisect.bisect_right(addrs,a-base-(1 if ret else 0))-1
    return names[i] if i>=0 else '?'
incl=collections.Counter(); excl=collections.Counter(); edges=collections.Counter(); total=0
fstacks=collections.Counter()
for l in open(f):
    p=l.split()
    pcs=[int(x,16) for x in p[1:]]
    fr=[sym(pcs[0],False)]+[sym(a,True) for a in pcs[1:]]
    total+=1
    excl[fr[0]]+=1
    for n in set(fr): incl[n]+=1
    for i in range(len(fr)-1): edges[(fr[i+1],fr[i])]+=1
    if focus and any(focus in x for x in fr):
        fstacks[';'.join(reversed(fr))]+=1
k=period/rounds
print(f"samples {total}, ~{total*k:.0f} insns/round")
print("== inclusive (insns/round)")
for n,c in incl.most_common(90): print(f"{c*k:8.0f}  {n}")
if focus:
    print("== stacks through", focus)
    for s,c in fstacks.most_common(40): print(f"{c*k:8.0f}  {s}")

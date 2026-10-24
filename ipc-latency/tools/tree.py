# usage: tree.py <stacks> <nm> <base-hex> <rounds> <period> <depth> <minpct>
# prints a top-down call tree (instructions per round), root = outermost frame
import sys, bisect, subprocess, collections
f, nmf, base, rounds, period = sys.argv[1], sys.argv[2], int(sys.argv[3],16), int(sys.argv[4]), int(sys.argv[5])
maxd=int(sys.argv[6]); minv=float(sys.argv[7])
syms=sorted((int(l.split()[0],16), l.split()[2]) for l in open(nmf))
addrs=[a for a,_ in syms]; raw=[n for _,n in syms]
dm=subprocess.run(['rustfilt'],input='\n'.join(raw),capture_output=True,text=True).stdout.split('\n')
import re
def short(n):
    n=re.sub(r'::\{closure#\d+\}','::{c}',n)
    out=[];depth=0
    for ch in n:
        if ch=='<': depth+=1
        elif ch=='>': depth-=1; continue
        if depth==0 or (depth==1 and ch not in '<'): pass
        if depth==0: out.append(ch)
    s=''.join(out)
    # keep last path segments of the original for methods on types
    m=re.match(r'^<(.+?)(?: as (.+?))?>::(.+)$', n)
    if m:
        ty=re.sub(r'<.*','',m.group(1)).split('::')[-1]
        meth=re.sub(r'::<.*','',m.group(3))
        return f"{ty}::{meth}"
    return re.sub(r'::<.*','',n)
names=[short(d) for d in dm]
def sym(a, ret):
    if a>>48 != 0xffff: return '<user>'
    i=bisect.bisect_right(addrs,a-base-(1 if ret else 0))-1
    return names[i] if i>=0 else '?'
class Node:
    __slots__=('c','kids')
    def __init__(s): s.c=0; s.kids={}
root=Node()
for l in open(f):
    p=l.split()
    pcs=[int(x,16) for x in p[1:]]
    fr=[sym(pcs[0],False)]+[sym(a,True) for a in pcs[1:]]
    fr=list(reversed(fr))
    n=root; n.c+=1
    for x in fr:
        n=n.kids.setdefault(x,Node()); n.c+=1
k=period/rounds
def show(n,name,d):
    if n.c*k<minv: return
    print(f"{'  '*d}{n.c*k:7.0f} {name}")
    if d>=maxd: return
    for nm,ch in sorted(n.kids.items(),key=lambda x:-x[1].c): show(ch,nm,d+1)
show(root,'ALL',0)

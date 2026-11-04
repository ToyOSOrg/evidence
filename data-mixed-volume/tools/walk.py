import sys
E='<T14 captures>/'
front=open(E+'front-16MiB.bin','rb').read()
mid=open(E+'blocks-1325056-1361919.bin','rb').read()
extra={}
for a in sys.argv[1:]:
    s=int(a.split('/')[-1].split('.')[0]); d=open(a,'rb').read()
    for i in range(len(d)//4096): extra[s+i]=d[i*4096:(i+1)*4096]
def blk(n):
    if n<4096: return front[n*4096:(n+1)*4096]
    if 1325056<=n<1361920: return mid[(n-1325056)*4096:(n-1325055)*4096]
    return extra.get(n)
def node(n):
    d=blk(n)
    if d is None: return None
    if d[:4]!=b'BTND': return ('bad',list(d[:4]))
    lvl=int.from_bytes(d[8:10],'little'); cnt=int.from_bytes(d[10:12],'little')
    off=32; ents=[]
    for _ in range(cnt):
        h=int.from_bytes(d[off:off+8],'little'); vl=int.from_bytes(d[off+18:off+22],'little')
        v=d[off+24:off+24+vl]; ents.append((h,v)); off=(off+24+vl+7)&~7
    return (lvl,ents)
def walk(n,depth=0,path=''):
    r=node(n)
    if r is None: print('  '*depth+f'{n}: MISSING'); return
    if r[0]=='bad': print('  '*depth+f'{n}: BAD MAGIC {r[1]}'); return
    lvl,ents=r
    if lvl==0: print('  '*depth+f'{n}: leaf {len(ents)} entries'); return
    print('  '*depth+f'{n}: level {lvl}, {len(ents)} children')
    for h,v in ents: walk(int.from_bytes(v[:8],'little'),depth+1)
walk(1334530)

import collections
bm=front[4096:4096*1361]
used=lambda b:(bm[b>>3]>>(b&7))&1
refs=collections.Counter(); missing=[]; bad=[]; seen=[]
def collect(n):
    refs[n]+=1
    r=node(n)
    if r is None: missing.append(n); return
    if r[0]=='bad': bad.append((n,r[1])); return
    lvl,ents=r
    if lvl==0: return
    for h,v in ents: collect(int.from_bytes(v[:8],'little'))
collect(1334530)
print("SUMMARY nodes referenced",len(refs),"dups",[(b,c) for b,c in refs.items() if c>1])
print("missing",len(missing),sorted(missing))
print("bad",bad)
low=[b for b in refs if b<1728]
print("children <1728:",len(low),"of which bitmap says free:",[b for b in low if not used(b)])
print("children >=1728 bitmap says free:",[b for b in refs if b>=1728 and not used(b)])

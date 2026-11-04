import sys
f=open(sys.argv[1],'rb').read()
bm=f[4096:4096*1361]
total=44564480
runs=[];start=None
for blk in range(total):
    used=(bm[blk>>3]>>(blk&7))&1
    if used and start is None: start=blk
    if not used and start is not None: runs.append((start,blk-start)); start=None
if start is not None: runs.append((start,total-start))
print("used runs",len(runs),"used blocks",sum(l for _,l in runs))
for s,l in runs: print(s,l, "end",s+l)

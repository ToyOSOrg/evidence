import re,sys,glob,os
runs=sys.argv[1]
for size in ("4096","16384","65536"):
    print("== pipe.throughput."+size)
    for d in sorted(os.listdir(runs)):
        txt=open(os.path.join(runs,d,"kernel.log"),errors="replace").read()
        m=re.search(r"bench=pipe\.throughput\.%s .*"%size,txt)
        if not m: continue
        row=m.group(0)
        f=dict(kv.split("=",1) for kv in row.split() if "=" in kv)
        pairs=[tuple(map(int,p.split("+"))) for p in f["reader_writer_cpus"].split(",")]
        split=sum((r<8)!=(w<8) for r,w in pairs)
        n=int(f["n"]); mean=int(f["mean"]); lo=int(f["min"]); hi=int(f["max"])
        # with `split` rounds at the min-mode and the rest at the max-mode, the mean this predicts
        pred=(split*lo+(n-split)*hi)/n
        print(f"  {d:8} split={split}/{n} min={lo} max={hi} mean={mean} predicted<= {pred:.0f} p50={f['p50']}")

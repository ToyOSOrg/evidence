import sys, re, os, glob, json
O, issues_dir = sys.argv[1], sys.argv[2]
LOWER = {'ns','ps','ns/MiB','ns/page'}
HIGHER = {'MB/s','kops/s','chunks/s'}
issue_text = {os.path.basename(p): open(p).read() for p in glob.glob(issues_dir+'/*.md')}
def area(b):
    for pre,a in [('cpu.','cpu'),('crunch.','cpu'),('work.compress','cpu'),('syscall.','kernel entry'),('time.now','clock'),
                  ('time.sleep','timers'),('time.timer','timers'),('time.yield','scheduler'),('wake.','scheduler'),('pingpong.','scheduler'),
                  ('fair.','scheduler'),('tail.','scheduler'),('thread.','process/thread'),('proc.','process/thread'),('process.','process/thread'),
                  ('work.build','process/thread'),('mem.','memory'),('ipc.','ipc'),('pipe.','ipc'),('net.','network'),('lan.','network'),
                  ('internet.','network'),('persist.','disk'),('fs.disk.','fs'),('fs.mem.','fs'),('energy.','power'),('nvme.','disk'),('identity.','identity')]:
        if b.startswith(pre): return a
    return 'other'
def owner(b):
    base=b.split('@')[0].split('#')[0]
    hits=[n for n,t in issue_text.items() if '`'+base+'`' in t or base+'`' in t or base+' ' in t]
    if not hits:
        parts=base.split('.')
        for k in range(len(parts)-1,1,-1):
            pre='.'.join(parts[:k])+'.'
            hits=[n for n,t in issue_text.items() if '`'+pre in t]
            if hits: break
    return hits
out={}
for bench in ['t14','amd']:
    rows=[]
    for line in open(f'{O}/{bench}-compare.md'):
        if not line.startswith('| ') or line.startswith('| bench') : continue
        c=[x.strip() for x in line.strip().strip('|').split('|')]
        if len(c)<11: continue
        name,unit,lp,lm,lr,tp,tm,tr,ratio,p,verdict=c[:11]
        try: lmv,tmv=float(lm),float(tm)
        except: lmv=tmv=None
        worse=None
        if lmv and tmv and lmv>0 and tmv>0:
            if unit in LOWER: worse=tmv/lmv
            elif unit in HIGHER: worse=lmv/tmv
        rows.append(dict(name=name,unit=unit,linux=lp,lmed=lm,lrange=lr,toyos=tp,tmed=tm,trange=tr,ratio=ratio,p=p,verdict=verdict,worse=worse,area=area(name)))
    out[bench]=rows
json.dump(out,open(f'{O}/rows.json','w'),indent=1)
# gaps
for bench in ['t14','amd']:
    gaps=[r for r in out[bench] if r['worse'] and r['worse']>1.0 and not r['name'].startswith('cpu.clock')]
    print(bench, 'rows', len(out[bench]), 'losing', len(gaps), 'resolved-worse', sum('ToyOS worse' in r['verdict'] for r in gaps), 'resolved-better', sum('ToyOS better' in r['verdict'] for r in out[bench]))

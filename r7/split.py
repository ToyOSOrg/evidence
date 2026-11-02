import re,sys
f=sys.argv[1]
L=open(f,errors='replace').read().splitlines()
ev=[]; samples=[]
for l in L:
    if 'nvme probe:' in l:
        for e in l.split('nvme probe: ',1)[1].split(';'):
            m=re.match(r'\s*(\d+)\.(\d+) (\w+) (\d+)\+(\d+) s(\d+) (idle (\d+) ms|busy) (\d+) us',e)
            if m: ev.append(dict(t=int(m.group(1))*10**9+int(m.group(2))*1000, op=m.group(3), lba=int(m.group(4)), n=int(m.group(5)), s=int(m.group(6)), idle=m.group(8), lat=int(m.group(9))*1000))
    if 'trace.sample' in l:
        d=dict(re.findall(r'(\w+)=(\S*)',l.split('trace.sample',1)[1])); samples.append(d)
ev.sort(key=lambda e:e['t'])
for d in samples:
    t0=int(d['t0_ns']); t1=t0+int(d['dur_us'])*1000; k=int(d['k'])
    cmds=[e for e in ev if t0<=e['t']<=t1]
    kind='after-idle' if k<8 else 'b2b'
    print(f"## sample {k} ({kind}) dur {int(d['dur_us'])/1000:.2f} ms, {len(cmds)} logged commands")
    prev_done=None; segs=[]
    if cmds:
        segs.append(('host before first', (cmds[0]['t']-t0)/1e6))
        busy_until=t0
        for c in cmds:
            done=c['t']+c['lat']
            gap=(c['t']-busy_until)/1e6 if c['t']>busy_until else 0
            print(f"   +{(c['t']-t0)/1e6:7.3f} ms {c['op']:5} lba {c['lba']}+{c['n']} s{c['s']} {'idle '+c['idle']+' ms' if c['idle'] else 'busy'} lat {c['lat']/1e6:.3f} ms" + (f"  [gap {gap:.3f} ms, nothing outstanding]" if gap>0.05 and c is not cmds[0] else ""))
            busy_until=max(busy_until,done)
        print(f"   return after last reap: {(t1-busy_until)/1e6:.3f} ms")
    evs=d['events'].split(',') if d['events'] else []
    print(f"   diary records in window: {len(evs)}; " + ' '.join(evs[:40]))

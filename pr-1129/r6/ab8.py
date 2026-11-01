# ab8: per boot and arm, the pipe.throughput rows' p50, per-round sides' CPUs and migrations
# (moves/cross-LLC/wakes/picks), plus the key rows' p50s. Usage: ab8.py <runs dir>
import re,sys,os
R=sys.argv[1]
ROWS=['pipe.throughput.16384','pipe.throughput.4096','pipe.throughput.65536','ipc.reqrep.8','ipc.reqrep.65536',
      'pingpong.futex.cross_core','work.build_shaped.j16','fs.disk.seq_read.1048576','fs.mem.seq_read.4096','tail.wake.periodic.60s']
boots=sorted(os.listdir(R),key=lambda d:int(d.split('-')[0]))
data={}
for b in boots:
    d={}
    for l in open(f'{R}/{b}/kernel.log',errors='replace'):
        m=re.search(r'osbench v=2 os=toyos bench=(\S+) (.*)',l)
        if m: d[m.group(1)]=dict(x.split('=',1) for x in m.group(2).split() if '=' in x)
    data[b]=d
for row in ROWS:
    print(f'== {row}')
    for b in boots:
        f=data[b].get(row,{})
        extra=' '.join(f'{k}={f[k]}' for k in ('reader_writer_cpus','one_core','moves_xllc_wakes_picks') if k in f)
        if 'ran' in f and row.startswith('ipc'): extra=f"ran={f['ran']}"
        print(f"  {b:8s} p50={f.get('p50','-'):>10s} {extra}")

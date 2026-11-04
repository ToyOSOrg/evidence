#!/usr/bin/env python3
"""kvmtab.py <log>...: pipe/ipc p50s, IPC send/recv probe ns, and pipe-reader segs per log."""
import sys, re
for f in sys.argv[1:]:
    t = open(f, errors="replace").read()
    rows = dict(re.findall(r'bench=((?:pipe\.throughput|ipc)\.\S+) unit=\S+ .*?p50=(\d+)', t))
    print("==", f.split('/')[-1])
    print("  " + " ".join(f"{k.replace('pipe.throughput.','p').replace('ipc.reqrep','rr')}={v}" for k, v in rows.items()))
    for l in t.splitlines():
        if 'exit: osbench_ipc' in l or ('exit: osbench_system' in l and ' 8:' in l):
            pid = re.search(r'pid=(\d+)', l)[1]
            m = re.search(r'probe_seg(.*?) probe_ns', l); seg = m[1].strip() if m else ''
            ns = dict(x.split(':') for x in re.search(r'probe_ns_per_call(.*)', l)[1].split())
            print(f"  pid {pid} segs[{seg}] ns 0:{ns.get('0','-')} 1:{ns.get('1','-')} 133:{ns.get('133','-')} 159:{ns.get('159','-')}")

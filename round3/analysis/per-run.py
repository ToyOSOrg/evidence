import re, sys, statistics as st
for path in sys.argv[1:]:
    log = open(path).read().splitlines()
    tsc = None; runs = {}; mbps = {}; c0 = {}; cur = None
    for l in log:
        m = re.search(r'perf idle .*tsc_hz=(\d+)', l)
        if m: tsc = int(m.group(1))
        m = re.search(r'\[download\] perf run=(\d+) k=32 (.*)', l)
        if m: runs[int(m.group(1))] = dict(w.split('=',1) for w in m.group(2).split() if '=' in w)
        m = re.search(r'\[download\] whole .* mbps=([\d.]+) .* run=(\d+)', l)
        if m: mbps[int(m.group(2))] = float(m.group(1))
        m = re.match(r'netperf: run (\d+) per MB', l)
        if m: cur = int(m.group(1))
        m = re.search(r'system C0 .*?([\d.]+) ms', l)
        if m and cur and cur not in c0: c0[cur] = float(m.group(1))
    print(path.split('/')[-1], 'tsc', tsc)
    rows = {'copyB/byte':[], 'H ms':[], 'P ms':[], 'C0 ms':[], 'mbps':[]}
    for r in sorted(runs):
        kv = runs[r]; mb = int(kv['bytes'])/1e6
        cb = int(kv['k.pipe_copy_bytes'])/int(kv['bytes'])
        h = int(kv['k.pipe_lock_hold_cycles'])/tsc*1e3/mb
        p = int(kv['k.pipe_lock_spin_cycles'])/tsc*1e3/mb
        print(f" run {r}: mbps {mbps.get(r)} copy/byte {cb:.6f} H {h:.4f} P {p:.4f} C0 {c0.get(r)}")
        if r >= 1:
            rows['copyB/byte'].append(cb); rows['H ms'].append(h); rows['P ms'].append(p); rows['C0 ms'].append(c0.get(r) or float('nan')); rows['mbps'].append(mbps.get(r))
    for k,v in rows.items(): print(f"  median all {k}: {st.median(v):.6g}   median runs 2-6: {st.median(v[1:]):.6g}")

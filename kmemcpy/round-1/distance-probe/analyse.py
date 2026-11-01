import re, sys, bisect
log, syms = sys.argv[1], sys.argv[2]
addrs, names = [], []
for line in open(syms):
    a, _, n = line.rstrip('\n').split(' ', 2)
    addrs.append(int(a, 16)); names.append(n)
anchor_static = None
for a, n in zip(addrs, names):
    if n.endswith('memprobe::record'): anchor_static = a
snaps = []  # (time, marker-before, hist, ra table)
cur = None
phase = 'boot'
for line in open(log, errors='replace'):
    m = re.search(r'===TEST_END (\S+) ', line)
    if m:
        phase = 'after ' + m.group(1)
    m = re.search(r'memprobe \w+ anchor=(0x[0-9a-f]+) count=\[([^\]]*)\] bytes=\[([^\]]*)\]', line)
    if m:
        cur = dict(phase=phase, slide=int(m.group(1), 16) - anchor_static,
                   count=[int(x) for x in m.group(2).split(',')], bytes=[int(x) for x in m.group(3).split(',')], ra={})
        snaps.append(cur); continue
    m = re.search(r'memprobe ra=(0x[0-9a-f]+) all=(\d+) d512=(\d+) d64=(\d+)', line)
    if m and cur is not None:
        cur['ra'][int(m.group(1), 16)] = tuple(int(x) for x in m.group(2, 3, 4))
# last snapshot of each phase
last = {}
order = []
for s in snaps:
    if s['phase'] not in last: order.append(s['phase'])
    last[s['phase']] = s
B = ['n<64', 'd=0', '1-15', '16-63', '64-255', '256-511', '512-1023', '>=1024']
def sym(ra, slide):
    a = ra - slide
    i = bisect.bisect_right(addrs, a) - 1
    return names[i][:110] if i >= 0 else hex(a)
prev = None
labels = {'boot': 'boot to osbench_system end'}
for p in order:
    s = last[p]
    c = s['count']; b = s['bytes']; ra = s['ra']
    if prev:
        c = [x - y for x, y in zip(c, prev['count'])]; b = [x - y for x, y in zip(b, prev['bytes'])]
        ra = {k: tuple(v[i] - prev['ra'].get(k, (0, 0, 0))[i] for i in range(3)) for k, v in ra.items()}
    big = sum(b[1:])
    print(f'== segment ending at the last dump while "{p}" ({"cumulative from boot" if not prev else "delta"})')
    for name, cc, bb in zip(B, c, b):
        print(f'  {name:>9}: {cc:>9} copies {bb:>12} bytes  {100*bb/max(big,1) if name!="n<64" else 0:6.2f}% of n>=64 bytes')
    print(f'  n>=64 bytes at d in 1..512: {100*sum(b[2:6])/max(big,1):.2f}%; at d in 1..64: {100*sum(b[2:4])/max(big,1):.2f}%')
    rows = sorted(ra.items(), key=lambda kv: -kv[1][1])[:12]
    for k, (al, d512, d64) in rows:
        if al == 0: continue
        print(f'    {al:>12} B, {100*d512/al:5.1f}% at 1..512, {100*d64/al:5.1f}% at 1..64  {sym(k, s["slide"])}')
    prev = last[p]

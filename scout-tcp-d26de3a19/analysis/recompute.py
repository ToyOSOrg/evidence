"""Recompute the scout's rows from the raw stamps, independently of setup_table.rs.

usage: python3 -I recompute.py <judge-1.log> <ubuntu dir>
"""
import re, sys, glob, statistics as st

judge, udir = sys.argv[1], sys.argv[2]

def words(s):
    return dict(w.split('=', 1) for w in s.split() if '=' in w)

stamps, setups, lan = [], [], []
for line in open(judge):
    m = re.search(r'\[stamp\] (\w+) (.*)$', line)
    if m:
        stamps.append((m.group(1), words(m.group(2))))
    m = re.search(r'\[download\] setup (.*)$', line)
    if m:
        setups.append(words(m.group(1)))
    m = re.search(r'\[download\] lan control (.*)$', line)
    if m:
        lan.append(words(m.group(1)))

I = lambda w, k: int(w[k])
ms = lambda a, b: (b - a) / 1e6

def own(w):
    return int(w.get('irqs', 0)) >= 1 and w.get('idx') == '0' and I(w, 'n4') >= I(w, 'prev')

def first(kind, key, lo, hi):
    for k, w in stamps:
        if k == kind and lo <= I(w, key) <= hi:
            return w
    return None

def med(v):
    return st.median(v)

rows = {}
def put(name, v):
    rows.setdefault(name, []).append(v)

problems = []
print('per fetch (ms)')
for s in setups:
    j = [I(s, f'j{k}') for k in range(6)]
    l = first('lookup', 'n1', j[1], j[2])
    c = first('connect', 'n1', j[3], j[4])
    o = first('setopt', 'n1', I(c, 'n6'), j[4])
    d = first('data', 'n3', j[4], j[5])
    for name, w in [('lookup', l), ('connect', c), ('setopt', o), ('data', d)]:
        if w is None:
            problems.append(f"run {s['run']}: no {name} stamp")
    if l['clean'] != '1' or l['queries_between'] != '1':
        problems.append(f"run {s['run']}: lookup clean={l['clean']} qb={l['queries_between']}")
    if c['reply'] != 'synack' or c['syns'] != '1':
        problems.append(f"run {s['run']}: connect reply={c['reply']} syns={c['syns']}")
    for name, w in [('lookup', l), ('connect', c), ('data', d)]:
        if not own(w):
            problems.append(f"run {s['run']}: {name} interrupt not own")
    tcp = ms(j[0], j[4]); tls = ms(j[4], j[5])
    ureq = ms(j[0], j[1]) + ms(j[2], j[3])
    lookup = ms(j[1], j[2]); lw = ms(I(l, 'n3'), I(l, 'n4'))
    connect = ms(j[3], I(c, 'n6')); sw = ms(I(c, 'n3'), I(c, 'n4'))
    nodelay = ms(I(c, 'n6'), I(o, 'n6')); tail = ms(I(o, 'n6'), j[4])
    drtt = ms(I(d, 'n3'), I(d, 'n4'))
    parts = dict(tcp=tcp, ureq=ureq, lookup=lookup, lookup_wire=lw, lookup_local=lookup - lw,
                 l_client_acc=ms(j[1], I(l, 'n1')), l_acc_read=ms(I(l, 'n1'), I(l, 'n2')),
                 l_read_query=ms(I(l, 'n2'), I(l, 'n3')), l_wake=ms(I(l, 'n4'), I(l, 'n5')),
                 l_reply_answer=ms(I(l, 'n5'), I(l, 'n6')), l_answer_client=ms(I(l, 'n6'), j[2]),
                 connect=connect, syn_wire=sw, connect_local=connect - sw,
                 c_client_acc=ms(j[3], I(c, 'n1')), c_acc_read=ms(I(c, 'n1'), I(c, 'n2')),
                 c_read_syn=ms(I(c, 'n2'), I(c, 'n3')), c_wake=ms(I(c, 'n4'), I(c, 'n5')),
                 c_reply_answer=ms(I(c, 'n5'), I(c, 'n6')),
                 nodelay=nodelay, s_answer_acc=ms(I(c, 'n6'), I(o, 'n1')), s_acc_read=ms(I(o, 'n1'), I(o, 'n2')),
                 s_read_answer=ms(I(o, 'n2'), I(o, 'n6')),
                 tail=tail, data_rtt=drtt, d_wake=ms(I(d, 'n4'), I(d, 'n5')), tls_phase=tls,
                 local_sum=(lookup - lw) + (connect - sw) + nodelay,
                 syn_minus_data=sw - drtt,
                 sum_check=tcp - (ureq + lookup + connect + nodelay + tail))
    for k, v in parts.items():
        put(k, v)
        if v < 0 and k not in ('sum_check',):
            problems.append(f"run {s['run']}: {k} negative {v}")
    put('addr=' + s['addr'] + ' syn_wire', sw)
    put('ack_len', int(d['ack_len']))
    print(f"run={s['run']} addr={s['addr']} family={s['family']} addrs={s['addrs']} " +
          ' '.join(f"{k}={v:.3f}" for k, v in parts.items()))

print('\nToyOS medians over the six fetches (ms)')
for k, v in rows.items():
    print(f"  {k:<22} n={len(v)} min={min(v):.3f} med={med(v):.3f} max={max(v):.3f}")

print('\nLAN control')
lanrows = {}
for w in lan:
    c0, c1 = I(w, 'c0'), I(w, 'c1')
    c = first('connect', 'n1', c0, c1)
    lw = ms(I(c, 'n3'), I(c, 'n4')) if own(c) else None
    wk = ms(I(c, 'n4'), I(c, 'n5')) if own(c) else None
    print(f"  i={w['i']} outcome={w['outcome']} reply={c['reply']} lan_connect={ms(c0, c1):.3f} lan_syn_wire={lw:.3f} wake={wk:.3f}")
    lanrows.setdefault('lan_connect', []).append(ms(c0, c1))
    lanrows.setdefault('lan_syn_wire', []).append(lw)
    lanrows.setdefault('lan_wake', []).append(wk)
for k, v in lanrows.items():
    print(f"  {k:<22} n={len(v)} min={min(v):.3f} med={med(v):.3f} max={max(v):.3f}")

wakes = [ms(I(w, 'n4'), I(w, 'n5')) for k, w in stamps if k != 'setopt' and own(w)]
print(f"\nall own-interrupt wakes n={len(wakes)} min={min(wakes):.4f} med={med(wakes):.4f} max={max(wakes):.4f} over50us={sum(1 for x in wakes if x > 0.05)}")
under = sorted(x for x in wakes if x <= 0.05)
print(f"  at or under 50 us: {[round(x * 1000, 1) for x in under]} us")

# Every lookup's wire (own interrupt only) in time order, to see the spread.
lk = [(I(w, 'n1'), ms(I(w, 'n3'), I(w, 'n4')), own(w), w['idx']) for k, w in stamps if k == 'lookup']
print('\nevery lookup: n1, wire (ms), own, idx')
for n1, wire, o, idx in lk:
    print(f"  {n1} {wire:7.3f} own={o} idx={idx}")

print('\nUbuntu')
u = {'any': {}, 'v4': {}}
allu = {}
for f in sorted(glob.glob(udir + '/ubuntu-setup-[0-9]-*.txt')):
    for line in open(f):
        m = re.search(r'https_download: setup (.*)$', line)
        if not m:
            continue
        w = words(m.group(1))
        if 'tcpi_rtt_us' not in w or w.get('peer_index') != '0':
            problems.append(f"{f}: E4 miss: {line.strip()}")
        j = [int(w[f'j{k}']) for k in range(6)]
        vals = dict(U1=ms(j[1], j[2]), U2=ms(j[3], j[4]), U3=ms(j[0], j[4]), U4=int(w['tcpi_rtt_us']) / 1e3,
                    U5=ms(j[4], j[5]), ureq=ms(j[0], j[1]) + ms(j[2], j[3]))
        vals['U2-U4'] = vals['U2'] - vals['U4']
        for k, v in vals.items():
            u[w['asked']].setdefault(k, []).append(v)
            allu.setdefault(k, []).append(v)
        print(f"  {f.split('/')[-1]} run={w['run']} asked={w['asked']} addrs={w['addrs']} family={w['family']} peer={w['peer_family']} " +
              ' '.join(f"{k}={v:.3f}" for k, v in vals.items()))
for name, d in [('asked=any', u['any']), ('asked=v4', u['v4']), ('all 18', allu)]:
    print(f"  {name}")
    for k, v in d.items():
        print(f"    {k:<8} n={len(v)} min={min(v):.3f} med={med(v):.3f} max={max(v):.3f}")

print('\nproblems:', problems if problems else 'none')

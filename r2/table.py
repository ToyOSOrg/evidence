import sys
# usage: table.py <bench-dir> <label>  ; reads shipped-1.txt, shipped-2.txt, unasserted.txt
d, label = sys.argv[1], sys.argv[2]
def load(p):
    rows = {}
    for l in open(p):
        if l.startswith('oracle: '):
            f = [x.strip() for x in l[8:].split('|')]
            num = lambda x: None if x == '-' else float(x)
            rows[f[0]] = dict(t=num(f[1]), ring=num(f[2]), ossl=num(f[3]), aws=num(f[4]), spread=float(f[5]),
                              vr=num(f[6]), vo=num(f[7]), va=num(f[8]))
    return rows
s1, s2, u = load(d + '/shipped-1.txt'), load(d + '/shipped-2.txt'), load(d + '/unasserted.txt')
hot = ['chacha20-poly1305/seal/65536', 'chacha20-poly1305/open/65536', 'chacha20-poly1305/seal/16384',
       'chacha20-poly1305/open/16384', 'chacha20-poly1305/seal/1024', 'chacha20-poly1305/open/1024',
       'aes-128-gcm/seal/16384', 'aes-128-gcm/open/16384', 'aes-256-gcm/seal/16384', 'aes-256-gcm/open/16384',
       'aes-128-gcm/seal/65536', 'aes-256-gcm/seal/65536', 'aes-128-gcm/seal/1024', 'aes-256-gcm/seal/1024',
       'sha-256/1048576', 'sha-256/16384', 'sha-256/64',
       'x25519/ecdh', 'p-256/ecdh', 'ed25519/sign/64', 'ed25519/verify/64', 'ecdsa-p-256-sha-256/verify/64',
       'rsa-2048-pkcs1-sha-256/verify/64', 'rsa-2048-pss-sha-256/verify/64',
       'chacha20-poly1305-openssh/seal/32768', 'chacha20-poly1305-openssh/open/32768', 'chacha20-poly1305-openssh/seal/16384']
order = hot + [k for k in s1 if k not in hot]
def ns(x):
    if x is None: return '-'
    return f'{x/1000:.2f} µs' if x >= 10000 else f'{x:.0f} ns'
print(f'### {label}\n')
print('| row | ToyOS shipped | ToyOS unasserted | ring | OpenSSL | AWS-LC | shipped / ring | / OpenSSL | / AWS-LC | behind the fastest (shipped) | unasserted / fastest | note |')
print('|---|---|---|---|---|---|---|---|---|---|---|---|')
for i, k in enumerate(order):
    if i == len(hot):
        print('| **other rows** | | | | | | | | | | | |')
    a, b, c = s1[k], s2[k], u[k]
    t = (a['t'] + b['t']) / 2
    drift = abs(b['t'] / a['t'] - 1)
    refs = [x for x in (c['ring'], c['ossl'], c['aws']) if x]
    fastest = min(refs)
    notes = []
    if max(a['spread'], b['spread'], c['spread']) > 0.05: notes.append('spread>5%')
    if drift > 0.05: notes.append(f'drift {drift:.0%}')
    pairs = [(v, n) for v, n in ((a['vr'], 'ring'), (a['vo'], 'OpenSSL'), (a['va'], 'AWS-LC')) if v is not None]
    worst, lib = max(pairs)
    r = lambda x: '-' if x is None else f'{x:.2f}'
    print(f"| {k} | {ns(t)} | {ns(c['t'])} | {ns(a['ring'])} | {ns(a['ossl'])} | {ns(a['aws'])} | {r(a['vr'])} | {r(a['vo'])} | {r(a['va'])} | {worst:.2f} ({lib}) | {c['t']/fastest:.2f} | {', '.join(notes)} |")
print()

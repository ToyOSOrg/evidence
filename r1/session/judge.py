"""Judge the T14 session by the issue's exit. Usage: judge.py L1.txt TOYOS.log L2.txt
Reads each run's lan.wired.tcp.upload line; prints the verdict per rule."""
import sys, re, itertools
from math import comb

def row(path):
    for line in open(path, errors='replace'):
        i = line.find('bench=lan.wired.tcp.upload ')
        if i >= 0:
            return dict(w.split('=', 1) for w in line[i:].split() if '=' in w)
    sys.exit(f'{path}: no upload row')

def rounds(r, ms):
    return [int(v) for v in r[f'peer_received_by_{ms}ms_bytes'].split(',')]

def u_low(a, b):
    """Exact P(U_a <= observed) under exchangeability: one-sided, a ranked low."""
    pooled = a + b
    def u(xs, ys):
        return sum((x > y) + 0.5 * (x == y) for x in xs for y in ys)
    obs = u(a, b)
    n, k = len(pooled), len(a)
    hits = 0
    for idx in itertools.combinations(range(n), k):
        s = set(idx)
        xa = [pooled[i] for i in idx]
        xb = [pooled[i] for i in range(n) if i not in s]
        hits += u(xa, xb) <= obs
    return hits / comb(n, k)

def two_sided(a, b):
    return min(1.0, 2 * min(u_low(a, b), u_low(b, a)))

l1, t, l2 = map(row, sys.argv[1:4])
ok = True
lp = min(int(l1['p50']), int(l2['p50']))
p50 = int(t['p50']) >= lp - 1
print(f"p50: toyos {t['p50']} linux {l1['p50']},{l2['p50']} -> {'pass' if p50 else 'FAIL'}")
ok &= p50
rtx = int(t.get('stack_net_tcp_retransmit_bytes', 0))
lp_ = int(t.get('stack_net_tcp_loss_probe', 0))
loss_ok = rtx == 0 or (rtx <= 1448 * lp_ and int(t.get('stack_net_tcp_rto', 0)) == 0 and int(t.get('stack_net_tcp_fast_recovery', 0)) == 0 and int(t.get('stack_net_tcp_sack_recovery', 0)) == 0)
print(f"resent: {rtx} B, probes {lp_} -> {'pass' if loss_ok else 'FAIL'}")
ok &= loss_ok
decides = True
for ms in (100, 300):
    a, b1, b2 = rounds(t, ms), rounds(l1, ms), rounds(l2, ms)
    p = u_low(a, b1 + b2)
    pl = two_sided(b1, b2)
    mean = lambda xs: sum(xs) / len(xs) / 1e6
    print(f"{ms} ms: toyos {mean(a):.3f} MB {a}\n        L1 {mean(b1):.3f} {b1}\n        L2 {mean(b2):.3f} {b2}")
    print(f"        one-sided p(toyos low) = {p:.4f} -> {'pass' if p > 0.05 else 'FAIL'}; L1 vs L2 two-sided p = {pl:.4f}{' (runs differ: session does not decide)' if pl <= 0.05 else ''}")
    ok &= p > 0.05
    decides &= pl > 0.05
print('VERDICT:', 'does not decide (Linux runs differ)' if not decides else ('parity' if ok else 'not parity'))

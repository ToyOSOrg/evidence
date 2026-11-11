#!/usr/bin/env python3
"""Judges PR #1131's finishing measurement by metal2/rules.txt. Usage: judge2.py <runs dir>"""
import re, sys, statistics as st
runs = sys.argv[1]
LINE = re.compile(r'osbench v=2 os=(\w+) bench=(\S+) unit=(\S+) n=(\d+) min=(\S+) p50=(\S+) p90=(\S+) .*? max=(\S+)')
def rows(path):
    out = {}
    for line in open(path, errors='replace'):
        m = LINE.search(line)
        if m:
            f = lambda x: float(x) if x != '-' else float('nan')
            out[m.group(2)] = dict(unit=m.group(3), p50=f(m.group(6)), p90=f(m.group(7)), min=f(m.group(5)), max=f(m.group(8)))
    return out
def grab(path, pat):
    return [l.strip() for l in open(path, errors='replace') if re.search(pat, l)]
def fmt(v, unit):
    return f'{v/1e6:.2f} ms' if unit == 'ns' and v >= 1e5 else (f'{v/1e3:.1f} us' if unit == 'ns' else f'{v:.0f} {unit}')
AI = 'persist.write_4k_fsync_after_idle'; BB = 'persist.write_4k_fsync'
AFTER = ['persist.write_4k_fsync_beside_1m', 'persist.append_4k_fsync', 'persist.create_fsync_unlink']
def mode(d):
    return 'slow' if d['p50'] > 3e6 else ('mixed' if d['p90'] > 3e6 else 'fast')
for bench in ['amd', 't14']:
    print(f'\n# {bench}\n')
    data = {a: [rows(f'{runs}/{bench}/r{r}-{a}/kernel.log') for r in (1, 2, 3)] for a in 'MP'}
    lin = [rows(f'{runs}/{bench}/linux-L{n}.txt') for n in (1, 2, 3)]
    print('## Per boot (p50 / p90)\n')
    print('| boot | write_4k_fsync | mode before idle | after_idle p50 (min..max) | beside_1m | append_4k_fsync | create_fsync_unlink | modes after idle |')
    print('|---|---|---|---|---|---|---|---|')
    for r in range(3):
        for a in 'MP':
            d = data[a][r]
            c = lambda k: f"{d[k]['p50']/1e6:.2f} / {d[k]['p90']/1e6:.2f} ms"
            print(f"| r{r+1}-{a} | {c(BB)} | {mode(d[BB])} | {d[AI]['p50']/1e6:.2f} ms ({d[AI]['min']/1e6:.2f}..{d[AI]['max']/1e6:.2f}) | " + ' | '.join(c(k) for k in AFTER) + ' | ' + ', '.join(mode(d[k]) for k in AFTER) + ' |')
    for n, d in enumerate(lin):
        c = lambda k: f"{d[k]['p50']/1e6:.2f} / {d[k]['p90']/1e6:.2f} ms"
        print(f"| linux L{n+1} | {c(BB)} | - | {d[AI]['p50']/1e6:.2f} ms ({d[AI]['min']/1e6:.2f}..{d[AI]['max']/1e6:.2f}) | " + ' | '.join(c(k) for k in AFTER) + ' | - |')
    names = sorted(k for k in data['M'][0] if k.startswith(('fs.disk.', 'persist.', 'nvme.')) and k != AI)
    print('\n## L1: every back-to-back disk row, median of three boots\' p50 (min..max)\n')
    print('| row | M\' | P\' | Linux | P\' vs M\' | resolved |')
    print('|---|---|---|---|---|---|')
    fails = []
    for k in names:
        unit = data['M'][0][k]['unit']
        v = {a: [d[k]['p50'] for d in data[a] if k in d] for a in 'MP'}
        lv = [d[k]['p50'] for d in lin if k in d]
        cell = lambda xs: f'{fmt(st.median(xs), unit)} ({fmt(min(xs), unit)}..{fmt(max(xs), unit)})' if xs else '-'
        m, p = st.median(v['M']), st.median(v['P'])
        w = (m - p) / m if unit == 'MB/s' else (p - m) / m
        rs = min(v['P']) > max(v['M']) or max(v['P']) < min(v['M'])
        if w > 0.05 and rs: fails.append(f'{k} {w*100:+.0f}%')
        print(f'| {k} | {cell(v["M"])} | {cell(v["P"])} | {cell(lv)} | {w*100:+.0f}% | {"yes" if rs else "no"} |')
    print('\n(+ is worse.)\n')
    print('L1:', 'PASS' if not fails else 'FAIL: ' + ', '.join(fails))
    print('\n## L2: the tables\n')
    for r in (1, 2, 3):
        for l in grab(f'{runs}/{bench}/r{r}-P/kernel.log', r'autonomous power state'):
            print(f'- r{r}-P:', re.sub(r'^\[[^\]]*\] ', '', l))
        for l in grab(f'{runs}/{bench}/r{r}-M/kernel.log', r'autonomous power state'):
            print(f'- r{r}-M (unexpected):', l)
    for l in grab(f'{runs}/{bench}/linux-LN.txt', r'apst'):
        print('- linux:', re.sub(r'^osbench v=2 os=linux ', '', l))
    print('\n## R1, R2: the first durable write after idle\n')
    med = lambda xs: st.median(xs)
    pm, mm, lm = med([d[AI]['p50'] for d in data['P']]), med([d[AI]['p50'] for d in data['M']]), med([d[AI]['p50'] for d in lin])
    print(f"- p50, median of boots: P' {pm/1e6:.2f} ms, M' {mm/1e6:.2f} ms, Linux {lm/1e6:.2f} ms")
    print(f"- P' over Linux: {(pm-lm)/1e6:+.2f} ms ({(pm-lm)/lm*100:+.0f}%). APST's own price, P' minus M': {(pm-mm)/1e6:+.2f} ms")
    print(f"- worst sample: P' {max(d[AI]['max'] for d in data['P'])/1e6:.2f} ms, M' {max(d[AI]['max'] for d in data['M'])/1e6:.2f} ms, Linux {max(d[AI]['max'] for d in lin)/1e6:.2f} ms")
    if bench == 't14':
        print('\n## R3: the slow mode across the idle row\n')
        for a in 'MP':
            begins = [d for d in data[a] if mode(d[BB]) != 'fast']
            left = [d for d in begins if all(mode(d[k]) == 'fast' for k in AFTER)]
            print(f"- {a}': {len(begins)} of 3 boots began slow or mixed; {len(left)} of those had every durable row after the idle row fast")

#!/usr/bin/env python3
"""Judges the #1202/#1131 A/B by metal/rules.txt. Usage: judge.py <runs dir>"""
import re, sys, os, statistics as st
runs = sys.argv[1]
LINE = re.compile(r'osbench v=2 os=(\w+) bench=(\S+) unit=(\S+) n=(\d+) min=(\S+) p50=(\S+) .*? max=(\S+)')
def rows(path):
    out = {}
    for line in open(path, errors='replace'):
        m = LINE.search(line)
        if m:
            out[m.group(2)] = dict(unit=m.group(3), p50=float(m.group(6)), min=float(m.group(5)), max=float(m.group(7)))
    return out
def when(path):
    for line in open(path, errors='replace'):
        m = re.match(r'\[(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d)', line)
        if m: return m.group(1)
    return '-'
def fmt(v, unit):
    return f'{v/1e6:.2f} ms' if unit == 'ns' and v >= 1e5 else (f'{v/1e3:.1f} us' if unit == 'ns' else f'{v:.0f} {unit}')
DUR = ['persist.write_4k_fsync', 'persist.append_4k_fsync', 'persist.create_fsync_unlink', 'persist.write_4k_fsync_beside_1m']
for bench in ['amd', 't14']:
    print(f'\n# {bench}\n')
    data = {a: [] for a in 'MFP'}
    print('## Per boot: p50 of the durable rows, and the mode (slow: write_4k_fsync p50 over 3 ms)\n')
    print('| boot | started | write_4k_fsync | append_4k_fsync | create_fsync_unlink | beside_1m | fsync_clean | seq_write_fsync | after_idle | mode |')
    print('|---|---|---|---|---|---|---|---|---|---|')
    for r in range(1, 5):
        for a in 'MFP':
            p = f'{runs}/{bench}/r{r}-{a}/kernel.log'
            d = rows(p); data[a].append(d)
            cell = lambda k: fmt(d[k]['p50'], d[k]['unit']) if k in d else '-'
            mode = 'slow' if d['persist.write_4k_fsync']['p50'] > 3e6 else 'fast'
            print(f'| r{r}-{a} | {when(p)} | ' + ' | '.join(cell(k) for k in DUR + ['persist.fsync_clean', 'persist.seq_write_fsync', 'persist.write_4k_fsync_after_idle']) + f' | {mode} |')
    lin = []
    for n in (1, 2, 3):
        d = rows(f'{runs}/{bench}/linux/L{n}.txt'); lin.append(d)
        cell = lambda k: fmt(d[k]['p50'], d[k]['unit']) if k in d else '-'
        print(f'| linux L{n} | - | ' + ' | '.join(cell(k) for k in DUR + ['persist.fsync_clean', 'persist.seq_write_fsync', 'persist.write_4k_fsync_after_idle']) + ' | - |')
    names = sorted(k for k in data['M'][0] if k.startswith(('fs.disk.', 'persist.', 'nvme.')))
    print('\n## Every disk row: median of the four boots\' p50 (min..max over boots)\n')
    print('| row | M | F | P | Linux (3 runs) | F vs M | resolved | P vs F | resolved |')
    print('|---|---|---|---|---|---|---|---|---|')
    verdicts = {'F2': [], 'G3': []}
    def worse(new, old, unit):  # fraction by which new is worse than old
        return (old - new) / old if unit == 'MB/s' else (new - old) / old
    def resolved(xs, ys):
        return min(xs) > max(ys) or max(xs) < min(ys)
    for k in names + ['persist.write_4k_fsync_after_idle']:
        unit = next(d[k]['unit'] for a in 'MFP' for d in data[a] if k in d)
        v = {a: [d[k]['p50'] for d in data[a] if k in d] for a in 'MFP'}
        lv = [d[k]['p50'] for d in lin if k in d]
        def cell(xs):
            return f'{fmt(st.median(xs), unit)} ({fmt(min(xs), unit)}..{fmt(max(xs), unit)})' if xs else '-'
        fm = pf = ''; rfm = rpf = ''
        if v['M'] and v['F']:
            w = worse(st.median(v['F']), st.median(v['M']), unit); rs = resolved(v['F'], v['M'])
            fm = f'{w*100:+.0f}%'; rfm = 'yes' if rs else 'no'
            if w > 0.05 and rs: verdicts['F2'].append((k, w))
        if v['F'] and v['P'] and k != 'persist.write_4k_fsync_after_idle':
            w = worse(st.median(v['P']), st.median(v['F']), unit); rs = resolved(v['P'], v['F'])
            pf = f'{w*100:+.0f}%'; rpf = 'yes' if rs else 'no'
            if w > 0.05 and rs: verdicts['G3'].append((k, w))
        print(f'| {k} | {cell(v["M"])} | {cell(v["F"])} | {cell(v["P"])} | {cell(lv)} | {fm} | {rfm} | {pf} | {rpf} |')
    print('\n(+ is worse. "resolved": every boot of one arm beyond every boot of the other.)\n')
    print('## Verdicts\n')
    print('F1 gain (F median below M):', ', '.join(f"{k.split('.')[1]}: {'yes' if st.median([d[k]['p50'] for d in data['F']]) < st.median([d[k]['p50'] for d in data['M']]) else 'NO'}" for k in DUR))
    print('F2 no regression (>5% worse AND resolved fails):', 'PASS' if not verdicts['F2'] else 'FAIL: ' + ', '.join(f'{k} {w*100:+.0f}%' for k, w in verdicts['F2']))
    ai = 'persist.write_4k_fsync_after_idle'; bb = 'persist.write_4k_fsync'
    cp = st.median([d[ai]['p50'] - d[bb]['p50'] for d in data['P']]); cl = st.median([d[ai]['p50'] - d[bb]['p50'] for d in lin])
    print(f'G1 wake cost: P {cp/1e6:.2f} ms against Linux {cl/1e6:.2f} ms:', 'PASS' if cp <= cl else 'FAIL')
    wp = max(d[ai]['max'] for d in data['P']); wl = max(d[ai]['max'] for d in lin)
    print(f'G2 worst after-idle sample: P {wp/1e6:.2f} ms against Linux {wl/1e6:.2f} ms:', 'PASS' if wp <= wl else 'FAIL')
    print('G3 back to back, P vs F:', 'PASS' if not verdicts['G3'] else 'FAIL: ' + ', '.join(f'{k} {w*100:+.0f}%' for k, w in verdicts['G3']))
    print(f'reported: P after-idle p50 per boot {[round(d[ai]["p50"]/1e6,2) for d in data["P"]]} ms; Linux {[round(d[ai]["p50"]/1e6,2) for d in lin]} ms')

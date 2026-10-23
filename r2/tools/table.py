import sys, statistics, collections
def words(line):
    out = {}
    for w in line.split()[3:]:
        if '=' in w:
            k, v = w.split('=', 1); out.setdefault(k, v)
    return out
def runs(bench_dir):
    rs = []
    for i in (1, 2, 3):
        rs.append([l.rstrip('\n') for l in open(f'{bench_dir}/linux-all-{i}.txt') if l.startswith('osbench v=2')])
    return rs
def table(name, bench_dir):
    rs = runs(bench_dir)
    order, rows, status, conds = [], collections.defaultdict(lambda: [None]*3), {}, collections.defaultdict(set)
    for i, lines in enumerate(rs):
        group = None
        for l in lines:
            w = words(l)
            if 'group' in w: group = w['group']; continue
            if l.split()[3] == 'cond':
                k, v = l.split()[4].split('=', 1); conds[k].add(v); continue
            b = w.get('bench')
            if not b: continue
            key = (group, b)
            if key not in order: order.append(key)
            if 'p50' in w: rows[key][i] = w
            else:
                for s in ('unsupported', 'unmeasured', 'refused'):
                    if s in w: status[key] = f'{s}: {w[s].replace("_", " ")}'
            if 'lan' == b: pass
    out = [f'## {name}', '', 'Three unprivileged `osbench all` runs at f644cefae. Each cell is a run\'s p50; the median is of the three p50s, and spread is (max - min) / median of them. `cpu.clock` lines are omitted.', '']
    keep = ['kernel', 'distro', 'cpu_model', 'cpus', 'threads_per_core', 'governor', 'epp', 'cpufreq_driver', 'ac_online', 'thp', 'smt_active', 'crunch.sensor', 'crunch.stop_c', 'crunch.limit_from', 'dmi.product_version', 'dmi.bios_version']
    out.append('Conditions: ' + '; '.join(f'{k}={"|".join(sorted(conds[k]))}' for k in keep if k in conds))
    out += ['', '| group | bench | unit | run 1 | run 2 | run 3 | median | spread | p99 median | runs 1, 2, 3 |', '|---|---|---|---|---|---|---|---|---|---|']
    for key in order:
        g, b = key
        if b == 'cpu.clock': continue
        r = rows.get(key)
        if r and all(r):
            p50 = [int(x['p50']) for x in r]
            med = statistics.median(p50)
            spread = (max(p50) - min(p50)) / med * 100 if med else 0
            p99 = [int(x['p99']) for x in r if x.get('p99', '-') != '-']
            extra = '; '.join(f'{k}=' + ', '.join(x.get(k, '-') for x in r) for k in ('units_per_s', 'munmaps_per_s', 'windows_refused', 'hottest_c') if k in r[0])
            p99s = f'{int(statistics.median(p99))}' if len(p99) == 3 else '-'
            out.append(f'| {g} | {b} | {r[0]["unit"]} | ' + ' | '.join(map(str, p50)) + f' | {int(med)} | {spread:.1f}% | {p99s} | {extra} |')
        elif key in status:
            out.append(f'| {g} | {b} | | | | | {status[key]} | | | |')
        else:
            out.append(f'| {g} | {b} | | | | | measured in {sum(1 for x in (r or []) if x)} of 3 runs | | | |')
    return '\n'.join(out)
print(table(sys.argv[1], sys.argv[2]))

# table.py <runs-dir>: p50 (and p90) per fs row, per bench, base-1 head-2 base-3 head-4.
import re, sys, os
runs = sys.argv[1]
for bench in ('t14', 'amd'):
    rows = {}
    for boot in ('base-1', 'head-2', 'base-3', 'head-4'):
        p = os.path.join(runs, bench, boot, 'kernel.log')
        if not os.path.exists(p): continue
        for line in open(p, errors='replace'):
            m = re.search(r'bench=(fs\.\S+) unit=(\S+) .*?p50=(\d+) p90=(\d+|-)', line)
            if m:
                rows.setdefault((m[1], m[2]), {})[boot] = (int(m[3]), m[4])
    for (name, unit), v in sorted(rows.items()):
        cells = ''.join(f'{v[b][0]:>10}' if b in v else f'{"-":>10}' for b in ('base-1', 'head-2', 'base-3', 'head-4'))
        print(f'{bench:4} {name:32} {unit:5} {cells}')

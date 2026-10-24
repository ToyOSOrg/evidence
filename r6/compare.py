import sys, statistics, collections
LOWER = {'ns', 'ps', 'ns/MiB', 'ns/page', 'mW', 'us', 'ms'}
HIGHER = {'MB/s', 'kops/s', 'ops/s', 'MHz'}
def words(line):
    out = {}
    for w in line.split()[3:]:
        if '=' in w:
            k, v = w.split('=', 1); out.setdefault(k, v)
    return out
def parse(lines):
    rows, status, groups_done = {}, {}, set()
    group = None
    for l in lines:
        if not l.startswith('osbench v=2'): continue
        w = words(l)
        if 'group' in w:
            group = w['group']
            if 'done' in l: groups_done.add(group)
            continue
        b = w.get('bench')
        if not b or b == 'cpu.clock': continue
        if 'p50' in w: rows[b] = (group, w)
        else:
            for s in ('unsupported', 'unmeasured', 'refused'):
                if s in w: status[b] = (group, s, w[s].replace('_', ' '))
    return rows, status, groups_done
def within(w):
    p50 = int(w['p50']); p90 = w.get('p90', '-')
    return f"{(int(p90) - p50) / p50 * 100:.0f}%" if p90 != '-' and p50 else '-'
UNLIKE = [
    ('persist.', 'not like for like: ToyOS writes the boot USB stick (FAT32 via usbd), Linux its NVMe home'),
    ('mem.memcpy.', 'not like for like: Linux asked for and got huge pages, ToyOS maps 4 KiB'),
    ('mem.bw.', 'not like for like: Linux asked for and got huge pages, ToyOS maps 4 KiB'),
    ('mem.first_touch.2m', 'not like for like: a 2 MiB page fault on Linux, a 4 KiB one on ToyOS'),
    ('mem.map_touch_unmap.2m', 'not like for like: a 2 MiB page fault on Linux, a 4 KiB one on ToyOS'),
    ('mem.realloc_grow.', "not like for like: each system's allocator; Linux's moves pages, ToyOS's copies (inferred from the times)"),
    ('mem.malloc_churn.1048576.', "not like for like: each system's allocator; Linux maps each 1 MiB block (inferred from the rates)"),
    ('time.yield', "not like for like: ToyOS std's yield is a spin hint, Linux's sched_yield"),
]
CRUNCH_ALL = {
    't14': "not like for like: ToyOS ran with no temperature stop, and its all-core clock stayed high where Linux's fell, which issues/the-t14s-thermal-modes-do-not-move-its-package-power-limits.md would explain (ToyOS refuses the firmware's PL1/PL2 writes)",
    'amd': 'not like for like: ToyOS ran with no temperature stop',
}
MACHINE = None
def unlike(b):
    if b.startswith('crunch.all.'):
        return CRUNCH_ALL[MACHINE]
    return next((why for prefix, why in UNLIKE if b.startswith(prefix)), None)
def row(g, b, lr, tr, label=None):
    unit = lr[0][1]['unit']
    p50s = [int(x[1]['p50']) for x in lr]
    med = statistics.median(p50s)
    mid = sorted(lr, key=lambda x: int(x[1]['p50']))[1][1]
    spread = (max(p50s) - min(p50s)) / med * 100 if med else 0
    t = int(tr[1]['p50'])
    ratio = t / med if med else float('nan')
    ahead = 'yes' if (unit in LOWER and t < med) or (unit in HIGHER and t > med) else ('no' if unit in LOWER | HIGHER else '-')
    ahead = unlike(b) or ahead
    return f'| {g} | {label or b} | {unit} | {int(med)} | {spread:.1f}% | {within(mid)} | {t} | {within(tr[1])} | {ratio:.2f} | {ahead} |'
def why_missing(b, group, tdone):
    if b.endswith('.slack1ns'): return "Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above"
    if b.startswith('fs.shm.'): return "Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below"
    if b.startswith(('fair.flat', 'fair.session', 'fair.scope')): return "Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ"
    if b.startswith(('fair.onejob', 'fair.perjob')): return "ToyOS's job groupings; Linux's are flat, session and scope"
    if b.startswith(('fs.tmp.', 'fs.served.')): return 'paired with fs.shm below'
    if group not in tdone: return f'the ToyOS boot never ran group {group}: it ended at lan (killed at the list bound, fixed in ada5bf21c)'
    return None
def main(name, linux_dir, toyos_file):
    global MACHINE
    MACHINE = name
    linux = [parse(open(f'{linux_dir}/linux-all-{i}.txt').read().splitlines()) for i in (1, 2, 3)]
    toyos, tstatus, tdone = parse(open(toyos_file).read().splitlines())
    order = []
    for rows, status, _ in linux:
        for b in list(rows) + list(status):
            if b not in order: order.append(b)
    for b in list(toyos) + list(tstatus):
        if b not in order: order.append(b)
    out = [f'## {name}: ToyOS against Linux', '',
           'Linux: the median of three runs\' p50 at f644cefae; its run-to-run spread is (max - min) / median of the three p50s. '
           'ToyOS: one boot at f644cefae, its p50. Within-run spread is (p90 - p50) / p50 of a run (Linux: of the median run). '
           'Ratio is ToyOS / Linux; "ToyOS ahead" reads the unit: lower is better for times and energy, higher for rates; a row whose two sides do not do the same work says so there instead.', '',
           '| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |',
           '|---|---|---|---|---|---|---|---|---|---|']
    unsupported, linux_only, toyos_only, open_rows = [], [], [], []
    for b in order:
        lr = [r[0].get(b) for r in linux]
        tr = toyos.get(b)
        if all(lr) and tr:
            out.append(row(lr[0][0], b, lr, tr))
        elif b in tstatus and tstatus[b][1] == 'unsupported':
            unsupported.append((b, tstatus[b][2], 'measured' if all(lr) else next((r[1][b][1] for r in linux if b in r[1]), 'absent')))
        elif all(lr) and not tr:
            why = tstatus[b][1] + ': ' + tstatus[b][2] if b in tstatus else why_missing(b, lr[0][0], tdone) or 'not in the ToyOS output'
            linux_only.append((b, why))
        elif tr and not any(lr):
            why = next((f'{r[1][b][1]}: {r[1][b][2]}' for r in linux if b in r[1]), None) or why_missing(b, tr[0], tdone) or 'not in the Linux output'
            toyos_only.append((b, why))
        else:
            open_rows.append((b, next((f'Linux {r[1][b][1]}: {r[1][b][2]}' for r in linux if b in r[1]), ''), f'ToyOS {tstatus[b][1]}: {tstatus[b][2]}' if b in tstatus else ''))
    pairs = []
    for b in order:
        if not b.startswith('fs.shm.'): continue
        lr = [r[0].get(b) for r in linux]
        for target in ('tmp', 'served'):
            tb = 'fs.' + target + b[len('fs.shm'):]
            if all(lr) and tb in toyos:
                pairs.append(row('files', b, lr, toyos[tb], f'{b[len("fs.shm."):]}: Linux shm, ToyOS {target}'))
    out += ['', "### Files: Linux's /dev/shm against ToyOS's /tmp (the kernel's tmpfs) and /home (the DATA file server, in memory)", '',
            '| group | operation | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |',
            '|---|---|---|---|---|---|---|---|---|---|'] + pairs
    slack = []
    for b in order:
        if not b.endswith('.slack1ns'): continue
        lr = [r[0].get(b) for r in linux]
        tb = b[:-len('.slack1ns')]
        if all(lr) and tb in toyos:
            slack.append(row(lr[0][0], b, lr, toyos[tb], f'{tb}: Linux at 1 ns timer slack'))
    out += ['', "### Wakes and sleeps against Linux with its timer slack at 1 ns (ToyOS has no timer slack; Linux's default pads each sleep by up to 50 us)", '',
            '| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |',
            '|---|---|---|---|---|---|---|---|---|---|'] + slack
    out += ['', '### ToyOS reports unsupported', '', '| bench | ToyOS says | Linux |', '|---|---|---|']
    out += [f'| {b} | {why} | {lin} |' for b, why, lin in unsupported]
    out += ['', '### Not compared, and why', '', '| bench | Linux | ToyOS |', '|---|---|---|']
    out += [f'| {b} | {l} | {t} |' for b, l, t in open_rows]
    out += [f'| {b} | measured | {why} |' for b, why in linux_only]
    out += [f'| {b} | {why} | measured |' for b, why in toyos_only]
    print('\n'.join(out))
main(*sys.argv[1:])

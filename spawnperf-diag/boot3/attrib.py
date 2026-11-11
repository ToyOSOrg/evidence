"""Boot 3: where a build-shaped child's CPU goes at j1 and j<cpus>, per bench, mean of rounds 1-3.
Usage: python3 -I attrib.py <bench>=<kernel.log> ...
Reads, per round: the parent's `build jN round R:` line (children summed), each child's exit line
(` n=calls/wall_us/cpu_us/spin_us/shoot_us/split` per syscall number and ` | faults= ... fault_split=`),
and the kernel's `contention <jobs*10+round>:` census."""
import re, sys, collections

NAMES = {6: 'RANDOM', 10: 'CLOSE', 14: 'FSTAT', 50: 'HANDLE_DUP', 59: 'FUTEX_WAKE', 63: 'VM_RESERVE', 64: 'VM_RELEASE',
         99: 'ENDOWMENTS', 102: 'NAMESPACE_OPEN', 105: 'SHM_CREATE', 106: 'SHM_MAP', 133: 'MESSAGE_SEND',
         156: 'PAGED_READ', 159: 'MESSAGE_RECV', 162: 'THREAD_GET_AFFINITY', 171: 'SET_THREAD_POINTER'}


def rounds(lines):
    """(jobs, round, first line, last line) of each printed round: from its `contention 0:` reset to its census."""
    out, start = [], None
    for i, l in enumerate(lines):
        m = re.search(r'contention (\d+): sites=', l)
        if not m:
            continue
        label = int(m.group(1))
        if label == 0:
            start = i
        elif start is not None:
            jobs, rnd = divmod(label, 10)
            if rnd:
                out.append((jobs, rnd, start, i))
            start = None
    return out


def one(lines, jobs, rnd, a, b):
    r = {'syscall': collections.defaultdict(lambda: [0] * 6), 'fault': [0] * 5, 'kids': 0, 'sites': {}, 'cpu_spin': 0,
         'cpu_shoot': 0, 'cpu_served': 0, 'lock_wait': 0}
    for l in lines[a:b]:
        if 'exit: osbench pid=' not in l:
            continue
        r['kids'] += 1
        for n, *v in re.findall(r' (\d+)=(\d+)/(\d+)/(\d+)/(\d+)/(\d+)/(\d+)', l):
            for k in range(6):
                r['syscall'][int(n)][k] += int(v[k])
        m = re.search(r'faults=(\d+) fault_us=(\d+) fault_spin_us=(\d+) fault_shoot_us=(\d+) fault_split=(\d+)', l)
        r['fault'] = [x + int(y) for x, y in zip(r['fault'], m.groups())]
    tag = f'contention {jobs * 10 + rnd}: '
    for l in lines[b:b + 60]:
        if tag not in l:
            continue
        m = re.search(r'sites=\d+ lost=(\d+) lock_wait_us=(\d+)', l)
        if m:
            r['lost'], r['lock_wait'] = int(m.group(1)), int(m.group(2))
        m = re.search(r'site (\S+) waits=(\d+) us=(\d+)', l)
        if m:
            r['sites'][m.group(1)] = (int(m.group(2)), int(m.group(3)))
        m = re.search(r'spin_us=\[([\d,]*)\] shoot_us=\[([\d,]*)\] served_us=\[([\d,]*)\]', l)
        if m:
            s = [sum(int(x) for x in g.split(',') if x) for g in m.groups()]
            r['cpu_spin'], r['cpu_shoot'], r['cpu_served'] = s
    pat = re.compile(rf'build j{jobs} round {rnd}: wall_us=(\d+) .*children summed: wall_us=\d+ cpu_us=(\d+) '
                     r'blocked_ipc_us=(\d+) .*runqueue_wait_us=(\d+) fault_us=(\d+) faults=(\d+) syscalls=(\d+) syscall_us=(\d+)')
    for l in lines[b:b + 60]:
        m = pat.search(l)
        if m:
            r['wall'], r['cpu'], r['ipc'], r['rq'], _, _, _, _ = map(int, m.groups())
            break
    return r


def mean(xs):
    return sum(xs) / len(xs)


def report(bench, path):
    lines = open(path, errors='replace').read().splitlines()
    by = collections.defaultdict(list)
    for jobs, rnd, a, b in rounds(lines):
        by[jobs].append(one(lines, jobs, rnd, a, b))
    print(f'## {bench}: means of rounds 1-3, ms over 256 children unless stated')
    hdr = ('jobs', 'rounds', 'wall', 'child cpu', 'syscall cpu', 'SHM_CREATE cpu', '..spin', 'CLOSE cpu', '..spin',
           'other sys cpu', '..spin', 'RECV cpu', 'fault', '..spin', 'shoot', 'rest (user, exit)', 'machine spin',
           'pmm.rs:93 wait', 'served')
    print('| ' + ' | '.join(hdr) + ' |')
    print('|' + '---|' * len(hdr))
    rows = {}
    for jobs, rs in sorted(by.items()):
        def s(f):
            return mean([f(r) for r in rs]) / 1000
        sc = lambda n, k: s(lambda r: r['syscall'][n][k])
        sys_cpu = s(lambda r: sum(v[2] for n, v in r['syscall'].items() if n != 159))
        recv = sc(159, 2)
        shm, shm_spin, close, close_spin = sc(105, 2), sc(105, 3), sc(10, 2), sc(10, 3)
        other = sys_cpu - shm - close
        other_spin = s(lambda r: sum(v[3] for n, v in r['syscall'].items() if n not in (105, 10, 159)))
        fault, fault_spin = s(lambda r: r['fault'][1]), s(lambda r: r['fault'][2])
        shoot = s(lambda r: sum(v[4] for v in r['syscall'].values()) + r['fault'][3])
        cpu = s(lambda r: r['cpu'])
        rest = cpu - sys_cpu - recv - fault
        row = dict(wall=s(lambda r: r['wall']), cpu=cpu, sys=sys_cpu + recv, shm=shm, shm_spin=shm_spin, close=close,
                   close_spin=close_spin, other=other, other_spin=other_spin, recv=recv, fault=fault,
                   fault_spin=fault_spin, shoot=shoot, rest=rest, mspin=s(lambda r: r['cpu_spin']),
                   pmm=s(lambda r: r['sites'].get('kernel/src/mm/pmm.rs:93', (0, 0))[1]),
                   served=s(lambda r: r['cpu_served'] + r['cpu_shoot']))
        rows[jobs] = row
        vals = [row[k] for k in ('wall', 'cpu', 'sys', 'shm', 'shm_spin', 'close', 'close_spin', 'other', 'other_spin',
                                 'recv', 'fault', 'fault_spin', 'shoot', 'rest', 'mspin', 'pmm', 'served')]
        print(f'| j{jobs} | {len(rs)} | ' + ' | '.join(f'{v:.1f}' for v in vals) + ' |')
    lo, hi = min(rows), max(rows)
    g = {k: rows[hi][k] - rows[lo][k] for k in rows[lo]}
    print(f'\nGrowth of children\'s CPU j{lo} -> j{hi}: {g["cpu"]:.1f} ms; of it SHM_CREATE {g["shm"]:.1f} '
          f'({100 * g["shm"] / g["cpu"]:.0f} %, spin {g["shm_spin"]:.1f}), faults {g["fault"]:.1f} '
          f'({100 * g["fault"] / g["cpu"]:.0f} %, spin {g["fault_spin"]:.1f}), CLOSE {g["close"]:.1f}, other syscalls '
          f'{g["other"]:.1f} (spin {g["other_spin"]:.1f}), MESSAGE_RECV on-CPU {g["recv"]:.1f}, rest {g["rest"]:.1f}.')
    spin = rows[hi]['shm_spin'] + rows[hi]['fault_spin'] + rows[hi]['close_spin'] + rows[hi]['other_spin']
    print(f'At j{hi}: children\'s own lock spin {spin:.1f} ms of {rows[hi]["mspin"]:.1f} ms machine-wide; '
          f'the pmm lock site {rows[hi]["pmm"]:.1f} ms of all contended waits; machine spin per wall '
          f'{rows[hi]["mspin"] / rows[hi]["wall"]:.2f} CPUs.')
    print(f'\n### {bench} contended lock sites, mean us per round')
    sites = collections.defaultdict(dict)
    for jobs, rs in by.items():
        for name in set().union(*[r['sites'] for r in rs]):
            sites[name][jobs] = (mean([r['sites'].get(name, (0, 0))[0] for r in rs]),
                                 mean([r['sites'].get(name, (0, 0))[1] for r in rs]))
    print('| site | ' + ' | '.join(f'j{j} waits | j{j} us' for j in sorted(by)) + ' |')
    print('|---|' + '---|---|' * len(by))
    for name, d in sorted(sites.items(), key=lambda kv: -kv[1].get(hi, (0, 0))[1])[:14]:
        print(f'| {name} | ' + ' | '.join(f'{d.get(j, (0, 0))[0]:.0f} | {d.get(j, (0, 0))[1]:.0f}' for j in sorted(by)) + ' |')
    print(f'\n### {bench} per syscall at j{hi}, mean per round (calls, on-CPU ms, spin ms) against j{lo}')
    print(f'| syscall | calls | j{lo} cpu | j{hi} cpu | j{hi} spin | x |')
    print('|---|---|---|---|---|---|')
    per = {}
    for jobs in (lo, hi):
        for n in set().union(*[r['syscall'] for r in by[jobs]]):
            per.setdefault(n, {})[jobs] = [mean([r['syscall'][n][k] for r in by[jobs]]) for k in range(6)]
    for n, d in sorted(per.items(), key=lambda kv: -kv[1].get(hi, [0] * 6)[2]):
        a, z = d.get(lo, [0] * 6), d.get(hi, [0] * 6)
        x = z[2] / a[2] if a[2] else float('nan')
        print(f'| {NAMES.get(n, n)} | {z[0]:.0f} | {a[2] / 1000:.1f} | {z[2] / 1000:.1f} | {z[3] / 1000:.1f} | {x:.1f} |')
    print()


for arg in sys.argv[1:]:
    bench, path = arg.split('=', 1)
    report(bench, path)

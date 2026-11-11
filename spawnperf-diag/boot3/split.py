"""Boot 3: per-syscall and fault split of build_shaped's children per round, and the contention census.
Usage: python3 -I split.py <kernel.log> <bench>"""
import re, sys, collections

path, bench = sys.argv[1], sys.argv[2]
NAMES = {6: 'RANDOM', 10: 'CLOSE', 14: 'FSTAT', 50: 'HANDLE_DUP', 59: 'FUTEX_WAKE', 63: 'VM_RESERVE', 64: 'VM_RELEASE',
         99: 'ENDOWMENTS', 102: 'NAMESPACE_OPEN', 105: 'SHM_CREATE', 106: 'SHM_MAP', 133: 'MESSAGE_SEND',
         156: 'PAGED_READ', 159: 'MESSAGE_RECV', 162: 'THREAD_GET_AFFINITY', 171: 'SET_THREAD_POINTER'}
lines = open(path, errors='replace').read().splitlines()
# Round windows: from a `contention 0:` reset to the next labelled dump.
rounds = []  # (label, start, end)
start = None
for i, l in enumerate(lines):
    m = re.search(r'contention (\d+): sites=', l)
    if not m:
        continue
    label = int(m.group(1))
    if label == 0:
        start = i
    elif start is not None:
        rounds.append((label, start, i))
        start = None
for label, a, b in rounds:
    jobs, rnd = divmod(label, 10)
    if rnd == 0:
        continue
    per = collections.defaultdict(lambda: [0] * 6)
    faults = [0] * 5
    kids = 0
    for l in lines[a:b]:
        if 'exit: osbench pid=' not in l:
            continue
        kids += 1
        for n, *v in re.findall(r' (\d+)=(\d+)/(\d+)/(\d+)/(\d+)/(\d+)/(\d+)', l):
            for k in range(6):
                per[int(n)][k] += int(v[k])
        m = re.search(r'faults=(\d+) fault_us=(\d+) fault_spin_us=(\d+) fault_shoot_us=(\d+) fault_split=(\d+)', l)
        if m:
            faults = [x + int(y) for x, y in zip(faults, m.groups())]
    print(f'{bench} j{jobs} round {rnd}: children={kids} faults={faults[0]} fault_us={faults[1]} fault_spin_us={faults[2]} fault_shoot_us={faults[3]} fault_split={faults[4]}')
    for n, v in sorted(per.items(), key=lambda kv: -kv[1][2]):
        print(f'  {NAMES.get(n, n):>20} calls={v[0]:6} wall_us={v[1]:8} cpu_us={v[2]:8} spin_us={v[3]:8} shoot_us={v[4]:7} split={v[5]}')
    for l in lines[a:b + 45]:
        if re.search(rf'contention {label}: ', l):
            print('  ' + re.sub(r'^\[[^\]]*\] ', '', l)[:300])

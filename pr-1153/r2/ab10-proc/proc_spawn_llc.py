"""Per boot: for each `tiny` child, the parent's CPU (its spawn line) and the child's (its exit line), as same-LLC
or split counts, with the parent's commonest CPU, beside the proc rows' p50. LLCs 0-7 / 8-15. Usage: proc_spawn_llc.py <runs>"""
import re, sys, os, collections
R = sys.argv[1]
for b in sorted(os.listdir(R), key=lambda d: int(d.split('-')[0])):
    spawn, exit_ = {}, {}
    rows = {}
    for line in open(f'{R}/{b}/kernel.log', errors='replace'):
        m = re.search(r' cpu(\d+) kernel\] spawn: \S+/tiny pid=(\d+)', line)
        if m: spawn[m.group(2)] = int(m.group(1))
        m = re.search(r' cpu(\d+) kernel\] exit: tiny pid=(\d+)', line)
        if m: exit_[m.group(2)] = int(m.group(1))
        m = re.search(r'bench=(proc\.(?:spawn_wait\.tiny|posix_spawn_wait\.tiny|spawn_wait_loop\.100)) .* p50=(\d+)', line)
        if m: rows[m.group(1)] = int(m.group(2))
    pairs = [(spawn[p], exit_[p]) for p in spawn if p in exit_]
    split = sum(1 for a, c in pairs if a // 8 != c // 8)
    same_cpu = sum(1 for a, c in pairs if a == c)
    parents = collections.Counter(a for a, _ in pairs).most_common(2)
    print(f"{b:9s} children={len(pairs)} split={split} ({100 * split // max(len(pairs), 1)}%) same_cpu={same_cpu} parent_cpus={parents} "
          + ' '.join(f"{k.split('.', 1)[1]}={v}" for k, v in sorted(rows.items())))

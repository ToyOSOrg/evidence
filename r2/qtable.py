#!/usr/bin/env python3
"""qtable.py <dir>: the pipe and ipc rows of qbench-<round>-<arm>.log, p50 per arm and round, each arm's mean over base's."""
import sys, re, pathlib, collections
d = pathlib.Path(sys.argv[1])
arms = ["base", "claim", "b4096", "b1024"]
pat = re.compile(r'bench=((?:pipe\.throughput|ipc)\.\S+) unit=(\S+) .*?p50=(\S+)')
v = collections.defaultdict(lambda: collections.defaultdict(list)); units = {}
for arm in arms:
    for r in (1, 2):
        for l in (d / f"qbench-{r}-{arm}.log").read_text(errors="replace").splitlines():
            m = pat.search(l)
            if m:
                v[m[1]][arm].append(float(m[3])); units[m[1]] = m[2]
print(f"{'row':26} {'unit':5} " + " ".join(f"{a:>17}" for a in arms) + "   claim/base b4096/base b1024/base")
for row in sorted(v):
    mean = {a: sum(v[row][a]) / len(v[row][a]) for a in arms if v[row][a]}
    cells = " ".join(f"{str([int(x) for x in v[row][a]]):>17}" for a in arms)
    rat = "   ".join(f"{mean[a] / mean['base']:.2f}" if a in mean else "-" for a in arms[1:])
    print(f"{row:26} {units[row]:5} {cells}   {rat}")

"""tally.py <tag>: scratch. Per arm of logs/<tag>-<round>-<arm>.log: rows, STALLs, other reds, and the
counters_read spans (guest clock) of each guest."""
import re, glob, sys, collections
tag = sys.argv[1]
for arm in ["base", "onecopy", "tas"]:
    n = s = f = 0; spans = []; none = 0
    for path in sorted(glob.glob(f"logs/{tag}-*-{arm}.log")):
        t = open(path, errors="replace").read()
        for m in re.finditer(r"^\S+ +(PASS|STALL|FAIL) +\S+", t, re.M):
            n += 1; s += m.group(1) == "STALL"; f += m.group(1) == "FAIL"
        st, en = {}, {}
        for line in t.splitlines():
            m = re.match(r"\S+ \[serial (\d+)\] \[\s*([\d.]+) test-runner\] ===TEST_(START|END) test_rs_counters_read", line)
            if m: (st if m.group(3) == "START" else en)[m.group(1)] = float(m.group(2))
        for g in st:
            if g in en: spans.append(round(en[g] - st[g], 2))
            else: none += 1
    spans.sort()
    print(f"{arm}: rows {n}, STALLED {s}, other reds {f}; reads ended {len(spans)}, not ended {none}; spans {spans}")

"""Compare one osbench boot's sched, ipc and tail rows against recorded boots.

usage: python3 -I osbench-guard.py <this kernel.log> <recorded toyos-*.txt>...

For each row (bench=...) of the three groups, prints this boot's p50 against
the recorded boots' p50s: their median and range, the ratio to the median
oriented so that >1 means worse, and flags past 2x the median and worse than
the whole recorded range.
"""
import re
import statistics
import sys

GROUPS = ("sched", "ipc", "tail")
LINE = re.compile(r"osbench v=2 os=toyos (?:group=(\w+) (start|done)|bench=(\S+) unit=(\S+) .*?\bp50=(\S+))")


def rows(path):
    out = {}
    group = None
    with open(path, encoding="utf-8", errors="replace") as f:
        for line in f:
            m = LINE.search(line)
            if not m:
                continue
            if m.group(1):
                group = m.group(1) if m.group(2) == "start" else None
                continue
            if group in GROUPS and m.group(5) not in ("-", ""):
                try:
                    out[(group, m.group(3), m.group(4))] = float(m.group(5))
                except ValueError:
                    pass
    return out


def higher_is_better(unit):
    u = unit.lower()
    return "/s" in u or u.endswith("per_s") or u in ("ops", "mhz", "count_per_s")


def main():
    now = rows(sys.argv[1])
    recorded = [rows(p) for p in sys.argv[2:]]
    past2 = worse = 0
    print(f"{'group':6} {'row':48} {'unit':8} {'this':>12} {'rec median':>12} {'rec range':>25} {'worse x':>8} flag")
    for key in sorted(now):
        group, bench, unit = key
        vals = [r[key] for r in recorded if key in r]
        if not vals:
            print(f"{group:6} {bench:48} {unit:8} {now[key]:>12g} {'(not recorded)':>12}")
            continue
        med = statistics.median(vals)
        lo, hi = min(vals), max(vals)
        up = higher_is_better(unit)
        if med == 0 or now[key] == 0:
            ratio = float("nan")
        else:
            ratio = med / now[key] if up else now[key] / med
        out_of_range = now[key] < lo if up else now[key] > hi
        flag = []
        if ratio == ratio and ratio > 2:
            flag.append("PAST-2x")
            past2 += 1
        if out_of_range:
            flag.append("worse-than-range")
            worse += 1
        print(f"{group:6} {bench:48} {unit:8} {now[key]:>12g} {med:>12g} {f'{lo:g}..{hi:g}':>25} {ratio:>8.2f} {' '.join(flag)}")
    print(f"\nrows: {len(now)}; past 2x the recorded median: {past2}; worse than every recorded boot: {worse}")


main()

"""Reads one bench's masked `osbench-compare` table and prints its scoreboard.

usage: python3 -I scoreboard.py <bench name> <compare.md> <issues dir>

The verdict rule, set before the runs:
  behind      osbench-compare's p for the row is under 0.05 (exact two-sided
              Mann-Whitney over the runs' p50s: with 4 boots against 5 Linux
              runs, every run of one system beat every run of the other) and
              ToyOS's median is the worse one. The direction is the unit's:
              times lower, rates higher (compare itself names none for ps).
  ahead       the same, with ToyOS's median the better one
              At four against five p is under 0.05 with no inversion (2/126)
              or one (4/126).
  at parity   not resolved, and the medians within 1.10 of each other
  unresolved  not resolved, and the medians more than 1.10 apart: the spread
              hides a difference of that size, and the row needs more runs
Rows without a better direction, measured by one system only, or measured in
fewer than four runs of a system are listed apart and get no verdict.
The AMD table is ordered by the ratio against Linux's TSC runs.

Hotness is this scoreboard's own ordering, not a declaration in the tree:
  0  the product's stated performance requirements, by proxy: build
     throughput (`work.build_shaped` compresses files) and application launch
     (the spawn rows end at the child's exit)
  1  paths every program pays per operation: system call, clock read, IPC,
     wake and switch, pipe, user copy, page fault, cached file read/write/stat
  2  per-object paths: thread and mapping creation, file metadata, durable
     writes, the LAN
  3  everything else: fairness totals, timers' lateness, the CPU crunch
"""

import glob
import os
import re
import sys

LOWER = {"ns", "ps", "ns/MiB", "ns/page", "us", "ms"}
HIGHER = {"MB/s", "kops/s", "chunks/s", "ops/s"}

TIERS = [
    (0, r"^(work\.build_shaped|proc\.|process\.spawn_wait)"),
    (1, r"^(syscall\.|time\.now|time\.yield|ipc\.|pingpong\.|wake\.|pipe\.throughput|mem\.memcpy|mem\.bw|"
        r"mem\.first_touch|mem\.anon|mem\.map_touch_unmap|mem\.malloc_churn|"
        r"fs\.(mem|disk)\.(read_4k_at|write_4k_at|seq_read|seq_write|stat|fstat|open_close|seek|pread))"),
    (2, r"^(thread\.|mem\.|fs\.|persist\.|lan\.|net\.|nvme\.|work\.)"),
]

AREAS = [
    ("syscall", r"^(syscall\.|time\.now)"),
    ("ipc", r"^(ipc\.|pipe\.)"),
    ("spawn", r"^(proc\.|process\.|thread\.|work\.build)"),
    ("sched/wake", r"^(wake\.|pingpong\.|fair\.|tail\.|time\.)"),
    ("memory", r"^mem\."),
    ("fs memory", r"^fs\.mem\."),
    ("fs disk", r"^fs\.disk\."),
    ("durable", r"^(persist\.|nvme\.)"),
    ("network", r"^(net\.|lan\.|internet\.)"),
    ("cpu", r"^(crunch\.|work\.compress|cpu\.)"),
    ("power", r"^energy\."),
]


def tier(name):
    for t, pat in TIERS:
        if re.match(pat, name):
            return t
    return 3


def area(name):
    for a, pat in AREAS:
        if re.match(pat, name):
            return a
    return "other"


# (row pattern, the one record that owns the row's gap against Linux, the bench it holds for or None for both)
RECORDS = [
    (r"^(proc\.|process\.|thread\.|work\.build_shaped)", "spawning-a-process-costs-toyos-up-to-147-times-linuxs", None),
    (r"^(fs\.disk\.|persist\.seq_read_cached)", "a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call", None),
    (r"^fs\.mem\.", "a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs", None),
    (r"^persist\.seq_write_fsync", "a-sequential-durable-write-on-data-runs-at-about-half-linuxs (open PR #1216's)", "amd"),
    (r"^persist\.", "toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots", "t14"),
    (r"^persist\.create_fsync_unlink", "a-created-fsynced-and-unlinked-file-costs-toyos-more-than-linux", "amd"),
    (r"^pingpong\.", "a-two-thread-ping-pong-costs-toyos-up-to-twice-linuxs-on-the-t14", None),
    (r"^wake\.onto_busy", "a-wake-onto-a-busy-cpu-costs-toyos-1-8-times-linuxs", None),
    (r"^wake\.storm\.drain", "a-wake-storm-drains-up-to-a-quarter-slower-than-linuxs-on-the-t14", None),
    (r"^(wake\.periodic|time\.sleep_late|time\.timer_1ms)", "a-timed-wake-is-later-than-linuxs-without-its-timer-slack", None),
    (r"^ipc\.reqrep(_handle)?\.8", "a-small-message-round-trip-over-a-native-connection-costs-twice-linuxs-on-the-t14", None),
    (r"^(ipc\.reqrep\.|pipe\.throughput|mem\.bw\.copy)", "user-memory-hot-paths-are-slower-than-2-mib-pages", None),
    (r"^mem\.memcpy", "a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs", None),
    (r"^mem\.munmap", "a-tlb-shootdown-reaches-only-the-cpus-that-ran-the-space", None),
    (r"^mem\.(map_unmap_4k|anon)", "user-memory-hot-paths-are-slower-than-2-mib-pages", None),
    (r"^time\.now", "a-clock-read-costs-toyos-half-again-linuxs-on-the-t14", None),
    (r"^time\.yield", "a-yield-costs-toyos-up-to-3-4-times-linuxs", None),
    (r"^fair\.shared", "all-cpu-throughput-in-one-group-reads-under-linuxs", None),
    (r"^crunch\.single", "toyos-uses-what-modern-hardware-offers-for-speed", None),
]


def records(name, issues):
    """The one record that owns the row's gap against Linux, by hand: a name search matches mentions."""
    for pat, rec, bench in RECORDS:
        if re.match(pat, name) and bench in (None, BENCH):
            return [rec]
    return []


def rows(path):
    out = []
    for line in open(path, encoding="utf-8"):
        if not line.startswith("| ") or line.startswith("| bench"):
            continue
        c = [x.strip() for x in line.strip().strip("|").split("|")]
        if len(c) < 11:
            continue
        name, unit, lp, lm, lr, tp, tm, tr, ratio, p, verdict = c[:11]
        try:
            lmv, tmv = float(lm), float(tm)
        except ValueError:
            lmv = tmv = None
        worse = None
        few = min(len([v for v in lp.split(",") if v.strip()]), len([v for v in tp.split(",") if v.strip()])) < 4
        if lmv and tmv and not few:
            if unit in LOWER:
                worse = tmv / lmv
            elif unit in HIGHER:
                worse = lmv / tmv
        if few and lmv and tmv:
            verdict = "fewer than four runs of a system measured it: no verdict"
        out.append(dict(name=name, unit=unit, lp=lp, lm=lm, lr=lr, tp=tp, tm=tm, tr=tr, p=p, said=verdict, worse=worse))
    return out


def verdict(r):
    if r["worse"] is None:
        return None
    w = r["worse"]
    try:
        resolved = float(r["p"]) < 0.05
    except ValueError:
        resolved = False
    if resolved and w != 1:
        return "behind" if w > 1 else "ahead"
    return "at parity" if 1 / 1.10 <= w <= 1.10 else "unresolved"


def num(v):
    try:
        return f"{float(v):,.0f}"
    except ValueError:
        return v


def line(r, issues, with_record):
    cells = [
        str(tier(r["name"])), area(r["name"]), "`" + r["name"] + "`", r["unit"],
        f"{num(r['tm'])} ({r['tr']})", f"{num(r['lm'])} ({r['lr']})",
        f"{r['worse']:.2f}x" if r["worse"] >= 1 else f"{1 / r['worse']:.2f}x faster", r["p"], verdict(r),
    ]
    if TSC:
        try:
            lt = sorted(float(r["lp"].split(",")[i]) for i in TSC)
            mid = sum(lt) / len(lt)
            w = float(r["tm"]) / mid if r["unit"] in LOWER else mid / float(r["tm"])
            cells.append(f"{w:.2f}x" if w >= 1 else f"{1 / w:.2f}x faster")
        except (ValueError, IndexError):
            cells.append("-")
    if with_record:
        cells.append(", ".join(records(r["name"], issues)) or "**none**")
    return "| " + " | ".join(cells) + " |"


TSC = [int(i) - 1 for i in sys.argv[4].split(",")] if len(sys.argv) > 4 else []
BENCH = "amd" if TSC else "t14"


def tsc_worse(r):
    """ToyOS's median against the mean of Linux's TSC runs, above 1 slower."""
    lt = [float(r["lp"].split(",")[i]) for i in TSC]
    mid = sum(lt) / len(lt)
    return float(r["tm"]) / mid if r["unit"] in LOWER else mid / float(r["tm"])


def beats_both(r):
    """Whether every ToyOS boot is better than both of Linux's TSC runs."""
    lt = [float(r["lp"].split(",")[i]) for i in TSC]
    tp = [float(v) for v in r["tp"].split(",")]
    if r["unit"] in LOWER:
        return max(tp) < min(lt)
    return min(tp) > max(lt)


def main():
    bench, compare, issues_dir = sys.argv[1:4]
    issues = {os.path.basename(p)[:-3]: open(p, encoding="utf-8").read() for p in glob.glob(issues_dir + "/*.md")}
    R = [r for r in rows(compare) if not r["name"].startswith("cpu.c")]
    judged = [r for r in R if r["worse"] is not None]
    by = {v: [r for r in judged if verdict(r) == v] for v in ("behind", "unresolved", "at parity", "ahead")}
    print(f"## {bench}\n")
    print(f"{len(R)} rows besides the clock gauges; {len(judged)} have a direction and both systems' values: "
          f"behind {len(by['behind'])}, unresolved {len(by['unresolved'])} "
          f"({sum(r['worse'] > 1 for r in by['unresolved'])} reading behind), "
          f"at parity {len(by['at parity'])}, ahead {len(by['ahead'])}.\n")
    head = "| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict |"
    rule = "|---|---|---|---|---|---|---|---|---|"
    if TSC:
        head += " against Linux's TSC runs |"
        rule += "---|"
    print("### Behind Linux, by hotness and then ratio\n")
    print(head + " record |\n" + rule + "---|")
    for r in sorted(by["behind"], key=lambda r: (tier(r["name"]), -(tsc_worse(r) if TSC else r["worse"]))):
        print(line(r, issues, True))
    if TSC:
        n = sum(beats_both(r) for r in by["ahead"])
        print(f"\nOf the {len(by['ahead'])} rows ahead, every boot beats both TSC runs in {n}; the others: "
              + ", ".join("`" + r["name"] + "`" for r in by["ahead"] if not beats_both(r)) + ".")
    print("\n### Unresolved and reading behind by more than 1.10\n")
    print(head + " record |\n" + rule + "---|")
    for r in sorted([r for r in by["unresolved"] if r["worse"] > 1], key=lambda r: (tier(r["name"]), -r["worse"])):
        print(line(r, issues, True))
    if len(sys.argv) > 4:
        tsc = TSC
        print(f"\n### Not behind by the rule, yet behind both of Linux's TSC runs ({sys.argv[4]}) by more than 1.10\n")
        print("Two runs resolve nothing; these are exploratory. A cell's Linux value is the TSC runs' p50s.\n")
        print("| hot | area | row | unit | ToyOS median (range) | Linux TSC runs | ToyOS against the nearer | rule's verdict | record |")
        print("|---|---|---|---|---|---|---|---|---|")
        found = []
        for r in judged:
            if verdict(r) == "behind":
                continue
            try:
                lt = [float(r["lp"].split(",")[i]) for i in tsc]
            except (ValueError, IndexError):
                continue
            tm = float(r["tm"])
            w = min(tm / v for v in lt) if r["unit"] in LOWER else min(v / tm for v in lt)
            if w > 1.10:
                found.append((tier(r["name"]), -w, r, lt))
        for t, w, r, lt in sorted(found, key=lambda f: f[:2]):
            print(f"| {t} | {area(r['name'])} | `{r['name']}` | {r['unit']} | {num(r['tm'])} ({r['tr']}) | "
                  f"{', '.join(num(v) for v in lt)} | {-w:.2f}x | {verdict(r)} | "
                  f"{', '.join(records(r['name'], issues)) or '**none**'} |")
    print("\n### Every judged row\n")
    print(head + "\n" + rule)
    for r in sorted(judged, key=lambda r: (area(r["name"]), r["name"])):
        print(line(r, issues, False))
    print("\n### Rows with no verdict\n")
    print("| row | unit | ToyOS | Linux | compare says |\n|---|---|---|---|---|")
    for r in R:
        if r["worse"] is None:
            print(f"| `{r['name']}` | {r['unit']} | {r['tp']} | {r['lp']} | {r['said']} |")


main()

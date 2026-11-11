#!/usr/bin/env python3
"""Scratch: read `mprobe` lines of a kernel log; print each row's segments in ns."""
import re, sys, collections
NAMES = {
 1:"dispatch: entered", 2:"dispatch: drains+note_syscall", 3:"exit_to_user check",
 19:"reserve: space fetched", 20:"reserve: locked", 21:"reserve: room", 22:"reserve: place", 23:"reserve: promise",
 47:"build: before a table", 48:"build: table alloc+zero+link", 24:"reserve: build done", 25:"reserve: put (inventory insert, settle)",
 26:"reserve: returned", 27:"reserve: unlocked",
 29:"release: space fetched", 30:"release: locked", 31:"release: room", 32:"release: inventory.remove", 33:"clear: edit leaves",
 50:"tlb: tags.changed", 51:"tlb: local flush by page", 52:"tlb: issue generation", 53:"tlb: IPIs sent", 54:"tlb: wait for targets",
 34:"clear: shootdown 1 returned", 35:"clear: take_owned collected", 36:"clear: futex revoke", 37:"clear: frames freed",
 38:"clear: take_owned done", 39:"clear: unlink tables", 40:"clear: shootdown 2 returned", 41:"clear: tables freed",
 42:"release: unpromise", 43:"release: drop removed", 44:"release: settle", 45:"release: returned", 46:"release: unlocked",
 55:"flush(): entered", 56:"flush(): full flush done", 57:"serve_ipi: entered", 58:"serve_ipi: done",
 250:"probe pair a", 251:"probe pair b",
}
def name(i):
    if i in NAMES: return NAMES[i]
    if 256 <= i < 512: return f"syscall {i-256}: entry (from last probe, through user)"
    if i >= 512: return f"syscall {i-512}: body end"
    return "?"
khz = None
rows = collections.OrderedDict()
for line in open(sys.argv[1], errors="replace"):
    m = re.search(r"mprobe tsc_khz=(\d+)", line)
    if m: khz = int(m.group(1))
    m = re.search(r"mprobe row=(\S+) cpu=(\d+)(.*)", line)
    if m:
        for rec in m.group(3).split():
            i, c, s = map(int, rec.split(":"))
            rows.setdefault(m.group(1), {}).setdefault(int(m.group(2)), []).append((i, c, s))
print(f"tsc_khz={khz}")
for row, cpus in rows.items():
    print(f"\n== {row}")
    for cpu, recs in sorted(cpus.items()):
        print(f" cpu {cpu}")
        for i, c, s in recs:
            print(f"  {i:4d} {name(i):52s} n={c:7d} {s*1e6/khz/c:9.1f} ns each  total {s*1e3/khz:12.0f} us")

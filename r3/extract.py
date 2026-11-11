"""Masked copies of what PR #1216's A/B reads, for the evidence branch. Scratch; never lands.

usage: python3 -I extract.py <mask table> <runs-ab dir> <judge dir> <out dir>

A boot's log keeps only the lines the A/B reads: osbench's, the test markers, the file server's DATA lines
and the diagnostic boot's SEQDIAG lines; the rest of a log names the machine's network. Linux runs, chain
logs and judge logs are kept whole. Every kept line goes through the mask table (pairs of literal and
stand-in, tab-separated, kept outside the evidence) and is then refused if a value of an identifying shape
is left.
"""
import os
import re
import sys

masks_path, runs, judge, out = sys.argv[1:5]
MASKS = [tuple(l.rstrip("\n").split("\t")) for l in open(masks_path) if l.strip()]
KEEP = re.compile(
    r"osbench v=2|===TEST_(START|END)|fileserver: (mounted the DATA volume|Data serving|DATA )|SEQDIAG"
)
REFUSE = [
    re.compile(r"\b(?:\d{1,3}\.){3}\d{1,3}\b"),  # an IPv4 address
    re.compile(r"\b[0-9a-fA-F]{2}(?::[0-9a-fA-F]{2}){5}\b"),  # a MAC address
    re.compile(r"/Users/|/home/|\.local\b"),
]


def mask(line):
    for literal, stand_in in MASKS:
        line = line.replace(literal, stand_in)
    for shape in REFUSE:
        hit = shape.search(line)
        assert not hit, f"an identifying value is left: {hit.group(0)!r} in {line[:120]!r}"
    return line


def write(path, lines):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w") as f:
        f.writelines(mask(l) for l in lines)


for bench in ("t14", "amd"):
    for name in sorted(os.listdir(f"{runs}/{bench}")):
        src = f"{runs}/{bench}/{name}"
        if os.path.isdir(src):
            with open(f"{src}/kernel.log", errors="replace") as f:
                kept = [l for l in f if KEEP.search(l)]
            verdict = open(f"{src}/verdict.txt").read().strip()
            write(f"{out}/boots/{bench}-{name}.txt", [f"# verdict.txt: {verdict}\n"] + kept)
        elif name.endswith((".txt", ".err", ".log")):
            write(f"{out}/{'linux' if name.startswith('linux') else 'chain'}/{bench}-{name}", open(src).readlines())
for name in sorted(os.listdir(f"{judge}/logs")):
    if name.endswith(".log") and name != "slot.log":
        write(f"{out}/judge/{name}", open(f"{judge}/logs/{name}", errors="replace").readlines())

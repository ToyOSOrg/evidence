"""ab.py <metal-dir> <bench> <scoreboard.md> : judge one bench's osbench A/B.

Reads every `osbench v=2 os=toyos bench=... p50=...` line of
<metal-dir>/{base,head}/<bench>/benchcase/boot-N/kernel.log, and for the rows the
landing criteria name (pipe.*, ipc.*, fs.*read_4k*/write_4k*; pingpong.pipe.*
beside them, unjudged) prints each side's p50 per boot, the medians, base's own
boot-to-boot spread (max - min of its p50s) and whether head is slower than base
by more than that spread. A row's recorded value is the scoreboard's ToyOS
median on that bench, where the scoreboard lists the row.
"""
import re
import statistics
import sys
from pathlib import Path

LINE = re.compile(r"osbench v=2 os=toyos bench=(\S+) unit=(\S+) .*?\bp50=(\S+)")


def rows_of(log):
    out = {}
    for line in log.read_text(errors="replace").splitlines():
        m = LINE.search(line)
        if m and m.group(1) not in out and m.group(3) != "-":
            out[m.group(1)] = (m.group(2), float(m.group(3)))
    return out


def judged(name):
    return name.startswith(("pipe.", "ipc.")) or (
        name.startswith("fs.") and ("read_4k" in name or "write_4k" in name))


def scoreboard(path, bench):
    text = Path(path).read_text().splitlines()
    start = next(i for i, l in enumerate(text) if l.startswith("### The T14"))
    amd = next(i for i, l in enumerate(text) if l.startswith("### The AMD bench"))
    end = next(i for i, l in enumerate(text) if l.startswith("### Durable writes"))
    lines = text[start:amd] if bench == "t14" else text[amd:end]
    rec = {}
    for l in lines:
        m = re.match(r"\| \d+ \| `([^`]+)` \| ([\d,]+) \(", l)
        if m:
            rec[m.group(1)] = float(m.group(2).replace(",", ""))
    return rec


def main():
    root, bench, board = Path(sys.argv[1]), sys.argv[2], sys.argv[3]
    sides = {}
    for side in ("base", "head"):
        boots = sorted((root / side / bench / "benchcase").glob("boot-*"))
        sides[side] = [(b.name, rows_of(b / "kernel.log")) for b in boots]
        print(f"{side}: {len(boots)} boot(s): {', '.join(b.name for b in boots)}")
    rec = scoreboard(board, bench)
    names = sorted({n for _, r in sides["base"] for n in r} & {n for _, r in sides["head"] for n in r})
    names = [n for n in names if judged(n) or n.startswith("pingpong.pipe.")]
    flagged, over = [], []
    print(f"\n{'row':40} {'unit':5} {'base p50s':34} {'head p50s':34} {'base med':>9} {'head med':>9} {'spread':>7} {'head/base':>9} verdict")
    for n in names:
        unit = sides["base"][0][1][n][0]
        b = [r[n][1] for _, r in sides["base"] if n in r]
        h = [r[n][1] for _, r in sides["head"] if n in r]
        bm, hm = statistics.median(b), statistics.median(h)
        spread = max(b) - min(b)
        higher_better = unit.endswith("/s")
        slower = (bm - hm) if higher_better else (hm - bm)
        # time ratio: >1 means head slower
        ratio = (bm / hm) if higher_better else (hm / bm)
        verdict = "-"
        if judged(n):
            verdict = "SLOWER beyond spread" if slower > spread else "ok"
            if slower > spread:
                flagged.append(n)
            if n in rec:
                limit_bad = (hm < rec[n] / 2) if higher_better else (hm > 2 * rec[n])
                verdict += f"; rec {rec[n]:g}" + (" OVER 2x" if limit_bad else " within 2x")
                if limit_bad:
                    over.append(n)
            else:
                verdict += "; no record"
        else:
            verdict = "(not judged)"
        fmt = lambda xs: ",".join(f"{x:g}" for x in xs)
        print(f"{n:40} {unit:5} {fmt(b):34} {fmt(h):34} {bm:9g} {hm:9g} {spread:7g} {ratio:9.3f} {verdict}")
    print(f"\njudged rows: {sum(judged(n) for n in names)}; slower beyond base spread: {len(flagged)} {flagged}; over twice the record: {len(over)} {over}")


main()

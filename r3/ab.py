"""PR #1216's A/B under metal/rules-ab.txt (fixed before the boots). Scratch analysis; never lands.

usage: python3 -I ab.py <runs-ab dir>
"""
import re
import statistics
import sys

ROOT = sys.argv[1]
BENCHES = ["t14", "amd"]
ROUNDS = ["r1", "r2", "r3", "r4"]
LINUX = ["linux-L1", "linux-L2", "linux-L3"]
SLOW_NS = 3_000_000
GATED = ("fs.disk.", "nvme.", "persist.")
LINE = re.compile(r"osbench v=2 os=(\w+) bench=(\S+) unit=(\S+) .*?\bp50=(\d+)")


def rows(path):
    out = {}
    with open(path, errors="replace") as f:
        for line in f:
            m = LINE.search(line)
            if m:
                name = m.group(2)
                assert name not in out or name == "cpu.clock", (path, name)
                out[name] = (m.group(3), int(m.group(4)))
    return out


def mode(r, bench="t14"):
    """The T14's drive mode; the rules define no mode for the AMD bench."""
    if bench != "t14":
        return "-"
    return "slow" if r["persist.write_4k_fsync"][1] > SLOW_NS else "fast"


def worse_pct(unit, m, p):
    """How much worse P's figure is than M's, in percent (negative is better)."""
    if unit == "MB/s":
        return (m - p) / m * 100.0
    return (p - m) / m * 100.0


def resolved(unit, ms, ps):
    """'P worse', 'P better' or None: every boot of one arm beyond every boot of the other."""
    if not ms or not ps:
        return None
    lo_better = unit != "MB/s"
    if min(ps) > max(ms):
        return "P worse" if lo_better else "P better"
    if max(ps) < min(ms):
        return "P better" if lo_better else "P worse"
    return None


def compare(label, M, P, names, out):
    out.append(f"\n#### {label}: {len(M)} M boot(s), {len(P)} P boot(s)\n")
    if len(M) < 2 or len(P) < 2:
        out.append("not established: fewer than two boots in an arm\n")
        return "not established"
    out.append("| row | unit | M p50 per boot | P p50 per boot | M median | P median | P worse by | resolved | A1 |")
    out.append("|---|---|---|---|---|---|---|---|---|")
    fails = []
    for name in names:
        ms = [r[name][1] for r in M if name in r]
        ps = [r[name][1] for r in P if name in r]
        if not ms or not ps:
            continue
        unit = M[0][name][0]
        mm, pm = statistics.median(ms), statistics.median(ps)
        w = worse_pct(unit, mm, pm)
        res = resolved(unit, ms, ps)
        fail = w > 5.0 and res == "P worse"
        if fail:
            fails.append(name)
        out.append(
            f"| {name} | {unit} | {', '.join(map(str, ms))} | {', '.join(map(str, ps))} | {mm:g} | {pm:g} | "
            f"{w:+.1f}% | {res or 'no'} | {'FAIL' if fail else 'ok'} |"
        )
    return fails


def main():
    out = []
    verdict = {}
    for bench in BENCHES:
        out.append(f"\n## {bench}\n")
        boots = {}
        for rnd in ROUNDS:
            for arm in "MP":
                boots[(rnd, arm)] = rows(f"{ROOT}/{bench}/{rnd}-{arm}/kernel.log")
        linux = [rows(f"{ROOT}/{bench}/{l}.txt") for l in LINUX]
        c2 = rows(f"{ROOT}/{bench}/C2/kernel.log")
        out.append("| boot | mode (write_4k_fsync p50) | persist.seq_write_fsync | fs.disk.seq_write.1048576 |")
        out.append("|---|---|---|---|")
        for rnd in ROUNDS:
            for arm in "MP":
                r = boots[(rnd, arm)]
                out.append(
                    f"| {rnd}-{arm} | {mode(r, bench)} ({r['persist.write_4k_fsync'][1] / 1e6:.2f} ms) | "
                    f"{r['persist.seq_write_fsync'][1]} | {r['fs.disk.seq_write.1048576'][1]} |"
                )
        for i, r in enumerate(linux, 1):
            out.append(
                f"| Linux L{i} | {mode(r, bench)} ({r['persist.write_4k_fsync'][1] / 1e6:.2f} ms) | "
                f"{r['persist.seq_write_fsync'][1]} | {r['fs.disk.seq_write.1048576'][1]} |"
            )
        out.append(
            f"| C2 (no arm) | {mode(c2, bench)} ({c2['persist.write_4k_fsync'][1] / 1e6:.2f} ms) | "
            f"{c2['persist.seq_write_fsync'][1]} | {c2['fs.disk.seq_write.1048576'][1]} |"
        )
        M = [boots[(r, "M")] for r in ROUNDS]
        P = [boots[(r, "P")] for r in ROUNDS]
        names = sorted({n for r in M + P for n in r if n.startswith(GATED)})
        modes = {mode(r, bench) for r in M + P}
        fails = {}
        fails["all boots"] = compare(f"{bench}, all boots", M, P, names, out)
        if len(modes) > 1:
            for md in sorted(modes):
                fails[md] = compare(
                    f"{bench}, {md} mode only",
                    [r for r in M if mode(r) == md],
                    [r for r in P if mode(r) == md],
                    names,
                    out,
                )
        ungated = sorted({n for r in M + P for n in r if not n.startswith(GATED) and n != "cpu.clock"})
        compare(f"{bench}, rows outside A1 (reported only)", M, P, ungated, out)
        verdict[bench] = (modes, {k: v for k, v in fails.items()})
    out.append("\n## A1 summary\n")
    for bench, (modes, fails) in verdict.items():
        out.append(f"- {bench}: modes {sorted(modes)}; failing rows by comparison: {fails}")
    print("\n".join(out))


main()

#!/usr/bin/env python3
"""judge2.py <runs-dir>: ab2/rules.md rules 1 and 2, per bench; prints rule 3's members."""
import re, sys, pathlib, statistics

CLAIM = "persist.write_4k_fsync_beside_1m"
ALONE = "persist.write_4k_fsync"
MEMBERS = ["a_served_files_read_never_tears_against_its_write", "a_served_file_reads_through_its_paged_object",
           "served_file_offset", "a_pager_s_end_answers_its_waiting_holders_gone", "std_fs"]


def rows(f):
    out = {}
    for l in f.read_text(errors="replace").splitlines():
        m = re.search(r"bench=(\S+) unit=(\S+) .*?p50=([0-9.]+)", l)
        if m and re.match(r"(fs\.disk|fs\.mem|persist)\.", m.group(1)):
            out[m.group(1)] = (m.group(2), float(m.group(3)))
    return out


ok = True
for bench in sorted(p for p in pathlib.Path(sys.argv[1]).iterdir() if p.is_dir()):
    boots = sorted(p for p in bench.iterdir() if p.is_dir())
    base = [rows(b / "kernel.log") for b in boots if b.name.endswith("-base")]
    head = [rows(b / "kernel.log") for b in boots if b.name.endswith("-head")]
    print(f"== {bench.name}: {len(base)} base, {len(head)} head")
    for b in boots:
        v = b / "verdict.txt"
        print(f"   {b.name}: verdict {v.read_text().split()[0] if v.exists() else '?'}")
    if not base or not head:
        ok = False
        continue
    bd = [r[CLAIM][1] - r[ALONE][1] for r in base]
    hd = [r[CLAIM][1] - r[ALONE][1] for r in head]
    met = max(hd) < min(bd) and statistics.mean(hd) <= 0.5 * statistics.mean(bd)
    ok &= met
    print(f"   rule 1: d base {[round(x / 1e6, 3) for x in bd]} ms, head {[round(x / 1e6, 3) for x in hd]} ms, "
          f"ratio {statistics.mean(hd) / statistics.mean(bd):.2f}: CLAIM {'MET' if met else 'NOT MET'}")
    print(f"   (raw {CLAIM}: base {[r[CLAIM][1] for r in base]} head {[r[CLAIM][1] for r in head]})")
    names = sorted(set.intersection(*(set(r) for r in base + head)) - {CLAIM})
    for n in names:
        unit = base[0][n][0]
        bv, hv = [r[n][1] for r in base], [r[n][1] for r in head]
        higher_better = unit not in ("ns", "us", "ms")
        worse = all((h < min(bv)) if higher_better else (h > max(bv)) for h in hv)
        better = all((h > max(bv)) if higher_better else (h < min(bv)) for h in hv)
        bm, hm = statistics.median(bv), statistics.median(hv)
        change = (hm - bm) / bm
        if worse:
            tag = "REGRESSION" if abs(change) > 0.10 else "moved worse <=10%"
            ok &= tag != "REGRESSION"
        elif better:
            tag = "moved better"
        else:
            continue
        print(f"   {n:45} {unit:5} base {bv} head {hv}  {change:+.1%}  {tag}")
    for b in boots:
        if b.name.endswith("-testcases"):
            log = (b / "kernel.log").read_text(errors="replace") if (b / "kernel.log").exists() else ""
            for m in MEMBERS:
                said = re.findall(rf"===TEST_END test_rs_{m} exit=(-?\d+)===", log)
                met = said == ["0"]
                ok &= met
                print(f"   rule 3 {m}: exit {said} {'MET' if met else 'NOT MET'}")
print("ALL MET" if ok else "NOT MET SOMEWHERE")

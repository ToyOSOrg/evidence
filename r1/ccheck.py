#!/usr/bin/env python3
"""ccheck.py <tree> <results-dir>: each C case's stdout against its committed
expectation, filtered as tests/toyos.rs's c_expectation filters it."""
import sys, pathlib
tree, results = map(pathlib.Path, sys.argv[1:])
bad = 0
seen = 0
for r in sorted(results.glob("c-*.txt")):
    case = r.stem[2:]
    text = r.read_text()
    out = text.split("--- stdout ---\n", 1)[1] if "--- stdout ---\n" in text else ""
    exp_path = tree / "tests/corpus/tinycc" / f"{case}.expect"
    if not exp_path.exists():
        continue
    seen += 1
    warned = f"{case}.c:"
    exp = "".join(l + "\n" for l in exp_path.read_text().splitlines() if not (l.startswith(warned) and ": warning: " in l))
    if out.rstrip("\n") != exp.rstrip("\n"):
        bad += 1
        print(f"MISMATCH {case}")
print(f"{seen} compared, {bad} mismatched")
sys.exit(1 if bad else 0)

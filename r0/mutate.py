#!/usr/bin/env python3
"""mutate.py <tree> <name> <file> <old> <new> <cmd...>: replace exactly one
occurrence, run cmd, restore the file byte for byte, print the exit code."""
import subprocess, sys, pathlib
tree, name, rel, old, new, *cmd = sys.argv[1:]
p = pathlib.Path(tree, rel)
orig = p.read_bytes()
s = orig.decode()
assert s.count(old) == 1, f"{name}: {s.count(old)} matches"
p.write_text(s.replace(old, new))
try:
    r = subprocess.run(cmd, cwd=tree, capture_output=True, text=True)
    out = r.stdout + r.stderr
finally:
    p.write_bytes(orig)
assert p.read_bytes() == orig
pathlib.Path(sys.argv[0]).parent.parent.joinpath(f"control-{name}.log").write_text(out)
built = "error[" not in out and "could not compile" not in out
print(f"{name}: rc={r.returncode} built={built}")
for line in out.splitlines():
    if "panicked at" in line or "FAILED" in line or "test result" in line:
        print("   ", line)

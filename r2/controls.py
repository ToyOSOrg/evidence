#!/usr/bin/env python3
"""controls.py <worktree> <logdir>: each mutation applied, its tests run, the file restored."""
import subprocess, sys, pathlib
tree, logs = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
M = [
  ("M1-data-owes-never", "system/fileserver/src/data.rs",
   "self.open.values().any(|open| open.dirty && !open.gone)", "false", "owe"),
  ("M2-fat-owes-never", "system/fileserver/src/fat.rs",
   "self.open.keys().any(|&node| self.carried(node))", "false", "owe"),
  ("M3-files-owes-volume-only", "system/fileserver/src/pages.rs",
   "self.files.values().any(|f| f.dirty.is_some()) || volume.owes()", "volume.owes()", "fsync"),
  ("M4-files-owes-always", "system/fileserver/src/pages.rs",
   "self.files.values().any(|f| f.dirty.is_some()) || volume.owes()", "true", "fsync"),
]
for name, path, old, new, filt in M:
    p = tree / path
    src = p.read_text()
    assert src.count(old) == 1, name
    p.write_text(src.replace(old, new))
    try:
        r = subprocess.run(["cargo", "test", "-p", "fileserver", filt], cwd=tree, capture_output=True, text=True)
        (logs / f"control-{name}.log").write_text(r.stdout + r.stderr + f"\nrc={r.returncode}\n")
        built = "Running" in r.stderr
        print(f"{name}: rc={r.returncode} built={built}", [l for l in r.stdout.splitlines() if "FAILED" in l or "panicked" in l][:3])
    finally:
        p.write_text(src)
st = subprocess.run(["git", "status", "--porcelain"], cwd=tree, capture_output=True, text=True).stdout
print("restored:", st == "")

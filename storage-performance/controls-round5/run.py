import subprocess, sys, shutil, os
sys.path.insert(0, os.path.dirname(__file__))
from mutations import M
root = "<worktree>/lib/bcachefs"
out = os.path.dirname(__file__)
only = sys.argv[1:] 
for entry in M:
    name, f, old, new, test = entry[:5]
    pkg = entry[5] if len(entry) > 5 else 'bcachefs'
    base = root if pkg == 'bcachefs' else root + '/../..'
    if only and name not in only: continue
    path = f"{root}/src/engine/{f}" if pkg == "bcachefs" else f"{root}/../../{f}"
    src = open(path).read()
    assert src.count(old) == 1, (name, src.count(old))
    shutil.copy(path, f"{out}/{name}.orig")
    open(path, "w").write(src.replace(old, new))
    subprocess.run(["git", "diff", "--", path], cwd=root, stdout=open(f"{out}/{name}.patch", "w"))
    try:
        try:
            r = subprocess.run(["cargo", "test", "--release", "-p", pkg, "--lib", test], cwd=root, capture_output=True, text=True, timeout=420)
        except subprocess.TimeoutExpired as t:
            subprocess.run(["pkill", "-f", "target/release/deps/bcachefs-"])
            open(f"{out}/{name}.log", "w").write((t.stdout or b"").decode(errors="replace") + (t.stderr or b"").decode(errors="replace"))
            print(f"{name}: TIMEOUT after 420 s (did not complete)", flush=True)
            continue
        open(f"{out}/{name}.log", "w").write(r.stdout + r.stderr)
        built = "error[" not in r.stderr
        summary = [l for l in (r.stdout + r.stderr).splitlines() if l.startswith("test result") or "panicked" in l or l.startswith("error[")]
        print(f"{name}: exit {r.returncode} built={built} :: {' | '.join(summary)[:400]}", flush=True)
    finally:
        shutil.copy(f"{out}/{name}.orig", path)
        os.remove(f"{out}/{name}.orig")

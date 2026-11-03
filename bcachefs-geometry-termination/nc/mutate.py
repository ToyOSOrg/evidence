#!/usr/bin/env python3
"""mutate.py NAME FILE OLD_FILE NEW_FILE -- test filters...
Applies the replacement, saves the diff, builds and runs the filtered tests,
records the exit code, and restores the file in the same run."""
import subprocess, sys, shutil, pathlib
name, path, old_f, new_f = sys.argv[1:5]
filters = sys.argv[sys.argv.index('--')+1:]
root = pathlib.Path('$WORKTREE')
out = pathlib.Path('$EVIDENCE/nc')
f = root / path
orig = f.read_text()
old, new = pathlib.Path(old_f).read_text(), pathlib.Path(new_f).read_text()
assert orig.count(old) == 1, f"{name}: mutation site not unique ({orig.count(old)})"
try:
    f.write_text(orig.replace(old, new))
    diff = subprocess.run(['git', 'diff', '--', path], cwd=root, capture_output=True, text=True).stdout
    (out / f'{name}.patch').write_text(diff)
    build = subprocess.run(['cargo', 'test', '-p', 'bcachefs', '--lib', '--no-run'], cwd=root, capture_output=True, text=True)
    (out / f'{name}.build.log').write_text(build.stdout + build.stderr)
    print(f'{name}: build exit {build.returncode}')
    if build.returncode == 0:
        run = subprocess.run(['cargo', 'test', '-p', 'bcachefs', '--lib', '--', '--test-threads=4', *filters], cwd=root, capture_output=True, text=True)
        (out / f'{name}.log').write_text(run.stdout + run.stderr)
        print(f'{name}: test exit {run.returncode}')
finally:
    f.write_text(orig)
    assert f.read_text() == orig
    print(f'{name}: restored')

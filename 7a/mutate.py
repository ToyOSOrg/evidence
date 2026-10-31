# mutate.py <worktree> <log> : each mutation applied, its test run, restored.
# A mutation whose test still passes is reported, never retried.
import subprocess, sys, pathlib
tree, log = pathlib.Path(sys.argv[1]), open(sys.argv[2], 'w')
M = [
    ('a truncating open does not empty the object', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''        f.object.resize(0).map_err(word)?;
        f.dirty = None;''',
     '''        let _ = &f;''',
     ['cargo', 'test', '--lib', 'pages::tests::a_truncating_open']),
    ('room drops an open file first', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''        self.opens == 0 && !self.held && self.dirty.is_none()''',
     '''        self.dirty.is_none()''',
     ['cargo', 'test', '--lib', 'pages::tests::room_is_made']),
]
bad = 0
for name, rel, crate, old, new, test in M:
    path = tree / rel
    text = path.read_text()
    assert text.count(old) == 1, f'{name}: the mutation site is not unique'
    path.write_text(text.replace(old, new))
    try:
        r = subprocess.run(test, cwd=tree / crate, capture_output=True, text=True)
        out = r.stdout + r.stderr
        built = 'error[' not in out and 'could not compile' not in out
        verdict = 'RED' if built and r.returncode != 0 else ('DID NOT BUILD' if not built else 'GREEN (control fails)')
        bad += verdict != 'RED'
        log.write(f'=== {name}: {verdict} (exit {r.returncode})\n$ {" ".join(test)}\n{out[-3000:]}\n')
        print(f'{name}: {verdict}')
    finally:
        path.write_text(text)
diff = subprocess.run(['git', 'status', '--porcelain'], cwd=tree, capture_output=True, text=True).stdout
log.write(f'tree after restore: {diff!r}\n')
print('restored' if not diff.strip() else f'NOT RESTORED: {diff}')
sys.exit(1 if bad or diff.strip() else 0)

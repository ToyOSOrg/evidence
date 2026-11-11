# Negative controls: each mutation applied, its patch saved, its tests run, the file restored.
import subprocess, sys, pathlib, difflib
D = pathlib.Path('<scratch>')
W = D / 'wt-step1'
L = D / 'logs/step1-controls'
M = [
  ('m1-fsync-takes-nothing', 'system/fileserver/src/pages.rs',
   'let taken = self.pg().take_dirtied(object).map_err(word)?;',
   'let taken: Option<(u64, u64)> = { let _ = word; None };',
   ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::an_fsync_writes_back_what_a_holder_dirtied']),
  ('m2-no-pool-at-write-back', 'system/fileserver/src/data.rs',
   'let pool = open.pool.as_mut().ok_or((done, Error::Io))?;',
   'let pool = open.pool.as_mut().filter(|_| false).ok_or((done, Error::Io))?;',
   ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::a_holders_writes_reach_the_volume_from_the_pool']),
  ('m3-credit-kept-at-no-holders', 'system/fileserver/src/pages.rs',
   'volume.ungrant(f.node, credit);',
   'let _ = credit;',
   ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::the_room_held_for_holders_comes_back']),
  ('m4-fits-ignores-credit', 'kernel/pure/paged.rs',
   'if dirtying > o.credit {',
   'if dirtying > o.credit && false {',
   ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holders_write_is_checked_whole']),
]
for name, path, old, new, cmd in M:
    f = W / path
    orig = f.read_text()
    assert orig.count(old) == 1, (name, old)
    mutated = orig.replace(old, new, 1)
    (D / 'patches/step1' / f'{name}.patch').write_text(''.join(difflib.unified_diff(orig.splitlines(True), mutated.splitlines(True), 'a/' + path, 'b/' + path)))
    f.write_text(mutated)
    try:
        r = subprocess.run(cmd, cwd=W, capture_output=True, text=True)
        out = r.stdout + r.stderr
        (L / f'{name}.log').write_text(' '.join(cmd) + '\n' + out + f'\nrc={r.returncode}\n')
        built = 'test result' in out or 'running ' in out
        print(name, 'rc', r.returncode, 'built' if built else 'DID NOT BUILD', 'FAILED' if 'FAILED' in out else '')
    finally:
        f.write_text(orig)
print('restored', subprocess.run(['git', 'diff', '--stat'], cwd=W, capture_output=True, text=True).stdout.strip().splitlines()[-1])

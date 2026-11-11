# Negative controls: each mutation applied, its patch saved, its tests run, the file restored.
import subprocess, sys, pathlib, difflib
D = pathlib.Path('<scratch>')
W = D / 'wt-step1'
L = D / 'logs/step1-r1-controls'
M = [('s2-append-at-the-volumes-end', 'system/fileserver/src/pages.rs', '        let end = self.under_hold(identity, |files, size| {\n            let offset = at.unwrap_or(size);', '        let stale = volume.node_meta(node)?.size;\n        let end = self.under_hold(identity, |files, size| {\n            let offset = at.unwrap_or(stale);', ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::an_append_through_the_server_lands_at_the_end'])]
for name, path, old, new, cmd in M:
    f = W / path
    orig = f.read_text()
    assert orig.count(old) == 1, (name, old)
    mutated = orig.replace(old, new, 1)
    (D / 'patches/step1-r1' / f'{name}.patch').write_text(''.join(difflib.unified_diff(orig.splitlines(True), mutated.splitlines(True), 'a/' + path, 'b/' + path)))
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

# Negative controls: each mutation applied, its patch saved, its tests run, the file restored.
import subprocess, sys, pathlib, difflib
D = pathlib.Path('<scratch>')
W = D / 'wt-step1'
L = D / 'logs/step1-r1-controls'
M = [('f1-span-overflows', 'kernel/pure/paged.rs', 'within_reach(offset, len).then(|| len.min(HOLDER_PAGES * PAGE - offset % PAGE))', 'within_reach(offset, len).then(|| len.min((offset / PAGE + HOLDER_PAGES) * PAGE - offset))', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holders_span_stays_in_its_pages_up_to_the_last']), ('f2-room-sees-only-known-dirt', 'system/fileserver/src/pages.rs', 'let dirty: Vec<u64> = self.files.iter().filter(|(_, f)| f.may_owe()).map(|(id, _)| *id).collect();\n        let mut cleaned = false;', 'let dirty: Vec<u64> = self.files.iter().filter(|(_, f)| f.dirty.is_some()).map(|(id, _)| *id).collect();\n        let mut cleaned = false;', ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::a_server_write_at_the_ceiling_writes_back_what_holders_dirtied']), ('f3-server-write-unheld', 'system/fileserver/src/pages.rs', '        let end = self.under_hold(identity, |files, size| {\n            let offset = at.unwrap_or(size);', '        let unheld = |files: &mut Self, f: &mut dyn FnMut(&mut Self, u64) -> Result<u64, Error>| {\n            let size = files.pg().status(files.files[&identity].object).map_err(word)?.size;\n            f(files, size)\n        };\n        let end = unheld(self, &mut |files, size| {\n            let offset = at.unwrap_or(size);', ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::a_refused_server_write_holds_holders_off']), ('f4-writer-overtakes-queued-read', 'kernel/pure/paged.rs', 'let free = self.side == Side::Free && self.readers_waiting == 0 && !self.pager_waiting;', 'let free = self.side == Side::Free && !self.pager_waiting;', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::every_interleaving_reads_whole']), ('s1-two-holders-at-once', 'kernel/pure/paged.rs', 'let free = self.side == Side::Free && self.readers_waiting == 0 && !self.pager_waiting;', 'let free = matches!(self.side, Side::Free | Side::Holder) && self.readers_waiting == 0 && !self.pager_waiting;', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::every_interleaving_reads_whole']), ('s2-append-at-the-volumes-end', 'system/fileserver/src/pages.rs', '        let end = self.under_hold(identity, |files, size| {\n            let offset = at.unwrap_or(size);', '        let stale = volume.node_meta(node)?.size;\n        let end = self.under_hold(identity, |files, _size| {\n            let offset = at.unwrap_or(stale);', ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::an_append_through_the_server_lands_at_the_end']), ('f6-pager-keeps-paid-credit', 'kernel/pure/paged.rs', '            Writer::Pager if state.credited => {\n                self.slot_mut(i).state.credited = false;\n                o.credit += 1;\n            }', '            Writer::Pager if state.credited => {\n                self.slot_mut(i).state.credited = false;\n            }', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holders_paid_credit_comes_back'])]
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

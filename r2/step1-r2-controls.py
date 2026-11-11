# Negative controls: each mutation applied, its patch saved, its tests run, the file restored.
import subprocess, sys, pathlib, difflib
D = pathlib.Path('<scratch>')
W = D / 'wt-step1'
L = D / 'logs/step1-r2-controls'
M = [('b1-span-unchecked', 'kernel/pure/paged.rs', '    if !within_reach(offset, len) {\n        return Err(Refused::PastEnd);\n    }\n    let pages = (offset % PAGE + len).div_ceil(PAGE);', '    let pages = (offset % PAGE).wrapping_add(len).div_ceil(PAGE);', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holders_span_is_whole_or_refused']), ('b1-sdk-any-offset', 'sdk/toyos/src/files.rs', '    offset.checked_add(len as u64).is_some_and(|end| end <= fs::MAX_FILE_BYTES)', '    let _ = (offset, len);\n    true', ['cargo', 'test', '-p', 'toyos', '--lib', 'files::tests::only_a_write_inside_what_a_file_holds']), ('b2-stat-live', 'kernel/pure/paged.rs', '        self.held.unwrap_or((self.size, self.mtime))', '        (self.size, self.mtime)', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holder_states_the_moment']), ('b2-stamp-after-hold', 'system/fileserver/src/pages.rs', '                files.write_held(volume, identity, node, size, offset, data)?;\n                files.stamp(identity, volume.node_meta(node)?.mtime)?;\n            }\n            Ok(end)\n        })?;\n        if !data.is_empty() {', '                files.write_held(volume, identity, node, size, offset, data)?;\n            }\n            Ok(end)\n        })?;\n        if !data.is_empty() {\n            self.stamp(identity, volume.node_meta(node)?.mtime)?;', ['cargo', 'test', '--manifest-path', 'system/fileserver/Cargo.toml', 'pages::tests::a_server_write_stamps_its_time_inside_its_hold']), ('b3-clamp-long-spans', 'kernel/pure/paged.rs', '    if pages > HOLDER_PAGES {\n        return Err(Refused::TooLong);\n    }\n    Ok(pages)', '    Ok(pages.min(HOLDER_PAGES))', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::a_holders_span_is_whole_or_refused']), ('s1-holder-overtakes-waiting-pager', 'kernel/pure/paged.rs', '        let free = self.side == Side::Free && !self.pager_waiting;', '        let free = self.side == Side::Free;', ['cargo', 'test', '-p', 'kernel', '--lib', 'paged::tests::every_interleaving_reads_whole'])]
for name, path, old, new, cmd in M:
    f = W / path
    orig = f.read_text()
    assert orig.count(old) == 1, (name, old)
    mutated = orig.replace(old, new, 1)
    (D / 'patches/step1-r2' / f'{name}.patch').write_text(''.join(difflib.unified_diff(orig.splitlines(True), mutated.splitlines(True), 'a/' + path, 'b/' + path)))
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

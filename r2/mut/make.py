# Writes one host mutation into the worktree, as argv[1] names it: each
# (file, old, new), every `old` there exactly once.
import sys, pathlib
W = pathlib.Path('/Users/jan/Dev/jan/toyos-microcode')
M = {
 'j1-judge-takes-a-refused-line': [('tests/toyos.rs',
   '''        if let Some(line) = out.last().filter(|line| line.outcome == "refused") {''',
   '''        if let Some(line) = out.last().filter(|line| line.outcome == "never") {''')],
 'j2-judge-takes-any-outcome': [('tests/toyos.rs',
   '''lines.iter().find(|line| !["current", "loaded"].contains(&line.outcome.as_str()) || line.running != file)''',
   '''lines.iter().find(|line| line.running != file)''')],
 'j3-judge-takes-any-revision': [('tests/toyos.rs',
   '''lines.iter().find(|line| !["current", "loaded"].contains(&line.outcome.as_str()) || line.running != file)''',
   '''lines.iter().find(|line| !["current", "loaded"].contains(&line.outcome.as_str()))''')],
 'h07-amd-data-checksum-accepted': [('kernel/microcode/src/amd.rs',
   '''    if checksum != 0 {''', '''    if checksum != checksum {''')],
}
for path, old, new in M[sys.argv[1]]:
    p = W / path
    s = p.read_text()
    assert s.count(old) == 1, (sys.argv[1], path)
    p.write_text(s.replace(old, new))

# mk.py <name> <file> : reads (old, new) pairs from stdin separated by lines
# "=====" (old) and "-----" (new); writes <name>.patch, a unified diff of the
# file with each old replaced by its new, checked to apply.
import sys, subprocess, difflib, os
name, path = sys.argv[1], sys.argv[2]
W = '$WORKTREE'
src = open(os.path.join(W, path)).read()
mut = src
for block in sys.stdin.read().split('=====\n')[1:]:
    old, new = block.split('-----\n')
    assert mut.count(old) == 1, (name, old[:80], mut.count(old))
    mut = mut.replace(old, new)
diff = difflib.unified_diff(src.splitlines(True), mut.splitlines(True), 'a/' + path, 'b/' + path)
out = os.path.join(os.path.dirname(sys.argv[0]), name + '.patch')
open(out, 'w').writelines(diff)
subprocess.run(['git', 'apply', '--check', out], cwd=W, check=True)
print(name, 'ok')

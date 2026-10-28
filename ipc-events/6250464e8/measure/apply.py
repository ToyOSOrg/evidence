import shutil, sys
root = sys.argv[1]
m = root + '/tests/guest/osbench/src/main.rs'
s = open(m).read()
assert "mod waitone;" not in s
s = s.replace("mod wake;\nmod work;", "mod wake;\n#[cfg(target_os = \"toyos\")]\nmod waitone;\nmod work;", 1)
a = '    ("ipc", ipc::suite),'
assert a in s
s = s.replace(a, '    ("ipc", ipc_and_waitone),', 1)
s += '''
/// MEASUREMENT ONLY: the ipc group, then the one-handle wait's three ways.
fn ipc_and_waitone() {
    ipc::suite();
    #[cfg(target_os = "toyos")]
    waitone::suite();
}
'''
open(m, 'w').write(s)
shutil.copy(sys.argv[2], root + '/tests/guest/osbench/src/waitone.rs')

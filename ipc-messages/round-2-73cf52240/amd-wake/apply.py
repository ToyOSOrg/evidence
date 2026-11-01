# Measurement only, never committed: the ipcwake group and its metal row.
import shutil
def edit(p, pairs):
    s=open(p).read()
    for old,new in pairs:
        assert s.count(old)==1, (p, old[:70]); s=s.replace(old,new)
    open(p,'w').write(s)
shutil.copy('<scratch>/r2/ipcwake.rs','tests/guest/osbench/src/ipcwake.rs')
edit('tests/guest/osbench/src/main.rs',[
('mod ipc;\n','mod ipc;\nmod ipcwake;\n'),
('const BY_NAME: [(&str, fn()); 2] = [("lan", lan::suite), ("internet", internet::suite)];','const BY_NAME: [(&str, fn()); 3] = [("lan", lan::suite), ("internet", internet::suite), ("ipcwake", ipcwake::suite)];'),
])
edit('tests/guest/osbench/src/ipc.rs',[('\nfn control(peer: &Peer','\npub(crate) fn control(peer: &Peer')])
edit('tests/images/benchcase.toml',[('"bin/osbench_persist" = "/system/bin/osbench"\n','"bin/osbench_persist" = "/system/bin/osbench"\n"bin/osbench_ipcwake" = "/system/bin/osbench"\n')])
edit('tests/toyos.rs',[
('''const BENCHCASE: &[metal::Arm] = &[metal::Arm {''','''/// Measurement only, never lands.
const IPCWAKE: &[metal::Arm] = &[metal::Arm {
    adds_ms: 120_000,
    named_only: true,
    ..metal::once("ipcwake", "tests/images/benchcase.toml", &[], &["osbench_ipcwake", "osbench_ipc"])
}];

const BENCHCASE: &[metal::Arm] = &[metal::Arm {'''),
('''    // ---- one image: tests/images/benchcase.toml, `osbench`'s ToyOS half ----
    (''','''    // ---- one image: tests/images/benchcase.toml, `osbench`'s ToyOS half ----
    // Measurement only, never lands.
    (
        "ipcwake",
        metal::Metal { arms: IPCWAKE, judge: |b| osbench_ran(b[0], &["osbench_ipcwake", "osbench_ipc"]) },
    ),
    ('''),
])

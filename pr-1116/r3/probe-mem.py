import sys
p='tests/toyos.rs'; s=open(p).read()
o='''    const JOBS: [&str; 2] = ["osbench_identity", "osbench_fair"];'''
assert o in s; s=s.replace(o,'''    const JOBS: [&str; 1] = ["osbench_mem"];''',1)
o='''        BootOptions { ready_marker: bootlog::COMPLETE, ..Default::default() },
    );
    let mut console = format!("{}\\n", qemu.boot_log());
    let last = format!("===TEST_END {} ", JOBS[JOBS.len() - 1]);
    await_guest(&mut qemu, &mut console, "osbench's two groups to end", |said| said.contains(&last))?;'''
assert o in s
s=s.replace(o,'''        BootOptions { ready_marker: bootlog::COMPLETE, smp: 4, ..Default::default() },
    );
    let mut console = format!("{}\\n", qemu.boot_log());
    let last = format!("===TEST_END {} ", JOBS[JOBS.len() - 1]);
    let ended = await_guest(&mut qemu, &mut console, "osbench's two groups to end", |said| said.contains(&last));
    for line in console.lines().filter(|l| l.contains("osbench v=2") || l.contains("===TEST_")) {
        eprintln!("  [probe] {line}");
    }
    ended?;''',1)
open(p,'w').write(s)

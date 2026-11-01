"""Point osbench_capability_groups_exit_0 at osbench_sched on 4 CPUs and print
every osbench line, at run time and never committed. Matches by pattern."""
import re
p='tests/toyos.rs'; s=open(p).read()
a=s.index('fn osbench_capability_groups_exit_0()'); b=s.index('\n}\n',a)
body=s[a:b]
body,n1=re.subn(r'const JOBS: \[&str; \d+\] = \[[^\]]*\];','const JOBS: [&str; 2] = ["osbench_ipc", "osbench_files"];',body)
body,n2=re.subn(r'BootOptions \{ ready_marker: bootlog::COMPLETE, \.\.Default::default\(\) \}','BootOptions { ready_marker: bootlog::COMPLETE, smp: 4, ..Default::default() }',body)
body,n3=re.subn(r'(    )await_guest\((&mut qemu, &mut console, "[^"]*", \|said\| said\.contains\(&last\))\)\?;',
  r'\1let ended = await_guest(\2);\n\1for line in console.lines().filter(|l| l.contains("osbench v=2") || l.contains("===TEST_")) {\n\1    eprintln!("  [probe] {line}");\n\1}\n\1ended?;',body)
assert (n1,n2,n3)==(1,1,1),(n1,n2,n3)
open(p,'w').write(s[:a]+body+s[b:])

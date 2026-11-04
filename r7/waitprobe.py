#!/usr/bin/env python3
"""waitprobe.py <tree> base|head: MEASUREMENT ONLY. seg 11 = a pipe read's wait for data; head seg 12 = a claimed pipe read."""
import sys, pathlib, re
tree, arm = sys.argv[1:]
p = pathlib.Path(tree, "kernel/src/syscall/io.rs"); s = p.read_text()
pat = re.compile(r'(Pipe\(pipe\)\)? => \{\n(\s*)let parkable = crate::scheduler::Parkable::at_entry\(\);\n\s*if watch::wait_until\(&parkable, pipe\.read_watch\(\), 0, WaitClass::Pipe, Deadline::never\(\), \|\| pipe\.has_data\(\)\)\n\s*\.is_err\(\)\n\s*\{\n\s*return cancelled\(\);\n\s*\})')
m = pat.findall(s); assert len(m) == 1, len(m)
whole, ind = m[0]
new = whole.replace("let parkable = crate::scheduler::Parkable::at_entry();", "let parkable = crate::scheduler::Parkable::at_entry();\n" + ind + "let t11 = crate::probe::stamp();", 1) + "\n" + ind + "crate::probe::seg(11, t11);"
s = s.replace(whole, new); p.write_text(s)
if arm == "head":
    p = pathlib.Path(tree, "kernel/src/pipe.rs"); s = p.read_text()
    old = "            pipe.held.claim_read(n);\n            (n, pipe.held.first_drain(0, n), boost)"
    assert s.count(old) == 1
    s = s.replace(old, "            pipe.held.claim_read(n);\n            crate::probe::seg(12, crate::probe::stamp());\n            (n, pipe.held.first_drain(0, n), boost)")
    p.write_text(s)
print("ok", arm)

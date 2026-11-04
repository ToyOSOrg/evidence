#!/usr/bin/env python3
"""thrprobe.py <tree>: MEASUREMENT ONLY. A busy child thread's syscalls, logged as it exits."""
import sys, pathlib
p = pathlib.Path(sys.argv[1], "kernel/src/process.rs"); s = p.read_text()
old = "    release_thread(tid);\n    leave(Some(code));\n"
assert s.count(old) == 1
s = s.replace(old, '''    if let Some(handle) = crate::sched::driver::current_handle() {
        let profile = handle.syscalls();
        if profile.calls() > 1000 {
            use core::fmt::Write as _;
            let (counts, ns) = (profile.by_number(), profile.ns_by_number());
            let mut line = alloc::string::String::new();
            for (number, &count) in counts.iter().enumerate() {
                if count > 0 {
                    let _ = write!(line, " {number}={count}:{}", ns[number]);
                }
            }
            log!("probe thread pid={process_pid} calls={}{line}", profile.calls());
        }
    }
''' + old)
p.write_text(s); print("ok")

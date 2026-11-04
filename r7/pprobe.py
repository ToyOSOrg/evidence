#!/usr/bin/env python3
"""pprobe.py <tree>: MEASUREMENT ONLY. seg 8 = a user copy's wait for its space's lock, 9 = its locked walk and pin, 10 = the copy and unpin."""
import sys, pathlib
p = pathlib.Path(sys.argv[1], "kernel/src/user_ptr.rs"); s = p.read_text()
pairs = [
("""            {
                let mut guard = space.lock();
                while count < CHUNK_PAGES && done < len {""", """            let t8 = crate::probe::stamp();
            {
                let mut guard = space.lock();
                crate::probe::seg(8, t8);
                let t9 = crate::probe::stamp();
                while count < CHUNK_PAGES && done < len {"""),
("""                    count += 1;
                    done += n;
                }
            }
            crate::sched::driver::preempt_off(|_| {""", """                    count += 1;
                    done += n;
                }
                drop(guard);
                crate::probe::seg(9, t9);
            }
            let t10 = crate::probe::stamp();
            crate::sched::driver::preempt_off(|_| {"""),
]
for old, new in pairs:
    assert s.count(old) == 1, old[:60]
    s = s.replace(old, new)
# close seg 10 after the unpin loop
old = """            for phys in frames[..count].iter().flatten() {
                crate::mm::pmm::unpin_range(phys & !(PAGE_SIZE - 1), PAGE_SIZE as usize);
            }
"""
assert s.count(old) == 1
s = s.replace(old, old + "            crate::probe::seg(10, t10);\n")
p.write_text(s); print("ok")

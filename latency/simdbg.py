# Apply the measurement-only prints to a tree's simulator (never committed). Usage: python3 -I simdbg.py <tree>
import sys
t = sys.argv[1]
p = f"{t}/kernel/sim/src/invariants.rs"
s = open(p).read()
a = "    for (key, cause, ns) in dispatched {\n        if let Some(process) = vm.process_of(key) {"
assert s.count(a) == 1
s = s.replace(a, "    for (key, cause, ns) in dispatched {\n        if std::env::var_os(\"SIMDBG\").is_some() && ns > 2_250_000 { eprintln!(\"DBG long wait {key:?} {cause:?} {ns} at {:?}\", now); }\n        if let Some(process) = vm.process_of(key) {")
open(p, "w").write(s)

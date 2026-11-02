"""Head arm only: the kernel writes each handled wake's named waker into the diary's Wake record. Measurement only."""
import sys, os
root = sys.argv[1]
def edit(rel, old, new, count=1):
    p = os.path.join(root, rel)
    s = open(p).read()
    assert s.count(old) == count, f"{rel}: expected {count} of {old[:60]!r}, found {s.count(old)}"
    open(p, 'w').write(s.replace(old, new))
edit('kernel/pure/sched/hw.rs', "    Wake { task: TaskKey, name: u64 },", "    Wake { task: TaskKey, name: u64, waker: u32 },")
edit('kernel/pure/sched/cpu.rs', "        self.trace(env, now, TraceKind::Wake { task: key, name: task.ext().name() });\n        task.refresh_affinity();",
     "        self.trace(env, now, TraceKind::Wake { task: key, name: task.ext().name(), waker: cause.waker.map_or(0, |cpu| cpu.0 + 1) });\n        task.refresh_affinity();")
edit('kernel/pure/sched/cpu.rs', "TraceKind::Wake { task: key, name: task.ext().name() });\n                    self.place", "TraceKind::Wake { task: key, name: task.ext().name(), waker: 0 });\n                    self.place")
edit('kernel/pure/sched/cpu.rs', "TraceKind::Wake { task: key, name: ready.ext().name() });", "TraceKind::Wake { task: key, name: ready.ext().name(), waker: 0 });")
edit('kernel/src/trace.rs', "        TraceKind::Wake { name, .. } => (Kind::Wake, Some(name), 0),", "        TraceKind::Wake { name, waker, .. } => (Kind::Wake, Some(name), waker),")
print("waker hunk applied to", root)

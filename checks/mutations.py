# Negative controls for the differential test: each mutation is applied to the committed tree,
# the test is run, and the file is restored. Usage: python3 -I mutations.py <worktree> <log>
import subprocess, sys
wt, log = sys.argv[1], sys.argv[2]
M = [
 ("M1 div_rem's power-of-two remainder halved (equivalent: fine(ns) is a multiple of every power-of-two weight up to 2^48)", "kernel/pure/sched/eevdf.rs",
  "(n >> d.trailing_zeros(), n & (d - 1))", "(n >> d.trailing_zeros(), (n & (d - 1)) >> 1)"),
 ("M1b div_rem's other remainder halved", "kernel/pure/sched/eevdf.rs",
  "(n.div_euclid(d), n.rem_euclid(d))", "(n.div_euclid(d), n.rem_euclid(d) / 2)"),
 ("M2 a lone exit's unfinished request one unit short", "kernel/pure/sched/eevdf.rs",
  "let request_left = mul(e.vd - e.v, e.weight as i128);", "let request_left = mul(e.vd - e.v, e.weight as i128) - 1;"),
 ("M3 a group's member pushed at the end, out of job order", "kernel/pure/sched/queue.rs",
  "self.members.insert(at, (jk, group));", "let _ = at;\n                self.members.push((jk, group));\n                self.members.sort_by_key(|&(k, _)| core::cmp::Reverse(k));"),
 ("M4 a two-CPU mask counted unrestricted", "kernel/pure/sched/queue.rs",
  "self.unrestricted_fair += usize::from(reach == Reach::Any);", "self.unrestricted_fair += usize::from(reach != Reach::One);"),
 ("M5 the whole-job shortcut taken with one thread elsewhere", "kernel/pure/sched/job.rs",
  "if here == all {", "if here + 1 >= all {"),
 ("M6 a mask's reach not refreshed with it", "kernel/pure/sched/task.rs",
  "self.0.reach = self.0.affinity.reach();", ""),
 ("M7 the power-of-two test off by one", "kernel/pure/sched/eevdf.rs",
  "fn div(n: i128, d: i128) -> i128 {\n    if d & (d - 1) == 0 {\n        n >> d.trailing_zeros()", "fn div(n: i128, d: i128) -> i128 {\n    if d & (d - 1) == 0 {\n        (n >> d.trailing_zeros()) + i128::from(n & (d - 1) != 0 && n < 0)"),
]
out = open(log, "w")
def sh(cmd):
    p = subprocess.run(cmd, cwd=wt, shell=True, capture_output=True, text=True)
    return p.returncode, p.stdout + p.stderr
rc, head = sh("git rev-parse HEAD && git status --porcelain --ignore-submodules=none")
out.write(f"HEAD {head}\n")
for name, path, a, b in M:
    src = open(f"{wt}/{path}").read()
    assert src.count(a) == 1, (name, a)
    open(f"{wt}/{path}", "w").write(src.replace(a, b))
    rc_b, o_b = sh("cargo build -p kernel --lib 2>&1 | tail -2")
    rc, o = sh("cargo test -p kernel --lib sched::queue::differential 2>&1")
    verdict = "PASSED (mutation survived)" if rc == 0 else ("FAILED as required" if "panicked at kernel/pure/sched/queue/differential.rs" in o else f"exit {rc}, not the differential test's assertion")
    first = [l for l in o.splitlines() if "panicked" in l or "assertion" in l or "left:" in l][:3]
    out.write(f"=== {name}\n  build exit {rc_b}; test exit {rc}: {verdict}\n  " + "\n  ".join(first) + "\n")
    out.flush()
    print(name, "->", verdict)
    sh(f"git checkout -- {path}")
rc, st = sh("git status --porcelain --ignore-submodules=none")
out.write(f"restored; status: {st!r}\n")

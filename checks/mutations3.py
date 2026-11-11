# Negative controls for the request change, each applied to the committed tree, run, restored.
# Usage: python3 -I mutations3.py <worktree> <log>
import subprocess, sys
wt, log = sys.argv[1], sys.argv[2]
Q = "kernel/pure/sched/queue.rs"
CORE = "cargo test -p kernel --lib sched::cpu::tests::a_brief 2>&1"
POLICY = "cargo test -p kernel-sim --test policy -- an_interactive_wake a_short_request_buys_no_share 2>&1"
BOTH = "(" + CORE + "; a=$?; " + POLICY + "; b=$?; exit $((a|b)))"
M = [
 ("F0 every request a whole slice (main's policy)", Q, [("    (request + burst.clamp(MIN_SLICE_NS, SLICE_NS)) / 2", "    let _ = (request, burst);\n    SLICE_NS")], BOTH),
 ("F1 a group keeps the whole slice", Q, [("                    weight,\n                    request,\n                    carried,", "                    weight,\n                    SLICE_NS,\n                    carried,"),
                                          ("        self.groups.set_slice(&mut self.group_slots, group, request);", "        let _ = request;")], BOTH),
 ("S1 a short request also weighs more", Q, [
   ("        let weight = g.job.group_weight(g.threads.len() as u32);\n        self.groups.reweight(&mut self.group_slots, group, weight);\n    }\n\n    /// Every group",
    "        let weight = g.job.group_weight(g.threads.len() as u32) * SLICE_NS / self.group_slots.slice(group);\n        self.groups.reweight(&mut self.group_slots, group, weight);\n    }\n\n    /// Every group"),
   ("            let weight = g.job.group_weight(g.threads.len() as u32);\n            self.groups.reweight(&mut self.group_slots, group, weight);\n        }\n    }",
    "            let weight = g.job.group_weight(g.threads.len() as u32) * SLICE_NS / self.group_slots.slice(group);\n            self.groups.reweight(&mut self.group_slots, group, weight);\n        }\n    }"),
  ], POLICY),
]
out = open(log, "w")
def sh(cmd):
    p = subprocess.run(cmd, cwd=wt, shell=True, capture_output=True, text=True)
    return p.returncode, p.stdout + p.stderr
rc, head = sh("git rev-parse HEAD && git status --porcelain --ignore-submodules=none")
out.write(f"HEAD {head}\n")
for name, path, edits, tests in M:
    src = open(f"{wt}/{path}").read()
    for a, b in edits:
        assert src.count(a) == 1, (name, a)
        src = src.replace(a, b)
    open(f"{wt}/{path}", "w").write(src)
    rc, o = sh(tests)
    reds = [l for l in o.splitlines() if " ... FAILED" in l or ("panicked at kernel/pure/sched/cpu.rs" in l)]
    verdict = "PASSED (mutation survived)" if rc == 0 else (f"FAILED as required: {len(reds)} test(s) red" if reds else f"exit {rc}, no FAILED line")
    out.write(f"=== {name}\n  exit {rc}: {verdict}\n  " + "\n  ".join(reds[:8]) + "\n")
    out.flush()
    print(name, "->", verdict)
    sh(f"git checkout -- {path}")
rc, st = sh("git status --porcelain --ignore-submodules=none")
out.write(f"restored; status: {st!r}\n")

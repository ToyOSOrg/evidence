# Negative controls for item 2: each mutation applied to the committed tree, its tests run, the file restored.
# Usage: python3 -I mutations2.py <worktree> <log>
import subprocess, sys
wt, log = sys.argv[1], sys.argv[2]
CPU = "kernel/pure/sched/cpu.rs"
LIB = "cargo test -p kernel --lib sched:: 2>&1"
LOOM = "cargo test -p kernel-loom --test loom_sleep 2>&1"
M = [
 ("T1 the skip ignores whether the one-shot fired", CPU,
  "                    && self.env.hw.timer_pending() => {}", "                    && true => {}", LIB),
 ("T2 an idle CPU leaves a pending earlier one-shot too", CPU,
  "                if self.cpu.running.is_some()\n                    && self.cpu.armed", "                if self.cpu.armed", LIB),
 ("T3 the skip leaves a one-shot due later than needed", CPU,
  "self.now < armed && armed <= at", "self.now < armed", LIB),
 ("A1 an ask word read set is not cleared", CPU,
  "            _ => self.asks[word].swap(0, Ordering::Relaxed),", "            asks => asks,", "(" + LIB + "; a=$?; " + LOOM + "; b=$?; exit $((a|b)))"),
 ("A2 a set ask word is read as empty", CPU,
  "        core::array::from_fn(|word| match self.asks[word].load(Ordering::Relaxed) {\n            0 => 0,",
  "        core::array::from_fn(|word| match self.asks[word].load(Ordering::Relaxed) {\n            _ if true => 0,", "(" + LIB + "; a=$?; " + LOOM + "; b=$?; exit $((a|b)))"),
]
out = open(log, "w")
def sh(cmd):
    p = subprocess.run(cmd, cwd=wt, shell=True, capture_output=True, text=True)
    return p.returncode, p.stdout + p.stderr
rc, head = sh("git rev-parse HEAD && git status --porcelain --ignore-submodules=none")
out.write(f"HEAD {head}\n")
for name, path, a, b, tests in M:
    src = open(f"{wt}/{path}").read()
    assert src.count(a) == 1, (name, a)
    open(f"{wt}/{path}", "w").write(src.replace(a, b))
    rc, o = sh(tests)
    failed = [l for l in o.splitlines() if " ... FAILED" in l or "panicked at" in l][:6]
    reds = sum(1 for l in o.splitlines() if l.startswith("test result: FAILED"))
    verdict = "PASSED (mutation survived)" if rc == 0 else (f"FAILED as required ({reds} binary red)" if reds else f"exit {rc} without a test verdict")
    out.write(f"=== {name}\n  `{tests}` exit {rc}: {verdict}\n  " + "\n  ".join(failed) + "\n")
    out.flush()
    print(name, "->", verdict)
    sh(f"git checkout -- {path}")
rc, st = sh("git status --porcelain --ignore-submodules=none")
out.write(f"restored; status: {st!r}\n")

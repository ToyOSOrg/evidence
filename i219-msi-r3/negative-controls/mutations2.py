"""Round 2 negative controls: each mutation applied to one file as a checked
patch, built and run against its named tests, then restored, in one run.

Usage: python3 -I mutations2.py <worktree> <logdir>
"""
import pathlib
import subprocess
import sys

tree = pathlib.Path(sys.argv[1])
logs = pathlib.Path(sys.argv[2])
I219 = "system/netstack/i219"

# (name, file, anchor, replacement, cwd, test command)
MUTATIONS = [
    ("m1-no-auto-mask", f"{I219}/src/lib.rs",
     "        regs.write32(regs::CTRL_EXT, regs.read32(regs::CTRL_EXT) | ctrl_ext::IAME);\n",
     "        let _ = ctrl_ext::IAME;\n",
     I219, ["cargo", "test", "--lib", "--", "--exact", "tests::a_cause_after_the_read_is_a_message_at_the_unmask"]),
    ("m2-no-unmask-at-the-end-of-a-pass", f"{I219}/src/lib.rs",
     "        self.regs.write32(regs::IMS, self.causes.wanted);\n        Ok(Pass {",
     "        Ok(Pass {",
     I219, ["cargo", "test", "--lib", "--", "--exact", "tests::a_cause_after_the_read_is_a_message_at_the_unmask"]),
    ("m7-reclaim-judge-unscoped", "tests/common/claims.rs",
     "    let window = job_records(log, RECLAIM)?;\n",
     "    let window: Vec<&str> = records(log).collect();\n",
     ".", ["cargo", "test", "--test", "toyos-checks", "metal_claim_spends_one_remapping_entry"]),
]

summary = []
for name, rel, old, new, cwd, cmd in MUTATIONS:
    path = tree / rel
    original = path.read_text()
    try:
        assert original.count(old) == 1, f"{name}: the anchor is not unique"
        path.write_text(original.replace(old, new))
        patch = subprocess.run(["git", "-C", str(tree), "diff", "--", rel], capture_output=True, text=True).stdout
        (logs / f"{name}.patch").write_text(patch)
        with (logs / f"{name}.log").open("w") as out:
            run = subprocess.run(cmd, cwd=tree / cwd, stdout=out, stderr=subprocess.STDOUT)
            out.write(f"\n=== {' '.join(cmd)} exit={run.returncode}\n")
        summary.append((name, run.returncode))
    finally:
        path.write_text(original)

for name, code in summary:
    print(name, f"exit={code}")

"""Negative controls for the I219 change: each mutation is applied as a checked
patch to lib.rs, built, its named tests run, and the file restored, in one run.

Usage: python3 -I mutations.py <worktree> <logdir>
"""
import pathlib
import subprocess
import sys

tree = pathlib.Path(sys.argv[1])
logs = pathlib.Path(sys.argv[2])
crate = tree / "system/netstack/i219"
lib = crate / "src/lib.rs"

MUTATIONS = [
    (
        "m1-no-auto-mask",
        "        regs.write32(regs::CTRL_EXT, regs.read32(regs::CTRL_EXT) | ctrl_ext::IAME);\n",
        "        let _ = ctrl_ext::IAME;\n",
        ["a_cause_after_the_read_is_a_message_at_the_unmask"],
    ),
    (
        "m2-no-unmask-at-the-end-of-a-pass",
        "        self.regs.write32(regs::IMS, self.causes.wanted);\n        Ok(Pass {",
        "        Ok(Pass {",
        ["a_cause_after_the_read_is_a_message_at_the_unmask"],
    ),
    (
        "m3-ivar-on-every-part",
        "        if delivery == Delivery::Msix {\n            regs.write32(regs::IVAR",
        "        if true {\n            regs.write32(regs::IVAR",
        ["outside_msix_mode_causes_are_their_fixed_bits", "the_message_is_proven_before_the_function_is_driven"],
    ),
    (
        "m4-silence-passes-the-self-test",
        "    if messages == 0 {\n        return Err(Refusal::Undelivered",
        "    if false {\n        return Err(Refusal::Undelivered",
        ["a_vector_that_never_fires_is_refused_at_the_deadline", "a_message_from_before_the_test_does_not_pass_it",
         "an_allocation_that_routes_nothing_is_refused_as_undelivered"],
    ),
    (
        "m5-no-stale-drain",
        "    taken(irq.taken())?;\n",
        "",
        ["a_message_from_before_the_test_does_not_pass_it"],
    ),
    (
        "m6-bit-22-not-the-ecc-error",
        "            Part::I219 => cause::ECCER,\n            Part::E82574 => 0,",
        "            Part::I219 => 0,\n            Part::E82574 => 0,",
        ["an_uncorrectable_packet_buffer_error_refuses_the_pass"],
    ),
]

original = lib.read_text()
summary = []
try:
    for name, old, new, tests in MUTATIONS:
        assert original.count(old) == 1, f"{name}: the anchor is not unique"
        lib.write_text(original.replace(old, new))
        patch = subprocess.run(["git", "-C", str(tree), "diff", "--", str(lib)], capture_output=True, text=True).stdout
        (logs / f"{name}.patch").write_text(patch)
        log = logs / f"{name}.log"
        with log.open("w") as out:
            build = subprocess.run(["cargo", "test", "--no-run"], cwd=crate, stdout=out, stderr=subprocess.STDOUT)
            out.write(f"\n=== build exit={build.returncode}\n")
            results = []
            for test in tests:
                run = subprocess.run(["cargo", "test", "--lib", "--", "--exact", f"tests::{test}"],
                                     cwd=crate, stdout=out, stderr=subprocess.STDOUT)
                out.write(f"\n=== {test} exit={run.returncode}\n")
                results.append((test, run.returncode))
        summary.append((name, build.returncode, results))
        lib.write_text(original)
finally:
    lib.write_text(original)

for name, built, results in summary:
    print(name, f"build={built}", " ".join(f"{t}={code}" for t, code in results))

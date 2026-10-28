# Each mutation: (name, file, old, new, test expected to fail). Applied, built, run, restored.
import subprocess, sys, pathlib
root = pathlib.Path("<home>/Dev/jan/toyos-amd-wdt")
fch = "lib/tco/src/fch.rs"
M = [
 ("start-in-one-write", fch,
  "    wdt_placeholder", None, None),
]
M = [
 ("start-in-one-write", fch,
  "    fch.write(Register::Control, stopped | Control::RUN);\n    fch.write(Register::Control, stopped | Control::RUN | Control::TRIGGER);",
  "    fch.write(Register::Control, stopped | Control::RUN | Control::TRIGGER);",
  "an_unfed_timer_resets_the_machine_at_its_bound"),
 ("feed-writes-a-constant", fch,
  "    wdt.write(Register::Control, control.kept() | Control::TRIGGER);",
  "    let _ = control;\n    wdt.write(Register::Control, Control::RUN | Control::TRIGGER);",
  "every_write_keeps_the_bits_it_does_not_own"),
 ("survey-stops-nothing", fch,
  "    if stopped {\n        stop(fch);\n    }",
  "    if stopped {\n    }",
  "a_count_the_last_boot_left_running_is_stopped"),
 ("stop-clears-fired", fch,
  "    wdt.write(Register::Control, control.kept() & !Control::RUN);",
  "    wdt.write(Register::Control, control.0 & !Control::RUN);",
  "the_boot_after_an_expiry_reads_it_and_the_next_does_not"),
 ("survey-keeps-reset-stat", fch,
  "                if stat != 0 {\n                    fch.write_u32(PM_S5_RESET_STAT, stat);\n                }",
  "                let _ = stat;",
  "the_boot_after_an_expiry_reads_it_and_the_next_does_not"),
 ("arm-skips-the-tick", fch,
  "    if byte3 != wanted {\n        fch.write_u8(DECODE_EN_BYTE3, wanted);\n    }",
  "    let _ = wanted;",
  "an_unfed_timer_resets_the_machine_at_its_bound"),
]
ok = True
for name, f, old, new, test in M:
    p = root / f
    orig = p.read_text()
    if orig.count(old) != 1:
        print(f"{name}: anchor not found exactly once"); ok = False; continue
    p.write_text(orig.replace(old, new))
    try:
        build = subprocess.run(["cargo", "test", "-p", "toyos-tco", "--test", "fch", "--no-run"], cwd=root, capture_output=True, text=True)
        if build.returncode != 0:
            print(f"{name}: BUILD FAILED\n{build.stderr[-2000:]}"); ok = False; continue
        run = subprocess.run(["cargo", "test", "-p", "toyos-tco", "--test", "fch"], cwd=root, capture_output=True, text=True)
        out = run.stdout + run.stderr
        failed = [l.split()[1] for l in out.splitlines() if l.startswith("test ") and l.endswith("FAILED")]
        print(f"{name}: exit {run.returncode}, failed {failed}")
        if run.returncode == 0 or test not in failed:
            print(f"{name}: EXPECTED {test} TO FAIL"); ok = False
        (pathlib.Path(sys.argv[1]) / f"{name}.log").write_text(out)
    finally:
        p.write_text(orig)
restored = subprocess.run(["git", "diff", "--quiet", "--", fch], cwd=root)
print("restored" if (root / fch).read_text() else "?")
sys.exit(0 if ok else 1)

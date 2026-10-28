# Each mutation: (name, file, old, new, cargo test args, test expected to fail). Applied, run, restored.
import subprocess, sys, pathlib
root = pathlib.Path("<home>/Dev/jan/toyos-amd-wdt")
out = pathlib.Path(sys.argv[1])
fch = "lib/tco/src/fch.rs"; metal = "tests/metal/src/lib.rs"
TCO = ["-p", "toyos-tco", "--test", "fch"]; MET = ["-p", "toyos-metal", "--lib"]
M = [
 ("start-in-one-write", fch,
  "    fch.write(Register::Control, stopped | Control::RUN);\n    fch.write(Register::Control, stopped | Control::RUN | Control::TRIGGER);",
  "    fch.write(Register::Control, stopped | Control::RUN | Control::TRIGGER);", TCO,
  "an_unfed_timer_resets_the_machine_at_its_bound"),
 ("feed-writes-a-constant", fch,
  "    wdt.write(Register::Control, control.kept() | Control::TRIGGER);",
  "    let _ = control;\n    wdt.write(Register::Control, Control::RUN | Control::TRIGGER);", TCO,
  "every_write_keeps_the_bits_it_does_not_own"),
 ("survey-stops-nothing", fch,
  "        if stopped {\n            word &= !Control::RUN;\n        }",
  "", TCO, "a_count_the_last_boot_left_running_is_stopped"),
 ("survey-keeps-fired", fch,
  "        if found.control.fired() {\n            word |= Control::FIRED;\n        }",
  "", TCO, "the_boot_after_an_expiry_reads_it_and_the_next_does_not"),
 ("arm-keeps-stale-fired", fch,
  "    fch.write(Register::Control, stopped | Control::FIRED);",
  "    fch.write(Register::Control, stopped);", TCO,
  "a_fired_bit_the_survey_cannot_read_is_cleared_by_the_arm"),
 ("tick-refusal-leaves-the-count", fch,
  "        stop_where_decoded(fch);\n        return Err(Refused::TickStuck(decode_en));",
  "        return Err(Refused::TickStuck(decode_en));", TCO,
  "a_refusal_after_the_decode_leaves_the_timer_stopped"),
 ("survey-ignores-the-alternate-base", fch,
  "    let alternate = fch.read_u8(PM_ALT_ACPI_MMIO_EN);\n    if alternate & 1 != 0 {\n        return Err(Unsurveyed::AlternateBase(alternate));\n    }",
  "", TCO, "what_firmware_holds_is_refused_by_name"),
 ("survey-keeps-reset-stat", fch,
  "                if stat != 0 {\n                    fch.write_u32(PM_S5_RESET_STAT, stat);\n                }",
  "                let _ = stat;", TCO,
  "the_boot_after_an_expiry_reads_it_and_the_next_does_not"),
 ("arm-skips-the-tick", fch,
  "    if byte3 != wanted {\n        fch.write_u8(DECODE_EN_BYTE3, wanted);\n    }",
  "    let _ = wanted;", TCO, "an_unfed_timer_resets_the_machine_at_its_bound"),
 ("panic-page-accepted", metal,
  "    if !bootlog::sealed_nothing(loader) {\n        return None;\n    }\n",
  "", MET, "a_watched_wedge_is_ended_by_the_chipsets_reset"),
 ("unwatched", metal,
  "watched.then(|| reset_by_the_chipset(loader)).flatten()", "reset_by_the_chipset(loader)", MET,
  "a_watched_wedge_is_ended_by_the_chipsets_reset"),
 ("any-pass", metal,
  "    let after = bootlog::after_the_reset(loader)?;\n", "    let after = loader;\n", MET,
  "a_watched_wedge_is_ended_by_the_chipsets_reset"),
]
ok = True
for name, f, old, new, args, test in M:
    p = root / f; orig = p.read_text()
    if orig.count(old) != 1:
        print(f"{name}: anchor not found exactly once"); ok = False; continue
    p.write_text(orig.replace(old, new))
    try:
        (out / f"{name}.patch").write_text(subprocess.run(["git", "diff", "--", f], cwd=root, capture_output=True, text=True).stdout)
        build = subprocess.run(["cargo", "test", *args, "--no-run"], cwd=root, capture_output=True, text=True)
        if build.returncode != 0:
            print(f"{name}: BUILD FAILED\n{build.stderr[-1500:]}"); ok = False; continue
        run = subprocess.run(["cargo", "test", *args], cwd=root, capture_output=True, text=True)
        log = run.stdout + run.stderr
        failed = [l.split()[1] for l in log.splitlines() if l.startswith("test ") and l.endswith("FAILED")]
        failed = [t.rsplit("::", 1)[-1] for t in failed]
        print(f"{name}: exit {run.returncode}, failed {failed}")
        if run.returncode == 0 or test not in failed:
            print(f"{name}: EXPECTED {test} TO FAIL"); ok = False
        (out / f"{name}.log").write_text(log)
    finally:
        p.write_text(orig)
sys.exit(0 if ok else 1)

# PR #1132 r1: stage 2's checks, at display-stage2 b0c58dc88

Every log starts with the revision it ran at, and ends with the command's exit code.

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps green. It includes `toyos-tgl-display`'s 31 tests.
- `unit-tgl-display.log`: `cargo test -p toyos-tgl-display`, exit 0, 31 passed.
- Negative controls. Each `mutation-<name>.patch` is applied with `git apply`, the tests run, and the patch is reverted in the same run with a clean tree after. Each mutation compiles, and its run fails with exit 101:
  - `mutation-window`: a main program's header writes are no longer held to 80000h-8FFFFh. `a_main_program_outside_the_window_is_refused` fails.
  - `mutation-ctl2`: PWR_WELL_CTL2's requests are never withdrawn. Three tests fail: the T14 order, DC already allowed, and a held well.
  - `mutation-readback`: the CSR storage is not read back. `storage_that_does_not_hold_the_program_stops_before_any_well` fails.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `image-licence.txt`: the built image's sha256, and one occurrence of `Intel-i915-firmware-license.txt` in its bytes.

The T14 boot (`display-stage2-ab` df14d21d6) is staged, and has not run yet.

Paths are masked.

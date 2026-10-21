# ToyOS PR 971: usbd drives every xHCI controller

The checks ran at `bab43d811` (and `3d7b1c9f5`, which had the same tree except
`tests/guest/rust-tests/src/bin/endowment_denied.rs`, a binary that no host step builds and
no guest row runs). Paths are masked as `<home>`, `<dev>` and `<tmp>`.

- `ci-host.log`: `cargo run -- --ci host`, exit 0, "86 step(s), all green".
- `build-x86_64.log`, `build-aarch64.log`: `cargo run -- --build-only [--arch aarch64]`,
  exit 0 for both.
- `guest.log`: `cargo test --test toyos-build`. 61 of 62 passed. The one red is
  `crypto_instrument_prints_its_table`: "printed 74 of 77 rows", which is the console drop
  below.
- `stage-t14.log`, `stage-amd.log`: `--metal --metal-readback` staging. No machine was
  touched.
- `mut/`: each negative control as a patch with its run log. Every one is red on an
  assertion and was restored in the same run.
  - x1–x9: the driver's rules.
  - i1–i5: the input link.
  - h1–h10: the HID reader.
- `console-drop/`: why `crypto_instrument_prints_its_table` hangs, or loses rows, on this
  host (`issues/qemu-drops-console-output-the-harness-is-slow-to-read.md`).
  - `diagnostics.patch`: the temporary probes. They are not in the PR.
  - `diag11-console.log`: what the harness read. It includes logkeeper's `[dbg-lk]`
    lines: every runner line read and written, nothing held, ring position equal to its
    head, nothing refused.
  - `diag11-uart.log`: the kernel's records, teed to the 16550. They show the console
    queue empty, nothing owed, and `exit: test-runner ... code=82` (its watchdog: it had
    printed TEST_END).
  - `no-usbd-run.log`: the same hang with no usbd row in the image.
  - `base-e07354fb1-run.log`: the same hang at the branch's base.

# ToyOS PR 971, review round 1, checks at `aa0d01b59`

Paths are masked as `<home>`, `<dev>` and `<tmp>`.

- `ci-host.log`: `cargo run -- --ci host`, exit 0, "86 step(s), all green".
- `build-x86_64.log`, `build-aarch64.log`: `cargo run -- --build-only`, exit 0 for both.
- `guest.log`: `cargo test --test toyos-build`, exit 0, 64 of 64. This includes
  `the_log_lands_on_the_boot_stick` and `a_usb_key_reaches_the_console`.
- `mut/`: every negative control applied as a patch, with its run log, red and
  restored.
  - `x1-rerun-bab43d811.log`: x1 rerun on the final driver code. It is red on the
    same assertion as before.
  - `x10`: the CLEAR_FEATURE failure left unreclaimed. Red: it panics at the
    Op drop.
  - `k1`: usbd drops every key record. Red: the USB key smoke stalls.
  - `l1`: usbd's writes turned into reads. Red: the stick's volume holds no
    load line.
  - `s1`: the supervisor tells no driver. Red: no usbd end before the kernel's
    stop.
  - `s2`: the stop writes no port reset. Red on the stub (reset 0 of 2) and in
    QEMU (usbd exit 3).
  - `*.rerun.log`: s1, s2 and l1 rerun after the row gained its load.
- `qemu-load-jobs-by-hand.log`: `stick_write` and `tone_beside_stick_write` run
  once in QEMU by a temporary edit that was not committed. Both ended 0.
- `metal-bab43d811-*-loader.log`: the three metal boots' loader logs, which
  carry the black box. None of those boots had a logkeeper file on the stick.
- `diag-kernel.patch`: the temporary diagnostic kernel for the next metal boot.
  It tees the storage path's program lines and kernel records into the black
  box. It is not in the PR.

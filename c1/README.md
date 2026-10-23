# Storage C1: file protocol v2, the *at calls, pread and file times

Branch `storage-c1`, commit 7d5f1e0ab on `main` 89f92a4bd (PR #1042). Masked: home, worktree, scratch and temp paths, MAC addresses.

## Host and builds

- `host/ci-host.log`: `cargo run -- --ci host` on the tree of 7d5f1e0ab, exit status on the last line (0).
- `build/build-only-x86_64.log`, `build/build-only-aarch64.log`: `cargo run -- --build-only [--arch aarch64]` at 7d5f1e0ab, exit 0. `build-only-aarch64-disk-full.log` is the first AArch64 attempt, which stopped on a full host disk (`No space left on device`).
- `build/metal-readback.log`, `build/metal-request.txt`: the metal request, staged with `--metal --metal-readback`; no machine was touched (exit 2, "staged").

## QEMU x86-64 (`tests/images/testcases.toml`, interactive `--debug` boot)

The harness runs corpus cases and shared Rust members only on metal, so they ran here through `cargo test --test toyos-build -- --debug`, one test per `run` command, each file the harness's result (exit code, stdout, stderr). A corpus case's stdout was compared byte for byte with its `.expect`.

- `boot2-*`: corpus cases at the first full tree. All match their `.expect`.
- `boot3-*`: Rust members. All exit 0 except `readdir_bound`, which needs a boot of its own (its row says so).
- `readdir-diag.txt`: `readdir_bound` alone, with a temporary print: the iterator's `Err(OutOfMemory)`, because opening a directory numbers it out of the same 16 384 as the listing bound. `readdir-alone.txt`: alone, after the test change in 7d5f1e0ab, exit 0.
- `boot9-*`: a broader batch in one boot. `ccheck` (exit 3) is the comparator helper, which has no expectation of its own. `c_210_stat_identity` (exit 1) ran after `mkdir_cap`, which fills the kernel's directory cap; it matches in `boot2`.
- `boot10-*`: `214_at_calls` (with its concurrent `pwrite` cases), `211` and `206` at 7d5f1e0ab's sources. All match.

## Negative controls

- `controls/pread-pwrite-seek.patch`, applied, built, run, and reverted: libc's `pread` and `pwrite` as seek, transfer and seek back. `qemu/214-mutated.txt`: `pread beside a read` and `pwrite beside a write` are red on `/home` and `/tmp`, and so is `pwrite at its offset on /home`.
- `controls/cursor-by-count.patch` and `.log`: a listing cursor that counts entries. `removing_what_was_listed_skips_nothing_after_it` is red.

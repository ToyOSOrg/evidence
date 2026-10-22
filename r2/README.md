# ToyOSOrg/ToyOS#970, round 2 (rebased onto main after #988 and #991)

Head `6f398f518bc814f9d6819f696c8d9c584380bd62` on `c36253222`, rust `9d8bb4c347f`, with a clean tree before and after (`checks.txt`). Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 0 (87 steps) |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | `cargo test --test toyos-build -- hosted_clang_hello libc_children` | 1: `libc_children` passes; `hosted_clang_hello` installs (0) and compiles (`clang -c` 0), then `cc hello.c` fails at the driver's `posix_spawn` of `cc1` |
| guest-errno-with-real-strerror.log | the same row with libc's real `strerror` applied temporarily (the libc follow-up's change) | 1: `posix_spawn failed: Cannot allocate memory` |
| guest-diag-std-spawns-lld.log | a diagnostic variant: a std parent spawns `/apps/clang/bin/ld.lld --version` | that spawn 0; the driver's still fails |
| guest-diag-driver-commands.log | a diagnostic variant: `cc -###` and `clang -###` | 0; `clang -v` link fails at the cc1 spawn |

The two diagnostic variants were applied as an uncommitted change to the guest program, run, and reverted.

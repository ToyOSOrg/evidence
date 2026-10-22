# ToyOSOrg/ToyOS#970, round 3

Head `3cbebc5b3c7250026551f7017e1712634d790cc0` on `106a9e09e` (#998), rust `9d8bb4c347f`, clean tree before and after (`checks.txt`). `served_image` is gone; posix_spawn uses #998's `toyos::files::read_image`.

| file | command | exit |
|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `--build-only [--arch aarch64]` | 0, 0 |
| guest.log | `hosted_clang_hello libc_children` | 1: `libc_children` passes; `hosted_clang_hello` installs and compiles, then the driver's spawn of cc1 fails, as in r2 (main's `strerror` still says "unknown error"; r2's `guest-errno-with-real-strerror.log` has ENOMEM) |

# ToyOSOrg/ToyOS#970, round 3 (review r1 fixes, rebased onto #998)

Head `3cbebc5b3c7250026551f7017e1712634d790cc0` on `106a9e09e` (#998), rust `9d8bb4c347f`, clean tree before and after (`checks.txt`). Masked as in r2.

| file | command | exit |
|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 0 (87 steps) |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | `hosted_clang_hello libc_children` | 1: `libc_children` passes; `hosted_clang_hello` installs (0), compiles (0), and `cc` fails at its `posix_spawn` of `cc1`, through #998's `read_image`. main's `strerror` still says "unknown error"; r2's `guest-errno-with-real-strerror.log` read it as `ENOMEM` on the same path |

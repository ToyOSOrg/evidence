# PR 1276: host evidence

Branch `mio-registration-wakes-selector`, base main `3c5c55584`. Fork commit `3e070f61d683d034def4f20e625cef4c44d5ef8f` on ToyOSOrg/mio `toyos`. Host: macOS arm64. Paths, user and host names are masked.

| file | command | revision | exit |
|---|---|---|---|
| `mio-ci-host.log` | `cargo run -- --ci host` | `f9e3135d22b4fa3bf06e2bec47b3add543419be5` | 1: 1 of 123 steps red, the build system's `cargo test --lib`, whose one failure is `the_caller_s_environment_reaches_neither_the_build_nor_the_key` (`issues/the-llvm-environment-test-breaks-git-on-macos.md`); the other FAILED lines are the models' negative controls, each reaching its verdict |
| `mio-build-only.log` | `cargo run -- --build-only` | `f9e3135d2` | 0 |
| `mio-guestbuild.log` | `guestbuild.sh <worktree> <sysroot 0dd1ef87d639f652> "" mio_registers_while_parked mio_waker_coalesces`, the guest crate built as `build/build.rs`'s `build_toyos_bin` builds it | `f48024a32` (the code of `f9e3135d2`, whose diff is comments) | 0 |

`guestbuild.sh` is a scratch script, not part of the tree. It runs `cargo build --target x86_64-unknown-toyos --profile toyos` in `tests/guest/rust-tests` with `RUSTUP_TOOLCHAIN` set to the sysroot, and `CC_`, `AR_` and `CFLAGS_` set for the toolchain's clang and the C sysroot. That is `cargo_build_as`'s environment.

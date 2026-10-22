# #1005: russh's p384 on its bignum backend

- `p384-base-build.log`: `cargo run -- --build-only` at main 27ab916b7, before the change. Exit 0, and it shows `Compiling fiat-crypto v0.3.0`.
- `p384-fix-build.log`: the same build at 075db4185. Exit 0, with no fiat-crypto compile.
- `p384-fiat-proof.txt`: the `x86_64-unknown-toyos` `p384` fingerprint before and after, and where fiat artifacts lie.
- `p384-ci.log`: `cargo run -- --ci host` at 075db4185. Exit 0, 87 steps green.
- `p384-ci-enospc.log`: the first attempt, which ran the disk out and proved nothing.
- `p384-bignum-tests.log`: `p384` 0.14.0-rc.8's own `cargo test --all-features` with `--cfg p384_backend="bignum"`. Exit 0, and fiat is never compiled.
- `p384-rebased-build.log`: `--build-only` at the rebased head 57ea8819b. Exit 0.

Paths are masked to `~`.

# #1005 review round 1

- `p384-ci-r1.log`: `cargo run -- --ci host` at 177651f813987ea10828b6d8042681982d0b3a4c. Exit 0, 87 steps green. `fiat-lines-by-step.txt` lists each fiat-crypto line next to the step it falls in.
  - `system/sshserver` (host test) and the apps for linux, macos and windows: no `Compiling` or `Checking fiat-crypto` line. At 075db4185 these steps had one each (review finding 1).
  - The two lines left are `toyos-crypto, dispatched` and `clippy, warnings denied`. Both come from main's `toyos-crypto` dev-dependency `fiat-crypto = "0.3"` (`lib/crypto/Cargo.toml:41`), which #993 removes.
- `p384-bignum-tests-073.log`: `p384` 0.14.0-rc.8's own suite, in a scratch copy of the registry source.
  - Its lock was aligned to ToyOS's for every shared package with a semver-compatible version (`p384-scratch-073.Cargo.lock`): `crypto-bigint` 0.7.3, `rustcrypto-ff`/`-group` 0.14.0-rc.1, `sec1` 0.8.1, `cmov` 0.5.3, `ctutils` 0.4.2, `zeroize` 1.9.0 and so on.
  - The one package left different is `num-bigint` 0.3.3, and `cargo tree -i num-bigint` finds it in no build.
  - The log opens with `cargo tree -i crypto-bigint`.
  - `RUSTFLAGS` and `RUSTDOCFLAGS` were `--cfg p384_backend="bignum"`, then `cargo test --all-features`: exit 0, 34 + 6 + 11 tests and 2 doctests (the suite includes Wycheproof ECDSA). fiat was never compiled.

Paths are masked to `~`.

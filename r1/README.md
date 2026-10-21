# Evidence for ToyOSOrg/ToyOS#970 (and #969, its first commit)

Host: macOS on Apple silicon (aarch64-apple-darwin), 14 cores; guests under QEMU (HVF unavailable for x86_64 guests, so TCG).
Paths are masked: `~` is the user's home, `<user>` a personal name, `$TMPDIR` the per-user temp directory.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | 3c0982343 (pre-squash, before #969) | 0 |
| ci-host2.log | `cargo run -- --ci host` | b77180845 | 0 |
| build-only-x86_64.log | `cargo run -- --build-only` | b77180845 | 0 |
| build-only-aarch64.log | `cargo run -- --build-only --arch aarch64` | b77180845 | 0 |
| hostedclang2.log | `cargo run -- --hosted-clang` (built before the package gained LICENSE.TXT; the store product is what the guest rows use) | tree of 1fcb70d9f | 0 |
| guest1.log | `cargo test --test toyos-build -- hosted_clang_hello` | 6a0215d74 (before #969 and the sync) | 1: install 0 with the file server's NotFound entry failure, compile 1 |
| guest-diag1.log | same, with a temporary `clang -v` probe in the job | as guest1 | 1: `InstalledDir:` empty |
| guest-diag2.log | same, probe with explicit `--sysroot=/apps/clang/sysroot` | b0f68d9dd + probe (tree = b77180845 + probe) | 1: libc sees no `/apps/clang/sysroot/include`, std does |
| guest-final.log | `cargo test --test toyos-build -- hosted_clang_hello` | b77180845 | 1: install 0, no entry failure, compile 1 on `stdio.h` |
| static-pie.log | binutils `readelf -h -l -d` of the hosted clang and ld.lld (key 1ed2a0875fe8cbf6) | — | no INTERP, no NEEDED |
| mutations/run-final.log | `mutations/run.sh`: each `*.patch` applied, built, its tests run, reverted | b77180845 | every mutation red (101), unmutated green |
| mutations/run.log, truncation.run.log | earlier mutation runs, which found two redundant checks (deleted) | 70906cbda, 794136dcb | — |

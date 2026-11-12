# PR 1276: a fork registered in `.cargo/local.toml` dirties the nested lockfiles

`localtoml-repro.log` was made in the PR's worktree at `f9e3135d22b4fa3bf06e2bec47b3add543419be5`, with `rust` at `a189b3a6b3346db3c162fc6fd382f9b36b5f3ab1`, on a macOS arm64 host. Paths are masked.

1. Register the mio fork's worktree in `.cargo/local.toml`, as `[patch.crates-io]` and as a patch of its git source. The file is shown in the log.
2. `cargo metadata --format-version 1` in `rust/src/bootstrap` and in `sdk/libc` each exit 0, and each writes two `[[patch.unused]]` entries for mio into its own `Cargo.lock`. The diffs are in the log. In `rust/library`, the host's stable cargo refuses the manifest (exit 101). The sysroot build that first showed this, at `3c5c55584`, wrote the same entries into `rust/library/Cargo.lock` with the toolchain's own cargo.
3. `cargo run -- --build-only` exits 101 at `build/llvm.rs:329`: "rust/src/bootstrap holds changes no commit does".
4. The registration is removed and the three lockfiles are restored. The root `Cargo.lock`, which the patched build had pointed at the path, is restored as well.

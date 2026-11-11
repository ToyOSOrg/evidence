# PR 1203: only the installer's view writes /apps

Host, macOS arm64, branch head 83f1abb1d (the checks ran at 65f2ec12c; the
one later commit rewords a test comment). Paths are masked.

- `host/manifest-test.log`: `cargo test -p toyos-manifest`, exit 0.
- `host/build-test.log`: `cargo test --lib -- only_the_installer every_config_renders only_their_holders`, exit 0.
- `host/ci-host.log`, `.exit`, `.rev`: `cargo run -- --ci host`, exit 1, 1 of 110 steps red:
  `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, the macOS-host
  defect recorded in `issues/the-llvm-environment-test-breaks-git-on-macos.md`.
- `controls/control-a-*`: the view arm ignoring `installs`; `cargo test -p toyos-manifest` exit 101
  (2 red), the build test exit 101.
- `controls/control-b-*`: the shell's row granted `installs` in `images/system.toml`; the manifest
  crate's tests exit 0 (they read no config), the build test exit 101.
- `metal/`: `cargo test --test toyos-build -- --metal --metal-readback <dir> app_view` at 83f1abb1d,
  exit 2, the harness's verdict for a staging run. No machine was touched.

## Round 2, head e78085e47

`metal/` above is superseded: that image was never flashed.

- `r2/manifest-test.log`: `cargo test -p toyos-manifest`, exit 0.
- `r2/build-lib-test.log`: `cargo test --lib`, exit 101: 384 passed, 1 failed, the same macOS-only
  `llvm` test as round 1.
- `r2/metal-readback.log`, `.exit`, `.rev`, `r2/request.txt`: `app_view` restaged, exit 2, the
  staging verdict. No machine was touched.

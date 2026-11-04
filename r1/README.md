# ToyOS PR 1180, round 1, at 995fc581ad2df0c0426aff0f7daa3b4aecbe6ecb (macOS host, aarch64)

Paths masked: `$TMPDIR`, `$HOME`, `toyos-UID`.

- `ci-host.log`, `ci-host.exit`: `cargo run -- --ci host`, exit 0, 108 steps green.
- `toolchain-tests.log`: `cargo test --lib toolchain::tests`, exit 0.
- `mutation-no-tmpdir.patch`: removes bootstrap's own `TMPDIR`; built (`mutation.build.log`, exit 0),
  `a_bootstrap_run_leaves_nothing_in_its_caller_s_tmpdir` red (`mutation.test.log`, exit 101:
  "a bootstrap left [\"rustix_test_can_compile\"] in its caller's $TMPDIR"), then reversed.

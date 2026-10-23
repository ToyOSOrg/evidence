# PR #1047 evidence

- `ci-host.log`: `cargo run -- --ci host` at f6bc85fd9a33e4a7538dcd468237f556f2fae6ad, exit 0 (last line).
- `after-tests2.log`: `cargo test -p toyos-crypto --features portable,sign --no-fail-fast --test ed25519_verdicts --test wycheproof`, exit 0, same tree.
- `controls/reinstate-small-order-r.patch` and `.log`: the refusal reinstated on f6bc85fd9; build exit 0, `ed25519_verdicts` exit 101 (R = O and speccheck case 2), patch reverted (exit 0) in the same run.

Home, worktree and scratch paths are masked.

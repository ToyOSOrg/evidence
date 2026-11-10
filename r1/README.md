# PR 1199, round 1

| check | command | revision | target | exit | log |
|---|---|---|---|---|---|
| host | `cargo run -- --ci host` | 171044157 (tree; f33b58ef2 changes only `tests/guest/rust-tests/src/bin/bar_map_again.rs`, which no host step builds) | macOS host | 1: one of 110 steps red, `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, recorded in `issues/the-llvm-environment-test-breaks-git-on-macos.md` | `logs/host.log` |
| guest | guest-rows `virt_claim_lpi bar_map_again`, run 42907842461 | 171044157 | guest runner: aarch64 `virt` with ITS (emulated), x86-64 q35 | 1: `virt_claim_lpi` PASS; `bar_map_again` FAIL, this branch's own check restoring zero to `device_feature_select` | `logs/guest-42907842461.log` |
| guest | guest-rows `bar_map_again`, run 42909199077 | f33b58ef2 | guest runner: x86-64 q35 | 0: PASS | `logs/guest-42909199077.log` |

Control: `virt_claim_lpi` on main at 0b2dec674, run 42124293522, is the old
expectation against the same kernel: `Ok(16)` where the test wanted
`BadAddress`.

User names, home and temp paths and the runner's machine name are masked.

# PR #1050 r1: toyos-crypto review fixes

Revision: `1f5d648c39fd4d22bdb96ff47b5c6cb8f3266d69`, on aarch64-apple-darwin with rustc 1.98.1.
Home and checkout paths are masked to `~`.

| Check | Command | Exit | Log |
| --- | --- | --- | --- |
| Host CI | `cargo run -- --ci host` | 0 ("103 step(s), all green") | `ci-host.log` |
| Crypto, dispatched | `cargo test -p toyos-crypto --features 'std,sign,wpa2,rustls-provider' --offline` | 0 | `crypto-test.log` |
| Crypto, portable | the same with `,portable` | 0 | `crypto-portable.log` |
| bcachefs | `cargo test -p bcachefs --offline` | 0 | `bcachefs-test.log` |

The crypto and bcachefs logs were run on the uncommitted tree that became `1f5d648c3`. The commit added no changes after them.

## Red controls

In each control, `git apply` applied the patch, the filtered test ran and `git apply -R` restored the tree, all in one run. Both patched trees built.

- `controls/control-scrypt.patch` restores the old order: validation, then the guard. `scrypt::tests::a_refused_derivation_erases_the_workspace` fails with `assertion failed: workspace.iter().all(|&w| w == 0)`. Exit 101, restored 0.
- `controls/control-bcachefs-80.patch` ignores the result of the 80-bit (`verify::<10>`) extent MAC check. `engine::tests::a_flipped_byte_in_an_encrypted_extent_or_node_fails_its_mac` fails for `encrypted.img.gz`. Exit 101, restored 0.

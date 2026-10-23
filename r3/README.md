# Review round 3 evidence for ToyOSOrg/ToyOS#1048 (storage B5)

**Revision:** head `45c357cbd6c5d9b95ae81b0e245aea756a6f3954`, round 3 on top of `298a57aa6`. Masked paths: `$WORKTREE`, `$B5`, `$SCRATCH`, `$HOME`.

## host/

- `bcachefs-tests-r3.log`: `cargo test -p bcachefs` exits 0, with 155 lib tests.
  - It ran on the working tree before the commit; the commit is that tree.
  - The new tests are `bkey::tests::a_packed_key_whose_value_could_not_unpack_is_refused` and `journal::a_replayed_leaf_past_seven_nodes_is_read_but_not_mounted_read_write`.
- `clippy-r3.log`: clippy with the adopted lints exits 0.
- `ci-host-r3.log`: `cargo run -- --ci host` exits 0, "Host: 102 step(s), all green".
- `build-only-r3.log`: `cargo run -- --build-only` exits 0.

## controls/

`h-value-limit-unchecked` removes `Format::key`'s refusal of a value past 250 u64s. The new bkey test goes red (exit 101), and the restore was verified by hash. The replayed-node test needs no control: it asserts a refusal that exists, and records it.

## Judge

Not rerun. Round 3 changes no bytes ToyOS writes: it refuses a key no valid volume holds, and the rest is docs, tests and an issue. Round 2's verdicts stand.

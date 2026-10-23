# PR 1032, round 2: A11 and review r1, head e51e660f6

- `host/ci-host-e51e660.log`: `cargo run -- --ci host` at e51e660f6, exit 0, all 101 steps green. It runs the engine's 79 tests, the fuzz among them.
- `build/build-only-e51e660.log`: `cargo run -- --build-only` at e51e660f6, exit 0.
- **Judge:** the mkfs generator in `b2/judge/gen` writes byte-identical images at e51e660f6 (`SHA256SUMS` matches), so round 1's judgement stands.

## Controls

Each patch was applied to the committed e51e660f6, built and run with `cargo test -p bcachefs --lib <filter>`, then restored and touched (`controls/run.sh`).

| patch | what it breaks | result |
|---|---|---|
| `m5-type5-inverted` | type 5 computed with CRC-32C's inversions | exit 101; `the_crc32c_fixture_reads_its_tree` red |
| `m6-no-strict-check` | the reader takes a strict key in another btree's leaf | exit 101; `a_strict_key_in_another_btrees_leaf_is_refused_and_a_set_key_is_found` red at its reader assertion |
| `m7-no-fsck-keytype` | fsck ignores the key-type table | exit 101; the same test red at its fsck assertion |
| `m8-no-writer-check` | the writer encodes any key type | exit 101; `the_writer_refuses_a_key_its_btree_does_not_hold` red |
| `f4-copies` | the copy-offset fix reverted | exit 101; the fuzz `mutated_volumes_are_refused_without_a_panic` panics at `fsck.rs:105`, the reverted site |
| `f1-members`, `f2-journal`, `f3-nlink`, `f5-next` | the other fixes reverted, one at a time | exit 0: the fuzz does not reach them, and each has its module test |

Masked: home and scratch paths.

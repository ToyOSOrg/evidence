# Review r1 fixes: f38dd6ff8 and 95c79b51d

- `f38dd6ff8`: a publication member left with nothing to append is not
  written (R1, plus S1 and S5).
- `95c79b51d`: comments, the memory record and further tests (R2, R3, S2, S3).

| check at 95c79b51d | exit | log |
|---|---|---|
| `cargo test -p bcachefs --lib -- --test-threads=8` | 0, 177 passed | `lib-95c79b51d.log` |
| at `f38dd6ff8` alone | 0, 176 passed | `lib-f38dd6ff8.log` |
| clippy `--lib` with and without std, `-D warnings` | 0 | `clippy-*.log` |
| clippy `--all-targets`, the stale `lib/bcachefs/tests/{crash,integration}.rs` moved aside for the run and restored | 0 | `clippy-tests.log` |

**R1 reproduction**, in `a_member_left_with_nothing_to_append_is_not_written`.
The fixture-scale searches (`idle-search-*.log`) found no idle member:
- 96 natural variants (geometry, crash, single publication, regrouping);
- 22 variants with every node but the LRU rewritten.

A trace of each round's LRU keys showed why. Every LRU leaf also held a
change for an old bucket the rewrites drained.

The test's construction:
- 256 MiB, 4 KiB blocks, 32 KiB nodes, four to a bucket.
- Data buckets a quarter full, so LRU leaves split by fill.
- Only the inode and accounting nodes are to be rewritten. That state is
  reachable after an unclean mount, once this mount has rewritten the others.
- The idle member is the first LRU leaf.

| control | outcome | log |
|---|---|---|
| r1a: fix and encoder assertion reverted | reopened volume refused, `Corrupt("later bset with no keys")` | `nc/r1a-unfixed-no-assert.log` |
| r1b: fix reverted, assertion kept | the encoder's "a later bset with no keys" assertion fires at the unmount | `nc/r1b-unfixed.log` |

The mutations are in `nc/r1-{derive,write}.{old,new}`, applied by `nc/r1.py`.

**Patch files.** The `.patch` files of nc2–nc5 are empty: `publish.rs` was
untracked when they ran, so `git diff` showed nothing. Each mutation is its
`.old`/`.new` pair.

**The 32K/32K refusal measurement** is `fill-node-is-block-95c79b51d.log`.

## Upstream fsck v1.39.7 at 95c79b51d (`upstream/`)

Images are regenerated at `95c79b51d` by the published exporter, plus
`upstream/export4.rs`. Exits are in `upstream/b*.exits.txt`.

| images | exit |
|---|---|
| the R1 reproduction's volume (an idle LRU leaf; 22 members, 15 appended) | 0 |
| an encrypted 4K/32K publication that appends | 0 |
| 32K/64K and 4K/32K: churn, regrouped, 14 unmount flush states, encrypted churn, the 512 MiB publication, full-volume crash/removal/reuse | 0, every one |
| 32K/32K: churn, regrouped, encrypted, 7 unmount flush states, full volume | 134, upstream's own `btree_split` abort, as recorded |

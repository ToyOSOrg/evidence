# bcachefs: terminating clean unmount and refusal on every accepted geometry

Branch `codex/bcachefs-reclaim`; base `0249f7f23`:
- `aaa71f0bb`: the clean unmount ends in one self-describing publication.
- `825b9ba7a`: refuse `NoSpace` once what preceded the request is written.

Host: macOS arm64, Rust stable. Upstream oracle: bcachefs-tools v1.39.7 (the
verified Arch bundle of #1152's evidence), run under QEMU x86_64 TCG with
the Arch kernel and an added initramfs (`oracle/run.sh`, `oracle/fsck-init`).
Each image gets `bcachefs fsck -n -f -K`. Images are not published: they are
regenerated bit for bit from the seeded exporter tests (`oracle/export-tests.rs`,
appended to `lib/bcachefs/src/engine/tests/geometry.rs` at `825b9ba7a`).

## Library checks at 825b9ba7a

| check | exit | log |
|---|---|---|
| `cargo test -p bcachefs --lib -- --test-threads=8` | 0, 175 passed | `lib-825b9ba7a.log` |
| same at `aaa71f0bb` alone | 0, 174 passed | `lib-aaa71f0bb.log` |
| `cargo clippy -p bcachefs --lib --no-default-features -- -D warnings` | 0 | `clippy-nostd-825b9ba7a.log` |
| `cargo clippy -p bcachefs --lib -- -D warnings` | 0 | `clippy-std-825b9ba7a.log` |

`cargo clippy -p bcachefs --all-targets` fails only in `lib/bcachefs/tests/{crash,integration}.rs`.
Those files are unchanged from the base and import an API the crate no longer has.

## Negative controls

Each is a checked mutation (`nc/*.patch`): build, run, restore in one script
(`nc/mutate.py`). Every one built and went red.

| mutation | red test and failure |
|---|---|
| nc1: unmount's old reclaim-only drain | `every_accepted_geometry_unmounts_clean_after_churn`: `ReadOnly("journal reclaim's share exhausted")` on 32 KiB block = node |
| nc2: touched nodes do not join the publication | fsck derived-key mismatches; mtimes lost |
| nc3: releases before fills | regroup test: "pointer generation other than its bucket's" |
| nc4: stop before values settle | 6 tests, stale node sequences |
| nc5: rewrite over the old slot before the clean entry | one-block crash test: a crash state's mount fails its checksum |
| nc6b: no blacklist after a crash | blacklist test: "a bset naming 2 … not blacklisted" |
| nc7: refusal waits for quiescence (the base rule) | one-block full-volume test: no completion within 300 s, killed |

nc6 (SKIP = 0) does not compile: a constant assertion forbids it.

## Measurements

- Fill to `NoSpace`, 240-byte names, one directory (`fill-*.log`): native
  4K/32K reaches 9343 creates in 3.8 s, and 32K/64K 24342 in 13.4 s.
  32K/32K reaches 8000 creates in ~3 s, then one create never returns, at
  the base revision too (`fill-base-1.log`). Instrumented, its refusal's
  inputs stay fixed over 60000 reclaim passes: `keeps=false`, stable 1178,
  capacity 1908 (`livelock2.log`). With `825b9ba7a` it refuses at 9343 in 3.5 s.
- Across all 15015 publications in the suite (crash judges included), the
  largest had 27 members. Every one settled in 3 derivation rounds. None
  regrouped unless a test lowered the group limit (`publications-suite.log`).

## Upstream fsck (`oracle/`)

Exploratory runs at the working tree (`upstream-explore/`) found:
- Every 2-block and 8-block image passed.
- Every written one-block-node image aborted in upstream's own `btree_split`.
- Upstream's `format` refuses block = node.
- A ToyOS mkfs-only one-block-node volume checks clean.
- `-o nodiscard` does not help; `-o norecovery` checks nothing.

## Upstream fsck at 825b9ba7a (`upstream-final/`)

Images exported at `825b9ba7a` (`upstream-final/revision.txt`) by
`oracle/export-tests.rs`. Exit codes are from `upstream-final/b*.exits.txt`.

| images | exit |
|---|---|
| block 32K, node 64K: churn, regrouped, 7 unmount flush states, a 512 MiB single publication (67 members), full-volume crash/removal/reuse | 0, every one |
| block 4K, node 32K: churn, regrouped, 7 unmount flush states, encrypted churn, full-volume crash/removal/reuse | 0, every one |
| block = node = 32K: churn, regrouped, encrypted, 7 unmount flush states, full volume | 134 (abort in upstream's `btree_split`), or 1 (upstream's replay refusing the pointer its own split made) |

The unmount flush states cover:
- the old window replayed before the clean entry is durable;
- the clean entry durable with the superblock still unclean (replay of one entry
  holding no keys);
- the clean superblock.

The block = node failures repeat the exploratory finding. Upstream's `format`
refuses the geometry, and its in-memory split asserts on one-block nodes.
They are recorded in `issues/upstream-cannot-check-written-bcachefs-volumes-of-one-block-nodes.md`.

## Host CI and bcachefs's dependents at 825b9ba7a

`cargo run -- --ci host` (`ci-host-825b9ba7a.log`) was killed from outside
(exit 144) about 26 minutes in, during the loom controls. The control
failures before that point are their expected verdicts. Up to then:

- **The build system:** `image::tests::file_sets_across_a_bucket_size_edge_fit_and_read_back`
  fails. It fails identically at the base `0249f7f23` (`image-edge-base.log`).
- **The workspace's host members, and clippy:** both fail only on compile
  errors in `lib/bcachefs/tests/{crash,integration}.rs`. Those files are
  unchanged from the base and import a removed API. The test step stopped
  there, so the dependents were run directly:
  - `cargo test -p toyos-blockserve`: 7 passed, 1 failed.
  - `cargo test -p fileserver`: 95 passed, 4 failed.
  - The same tests fail identically at the base (`*-base.log`).

None of these failures is introduced by the two commits. All are left to
the integration branch.

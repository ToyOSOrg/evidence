# Review round 1 evidence for ToyOSOrg/ToyOS#1059 (storage B6)

Branch head `1060062ee5b167e9fffb3b9917588b0144185e18`. Paths are masked as in round 0's README.

Commits since round 0:
- `b6e8fc49c`: the 32 KiB floor, A2.24 and A2.25, and the records.
- `cc8acab09`: the direct A2.24 check, test only.
- the head: the fixture's `COMMITTED_FILES` row in `build/licence.rs`.

## host/
- `bcachefs-tests.log`: `cargo test -p bcachefs` at `b6e8fc49c`, exit 0. 170 lib tests, then 2, 57 and 2.
  - The test-only commit after it touches one test, which passed alone. It passed alone (`cargo test -p bcachefs --lib a_torn_newest`), and `controls/m-last-seq-own.patch.log` is its control.
- `clippy.log`: clippy at `b6e8fc49c` with the adopted lints, exit 0.
- `ci-host.log`: `cargo run -- --ci host` at the head, exit 0, "Host: 103 step(s), all green".
  - Its first run at the test-only commit was red in one step: sourcegate's "every committed binary file is declared", for the new fixture. The head adds the row.
- `build-only.log`: `cargo run -- --build-only` at the test-only commit, exit 0. The head changes only a table that the build's tests read.

## controls/
`all.log` runs every patch at `b6e8fc49c`, with the tree clean. Each revert reports "restored: hashes equal".
- All are red except `m-last-seq-own`. With A2.24 off, header-last writing still kept every torn self-naming entry harmless, so the upstream-window check could not tell.
- The test-only commit adds the rule's direct check: no entry on the medium names itself but the first after mkfs.
- `m-last-seq-own.patch.log` is its rerun there: red, with "entries naming themselves: [2, 3, …, 16]".

## judge/
94 files, made by `dump_b6.rs` at `b6e8fc49c` and checked in the guest. The pressure runs now sample through the clean unmount.
- **66 PASS of 67.** `pressure-05.img` and every raw and replayed pressure state pass.
- Also passing:
  - `fixture-32k-rw`: the new fixture after ToyOS's read-write mount;
  - `full-crashed-remounted`: the crashed full volume after a read-write mount, removals and a clean unmount;
  - both FUSE continuations.
- **The one FAIL is the required negative control**, `ctl-reused-before-durable`, exit 9.
- The held round-0 image still makes upstream loop (exit 124). That is the old writer's state, kept as the defect's reproduction.

## fixture/
`unclean-32k-nodes.img.gz` was made by `a2-1-64.sh`, BB-A2-1's script with only the image size changed (32M to 64M), in the judge VM. `logs/` holds every command, output and exit.
- `fsck -n -K` exits 0: "replaying entries 18-18 (unflushed 19-22)".
- `upstream-listing.log`: upstream's FUSE mount lists f1–f140, with f140 empty. The host test asserts the same.

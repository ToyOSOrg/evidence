# Storage B3: offline population, and fsck of every derived btree

Branch `storage-b3`, commit 426ede703 on `main` 89f92a4bd. Masked: home, worktree and scratch paths.

## Host

- `host/ci-host-426ede7.log`: `cargo run -- --ci host` at 426ede703, with its exit status on the last line.
- `build/build-only-426ede7.log`: `cargo run -- --build-only` at 426ede703, with its exit status on the last line.

## The upstream fixture `links.img.gz`

`fixture/fixture.sh` ran in the judge guest. `fixture/logs/` holds each command with its stdout, stderr and exit
status. Step 05 is upstream FUSE's `find` listing, whose inode numbers, link counts and sizes the committed test
`the_links_fixture_reads_its_tree_and_derives_its_own_state` asserts. Step 08 is upstream's judge on the
committed bytes: exit 0, no marker, "recovering from clean shutdown". Step 07's exit 143 is my own kill of a
wait loop that matched its own command line. The daemon had already exited, and step 09 reads `Clean: 1`.

## The judge

The guest is B2's: bcachefs-tools v1.39.4 (d997ad76e906), Ubuntu 26.04.1 arm64, kernel 7.0.0-38, QEMU/HVF. Every
judgement is `fsck -n -K < /dev/null`, and a pass is exit 0 and no failure marker (`judge/guest/lib.sh`).

- **Images.** `judge/gen` writes every image, read back and checked clean by ToyOS's fsck first. Its empty
  volumes are B2's judged bytes (`b2-images.sha` against B2's `SHA256SUMS`). The BB-A9-2 images are the
  committed test's own constructions, written out by `dump-a9-2.patch`, which was applied and then reverted.
  The generator and the dump write the same bytes (`SHA256SUMS`) at 426ede703.
- **`judge/logs/judge`** (`b3-judge.sh`), verdicts in `verdicts.txt`:
  - tree-8m, tree-32m and tree-1g PASS.
  - Upstream FUSE reads every path of each tree. The contents digest, link count and symlink target match the
    generator's manifest (82, 738 and 3038 lines, `manifest-ok`).
  - BB-A9-2: `a9-2-type5` PASS. `a9-2-type1` and `a9-2-nocrc` FAIL, with exit 9 and `extent_io_opts_not_set 8`
    (all 8 extents). nocrc also gives one snapshot-class accounting mismatch: the rewrite shortened each key
    by one word without restating the accounting.
  - Controls: a user bucket's dirty sectors changed (`c-alloc`), and a hard link's dirent deleted (`c-dirent`),
    both FAIL.
  - After upstream's read-write FUSE mount:
    - `tree-8m.r` PASS. Its `seq` write hit ENOSPC under upstream's reserves on a volume below what
      `format` accepts at 4 KiB blocks.
    - `tree-32m.r` FAIL: the daemon never exited after unmount, and replay reports "Journal stuck … journal
      full". See `hang` below.
    - `tree-1g.r` FAIL with `deleted_inode_but_clean` only. That is the file the script removed through FUSE,
      which upstream's FUSE unmount leaves as an orphan in a clean volume (BB-A8-2).
- **`judge/logs/hang`** (`b3-hang.sh`): the same tree, copied into an upstream-formatted 32 MiB volume by
  upstream's FUSE, then the same read-write steps:
  - the daemon was still running 120 s after unmount, and `up.r` FAILs "Journal stuck … journal full";
  - ToyOS's tree-32m, the same steps twice: the daemon exited in 2 s, `Clean: 1`, both PASS.

  The hang is upstream FUSE's.
- **`judge/logs/rw`** (`b3-rw.sh`): tree-1g after the read-write steps without the FUSE `rm` PASSes, and again
  after a read-back mount.
- **`judge/logs/encrypted`**: the encrypted volume of directories alone, unlocked from the hex secret in a session
  keyring, PASS.

## Controls

`controls/run.sh` applies each patch to commit b911db5a8, builds the tests and runs the filtered tests. It then
restores the file and touches it. Between b911db5a8 and 426ede703 only an issue record changed.

| patch | breaks | result |
|---|---|---|
| `m1-type1-extents` | the writer checksums extents as type 1, the metadata type | exit 101: the populated test red at fsck, "data checksum type other than the volume's options imply"; every read still verifies |
| `m2-nlink-names` | the writer stores a file's names, not names − 1 | exit 101: the populated test red at the link count |
| `m3-no-inum-fixtures` / `-populated` | the derivation drops the inum class | fixtures: exit 101, both red with the inum accounting keys `unexpected`. Populated: exit 0 |
| `m4-node-bp-level-fixtures` / `-populated` | node backpointers at the node's level, not plus one | fixtures: exit 101, both red with backpointers `differs`. Populated: exit 0 |
| `f1-size-overflow` | fsck's size round-up overflow restored | exit 101: `an_inode_size_near_2_64_is_checked_without_overflow` panics at the reverted site |
| `f2-journal-overlap` | overlapping journal ranges accepted | exit 101: `overlapping_journal_buckets_are_refused` red |
| `f3-member-device` | a member past its device accepted | exit 101: `a_member_past_its_device_is_refused` red |

m3 and m4 show what the shared derivation cannot catch on ToyOS's own volumes, which the upstream fixtures do.

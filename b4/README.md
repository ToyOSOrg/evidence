# Storage B4 (ToyOS PR #1039): ROOT written by the engine

Branch head under test: `3a16f262ceebee71bdf70dea30636c39027cdc03` (rebased on `main` 7eefbcb0b).
Earlier revisions named below differ from it only as stated. Paths are masked as `<dev>`, `<home>`
and `<scratch>`.

## Host

- `host/ci-host-rebased.log`: `cargo run -- --ci host` at 3a16f262c, exit 0, 101 of 101 steps green.
- `host/ci-host-final2.log`: the same at 605988293 (before the rebase onto #1028), exit 0, 101 of 101.

## Images

- `build/build-only-{x86_64,aarch64}-head.log`: `cargo run -- --build-only --arch <a>` at
  605988293, exit 0 each. The rebase onto main added only `tests/metal` (#1028), so the image build
  is unchanged.
- `build/metal-stage-blocked.log`: `--metal --metal-readback <dir> microcode` at 605988293,
  exit 101. `tests/guest/rust-tests/src/bin/launch_unsent_stdio.rs` does not compile against
  `toyos::fd` on main (after #1012). This is unrelated to B4, and no metal row was staged.

## QEMU

- `qemu/qemu-head.log`: `cargo test --test toyos-build -- nvme_disk_boots virt_readonly_copyout`
  at 605988293, exit 0. `nvme_disk_boots` (x86-64 q35, default ready marker) checks that the boot
  said ROOT's name and `os-release`, and serves every role. `virt_readonly_copyout` (AArch64
  `virt`) runs a program from `/system`.
- `qemu/qemu-head-x86-verbose.log`: the x86-64 boot with `--nocapture`. It includes the file
  server's `ROOT is filesystem …` line.

## Negative controls (`controls/`, at 605988293)

`run.sh` applies each patch, builds, runs the tests and restores the tree; the tree was clean
afterwards.

- `clock-seed.patch`: ROOT's seed is mixed with the clock. `one_set_built_twice_is_one_image` and
  `one_ordering_of_one_set_is_one_image` FAIL (exit 101).
- `clock-time.patch`: ROOT's times come from the clock. The same two tests FAIL (exit 101).
- `greedy-shape.patch`: btree levels are filled greedily, as before this PR.
  `no_node_is_left_with_a_remainder` and `leaves_fill_to_two_thirds_and_one_root_spans_them`
  FAIL (exit 101).
- `unmutated.log`: all of them pass (exit 0).

## Upstream judge (bcachefs-tools v1.39.4, `fsck -n -K`, B2's VM)

`guest-scripts/` holds the scripts; `lib.sh`'s `judge` is the design's §3.4 pass rule (exit 0 and
no failure marker), with a 600 s ceiling.

- `guest-logs/judge/` (ROOTs built at cf8af1e, `judge/SHA256SUMS-cf8af1e`):
  - both ROOTs PASS;
  - upstream FUSE reads every path, contents and symlink target as the engine's reader lists them
    (`manifest-ok`; the manifests are in `judge/`);
  - inode numbers run in sorted path order from 2^31 (`inodes-sorted-ok 88` and `80`);
  - neither ROOT has a freespace key (no free bucket);
  - after an upstream read-write FUSE mount, both PASS again;
  - control: `root-aarch64-greedy.img` (the AArch64 ROOT before the spread) FAILs with exit 124,
    fsck idle at "going read-write" until the ceiling.
- `guest-logs/head/`: ROOTs built at 605988293 (`judge/SHA256SUMS-605988293`). Both PASS with
  zero freespace keys, and fsck ends at journal sequence 2 (nothing committed). They differ from
  cf8af1e's only in `etc/os-release`, which names the commit and so changes every seed.
- `guest-logs/cursor/` (BB-A5-3): upstream's cursor is `idx 2147483736` (2^31 + 88). Its
  read-write mount numbers a new directory and file 2147483736 and 2147483737 (AArch64:
  2147483728 and 2147483729). A data write gets ENOSPC, and the judge PASSes after.
- `guest-logs/what/`: the AArch64 tree laid out greedily:
  - with no free bucket, `fsck -n` stalls (124);
  - with 32 free buckets it ends at journal sequence 3;
  - a writing fsck of a copy shows what it committed: the extents btree's last two leaves (buckets
    2037 and 2038) replaced by one at 2072.
- `guest-logs/sweep/seq.txt`: 8 MiB volumes, each one directory of k empty files, k = 60 … 900 in
  steps of 12. Spread layouts: 71 of 71 end at sequence 2. Greedy layouts: 24 of 71 commit merges.
  `tools/sweep` wrote them.

## Tools (scratch crates, built against the worktree)

- `tools/manifest`: extracts ROOT A from a boot image and writes the reader's manifest.
- `tools/variants`: rewrites a ROOT's tree with extra free buckets.
- `tools/sweep`: writes the sweep volumes.
- `tools/speed-test.rs`: the RootVolume read-throughput measurement (host, release):
  - 4 KiB reads: 43.9 MB/s;
  - 64 KiB reads: 278.9 MB/s;
  - 1 MiB reads: 339.7 MB/s.

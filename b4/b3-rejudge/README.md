# B3's judged images, regenerated at B4 (review r1 of #1039)

The even spread changes the layout of every btree level that holds more than one node, so B3's
judged images were regenerated at B4's tree. The engine source is identical in 3a16f262c and
5d86135ec, apart from the r1 fixes, which do not change bytes.
- **Generator:** `judge-gen/` is B3's `judge-gen`, pointed at the B4 worktree.
- **BB-A9-2's images:** written by `dump.rs`, appended to the engine's tests for the run and then
  removed.
- **Hashes:** `SHA256SUMS` holds the new ones and `SHA256SUMS-b3` B3's.
  - Changed by the spread: `tree-8m`, `tree-32m`, `tree-1g`, `root-32m` and the three `a9-2-*`.
  - Byte-identical to B3's: `dirs-data-64m` (encrypted, DATA's form), `data-64m`, `data-1g` and
    `root-1g`.

**The run (`run.txt`, `guest-logs/`).** bcachefs-tools v1.39.4, `fsck -n -K`, B2's VM, on a host
disk with room. A first run fell in the window when the host disk was full, so it is discarded.
B3's scripts are used unchanged except two edits:
- `gone` stops a FUSE daemon still running 120 s after its unmount with TERM, as B3's own `hang`
  script did;
- `lib.sh`'s fsck has a 600 s ceiling.

**As written, every volume PASSes:**
- `tree-8m`, `tree-32m` and `tree-1g`, whose upstream FUSE reads match their manifests
  (`manifest-ok` ×3), hard links included;
- `dirs-data-64m`, unlocked from its hex secret in the session keyring;
- `root-32m`, `root-1g`, `data-64m` and `data-1g`;
- `a9-2-type5`.

**The controls FAIL** as in B3: `a9-2-type1`, `a9-2-nocrc` (`extent_io_opts_not_set`), `c-alloc` and
`c-dirent`.

**After upstream's read-write FUSE mount** (`judge/`, steps that include a FUSE `rm`):
- `tree-1g.r` FAILs with `deleted_inode_but_clean`: upstream's FUSE leaves a clean volume holding an
  orphan (BB-A8-2), as in B3.
- `tree-8m.r` and `tree-32m.r` FAIL with upstream's "Journal stuck! … journal full", its daemon
  never exiting at unmount. B3 recorded this on 32 MiB, reproduced on an upstream-formatted volume.

**The same steps without the `rm`** (`rwhang/`): `tree-8m.w`, `tree-32m.w` and `tree-1g.w` all
PASS.

**An upstream-formatted 8 MiB volume** with 16 KiB nodes, holding `tree-8m`'s tree copied in through
FUSE (`rwhang/` 14–21), shows the same stall:
- its copy-in ends "Journal stuck … journal full";
- fsck of it stalls (124);
- after the read-write steps it FAILs with the same markers.

So the 8 and 32 MiB read-write failures are upstream's small-journal defect, not the writer's.

# DATA mounted a volume another format had written over (2026-11-04)

Evidence for `issues/data-mounted-a-volume-another-format-wrote-over.md` and the
native-format fixes that close it on the storage-consolidation branch.

Read-only captures of the benches' DATA partitions (not published: raw disk bytes)
were decoded on the host:

- `t14-decode.txt`: the T14's private-format superblocks through main's lib/bcachefs
  (`tools/decode-main.rs`, a sparse device refusing blocks not captured).
- `bitmap-and-native-headers.txt`: both benches' block 0, and blocks 1 and 257 —
  the private format's bitmap blocks — holding native superblock copies
  (version 0x0427, seq 10, written 2026-11-02 20:12:08 / 20:31:08 UTC); the
  private bitmap bits that read free as a result.
- `t14-tree-walk.txt`: the private format's tree on the T14 (`tools/walk.py`):
  190 nodes, block 1758 reached twice, live node 15052 marked free.
- `t14-timeline.txt`: the DATA lines of the boots involved: the native format
  (`disks format data --commit`) over "the retired ToyOS provisional file
  system", the native boots after it, the first main image mounting the old
  volume ("22 names") from its backup, the last good mount and the refusal.
- `main-replay/`: osbench's persist and fs.disk sequence through main's
  DATA file server (main 65c77e6dd) on a model of the T14's partition, with
  an independent walker refusing writes over the committed tree: intact,
  nothing; after the native mkfs, a silent mount, 41 writes over committed
  nodes and the next mount's `BadMagic`.
- `native/`: the fixes' host tests on the storage-consolidation branch, and
  their negative controls.

## native/

`RUN.txt` names the revision (the fixes on the storage-consolidation branch)
and the commands; `bcachefs.log` and `fileserver.log` are the full suites at
that revision; `negative-controls/` holds each mutation as a patch, the
script that applied, ran and reverted it, and each run's log:

- `a-silent`: a copy whose first sector is not this volume's counted as torn —
  the engine's refusal cases go red.
- `a-layout`: the layout copy not compared — the engine's cases and the AMD
  shape of the replay go red (it mounts).
- `a-front`: a primary claiming a copy, with no layout beside it, refused with
  its own error rather than as overwritten — the T14 shape goes red.
- `b-node`: a btree node declaring no checksum read unverified — the checksum
  test goes red.
- `c-mkfs` / `c-tail`: mkfs not filling the copies' reserves / not zeroing
  past the last copy — the mkfs test, and for the tail the replay's private
  volume (its backup survives), go red.

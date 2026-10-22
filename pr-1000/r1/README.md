# PR 1000, round 1 at d098a6638

- ci-host.log: exit 0.
- qemu-crypto-instrument.log: exit 0 (first line names the revision).
- readback.log, request.txt: staged cryptocase (exit 2 = Staged).
- controls/: patches, logs and results.txt. The run used 196ae3d17 plus the item-8a tree (pr5-tree.patch) before its last test and contract comment; add-public-no-doubling was rerun after its test existed.
- inspection/: the shipped-profile branch walk on both ToyOS targets.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

# PR 1013, round 1 at bb4033d8d

- ci-host.log: exit 0, 93 green.
- qemu-crypto-instrument.log: exit 0 (first line names the revision).
- readback.log, request.txt: staged cryptocase (exit 2 = Staged).
- controls/: patches, logs and results.txt. Run on main 81c1386cf plus the item-8b tree (pr6-tree.patch) before the last test and comment edits; mul-no-last-doubling was rerun after its test existed.
- inspection/: the shipped-profile branch walk on both ToyOS targets, and P-256's mul and square listings.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

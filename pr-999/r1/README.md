# PR 999, round 1 at db5c6c55e

- ci-host.log: `cargo run -- --ci host`, exit 0.
- qemu-crypto-instrument.log: QEMU row, exit 0 (first line names the revision).
- readback.log, request.txt: staged `cryptocase` (exit 2 = Staged).
- controls/: patches, logs, results.txt (run on cd7960d45 plus the item-7 tree, pr4-tree.patch, before its contract comments; the code is identical).
- inspection/: shipped-profile branch walk on both ToyOS targets, after the wrapping fix.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

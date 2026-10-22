# PR 997, round 1 at 1d0f66ac5

- ci-host.log: `cargo run -- --ci host`, exit 0.
- qemu-crypto-instrument.log: `crypto_instrument_prints_its_table` under QEMU, exit 0.
- readback.log, request.txt: the staged `cryptocase` image (exit 2 = Staged; no machine touched).
- controls/: patches, logs and results.txt. The first block of results ran on the PR's tree before its gap tests existed (the tree is pr3-tree.patch over 41e89b9ec); the second block ran after them.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

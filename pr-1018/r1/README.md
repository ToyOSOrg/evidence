# PR 1018, round 1 at ffd3be52b

- ci-host.log: exit 0, 93 green.
- rosetta-tests.log: the crate's x86-64 tests under Rosetta, which runs AES-NI and PCLMULQDQ: the changed paths.
- controls/: patches, logs, results.txt.
- ctr-x86_64-unknown-toyos.s: the shipped CTR function with the byte-addition runs (paddb).
- qemu-crypto-instrument.log: exit 0. readback.log, request.txt: staged cryptocase (exit 2 = Staged).

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

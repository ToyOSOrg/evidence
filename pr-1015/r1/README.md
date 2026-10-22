# PR 1015, round 1 at 74aa231bf

- ci-host.log: exit 0, 93 green.
- qemu-crypto-instrument.log: exit 0; crypto_parity checks the AVX2 ChaCha20 path against ring at every length 0..1153 B before timing.
- rosetta-tests.log: the crate's x86-64 tests under Rosetta (SSE and AES-NI paths; Rosetta reports no AVX2).
- readback.log, request.txt: staged cryptocase (exit 2 = Staged).

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

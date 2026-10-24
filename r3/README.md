# PR #1063 round 3 (branch p256-speed 9dc8a7771)

- r2/bench/{t14,amd}: round 2's Linux bench outputs as returned (files named by build), home paths masked.
- logs/vm-<suite>-w7.log: the crate's suites under QEMU TCG -cpu max at the round-3 tree (lib/crypto identical to
  9dc8a7771), each exit 0; vm-staged3-lib.log: the bench test command at 9dc8a7771.
- mutants/, logs/vm-mutant3-*, mutants-c3.txt: the multiplication and squaring mutants at 9dc8a7771; all fail.
- logs/metal-*-prepare-c3.log: cryptocase staged for both benches at 9dc8a7771 (exit 2: nothing established).
- staged/: the round-3 bench set's README, hashes and masked probe source.

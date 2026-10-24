# PR #1063 round 2 (branch p256-speed cec7093d1)

- r1/bench/{t14,amd}: round 1's Linux bench outputs as returned (oracle files named by build; each file's
  "toyos-crypto=" line names its revision), with home paths masked.
- logs/vm-<suite>-w6.log: the crate's suites under QEMU TCG -cpu max at the round-2 tree (identical to cec7093d1's
  lib/crypto), each exit 0; vm-staged2-lib.log is the bench test command at cec7093d1.
- mutants/ and logs/vm-mutant2-*, mutants-c2.txt: five mutations of round 2's code at cec7093d1; every one fails.
- inspection/: the kernel path's doubling, addition and both AVX2 table reads.
- staged/: the round-2 bench set's README, hashes and (masked) probe source.

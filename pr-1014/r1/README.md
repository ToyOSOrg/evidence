# PR 1014, round 1 at 04e784c9a

- ci-host.log: exit 0, 93 green.
- qemu-crypto-instrument.log: exit 0 (portable path; qemu64 has no BMI2).
- readback.log, request.txt: staged cryptocase (exit 2 = Staged).
- emulation.log, emulate.py, mutant*.rs: the asm template interpreted against Python integers, and three mutants it rejects (mutant.rs: one adox as adcx; mutant2.rs: a misplaced store; mutant3.rs: the OF carry into t[n+1] dropped).
- rsa-kernel-x86_64-unknown-toyos.s: the assembled kernel in the shipped profile.

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.

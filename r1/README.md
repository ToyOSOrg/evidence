# ToyOSOrg/ToyOS#1277, round 1, host evidence

Head `1a747db241213d06d908600734aead838b4ed97d`'s tree, on main `3c5c55584`. Every log is masked
(paths, temp paths, the throwaway signing key's fingerprint).

- `a1-ci-host.log`: `cargo run -- --ci host`, exit 1. 122 of 123 steps green; the red is
  `the build system`, the recorded macOS `llvm::tests` failure.
- `a1-build-1.log`: `cargo run -- --build-only`, exit 0.
- `a1-pure-1.log`, `a1-checks-3.log`: the kernel library's mitigation tests and the harness's
  mitigation checks, exit 0.
- `a1-mutant-spec-ctrl-unread.diff` and `.log`: the decision patched to ignore `IA32_SPEC_CTRL`;
  `the_benches_words_decide_as_their_vendors_rows` and `mitigations_verdict` red (exit 101).

Guest run 43151862065 follows in a later round.

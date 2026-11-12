# ToyOSOrg/ToyOS#1278, round 1, host evidence

Head `50c9da2010522bcd730dcfa81c003c1be563946e`, on #1277's `1a747db241213d06d908600734aead838b4ed97d`. Every log is masked (paths,
temp paths, the throwaway signing key's fingerprint).

- `a2-ci-host.log`: `cargo run -- --ci host`, exit 1. 122 of 123 steps green; the red is
  `the build system`, the recorded macOS `llvm::tests` failure.
- `a2-clippy.log`: `cargo run -- --clippy`, 26 invocations clean.
- `a2-pure-2.log`, `a2-host-1.log`: the kernel library's mitigation tests, the harness's mitigation
  checks, `toyos-manifest`'s and the SDK's spawn tests, exit 0.
- `a2-build-1.log`, `a2-build-2.log`: the shipping image and the `testcases` image on the test
  kernel, exit 0. `a2-guestbins.log`: every guest binary whose spawn arguments changed, built for
  `x86_64-unknown-toyos` by `toyos_build::build::build_toyos_bin` through a throwaway ignored test
  (not committed), exit 0. `a2-list.log`: the harness lists the new names.
- `a2-mutant-previous-only.diff` and `.log`: the IBPB decided by the previous space alone;
  `an_ibpb_goes_between_two_spaces_one_of_which_asked` reds with one IBPB in place of two.
- `a2-control-no-inheritance.diff`: the guest control on branch `mitigate-ask-control-inherit`,
  run 43156167715, whose result follows in a later round with run 43156124553's.

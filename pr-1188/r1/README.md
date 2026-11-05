# PR 1188, round 1

Revision a0d5cd88e unless noted.

- `ci-host.log`: `cargo run -- --ci host` on the tree before two lint fixes.
  Exit 1, and the only red step is clippy: a manual `% LEAF == 0` in
  `kernel/pure/claimspace.rs`, which also stopped clippy before it reached
  the kernel binaries. Every Tests, Userland and Models step was green,
  `cargo test -p kernel --lib` included.
- The two fixes are `is_multiple_of` in `claimspace` and an unused
  `PAGE_2M` import in `pcidev`. `ci-host-lint.log`: `--ci host lint` at
  a0d5cd88e, exit 0. That includes kernel clippy for x86_64 and aarch64
  with every feature set it builds.
- `claimspace-test.log`: `cargo test --lib claimspace` in `kernel/` at
  a0d5cd88e, exit 0.
- `build-only.log` and `build-only-aarch64.log`: `cargo run -- --build-only`
  and `cargo run -- --build-only --arch aarch64`, both exit 0.
- `controls/`: negative controls, each applied with `git apply`, built, run
  and reverted at a0d5cd88e. Both exit 101 (`controls.txt`).
  - `mut-grants-avoid-residue` (the old rule) reds
    `a_function_no_reset_quiets_serves_every_holder_whatever_the_last_one_laid_out`
    at its first refused grant.
  - `mut-carve-noop` reds that test's disjointness check and
    `carving_keeps_what_a_grant_does_not_cover`.
- `metal/request.txt` and `metal-readback.log`: the staged T14 and AMD-bench
  request, one `testcases` boot for five rows. No machine was touched.

Paths, user, host and machine model are masked.

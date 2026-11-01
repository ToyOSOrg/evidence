# PR 1145, round 1: build lock waits

Revision: ToyOS `buildlock-wait` at the commit this PR names; base `origin/main`
4768c7650 for the host run, rebased onto 9b3711cdb (no `build/` change between).
Host: macOS, Darwin 27.0.0, 14 CPUs.

- `probe/`: a stand-alone program, its output in `probe.log`. Four shared
  `flock` waiters queue behind an exclusive holder, in threads and in
  processes; after the release a fresh non-blocking shared try succeeds, yet
  the waiters are let in one at a time, each when the one before lets go.
- `controls/`: each negative control as a patch against the fixed
  `build/buildlock.rs`, its build log (exit 0) and its test log (exit 101).
  a: the base code with the scenario test; b: waits blocking in the kernel;
  c: the deadline never checked; d: the maker's try reverted to a wait.
- `logs/ci-host.log`: `cargo run -- --ci host`, exit 1, its one red step the
  clippy `redundant_clone` in a new test; `clippy-build.log` the rerun of that
  lint set over `toyos-build` after the fix, exit 0; `fixed-unit.log`,
  `rebased-unit.log` the buildlock tests, exit 0; `build-only.log`
  `cargo run -- --build-only` on the rebased head, exit 0.

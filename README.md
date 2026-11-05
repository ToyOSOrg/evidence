# PR #1186 evidence, round 1

- `host-ci-205e7f8fd.log`: `cargo run -- --ci host` at the PR head 205e7f8fd, dev host (aarch64 macOS), exit 0, 108 steps green.
- `host-ci-e1f7a40fb-buildlock-red.log`: the same check at e1f7a40fb (PR #1187's head, which does not touch build/), exit 1: the one red step is the build system's lib tests, `buildlock::tests::a_narrow_guest_does_not_overtake_a_wide_one_waiting` and the `Directory not empty` the failed test's threads left for `sysroot::tests::the_primary_s_fork_checkout_is_moved_to_its_pin`.
- `buildlock-ab.txt`: the base and the fixed lib test binary filtered to `buildlock::`, interleaved, 150 runs each in one session.

Correction: `host-ci-e1f7a40fb-buildlock-red.log` ran on e1f7a40fb, whose tree is PR #1187's head 0383550b0. Only the commit message was amended afterwards.

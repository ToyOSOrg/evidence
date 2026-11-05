# #1193 round 3: virtio-sound counts periods from its ring; review r2 fixes

Head ce5d8469d. The kernel is unchanged since the round 2 A/B, so no metal.

- logs/vsound-r3.log: toyos-virtio-sound 11/11, with
  a_record_folded_over_two_periods_does_not_stop_the_clock ([0, 1, 1, 1]).
- vsound/control-r3.patch, logs/vsound-control-r3.log: #1188's lib.rs
  restored (today's accounting) reds it with [1, 0, 0, 0].
- logs/soundserver-r3.log: soundserver 8/8.
- logs/ci-host-6.log: `cargo run -- --ci host` at ce5d8469d, 108 of 109
  steps green; the red step is the build system's lib tests, two failures
  independent of this branch:
  - buildlock::tests::a_narrow_guest_does_not_overtake_a_wide_one_waiting,
    the concurrency defect main fixed in #1186 (7d79229de), which #1188's
    base predates;
  - sysroot::tests::the_primary_s_fork_checkout_is_moved_to_its_pin, a
    stat-only dirty file read as work under host load; logs/sysroot-alone.log
    passes it alone at the same head. Recorded in the tree as
    issues/the-sysroot-pin-test-reads-a-stat-dirty-file-as-uncommitted-work.md.
  Every other step, the loom models and controls and every SDK, kernel and
  soundserver suite among them, is green.
- logs/build-x86-8.log: the x86-64 image at ce5d8469d, exit 0.

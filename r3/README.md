# PR #1136 r3: rebased onto #1134 e884ee2f6, at display-stage4 f714a5161

- `ci-host.log`: `cargo run -- --ci host`, exit 0. It includes `toyos-tgl-display`'s 45 tests and `toyos-display-output`'s 9. Two of them are new or changed:
  - `disabling_waits_for_idle_says_whether_it_came_and_can_enable_again`: SRD enabled again with no AUX;
  - `Output`'s whole first present.
- `metal-readback-r3.log`: this head's T14 boot staged. Exit 2 is staged, not run.
- The r2 boot (b62a34248) stays queued as staged, for the panel's DPCD.

Paths are masked.

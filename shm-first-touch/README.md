# PR 1270: a shared-memory region draws each page's frame at its first touch

- `checks-1.sh` -> `checks-1.log` (an earlier model draft): the first `two_touches_keep_one_frame_and_give_the_other_back`
  assumed both touches always draw, which a touch after the install does not; the model was corrected to count draws.
  Kernel clippy (x86, x86 with actuators, aarch64, library) and `kernel-loom` clippy: exit 0.
- `models.sh` -> `models-1.log`, with the corrected model: `--test shm_slot` exit 0 (3 passed); with
  `--features slot-install-relaxed`: exit 101, `a_frame_is_handed_over_with_what_its_drawer_wrote` and
  `two_touches_keep_one_frame_and_give_the_other_back` fail on loom's causality violation; `kernel-loom` clippy exit 0.
- `checks-2.sh` -> `checks-2.log` at 14bc8a0f3 (the PR head): `cargo test -p toyos-build --lib ci::` exit 0;
  `cargo run -- --ci host models` exit 0, 84 steps all green, control `slot-install-relaxed` reaching both verdicts;
  kernel clippy for x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`, aarch64-unknown-none-softfloat
  and the library's tests: exit 0 each.

## Review r1 (head 71b2f1586): a page draws once, under the region's first-touch lock

- `checks-3.sh` -> `checks-3.log`: `--test shm_slot` exit 0 (3 passed: one draw a page with both touchers handed it,
  a frame handed over with its zeros, a later touch drawing none); with `--features slot-install-relaxed` exit 101,
  `a_frame_is_handed_over_with_what_its_drawer_wrote` and `two_touches_draw_once_and_are_handed_one_frame` failing on
  loom's causality violation; `kernel-loom` clippy (all targets, with and without the control) exit 0;
  `cargo test -p toyos-build --lib ci::` exit 0 (21 passed); `cargo test -p kernel --lib --features sched-check` exit 0
  (461 passed); `cargo run -- --ci host models` exit 0, 84 steps all green, `slot-install-relaxed` reaching both
  verdicts; kernel clippy for x86_64 (default, boot+test actuators, boot actuators), aarch64 (default, boot+test
  actuators) and the library's tests: exit 0 each.

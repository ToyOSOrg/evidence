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

## Rebased onto main 818809583 (2026-11-12)

`rebase-checks.log` (`rebase-checks.sh`): the stack rebased onto main, conflicts resolved in `kernel/src/mm/space.rs`
(main's populate now fills an object range's run too, #1245) and in the spawn and frame-allocator records. At each
head (#1250 4e9f6f2b2, #1268 c00a628f1, #1270 0c76f7a46): `vm::` and `frames::` tests exit 0; kernel clippy for
x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`, aarch64-unknown-none-softfloat and the library's
tests, exit 0 each. At #1270's head: `--test shm_slot` exit 0 (3 passed), and with `slot-install-relaxed` exit 101,
the two hand-over models failing.

## The batched object run (head 4c6836706)

- `checks-4.sh` -> `checks-4.log`: `--test shm_slot` exit 0 (4 passed, `two_runs_draw_each_page_once` new: two runs
  sharing a page draw each page once and are handed the shared page's one frame); with `slot-install-relaxed` exit 101,
  the two hand-over models failing; `kernel-loom` clippy with and without the control exit 0;
  `cargo test -p kernel --lib --features sched-check` exit 0 (465 passed); kernel clippy for x86_64 (default, boot+test
  actuators, boot actuators), aarch64 (default, boot+test actuators) and the library's tests: exit 0 each.
- `models-2.log`: the same models and control run beforehand, outside a build slot, with the same results.

## Review r3 (head 917b8ef1a)

- `checks-5.sh` -> `checks-5.log`: `--test shm_slot` exit 0 (4 passed); with `slot-install-relaxed` exit 101, the two
  hand-over models failing; `kernel-loom` clippy exit 0; kernel clippy for x86_64-unknown-none,
  aarch64-unknown-none-softfloat and the library's tests: exit 0 each.

## Rebased onto main 75bdec3cd, after #1259 (2026-11-12)

`rebase2-checks.log`: the one conflict was `kernel/pure/vm.rs`'s tests, where #1259's `an_object_maps_as_what_it_is`
and #1250's copied-page tests both stay. At each head (#1250 308e990a6, #1268 e23c2d6f8, #1270 ea1010709): `vm::`
exit 0 (17 passed) and `frames::` exit 0 (39 at #1250, 40 above); kernel clippy for x86_64-unknown-none, x86_64 with
`boot-actuators,test-actuators`, aarch64-unknown-none-softfloat and the library's tests, exit 0 each. At #1270's head:
`--test shm_slot` exit 0 (4 passed); with `slot-install-relaxed` exit 101, the two hand-over models failing.

## Rebased onto main a7ca8ad09, after #1223 and #1261 (2026-11-12)

- `rebase3-range-diff-1250.txt`: #1250's round-1 commit changed to compose with #1223, which gave
  `sched::futex::revoke_frames` the space's wait count: `discard`'s call is `revoke_frames(&self.futex, frames)`.
  Every other commit of the stack is unchanged (`=`); #1270's first commit differs only in `kernel/loom/src/lib.rs`'s
  context, where #1261 removed the poll modules beside which `shm_slot` was declared
  (`rebase3-range-diff-1270.txt`).
- `rebase3-checks.log`: at each head (#1250 9d9d5ee0f, #1268 c2e8b9fba, #1270 4765676e3) `vm::` exit 0 (17 passed),
  `frames::` exit 0 (39, 40, 40); kernel clippy for x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`,
  aarch64-unknown-none-softfloat and the library's tests, exit 0 each. At #1270's head `--test shm_slot` exit 0
  (4 passed); with `slot-install-relaxed` exit 101, the two hand-over models failing.

## Rebased onto main 3c5c55584, after #1251 and #1271 (2026-11-12)

`rebase4-range-diff.txt`: comment-only. #1251 added "no CPU holds its root ([`Space::retire`])" to the doc on
`impl Drop for AddressSpace`, which #1250 rewrote; the resolution keeps that clause and #1250's wording for the rest.
Every other commit of the stack is `=`. The guest runs at the previous heads (#1250 43135806312 at 9d9d5ee0f, #1268
43135817474 at c2e8b9fba, #1270 43135829383 at 4765676e3) stand; those heads are kept on `hold-*` branches.

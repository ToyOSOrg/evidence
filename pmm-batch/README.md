# PR 1268: a draw of many promised frames takes the frame allocator's lock once

- `checks-and-stage.sh` -> `checks-and-stage.log`, at 2cfa7887b (stacked on PR 1250's head 1d151cba1):
  `cargo test -p kernel --lib --features sched-check frames::` exit 0 (41 passed) and `vm::` exit 0 (17 passed);
  `mutation-no-upfront-check.patch` applied (the batch draws before checking its promises): exit 101,
  `a_batch_past_its_promises_is_a_panic` fails (the panic comes from the eleventh single draw, with another message);
  reverted; kernel clippy for x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`,
  aarch64-unknown-none-softfloat and the library's tests, adopted lints and `-D warnings`: exit 0 each. Then the A/B
  staged for both benches (`exit 2` is staging's own: it touched no machine).
- `ab-registration.patch`: the MEASUREMENT ONLY `batch_ab` row both sides carry (never to land).
- `request5.txt`: the metal request, A B B A on each bench. Results land here when the boots are run.

## Review r1 (head 1047f13f1, on PR 1250's 8245c9d03)

- `checks-r1.log` (`checks-r1.sh`): `frames::` exit 0 (40 passed), `vm::` exit 0 (16 passed), clippy of the library's
  tests and of the kernel for x86_64-unknown-none exit 0. The test of the batch's up-front check is deleted (a draw
  past the promises already panics), and with it the mutation above, which showed only a different message.

## Rebased onto main 818809583 (2026-11-12)

`rebase-checks.log` (`rebase-checks.sh`): the stack rebased onto main, conflicts resolved in `kernel/src/mm/space.rs`
(main's populate now fills an object range's run too, #1245) and in the spawn and frame-allocator records. At each
head (#1250 4e9f6f2b2, #1268 c00a628f1, #1270 0c76f7a46): `vm::` and `frames::` tests exit 0; kernel clippy for
x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`, aarch64-unknown-none-softfloat and the library's
tests, exit 0 each. At #1270's head: `--test shm_slot` exit 0 (3 passed), and with `slot-install-relaxed` exit 101,
the two hand-over models failing.

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

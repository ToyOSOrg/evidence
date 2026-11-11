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

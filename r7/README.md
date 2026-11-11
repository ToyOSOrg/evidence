# PR #1269, round 7: review r6's model suggestion

At 9ea6a0ad7 (test code only over 26d192003):
- `cargo test -p kernel --lib paged::`: 34 passed, among them `a_wait_translated_before_a_removal_never_arms_on_a_frame_given_back` (six steps explored from a translated wait, a withdraw and a walk), with the model's `check` asserting no futex waiter is keyed on a given-back frame after any step.
- `mut-r6-uncounted-visit.patch` / `.log`: the visit's clear uncounted (B13). Exit 101: `a_wait_translated_before_a_visit_does_not_arm_on_a_frame_given_back` and `a_wait_translated_before_a_removal_never_arms_on_a_frame_given_back` red on the oracle ("frame 101 given back with a futex waiter keyed on it"). Source restored byte-identical (`cmp`).
- `clippy-r6-tests.log`: `cargo clippy -p kernel --lib --tests --features sched-check` with the workspace's kernel lints, exit 0.

Evidence for ToyOSOrg/ToyOS#1068. Local host: macOS arm64, under load from other agents; times are local and indicative only.

- host-parts/after-<part>.log: `cargo run --locked -- --ci host <part>` at the revision in after.rev (pre-amend 20c6154a0); exit codes and seconds in after-summary.txt. lint and models redded on the $TMPDIR lock guard, fixed in 410828abc.
- host-parts/after2-<part>.log: lint and models rerun at 410828abc (after2-summary.txt); tests and userland pass owed=true unchanged, so their after-* results stand.
- host-parts/ci-unit-2.log: `cargo test --lib ci::` at 410828abc.
- controls-bounds/ctl-<control>-b<N>.log: SDK session-model controls at preemption bounds 2 and 3 (bound 5 -> 3). controls-bounds/aw-*.log are kernel-loom's `an_answer_wakes_the_submitter_its_look_hid_the_poll_from`, not `looks_without_the_gate_lose_no_wake` as this file first said; they carry no command or revision and are superseded by bounds-r2/.
- bounds-r2/: the two bounds below 3, rerun at 410828abc by run.sh, each mutation and bound a checked patch reverted in the same run; runs.txt has every run's patches, command and exit code.
  - `an_answer_wakes_the_submitter_its_look_hid_the_poll_from` (bound 2): aw-no-complete-wake.patch removes `polls::complete`'s wake (a hand mutation, no declared control); with it the test is green at bound 0 and red at 1 and 2; unmutated it is green at 1 and 2.
  - `looks_without_the_gate_lose_no_wake` (bound 1): the declared control `transport-ungated-violation` is red at 0 and 1; unmutated green at 0 and 1.
- blockdev-r2/: review r1's distinct-media test, green with test-edit.patch and red under none-inherits.patch.
- bcachefs-controls/: checked patches (no restore after a crash state; no journal pre-flush) and the red runs they produce.

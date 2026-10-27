Evidence for ToyOSOrg/ToyOS#1068. Local host: macOS arm64, under load from other agents; times are local and indicative only.

- host-parts/after-<part>.log: `cargo run --locked -- --ci host <part>` at the revision in after.rev (pre-amend 20c6154a0); exit codes and seconds in after-summary.txt. lint and models redded on the $TMPDIR lock guard, fixed in 410828abc.
- host-parts/after2-<part>.log: lint and models rerun at 410828abc (after2-summary.txt); tests and userland pass owed=true unchanged, so their after-* results stand.
- host-parts/ci-unit-2.log: `cargo test --lib ci::` at 410828abc.
- controls-bounds/ctl-<control>-b<N>.log: SDK session-model controls at preemption bounds 2 and 3; aw-*: looks_without_the_gate_lose_no_wake and its control at bounds 0-2.
- bcachefs-controls/: checked patches (no restore after a crash state; no journal pre-flush) and the red runs they produce.

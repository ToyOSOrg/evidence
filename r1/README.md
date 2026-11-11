# ToyOS #1234, round 1: a descriptor call holds its object without a lock

Branch `fd-hold-without-lock` at d8f9a490b50f97a27704343e88346d66dcf1480a, base 34cb4c9183c73b46d330d272cb80c68c0c598bb8.
Paths are masked: `$SCRATCH` is the assignment's scratch directory (its worktree `wt/`, check trees `check-base/` and `check-head/`), `$HOME`, `$CARGO_HOME` and `$HOST_TMP` the developer host's, `$RUNNER_*` the guest runner's.

- `host/`: the targeted host checks (`rev.txt` names the revision). Each log written by the round's script starts with its command and ends with `exit <code>`; `build-only.log` ends with its exit.
  - `sdk-fd.log`: `cargo test -p toyos --lib fd::`, exit 0.
  - `control-*.log`: the three negative controls as `build/ci.rs`'s `run_control` issues them, each exit 101 with every named case `FAILED`.
  - `build-controls.log`: `cargo test -p toyos-build --lib -- every_model_control_is_run ci::`, exit 0.
  - `clippy-*.log`: the `toyos` clippy shapes, each exit 0.
  - `build-only.log`: `cargo run -- --build-only`, exit 0.
- `guest/run-43036214335.log`: guest rows at the head, 7 of 7 green.
- `metal-staging/`: `--metal-readback` staging of the `osbench` row at base and head for both benches (exit 2 is the harness's "staged, not judged"). No machine was touched.

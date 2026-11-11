# PR #1260: the run queue's operations cost less and decide as before

Paths are masked: `<wakeperf>` is the assignment's scratch directory, `<scratch>` its parent, `<home>` the user's home.

## diagnosis/: where the wake, IPC and yield paths spend their time (2026-11-11)

Measurement only. Branch `wakeperf-scout` (pushed, never lands) on main 422915e2c:

- `43b48b3bf`, `6006d1e68`: a `scout-seg` kernel feature times the segments between probes on each CPU; osbench brackets its timed loops with the readings. Metal rows `scout_seg`, `scout_plain`.
- `e5dd1e9dc` (reverted after staging): `[profile.toyos]` with `debug-assertions` and `overflow-checks` off, kernel and userland: the `unasserted` image.
- `6a87a3a71`: finer probes below drain, leave, enter, pick and charge in the pure scheduler: the `fine` image.

One boot per image on each bench (T14, AMD bench), osbench `system`, `sched`, `ipc`, `time`. Every boot's verdict passed.

- `<bench>/<arm>.results.txt`: the osbench result lines of each boot (`plain` is the tree's own kernel).
- `<bench>/{seg,fine}.scoutseg.txt`: the probe readings, `row cpu id:count:ticks ...`, with the TSC rate.
- `tables/<bench>-compare.md`: each row against the 2026-11-11 scoreboard's Linux and main; `unasserted/plain` is what the checks cost.
- `tables/<bench>-seg-grouped.txt`, `-seg-full.txt`: the coarse split per row (`tools/grp.py`, `tools/seg.py`), each probe's own cost (the `calibrate` row) subtracted per hit.
- `tables/fine-<bench>-grouped.txt`, `fine-<bench>-full.txt`, `fine-split.txt`: the fine split; `split.txt` sums the run-queue probes into drain, leave, park, enter, charge, pick, publish (`tools/split.py`).

A probe serialises the pipeline around it, so each segment overstates its part; the ranking is the finding. Probe IDs and their names are in `tools/seg.py`.

## checks/: PR #1260 at 8750f770b

- `pr1-checks.log`: the kernel library's tests (`cargo test -p kernel --lib`, and with `sched-check`) and the clippy shapes of `build/clippy.rs` that compile the touched files; each command's exit code.
- `pr1-mutations.log`, `mutations.py`: the differential test's negative controls, each applied to the committed head, run, and restored.
- `pr1-models.log`: `cargo run -- --ci host models` (kernel-sim, kernel-loom and every model control).
- `bench-*.txt`, `rq_bench.rs`, `pass_bench.rs`: the host microbenchmark (Apple M-series, the kernel's `toyos` profile, best of 7), scratch code that was never committed; indicative only.

# ToyOS against Linux, nightly 2026-10-31-2316

ToyOS at `dc1a8642e49d88a082fbbedc649cd6c5d5ce6954` (origin/main at the night's start). Each bench's Ubuntu as installed is the baseline. Per bench the night runs Linux `osbench all`, then 1 pair(s) of a ToyOS benchcase boot and a Linux `osbench all`, then, when the tree has the `osbench_energy` row, its boot and a Linux `sudo osbench energy` with the radios blocked. A ToyOS run counts once the pinned tree's judge passes its readback (`cargo test --test toyos-build -- --metal --metal-readback <dir> [--metal-host <bench>] osbench`).

Linux binary: `osbench` built at `dc1a8642e` with `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos`, sha256 `572f5daa9d43bcb26e7d5e9241e860d6bba34cbfb040ae64f814cca78794e663`. Energy row: staged by the osbench filter and run.

With one or two runs of a system no row can resolve (README: four a side is where a row first can). The table is a trend: `delta.md` lists the rows whose value left the range of up to seven earlier nights' runs.

## Benches

**t14**: linux-1 0, toyos-1-boot 0, linux-2 0, toyos-energy-boot 0, linux-energy 0, toyos-1-judge 0, toyos-energy-judge 0. Compare: 188 rows; resolved: none. no earlier night to take a delta against. Energy compared; no earlier night to take a delta against.
**amd**: linux-1 0, toyos-1-boot 0, linux-2 0, toyos-energy-boot 0, linux-energy 0, toyos-1-judge 0, toyos-energy-judge 0. Compare: 188 rows; resolved: none. no earlier night to take a delta against. Energy compared; no earlier night to take a delta against.

## Files

Per bench: `linux-<i>.txt` and `toyos-<i>.txt` are each run's osbench lines (the ToyOS ones taken from the readback's kernel log), `toyos-<i>.judge.log` the judge, `compare.md` the `osbench-compare` table over them, `delta.md` the night-over-night delta, `status.txt` each step's exit code. Machine model, disk model, host and user names, paths, MAC and IP addresses are masked.

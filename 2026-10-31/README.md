# ToyOS against Linux, nightly 2026-10-31

ToyOS at `69512b82b6170d02195c06a33c13a896f2b514b0` (origin/main at the night's start). Each bench's Ubuntu as installed is the baseline. Per bench the night runs Linux `osbench all`, then 1 pair(s) of a ToyOS benchcase boot and a Linux `osbench all`, then, when the tree has the `osbench_energy` row, its boot and a Linux `sudo osbench energy` with the radios blocked. A ToyOS run counts once the pinned tree's judge passes its readback (`cargo test --test toyos-build -- --metal --metal-readback <dir> [--metal-host <bench>] boot:benchcase`).

Linux binary: `osbench` built at `69512b82b` with `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos`, sha256 `5092a30272a36f339ad864f041a84faa4d2170411500356e1fa196d4a2a1e130`. Energy row: the tree has no energybenchcase boot.

With one or two runs of a system no row can resolve (README: four a side is where a row first can). The table is a trend: `delta.md` lists the rows whose value left the range of up to seven earlier nights' runs.

## Benches

**t14**: skipped staging. No comparison: it needs a passing Linux run and a judged ToyOS boot.
**amd**: skipped staging. No comparison: it needs a passing Linux run and a judged ToyOS boot.

## Problems

- main: t14: the benchcase staging exited 2, or did not stage the osbench row alone (<home>/.claude/jobs/2280e09e/tmp/scratchpad/orch/nightly/logs/2026-10-31/stage-t14.log)
- main: amd: the benchcase staging exited 2, or did not stage the osbench row alone (<home>/.claude/jobs/2280e09e/tmp/scratchpad/orch/nightly/logs/2026-10-31/stage-amd.log)
- t14: no staged benchcase image: bench skipped
- amd: no staged benchcase image: bench skipped

## Files

Per bench: `linux-<i>.txt` and `toyos-<i>.txt` are each run's osbench lines (the ToyOS ones taken from the readback's kernel log), `toyos-<i>.judge.log` the judge, `compare.md` the `osbench-compare` table over them, `delta.md` the night-over-night delta, `status.txt` each step's exit code. Machine model, disk model, host and user names, paths, MAC and IP addresses are masked.

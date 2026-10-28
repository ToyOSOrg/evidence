# PR #1073 round 2

- `cpu-clock.txt`, `compare.txt`: the first boots (59dcd1f03) against main, by group.
- `run2-out.txt` (from `run2.py`): the second boots (f8749dc69), A* (deep states off, all else equal),
  B2, and main's A, by group, with each crunch and malloc_churn row's placement and per-CPU
  counters (busy, run_mhz, core C6/C7, deep idles).
- `mutations/`: round-2 and round-3 mutations, each checked, applied, run and restored; `summary.txt`.
- `logs/`: `cargo run -- --ci host` at the heads their `.rev` names (5, 6, 7).
- `request-r2.txt`: the second boots as requested (run in the orchestrator's order).
Raw readbacks stay out: they carry machine identifiers.

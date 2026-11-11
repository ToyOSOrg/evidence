# PR 1225: path routing through the view's own names, and the file-call diagnosis it came from

- `fileops-diagnosis/runs/`: per boot, the `osbench_fileops` lines extracted from the kernel log, and the runner's
  verdict. T14 A-1, A-2 (base + scratch stage timers), T14 B-1 (the same + this change), AMD A-1. Machine model,
  firmware and CPU strings masked.
- `fileops-diagnosis/analysis/`: `split.py` (p50 per row and stage, one column per boot: #0 T14 A-1, #1 T14 A-2,
  #2 T14 B-1, #3 AMD A-1) and its output.
- `fileops-diagnosis/judge/`: the offline judge's logs (exit 1 for all four: `boot.txt` lacks `back_unix_secs`).
- `fileops-diagnosis/linux/`: `strace -c` of `osbench files` and `osbench persist` on both benches' Linux.
- `fileops-diagnosis/diagnosis.md`: the measured split (section 4) and the routing measurement (section 5).
- `host-checks/`: the host checks at 6f2ea3427 (`revision.txt`), run by `route-checks.sh` (paths masked): the SDK's
  `files::` tests (12 passed) and clippy's two `toyos` shapes from the build's lint list, warnings denied; each log
  ends with the command's exit code.
- `guest/run-43054675576.log`: the guest runner's log of `a_row_reaches_its_own_state_and_no_other` at 6f2ea3427,
  PASS (`--ci rows`, 5 steps all green).

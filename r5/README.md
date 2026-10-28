# PR #1074, round 5: where a 64 KiB pipe write's time went

- **The images:** measurement-only, never land.
  - diag-base is 544f9cc3c + `diag/diag-base.patch`; diag-head is cd42d13a4 + `diag/diag-head.patch`.
  - Both ran on the T14, and both judge 1 passed (`diag/judge-*.log`).
- **The counters:** each `pipediag` line is one `pipe.throughput` round's pipe. It gives TSC ticks for lock spin, hold, the user walk, frame take/give and memcpy runs. The `pieces` fields are cumulative across the walk's callers: reach-and-pin against copy.
- **Ticks per KiB moved, median of 8 rounds:**

| Write size | Walk reach + pin, base / head | Walk copy phase, base / head |
|---|---|---|
| 65536 | 50.7 / 50.0 | 123.5 / 153.8 |
| 16384 | 77.4 / 72.5 | 183.8 / 206.4 |

- **Memcpy runs per 64 KiB write:** base 17, head 32.
- **Bookkeeping at 65536:** frame take and give are under 1 tick/KiB, and lock spin is equal.
- **The fix under test:** 0a48bf8b4 merges continuing runs into one copy. `diag/diag-merge.patch` counts the memcpys it then issues.
- **`retention.txt`:** frames a pipe holds under bell, request/answer and bulk patterns, from the real `Bytes` on the host.

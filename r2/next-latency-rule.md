# The latency rule for the next APST A/B, fixed before it runs

This is the orchestrator's decision of r1. A drive's stated ENLAT/EXLAT is a
claim, not a bound. The bound is Linux parity on the same bench, measured in
the same session as the ToyOS boots.

- **Rows.** Per bench, with the same binary revision on both systems:
  - ToyOS B: `persist.write_4k_fsync_after_idle` from the `osbench_disk` boots.
  - Linux: the same row from `osbench persist` runs.
- **The bound has two parts. Both must hold on every bench.**
  - The p50 cost: median over B boots of the after-idle p50, minus the median over A boots of the after-idle p50. It must be at most the median over Linux runs of (after-idle p50 minus `persist.write_4k_fsync` p50).
  - The worst sample: B's largest after-idle sample over all its boots must be at most Linux's largest after-idle sample over all its runs.
- **Back-to-back rows:** as in r1 §3. A row regresses if B is more than 5% worse and the difference resolves. None may regress.
- **Idle:** as in r1 §1. B must not resolve higher than A.
- **Boots per bench:** at least 2 A + 2 B `osbench_disk` boots, 3 A + 3 B `osbench_energy` boots and 2 Linux persist runs. The order alternates which arm goes first in each round.

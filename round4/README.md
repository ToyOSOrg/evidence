# PR #873, round 4, at ToyOS 806130ce9a4a0e395391b1d3bcd90fab8d89fbde

- `gates/`: `cargo run -- --ci host`, both `--build-only` images and `cargo test`, at `gates.head`; each log ends in its exit.
- `mutations/`: m3 and m4 as staged at this head.
- `stage/`: the six `--metal-readback` stagings (exit 2, `Verdict::Staged`) and the ordered request.
- `oracle/sources.md`: Intel's ADL063/RPL043 text and the SDM, which the design follows.
- `derived/`: round 2's `scout_tlb_base` and `tlb_shootdown_cost` figures, base against head, read off `r2/metal/`.

Published with this round, every metal reading of rounds 2 and 3, masked by the orchestrator's mask:
- `r2/metal/<arm>/`: round 2's readbacks (kernel, loader, verdict) and each judge's log, at 86877feb6 (head, m2, m3, m4),
  d4c2f8ebe (base) and 0bc71d325 (head with the scout's two commits); images omitted.
- `r3/metal/<arm>/`: round 3's, at 854509da1 (head) and its m1, m3, m4.
- `runner/`: the orchestrator's runner logs, each boot's exit and each judge's exit, and each T14 boot's console log.

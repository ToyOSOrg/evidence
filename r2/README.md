# PR 1199, round 2

| check | command | revision | target | exit | log |
|---|---|---|---|---|---|
| guest | guest-rows `bar_map_again bar_map_behind_a_bridge`, run 42914728075 | e56cd252b | guest runner: x86-64 q35, the NIC on the root bus and behind a root port | 0: both PASS | `logs/guest-42914728075.log` |

Round 1's `virt_claim_lpi` (171044157) and host results stand: the later
commits change `bar_map_again.rs`, a comment in `tests/toyos.rs` and the
manual's line.

User names, home paths and the runner's machine name are masked.

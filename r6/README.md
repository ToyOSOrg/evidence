# #1057, round 6: review r5's fix

Head `825114d83`. Paths are masked.

`pmm::alloc_frame` now goes through `try_with`, so the post that a kept superframe's split sets is made once the allocator's lock is let go. This is established by inspection: no cheap kernel-level law reaches a kept superframe's split under a waiter.

| file | command | exit |
|---|---|---|
| ci-host.log.gz | `cargo run -- --ci host`: 103 steps green | 0 |
| proving-1..3 | `memory_floor_holds_the_controls` | 0 ×3 |
| g3.log.gz | round 5's `controls/g3-no-returned-post`, applied, run and reversed: the take step's new `taken > 0` guard does not hide a missing post | 1, stalled waiting for the greedy job |
| t14-request.txt | `floorcase` staged at `825114d83` | 2, the staging-only exit |

The T14 `floorcase` boots at `71e3b8d78` and `e8829f986` passed (the coordinator's runs).

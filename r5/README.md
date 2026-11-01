# PR #1125 r5: review r3's checks, at display-stage1 230c6201d

- `ci-host-tail.txt`: `cargo run -- --ci host`, exit 0, 107 steps green.
- `kernel::rmrr`: 11 host tests pass. New: every kept range is covered by the union of the RMRRs it came from, and not by any single one of them, which is the merged case that per-region containment refused.
- `mutation-rmrr-covered.log`: the negative control. A checked mutation makes `covered` check one RMRR at a time, as the old assertion did. The new test fails, exit 101, and the mutation is restored.
- The segment rule is a branch in vtd's DMAR walk: an RMRR off the enumerated segment gets one `Unknown` scope. It is established by inspection only, because no planned machine has a second segment.
- No T14 boot: the T14 has one region on segment 0, so these fixes do not change its path.

Paths are masked.

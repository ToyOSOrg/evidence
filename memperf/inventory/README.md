# The inventory's free index, kept once: host evidence

`harness/` is a scratch crate. It is measurement only and never lands. Its two other modules are not copied here. `old.rs` is `kernel/pure/vm.rs` at main 34cb4c918 with its test module removed; that code is byte-identical at main f79df9574, the PR's base. `new.rs` is the PR's `kernel/pure/vm.rs` with its test module removed. The release profile matches the kernel's: opt-level 2, debug assertions and overflow checks on. The host is aarch64 macOS.

## Differential: `harness diff`

Both inventories run through the same seeded random changes: placements, inserts (half of them right after a placement), removals, updates of protection and kind, and queries. The spaces are 64, 512 and 4,096 pages. Their entries are private ranges, objects and copies, whose offsets are chosen so that neighbours often continue each other.

After every change the harness compares:

- every answer: a placement, an insert's acceptance, a removal's entries, an update's acceptance, `is_free`, `covered`, `backed`, `find` and `meeting`;
- the whole state: every entry and 24 placements.

Results:

- `diff-2.log`: 300 seeds, 6,000,000 changes, all equal, exit 0. It counts what the changes did.
- `diff-1.log`: the same run before the counts were added, also all equal, exit 0.
- `mutation-{1,2}.patch` and `.log`: seeded defects in `new.rs` against a 30-seed run. Mutation 1 leaves a stale gap on removal; mutation 2 skips the join with the following range. Each failed at its first diverging state, exit 101. The unmutated file was restored and checked with `cmp`.

## Timing: `harness bench`

One page is placed, checked free, inserted and removed in a space of 16, 64 or 512 ranges. "joins" means the page lands beside a private read-write range that it continues, so the insert joins it and the removal splits it again. The two inventories alternate in 300 batches of 2,000 calls each, and each call is timed by one `Instant` pair. Each cell is the min/median of the batch means in ns.

- `bench-2.log`. The host's load average was about 90 throughout, so read the figures as relative, not absolute.

## The committed tests

`unit-mutation-{1,2}`: the PR's unit tests, run in a standalone copy of the committed file. Mutation 1 is the differential's mutation 1, a stale gap on removal. Mutation 2 drops the gap below an inserted range. The mixed-load test failed for both, exit 101, at its new exact-placement check. `unit-mutation-1-oldtests.log`: main's tests also fail on mutation 1.

## Host checks of the committed branch

`host-checks/` holds the four commands at 55fafd658, run on the aarch64 macOS host; `exits.txt` gives each exit code, all 0. They are the kernel library's tests as host CI runs them, its host clippy shape with tests, and clippy on both kernel targets, with the adopted lints and `-D warnings`.

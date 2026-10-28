# ToyOS #1088: the pager and swap design

#1088 records the design as `issues/anonymous-memory-swaps-to-an-encrypted-partition.md`.

- `plans/` holds every revision of the plan:
  - r1–r3 were reviewed as `reviews/review-r1.md`–`review-r3.md`, with the r1–r4 answer map in `reviews/notes.md`;
  - r5 was reviewed in `reviews/review-r5.md`;
  - r6 and r6.1 in `reviews/review-r6-followup.md`;
  - r7 and r8 in `reviews/review-r7-and-r8-followup.md`.
- r8.1 landed. r8.2 is r8.1 with the architect's 2026-10-28 refinements of §5.1 and §11 folded in, which the
  track also carries.
- `checks/ci-host.log.gz` is `cargo run -- --ci host` at `de417c2b6` plus the issue files. It exited 0, with 104
  steps green.

The residency figures the plans cite come from #1057's round 3 evidence,
`db37c51e785164253479d4ee440e999abfb206da/r3/measure-2.log.gz`, in this repository.

Paths are masked as `<home>`, `<worktree>`, `<primary-checkout>` and `<tmp>`.

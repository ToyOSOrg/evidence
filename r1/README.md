# PR #1269, round 1: step 2 of mapped paged objects

Host checks at f85ec672b (kernel lint `clippy-3g.rev`) and at the c478a03ba tree (host tests), worktree masked as `<worktree>`.

- `clippy-3g.log`: the kernel's four lint shapes (x86-64 host tests with `sched-check`, x86-64, x86-64 with the actuators, AArch64), exit 0 each, at f85ec672b. `clippy-3a.log`, `clippy-3b.log`: the same at the rebased base and after the refusal-cause commit.
- `host-3c.log`: `cargo test -p kernel --lib paged::` (29), `-p toyos-abi --lib end::` (3, after the past-the-last-fault word moved to 9), `-p toyos --lib process::`, `-p toyos-libc-copies spawn_requests` and `each_end`. Exit 0 each but the first `end::` run, whose red is the stale word the commit fixed.
- `loom-ranges.log`: `kernel/loom` `--test paged_ranges`, pass. `loom-ranges-control.log`: the same with `--features ranges-less-relaxed`, red with loom's "Causality violation: Concurrent read and write accesses".
- `checks-suite-split-3.log`: `cargo test --test toyos-checks suite_split`, pass.
- `clippy-sdk-3.log`: `cargo clippy -p toyos -p toyos-abi -p toyos-libc-copies --lib --tests -- -D warnings`, exit 0.
- `host-paged-2r.log`, `m2-*.patch` / `m2-*.log`: the pure model's run and its mutation controls from the commits before the rebase (the pure index is byte-identical after it), each control red as its patch names.

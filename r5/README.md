# PR #1269, round 5: review r4 answered, rebased onto #1259 at main 06fcb81ea

- `checks-r4.log`, at 8ac0f68d9 on macOS arm64, exit 0 each: `cargo test -p kernel --lib --features sched-check` (473 passed); `cargo run -- --ci host lint` (5 of 5 green); `cargo run -- --ci host models` (84 of 84 green).
- `checks-1269-rebase.log`: the same three at 98953580b, the rebased branch before round 4 (472 passed; 5 of 5; 84 of 84).
- `mut-r4-sweep-before-visits.patch` / `.log`: the walk answers `Sweep` before the pass's visits (B8's defect). `cargo test -p kernel --lib paged::` exit 101: `every_interleaving_keeps_each_leaf_on_its_pages_one_frame` and `long_runs_keep_each_leaf_on_its_pages_one_frame` red on the model's oracle ("frame N given back with a futex waiter keyed on it"); four scripted tests red on their expected order.
- `mut-r4-pre-r3.patch` / `.log`: the rule before r3, a visit resetting the sweep flag and a sweep while it is unset. Exit 101: `a_waiter_an_unmap_left_is_never_on_a_frame_given_back` red on the oracle ("frame 101 given back with a futex waiter keyed on it"); `a_page_marked_during_the_sweep_is_swept_before_its_frame_goes_back` red ("a pass began since the sweep").
- Each patch applied to the uncommitted round-4 tree; the source restored byte-identical (`cmp`) before the commit.

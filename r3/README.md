# PR #1269, round 3: review r2 answered

`checks-5f9f6fe41.log`, at 5f9f6fe41 on macOS arm64, each exit 0:
- `cargo test -p kernel --lib --features sched-check`: 472 passed, among them the walk's set (`the_walks_set_is_read_a_batch_at_a_time_in_marking_order`), the page placement's boundary (`a_page_is_placed_only_inside_its_range`) and the model whose visit is the kernel's rule with batches of one.
- `cargo run -- --ci host lint`: 5 steps, all green (clippy over every shape, the kernel's among them).
- `cargo run -- --ci host models`: 84 steps, all green (the loom and simulator models and their controls, `ranges-less-relaxed` among them).

# PR #1269, round 8: rebased onto main d1cefbaf9 (#1273)

- `checks-fd13c116e.log`, at fd13c116e on macOS arm64, exit 0 each: `cargo test -p kernel --lib --features sched-check` (513 passed); `cargo test --test toyos-checks suite_split`; `cargo run -- --ci host lint` (5 of 5 green); `cargo run -- --ci host models` (93 of 93 green).

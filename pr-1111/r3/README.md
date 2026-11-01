# PR #1111 r3: step 2 dropped (`e938fe3e5`)

- `drop2-kernel-lib.log` and `drop2-sim.log`: `cargo test -p kernel --lib` and `cargo test -p kernel-sim` at `e938fe3e5`, exit 0 each.
- `ci-host-stack-top-b8bd0ea02.log`: `cargo run -- --ci host` at the top of the stack, #1129, `b8bd0ea02`: 108 steps all green.

# PR #1134 r5: review r2, at display-stage3 e884ee2f6

- `ci-host.log`: `cargo run -- --ci host` at e884ee2f6, exit 0, 107 steps green.
- The change: a connection counts as live once a present arrives on it, rather than once one is answered. The docs and the track say what the code does. No new run is needed for that.

Paths are masked.

# pr-1168 r0

- `futex-loom.log`: `cargo test -p kernel-loom --test loom_watch` at the change: 13 passed.
- `futex-control.log`: the same with `--features post-n-counts-pre-park`: the new model red.
- `host-futex.log.gz`: `cargo run -- --ci host` at 783a0b3cc: rc=0, 110 steps.

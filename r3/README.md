# PR #1190 r3 (head `a99667bf0`)

| log | command | exit |
|---|---|---|
| `f6-ci-host.log` | `cargo run -- --ci host` at the head | 0, 109 steps |
| `f6-lk-b.log` | `cargo test` in `system/logkeeper` | 0, 26 passed |
| `f6-harness.log` | `cargo test --test toyos-build --no-run` | 0 |

`f6-lk-controls.log` holds three mutations of `Volume::finish`, each applied,
run and restored: no shortfall line, no sync, and no catching up while there
is time. Each fails
`a_stop_with_more_owed_than_its_time_syncs_and_says_the_shortfall` (exit 101).

`guest-42030108549-summary.log`: the row was red at `f3a8caa18` (STALLED: no
refusal). The fill left the 256 KiB kept for `loader.log` free again once the
loader deleted and recreated it. This head fills every cluster.

# PR #1190 r1

| log | command | revision | exit |
|---|---|---|---|
| `f2-ci-host.log` | `cargo run -- --ci host` | `cd47061b5` | 0, 109 steps |
| `f-ci-host.log` | `cargo run -- --ci host` | `4594e8564` (pre-rebase) | 1: one red, `buildlock::tests::a_narrow_guest_does_not_overtake_a_wide_one_waiting`, `create …/locks/guest-cpus: Invalid argument`. Not reproduced at `cd47061b5`; the branch touches no `build/` code. |
| `f-logkeeper-r3.log` | `cargo test` in `system/logkeeper` | content of `ae16175b4` | 0, 24 passed |
| `f-build-x86.log` | `cargo run -- --build-only` | content of `ae16175b4` | 0 |

`f-logkeeper-controls.log` holds two mutations, each applied and then restored:
- a retry wait that does not double fails `a_refused_volume_is_asked_again_at_a_doubling_wait_to_a_bound`;
- `Hub::since` hiding what the replay let go fails `a_lost_file_is_given_the_boot_from_where_it_was_durable`.

Both exit 101. Restored, all 24 pass.

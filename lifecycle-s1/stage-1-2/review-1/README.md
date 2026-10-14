# Review round 1 of #926 (6173329461), fixes at `28360a6e5`

| file | command | revision | target | exit |
|---|---|---|---|---|
| `ci-host-3.log` | `cargo run -- --ci host` | `28360a6e5` | host | 0, 83 steps green |
| `guest-drives-3.log` | `cargo test --test toyos-build -- --nocapture a_drives_row_holds_one_process_per_function` (its judge now counts hand-overs, S1) | `28360a6e5` | QEMU 11.1.1 `HeadlessTwoEdu` | 0, passed |

`8d9503f47` after it changes one issue file. Masked with the orchestrator's `mask.sh`.

# PR #1163 r1 at 441d30473

| File | Command | Exit |
|---|---|---|
| host-test.log | `cargo test --test toyos-checks -- the_idle_second_admits_only_first_time_acpi_events` | 0 |
| controls/admit-everything.log | the same, with `idle_second_lines` partitioning `event(line) \|\| true`, then restored | 101, as intended |
| clippy.log | `cargo run -- --clippy` | 0 |
| acpiserver.log | `cargo test` in `system/acpiserver` | 0 |
| acpiserver-api.log | `cargo test -p acpiserver-api` | 0 |

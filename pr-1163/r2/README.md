# PR #1163 r2 at 6f33bf086

| File | Command | Exit |
|---|---|---|
| host-test.log | `cargo test --test toyos-checks -- the_idle_second_admits_only_first_time_acpi_events` | 0 |
| controls/admit-everything.log | the same with the classifier admitting every line, then restored | 101, as intended (the first time said twice is answered Ok) |
| clippy.log | `cargo run -- --clippy`, rerun on the settled tree | 0 |
| acpiserver.log | `cargo test` in `system/acpiserver` | 0 |
| acpiserver-api.log | `cargo test -p acpiserver-api` | 0 |

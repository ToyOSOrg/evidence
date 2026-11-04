# PR #1163 r3 at 81d479a81

| File | Command | Exit |
|---|---|---|
| host-test.log | `cargo test --test toyos-checks -- the_idle_second_admits_only_first_time_acpi_events` | 0 |
| clippy.log | `cargo run -- --clippy` | 0 |
| acpiserver.log | `cargo test` in `system/acpiserver` | 0 |
| acpiserver-api.log | `cargo test -p acpiserver-api` | 0 |

The classifier is unchanged since r2, so r2's control still applies. The guest jobs changed here are built by the metal staging; no QEMU row runs them.

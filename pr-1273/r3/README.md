# pr-1273, round 3: the AArch64 case's runner receives `power`

At `d9bc3e41d`, whose only change from `d2b9c877e` is `tests/images/virttmpcase.toml`:

| file | command | exit |
|---|---|---|
| `build-configs.log` | `cargo test --lib -- build::tests` | 0 |

It ran 48 tests, among them `every_config_renders_its_manifest`, `every_shipped_boot_config_is_covered` and `a_received_name_reaches_a_server_that_runs_and_never_its_own`, over the changed config.

# #928 review round 1

Head `503d1959945d867ea6b4dad6f6c5fefb01503012` (`origin/main` `e136c77fd` merged). Masked with `mask.sh`.

| file | command | revision | exit |
|---|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | `503d1959945d867ea6b4dad6f6c5fefb01503012` | 0, 86 steps green |
| `guests.log` | `cargo test --test toyos-build -- usbd_drives_the_spare bar_map_again lent_device_memory_refused bar_map_behind_a_bridge iommu_virtio_platform` (q35) | `503d1959945d867ea6b4dad6f6c5fefb01503012` | 0, 5 passed |
| `build-x86.log`, `build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `a88fcc71b`, `503d1959945d867ea6b4dad6f6c5fefb01503012` | 0, 0 |
| `mutation-trusted-bus.log` | `mutation-trusted-bus.patch` (a bridge's own bus not required below its secondary), `cargo test --manifest-path kernel/pci/Cargo.toml bridge::`, restored | `503d1959945d867ea6b4dad6f6c5fefb01503012` plus the patch | 101: `a_path_climbs_from_the_functions_bus_to_the_root` red, and `a_function_on_the_root_bus_has_no_path_whatever_a_bridge_says` never ends (an unconfigured 0/0 bridge becomes its own parent, so the walk loops) until the process dies |

`r2-build-x86.log` is from `a88fcc71b`; the head adds only the issue's `status: open`.

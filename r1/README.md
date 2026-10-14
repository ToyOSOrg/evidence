# #928: a BAR behind a bridge is placed only where its path forwards

Branch `wt/toyos-bridge-window`, base `origin/main` `2c3f61a3e`. Host: Apple silicon, QEMU 11.1.1. Masked with the orchestrator's `mask.sh`.

| file | command | revision | exit |
|---|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | `88dab83e0` | 0, 83 steps green |
| `guests.log` | `cargo test --test toyos-build -- usbd_drives_the_spare bar_map_again lent_device_memory_refused bar_map_behind_a_bridge iommu_virtio_platform` (q35) | `88dab83e0` | 0, 5 passed |
| `control-behind.log` | `production.patch` (every `kernel/` change) reversed, `cargo test --test toyos-build -- bar_map_behind_a_bridge`, restored | `88dab83e0` minus the patch | 1: the job ends 101, the NIC `NOT HANDED OVER` |
| `mutation-unrouted.log` | `mutation-unrouted.patch` (the path's routing check ignored), `cargo test --manifest-path kernel/pci/Cargo.toml behind`, restored | `88dab83e0` plus the patch | 101: `an_address_one_bridge_on_the_path_does_not_forward_is_never_offered` red |
| `build-x86.log`, `build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `88dab83e0` | 0, 0 |
| `manual-boot-{fix,control}-serial.log` | `manual-boot.sh`: q35 with the shipping image's virtio NIC behind a `pcie-root-port`, netstack claiming it; the fix's image and main's | fix uncommitted at `2c3f61a3e`, then `2c3f61a3e` | fix: `BAR 4 (0x4000 bytes) placed at 0xc000200000` inside the port's `0xc000000000..0xc020000000`, handed over; main: eight candidates from `0xc020400000`, outside it, `NOT HANDED OVER` |
| `stage-t14.log`, `request-t14.txt` | `--metal --metal-readback … usbd_drives_the_type_c_controller` | `24ed5a756` | 2: staged |
| `stage-amd.log`, `request-amd.txt` | `--metal --metal-readback … amdvi_translates_the_stick_controller` | `24ed5a756` | 2: staged |

`24ed5a756` changes only the host test's constants for the AMD bench's bus 3 (its port's window and two more BARs, as its boot read them). `cargo test --manifest-path kernel/pci/Cargo.toml behind` after it: 4 passed.

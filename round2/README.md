# #916 review round 1: merged with main 5b48a3d17

Head `5dabb22b51ff01b93133df58218480233878ddb9`. Host: Apple silicon, QEMU 11.1.1. Paths masked.

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0, 77 steps green |
| `x86-guests.log` | `cargo test --test toyos-build -- bar_map_again lent_device_memory_refused usbd_drives_the_spare iommu_virtio_platform amdvi_selftest amdvi_firmware_left` (q35 with VT-d, and with QEMU's amd-iommu) | 0, 6 passed |
| `arm-guests.log` | `cargo test --test toyos-build -- virt_smmu virt_claim_lpi virt_low_ecam` (virt under HVF) | 0, 3 passed |
| `stage-t14.log`, `request-t14.txt` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-r2/t14 claim_reuses_its_remapping_entry domain_ends_below_the_host_bridges usbd_drives_the_type_c_controller` | 2: staged, no machine touched |
| `stage-amd.log`, `request-amd.txt` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-r2/amd amdvi_translates_the_stick_controller` | 2: staged, no machine touched |

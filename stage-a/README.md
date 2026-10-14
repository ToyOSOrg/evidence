# #916 stage A evidence

Branch `toyos-arm-aperture`, head `3f421a7a8dfc62d85a726882cee0f83c8edfe22e` (stage A merged with `origin/main` `3ba4a4a2f`). Host: Apple silicon, macOS, QEMU 11.1.1. Paths are masked (`<src>`, `<home>`, `<scratch>`).

| file | command | exit | revision | target |
|---|---|---|---|---|
| `ci-host-merged.log` | `cargo run -- --ci host` | 0 (77 steps green) | `3f421a7a8` | host |
| `x86-guests.log` | `cargo test --test toyos-build -- bar_map_again lent_device_memory_refused usbd_drives_the_spare iommu_virtio_platform` | 0, 4 passed | `3f421a7a8` | x86_64 q35 under TCG |
| `arm-guests.log` | `cargo test --test toyos-build -- virt_smmu virt_claim_lpi virt_low_ecam` | 0, 3 passed | `3f421a7a8` | aarch64 `virt` under HVF |
| `control-revert-virt_smmu.log` | `production.patch` reversed, `cargo test --test toyos-build -- virt_smmu`, then restored | 0 | `3f421a7a8` minus the patch | aarch64 `virt` under HVF |
| `control-mutation-overlap.log` | `mutation-overlap.patch`, `cargo test --manifest-path kernel/pci/Cargo.toml aperture`, then restored | 101, the declaration test red | `3f421a7a8` plus the patch | host |
| `control-mutation-undeclared.log` | `mutation-undeclared.patch`, `cargo run -- --build-only`, then restored | 101, `window.rs:183` const assertion | `3f421a7a8` plus the patch | x86_64 kernel build |
| `t14-stage.log`, `request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/t14 claim_reuses_its_remapping_entry domain_ends_below_the_host_bridges usbd_drives_the_type_c_controller` | 2: staged, no machine touched | `3f421a7a8` | T14 (not run) |
| `dsdt.bin`, `mcfg.bin` | QEMU 11.1.1 `virt,gic-version=3,its=on,iommu=smmuv3,kernel-irqchip=off`, HVF, `-m 256`, edk2 from QEMU's own `edk2-aarch64-code.fd`, booted to its shell; `pmemsave` of `0x4c000000+64 MiB`, tables found by signature and checksum (DSDT at `0x4cb41018`, MCFG at `0x4cb43a98`) | — | — | input to the `_CRS` probe |

The hybrid rule seen in a guest: `arm-guests.log`'s `virt_smmu` self-test writes at `0x10000000040`: its domain starts at 2^40, above the CPU's 40-bit physical addresses under HVF, because the SMMUv3 tables translate 48 bits. With the whole production change reversed, `control-revert-virt_smmu.log` writes at `0x400000000040`, the old quarter-of-48-bits floor. The test passes both ways: it judges translation, not placement.

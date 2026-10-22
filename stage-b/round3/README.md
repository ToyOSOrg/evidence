# #935 round 3: the merge of `main` (`3962d606f`)

Branch head `674b63692` (merge `a417a64fb`, then `1ffbdbaaf` and an issues-only commit). Logs are masked: home and checkout paths, user and host names, MACs, public IPv4.

| file | command | exit | revision | target |
|---|---|---|---|---|
| `build2.log` | `cargo run -- --build-only` | 0 | merge `7d1f6a99b` (the same tree as `a417a64fb`; only its message changed) plus the uncommitted tree of `1ffbdbaaf` | x86-64 |
| `build-arm.log` | `cargo run -- --arch aarch64 --build-only` | 0 | `1ffbdbaaf` | aarch64 |
| `ci-host-1.log` | `cargo run -- --ci host` | 0, 87 steps green | `1ffbdbaaf` | host |
| `guests-1.log` | `cargo test --test toyos-build -- virt_claim_lpi virt_smmu virt_low_ecam amdvi_selftest amdvi_firmware_left usbd_drives_the_spare usbd_refused_without_smi_filter usbd_refused_without_amdvi_remapping iommu_virtio_platform a_virtio_function_without_access_platform_is_refused bar_map_again bar_map_behind_a_bridge lent_device_memory_refused acpi_mediated_access acpi_press_is_one_sci acpi_supply_outlives_holder a_claim_waits_out_an_undeclared_machine a_drives_row_holds_one_process_per_function hda_plays_to_the_controller_that_reaches_an_output the_opening_exchange_with_qemus_agent_completes the_compositor_drives_the_virtio_gpu the_log_lands_on_the_boot_stick` | 0, 22 passed | `1ffbdbaaf` | q35 (TCG), `virt` (HVF) |
| `x86-cargo-run.log` | `cargo run < /dev/null`, QEMU killed by PID after `Boot: complete` | killed | `1ffbdbaaf` | q35, the interactive machine |
| `arm-cargo-run.log`, `arm-cargo-run-uart.log` | `tail -f /dev/null \| cargo run -- --arch aarch64`; the console log, and the early UART file QEMU writes | QEMU ended on the kernel's panic | `1ffbdbaaf` | `virt`, HVF, QEMU 11.1.1 |
| `controls/benchcase-without-acpiserver.{patch,log}` | the patch reversed onto `1ffbdbaaf`, `cargo test -p toyos-build --lib -- build::tests::every_config_that_claims_a_pci_function_starts_its_declarer`, then reapplied | 101: red, naming benchcase's `nvme` and `usbd` | `1ffbdbaaf` | host |
| `metal/*-stage.log`, `metal/*-request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir>/t14 acpi_tables_loaded claim_reuses_its_remapping_entry domains_map_clear_of_the_host_bridges usbd_drives_the_type_c_controller usbd_serves_the_boot_stick msix_table_read_in_place i219_messages_on_its_msi_vector acpi_server_death`; `... <dir>/amd amdvi_translates_the_stick_controller amdvi_usbd_drives_its_own_entry msix_table_read_in_place` | 2 each: staged, no machine touched | `1ffbdbaaf` | T14 (2 boots), AMD bench (1 boot) |

## Findings

- **aarch64 `cargo run` panics before userland** (`arm-cargo-run-uart.log`, lines 204 to 213): `virtio-console: found at PCI 00:08.0`, then `iommu: no domain of its own for a device: no declaration of the root bridges' windows is held`, then `panic at kernel/src/drivers/virtio.rs:538:28`, `wait_used`'s five-second bound. The console's stream on the SMMUv3 has no domain and aborts its DMA. The guest rows on `virt` pass because their console bypasses the unit.
- **x86 `cargo run` boots** (`x86-cargo-run.log`, lines 292 to 326): the same `no domain of its own` line, then `Boot: complete (281ms)`; the console works on VT-d's identity domain. Then `pci: root 0000:00 _OSC: not offered`, the declared windows (`mem 0xa0000..0xc0000, mem 0x80000000..0xe0000000, mem 0xf0000000..0xfec00000, mem 0xc000000000..0xc800000000`), and `pcidev: a claim waited 45ms for the root bridges' memory`.

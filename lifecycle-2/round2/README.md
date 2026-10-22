# #934 round 2: lifecycle stage 2 on main and stage B (#935)

Branch head `addf8e97b`: `wt/toyos-aperture-b` (`4e32df68c`, main `27acd19a6`) merged, then three commits. Logs are masked: home and checkout paths, user and host names, MACs, public IPv4.

| file | command | exit | revision | target |
|---|---|---|---|---|
| `ci-host-3.log` | `cargo run -- --ci host` | 0, 87 steps green | `addf8e97b` | host |
| `guests-3.log` | `cargo test --test toyos-build -- a_function_arrives_and_leaves a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine usbd_drives_the_spare bar_map_again bar_map_behind_a_bridge lent_device_memory_refused acpi_mediated_access acpi_supply_outlives_holder virt_claim_lpi virt_smmu virt_low_ecam amdvi_selftest iommu_virtio_platform hda_plays_to_the_controller_that_reaches_an_output the_log_lands_on_the_boot_stick usbd_refused_without_smi_filter` (each row builds its own images) | 0, 17 passed | `addf8e97b` | q35 (TCG), `virt` (HVF) |
| `build4.log` | `cargo run -- --build-only` | 0 | the merge's tree before `c5f97d961` | x86-64 |
| `controls/no-assignment.{patch,log}` | `hotplug::assign`'s answer dropped (`.filter(\|_\| false)`), `cargo test --test toyos-build -- a_function_arrives_and_leaves`, restored | 1: red, the plugged `edu`'s BAR 0 `fits in no window of its port`, the claim `NOT HANDED OVER` with no BAR to map, so no holder | `c5f97d961` | q35 |
| `controls/no-commit.{patch,log}` | acpiserver commits no root `_OSC`, the same row, restored | 1: red, `hot-plug slot is not armed: its root bridge's _OSC committed nothing` | `c5f97d961` | q35 |
| `metal/*-stage.log`, `metal/*-request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir>/t14 acpi_tables_loaded usbd_drives_the_type_c_controller usbd_serves_the_boot_stick claim_reuses_its_remapping_entry`; `... <dir>/amd amdvi_translates_the_stick_controller` | 2 each: staged, no machine touched | `addf8e97b` | T14 (1 boot), AMD bench (1 boot) |

The hot-plug row at `addf8e97b`: the slot is armed on `pci: root 0000:00 _OSC: native hot-plug offered, buses 0x00..=0xff, committed 0x11`; the plugged `edu`'s BAR 0 is assigned inside the port's 2 MiB memory window; arrival 12 is held, answers `Gone` on all four calls when pulled, and is retired; the second plug is arrival 13.

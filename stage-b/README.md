# #935 stage B evidence

Branch head `4f5142fea` (origin/main `acfb0913c` merged) unless a row says otherwise. Logs are masked: home paths, user and host names, MACs, public IPv4.

| file | command | exit | revision | target |
|---|---|---|---|---|
| `ci-host-4.log` | `cargo run -- --ci host` | 0, 86 steps green | `4f5142fea` | host |
| `guests-merged.log` | `cargo test --test toyos-build -- virt_claim_lpi virt_smmu virt_low_ecam bar_map_again lent_device_memory_refused usbd_drives_the_spare usbd_refused_without_smi_filter usbd_refused_without_amdvi_remapping iommu_virtio_platform amdvi_selftest amdvi_firmware_left acpi_mediated_access acpi_press_is_one_sci acpi_supply_outlives_holder a_claim_waits_out_an_undeclared_machine a_drives_row_holds_one_process_per_function the_opening_exchange_with_qemus_agent_completes the_compositor_drives_the_virtio_gpu` | 0, 18 passed | `4f5142fea` | q35 (HVF host: TCG x86), `virt` under HVF |
| `guests-final.log` | the same 16 rows less the two #921 ones | 0, 16 passed | `401b07222` (before the merge) | same |
| `arm-cargo-run-final.log` | `cargo run -- --arch aarch64`, stdin closed, QEMU killed by PID after `vdagent: port 1 open` | killed (interactive) | `4f5142fea` | `virt`, HVF, QEMU 11.1.1 |
| `x86-undeclared-2.log` | `cargo test --test toyos-build -- a_claim_waits_out_an_undeclared_machine` | 0 | `d84d8c345` | q35 |
| `build-x86-1.log`, `build-arm-1.log` | `cargo run -- --build-only`, `... --arch aarch64 --build-only` | 0, 0 | the work tree before `cd2c246fa`; every guest run at `4f5142fea` builds both arches' images again | both |
| `controls/*` | each `.patch` applied with the edit script, its test run, then `git checkout` restored | see below | patches name their base | host / q35 |
| `metal/*` | `cargo test --test toyos-build -- --metal --metal-readback <dir>/t14 claim_reuses_its_remapping_entry domain_ends_below_the_host_bridges usbd_drives_the_type_c_controller acpi_tables_loaded`; `... <dir>/amd amdvi_translates_the_stick_controller` | 2 each: staged, no machine touched | `4f5142fea` | T14, AMD bench (not run) |
| `virt-dsdt.bin` | the measured `virt` DSDT (pr-916 `stage-a/dsdt.bin`), now `lib/acpi/fixtures/qemu-11.1.1-virt/dsdt.bin` | - | - | - |

Controls (each must red; each did):
- `tra-accepted`: `_TRA` refusal deleted, `cargo test -p toyos-acpi translated`: exit 101, both `_TRA` tests red.
- `ram-window-accepted`: the RAM fence in `aperture::check` disabled: exit 101, `a_window_over_memory_is_refused_by_name` red.
- `second-declaration-replaces`: `Held::declare` admits from any state: exit 101, `the_declaration_is_answered_once_and_never_replaced` red.
- `claim-does-not-wait` (guest): `pcidev::answered` skips the wait: exit 1, `a_claim_waits_out_an_undeclared_machine` red, "the claim waited 290266ns, short of its 30s deadline".
The three host controls ran at `cd2c246fa`, the guest one at `d84d8c345`; none of the later commits touch the lines they mutate or the tests that judge them, beyond renaming `memory_windows` to `root_bridge`.

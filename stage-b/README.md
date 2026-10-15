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

## Metal at `4f5142fea` (run by the orchestrator)

Images staged at `4f5142fea` (`metal/*-request.txt`); readbacks, judges and the runner's manifests under `metal/`, masked as above plus product, model, BIOS and the stick's serial.

| bench | boots | rows | result | judge |
|---|---|---|---|---|
| T14 | 2 (`testcases`, `testcases-xhci-leave`) | `acpi_tables_loaded`, `claim_reuses_its_remapping_entry`, `domain_ends_below_the_host_bridges`, `usbd_drives_the_type_c_controller` | 4 passed, 0 failed | `metal/t14/judge-ab.log`, `metal/m935-t14.{txt,log}` |
| AMD bench | 1 (`testcases`) | `amdvi_translates_the_stick_controller` | 1 passed, 0 failed | `metal/amd/judge-aba.log`, `metal/m935-amd.{txt,log}` |

**DSDT load and claim waits**, from each boot's `kernel.log` (acpiserver is started 1-2 ms before diskserver in every boot):

| boot | `supervisor: started acpiserver` → `started diskserver` | tables loaded | declared | claim waits |
|---|---|---|---|---|
| T14 `testcases` | 11.791 → 11.792 | `14 of 14 tables loaded in 54 ms` | 11.857: `mem 0xa0000..0xc0000, mem 0xa0800000..0xc0000000, mem 0x4000000000..0x8000000000` | none: no PCI claim was made before the declaration |
| T14 `testcases-xhci-leave` | 11.730 → 11.732 | `14 of 14 tables loaded in 55 ms` | 11.797, the same three windows | `pcidev: a claim waited 37ms for the root bridges' memory` (11.797) |
| AMD `testcases` | 9.512 → 9.514 | `16 of 17 tables loaded in 45 ms` | **refused**, see below | none: no PCI claim was made on this boot |

**Which `_OSC` granted what.** The judge's `granted 0x0 of 0x0` lines are the platform's `\_SB._OSC` (`the query answered capabilities masked and offered 0x0 of 0x0`) and the 24 processors' (`the processors' _OSC negotiated, Intel's: 24 evaluated, … granted 0x0 of 0x0`): ToyOS claims no capability under either UUID. The host bridge's grant is the kernel's line, in both T14 boots:

    [2026-10-15 04:23:42 11.857 cpu3 kernel] pci: root 0000:00 _OSC: native hot-plug granted

So the T14's firmware grants native PCIe hot-plug (and ToyOS committed it, with nothing yet serving it: lifecycle 2).

**Finding: the AMD bench's declaration is refused.** Its `\_SB.PCI0._CRS` names more memory windows than a root's record carries (`MAX_BRIDGE_WINDOWS` = 8):

    [2026-10-15 00:23:42  9.563 acpiserver] acpiserver: no root bridge declared, so every PCI claim is refused: a root bridge's _CRS is no list of windows: more memory windows or I/O runs than the 8 there is room for
    [2026-10-15 00:23:42  9.563 cpu3 kernel] pcidev: the root bridges' memory is refused as declared: it names no window, so no function is handed over

No PCI claim was made on that boot, so no row saw it, and `amdvi_translates_the_stick_controller` judges kernel-driven xHCI domains, which need no declaration. Every process claim on the AMD bench would be refused at this head. The bound is a defect of this PR, not of the bench, and is raised on the PR; per the orchestrator, no code change is made while the review runs.

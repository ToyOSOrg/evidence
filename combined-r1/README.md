# #934 combined with #935, round 1, on main 190f3b164

Paths are masked: `<dev>` is the development directory, `<scratch>` the
assignment's scratch, `<home>` and `<tmp>` the host's.

| file | command | revision | result |
|---|---|---|---|
| `ci-host-1.log` | `cargo run -- --ci host` | `4fd9ea228` | exit 1: 1 of 108 red, `every_config_that_claims_a_pci_function_starts_its_declarer` on `linkcase`, fixed in `f47e0af18`. Superseded: the tree was edited while it ran. |
| `ci-host-2.log` | `cargo run -- --ci host` | `f47e0af18` | exit 0, 108 steps green |
| `build6.log`, `build-arm2.log` | `cargo run -- --build-only`, `--arch aarch64` | `f47e0af18` | exit 0, 0 |
| `guests-1.log` | `cargo test --test toyos-build -- a_function_arrives_and_leaves a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine acpi_mediated_access virt_claim_lpi the_log_lands_on_the_boot_stick a_link_ends_under_a_held_stream_and_comes_back usbd_drives_the_spare` | `f47e0af18` | exit 0, 8 passed |
| `arm-cargo-run-uart.log` | `cargo run -- --arch aarch64`, the PL011's file, QEMU 11.1.1 under HVF, stopped by hand after vdagent's port opened | `f47e0af18` | lines 213-214 the console refused, 239-240 the declaration, 359-396 the NVMe served, 437 `vdagent: port 1 open`, 441-442 the second vdagent's panic on the refused console function |
| `metal-t14-stage.log`, `metal-amd-stage.log` | `cargo test --test toyos-build -- --metal --metal-readback …` | `52b50f83e` | exit 2, staged; nothing touched a machine |

`52b50f83e` changes issue records alone over `f47e0af18`.

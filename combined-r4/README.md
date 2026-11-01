# #934 round 3's answers, at 016d6269e

Paths masked as in `combined-r1/`.

| file | command | revision | result |
|---|---|---|---|
| `r3-ci-host.log` | `cargo run -- --ci host` | `016d6269e` | exit 0, 108 steps green |
| `r3-build-x86.log`, `r3-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `016d6269e`'s tree | exit 0, 0 |
| `r3-hotplug.log` | `cargo test --test toyos-build -- --nocapture a_function_arrives_and_leaves` | `016d6269e`'s tree | exit 0; line 194 the boot `edu` moved to domain2, 198 the slot armed, 226-227 the plugged one's BAR assigned and its arrival |
| `r3-guests.log` | the same, with `a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine acpi_mediated_access virt_claim_lpi the_log_lands_on_the_boot_stick usbd_drives_the_spare` | `016d6269e` | exit 0, 7 passed |
| `r4-metal-*-stage.log` | `--metal --metal-readback <scratch>/metal-r4/…` | `016d6269e` | exit 2, staged; no machine touched |

Not kept: an intermediate boot of the hot-plug row, before VT-d's device scopes were read, refused the slot by port ("no programmed VT-d unit includes every PCI device…"), since QEMU's DMAR names the port by a bridge scope and includes nothing else. That log was overwritten by the passing run.

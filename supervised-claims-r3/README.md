# ToyOS #1164, review r2's answers at bd2a67e01

Masked as in `supervised-claims-r1/`; `<remote-host>` and `<remote-home>` are the x86 guest host's.

| file | command | revision | result |
|---|---|---|---|
| `sc-r3-unit.log` | `cargo test -p toyos-supervisor` | `bd2a67e01`'s tree | exit 0; 8 `declaration` tests, `no_drives_row_starts_inside_storages_window` among them |
| `mutation-drives-in-window.{patch,log}` | `no_drives_row_starts_inside_storages_window` with `drivers()` answering inside the window, then restored | same | exit 101: "a drives row inside the window starts before its home" |
| `sc-r3-ci-host.log` | `cargo run -- --ci host` | `bd2a67e01` | 109 green. The shell that ran it was killed; the run itself finished, so the log carries no EXIT line. |
| `sc-r3-remote.log` | `qemu-remote.sh bd2a67e01 --test toyos-build -- …` (11 x86 rows, on the KVM guest host by the owner's rule) | `bd2a67e01` | exit 0, 11 passed |
| `sc-r3-guests.log` | the same rows and the 4 `virt_reboot` rows plus `virt_first_entry`, locally, before the rule | `bd2a67e01` | exit 0, 16 passed; on a host other agents were loading |
| `metal-sc2-judge-t14.log`, `metal-sc2-judge-amd.log` | `--metal --metal-readback <scratch>/metal-sc2-judge/{t14,amd} …` over copies of the readbacks | boots `0ade582c4`, harness `0ade582c4` | exit 0: T14 3/3 (`acpi_server_death`, `acpi_tables_loaded`, `usbd_drives_the_type_c_controller`), AMD 1/1 |

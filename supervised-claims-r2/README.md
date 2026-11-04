# ToyOS #1164, review r1's answers: code at f96bbd779, issues at 0ade582c4

Masked as in `supervised-claims-r1/`.

| file | command | revision | result |
|---|---|---|---|
| `sc-r2-unit.log` | `cargo test -p toyos-supervisor` | `f96bbd779`'s tree | exit 0; the 7 `declaration` tests among them |
| `mutation-system-listed.{patch,log}` | the same, with the plan's loop over index 0, then restored | same | exit 101: `system_is_in_no_list` fails |
| `sc-r2-guests.log` | 15 rows (see the PR) | `f96bbd779` | exit 0, 15 passed |
| `sc-r2-ci-host.log` | `cargo run -- --ci host` | `f96bbd779` | exit 0, 109 green |
| `sc-r2-build-x86.log`, `sc-r2-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `f96bbd779` | exit 0, 0 |
| `metal-sc-judge-t14.log` | `--metal --metal-readback <scratch>/metal-sc-judge/t14 acpi_server_death acpi_tables_loaded usbd_drives_the_type_c_controller`, over copies of the T14's readbacks | boots `79473b788`, harness `f96bbd779` | exit 0: 3 passed over 2 boots |
| `metal-sc-judge-amd.log` | the same over the AMD readback, `amdvi_usbd_drives_its_own_entry` | same | exit 0: 1 passed |
| `metal-sc2-*-stage.log` | `--metal --metal-readback <scratch>/metal-sc2/{t14,amd} …`, the same rows | `0ade582c4` | exit 2, staged |

`0ade582c4` changes issue records alone over `f96bbd779`.

# #1152: formal member judging of the landing boots at 57dedf1f3

The coordinator's proctreecase, testcases and testcases-watchdog boots at
57dedf1f3 on both benches, judged by the staging command run again with the
readbacks in place (`cargo test --test toyos-build -- --metal [--metal-host
<amd>] --metal-readback <dir> boot:proctreecase boot:testcases`):

- `judge-57dedf1f3-t14.txt`: 270 passed, 6 failed, 3 boots.
- `judge-57dedf1f3-amd.txt`: 269 passed, 7 failed, 3 boots.
- `members-57dedf1f3-{t14,amd}.txt`: `test_rs_pipe_other_end_gone`,
  `test_rs_readdir_bound` and `207_libc_names` exit 0 on both (the C case's
  ccheck compares against the expectation that names DT_REG).
- `judge-baseline-8ac4f2187-{t14,amd}.txt`: the K4 baseline's testcases
  readbacks judged the same way (this branch's harness, so the baseline image
  lacks some of its members; those reds are not comparisons). Every red at
  57dedf1f3 is red there too.

Every remaining red, accounted:

| bench | row | why | record |
|---|---|---|---|
| T14 | idle_entered | AMD bench's row ("this row runs on the AMD bench") | issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md |
| T14 | amdvi_translates_the_boot_controller | AMD-Vi row on the Intel T14 | same |
| T14 | amdvi_remaps_the_boot_controller | AMD-Vi row on the Intel T14 | same |
| T14 | amdvi_usbd_drives_its_own_entry | AMD-Vi row; its member usbd_spare_vector exits 101 on the T14 | same |
| T14 | console_uart_driven | no COM1, and the panic of the AMD row's usbd_spare_vector on the same boot | same |
| T14 | i219_messages_on_its_msi_vector | pre-existing: test_rs_i219_msi exits 1 | issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md |
| AMD | acpi_server_events | the T14's row (its own tables); test_rs_acpi_counted exits 101 | issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md, issues/toyos-runs-the-machine-in-acpi-mode-and-interprets-its-aml.md |
| AMD | battery_read | the T14's battery row | issues/toyos-runs-the-machine-in-acpi-mode-and-interprets-its-aml.md |
| AMD | usbd_drives_the_type_c_controller | the T14's first xHCI's row | issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md |
| AMD | i219_messages_on_its_msi_vector | the T14's I219 row | issues/a-metal-row-names-no-hardware-and-a-bench-without-it-reds.md |
| AMD | claim_reuses_its_remapping_entry | pre-existing: test_rs_pci_reclaim exits 1 | issues/a-metal-row-names-no-hardware-and-a-bench-without-it-reds.md |
| AMD | counters | pre-existing: the judge requires `pm_enable=1`, an HWP declaration the AMD bench has not ("no HWP"); red on the baseline too | issues/a-metal-row-names-no-hardware-and-a-bench-without-it-reds.md |
| AMD | console_uart_driven | no COM1, and the panic of the T14 row's acpi_counted on the same boot | issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md |

# PR #1163 metal at e80dee12b, both benches (run by the orchestrator)

Harness judge run offline over each bench's readbacks; grepped excerpts only.

- T14: counters, acpi_server_events, acpi_tables_loaded, ps2server_arms, display_output_presents PASS; idle_entered FAIL (the AMD's row on the T14).
- AMD: idle_entered, acpi_tables_loaded, ps2server_arms PASS; counters FAIL at the T14's HWP lines (no HWP on the AMD; its idle second passed with the TSC step report admitted); acpi_server_events FAIL (acpi_counted, a T14 job); display_output_presents FAIL (no tgl-display).
- Every red is a T14 row on the AMD or the AMD's row on the T14: issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md.

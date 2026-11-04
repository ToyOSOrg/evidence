# PR #1163 metal at 81d479a81, both benches (the orchestrator ran it)

The harness judge was run offline over each bench's readbacks (`judge-*.log`, `cargo test --test toyos-build -- --metal --metal-readback <runs/bench> counters idle_entered acpi_server_events acpi_tables_loaded ps2server_arms display_output_presents`; exit 1 on both). The excerpts are grep lines, not whole logs.

- counters reds on both: the idle second holds the kernel's TSC refinement line (T14 12.396 s, AMD 7.547 s).
- AMD: acpi_counted, a T14 row, waited past the 60.3 s list bound; the runner ended the list inside it, so idle_entered, acpi_hold and the members after them never ran. Reverted at 1d0d558ef.
- T14 idle_entered and AMD display_output_presents fail by issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md.

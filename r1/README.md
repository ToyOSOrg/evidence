# PR 1089, round 1 (ToyOS 7d5c0ca038a01d9074eabe9ef5ed02671f83df07)

- `facts.md`: the clean-room fact sheet the implementation was built from (source classes as labelled; provenance of code-derived facts is not carried here).
- `ci-host-1.log`: `cargo run -- --ci host`, exit 0 (last line).
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `mutations/`: each patch applied with `git apply`, `cargo test -- cst::` in `system/acpiserver`, exit recorded at the log's end, patch reverted.
- `metal-prepare.log`, `metal-request.txt`: the AMD bench readback request (`acpi_tables_loaded`, `idle_entered`, `osbench`); staged only, no machine touched.

Paths are masked as `<worktree>`, `<scratch>`, `<home>`, `<tmp>`.

# #934 round 4's answers and the merge of main 058bea2d3

Paths are masked as in `combined-r1/`: `<dev>` the development directory,
`<scratch>` this round's scratch, `<scratch-r4>` round 4's, `<home>` and
`<tmp>` the host's. Bench model and firmware strings are masked too.

Commits over round 4's `016d6269e`:

- `06241e941` merges origin/main `058bea2d3`.
- `b89897e5e` answers review r4.
- `f234a58a2` gives acpiserver to the five images main gave a virtio-console row.
- `ded3c605c` changes the harness: the no-console-port profiles, hotplugcase's console rows, and acpi_mediated's HeldFunction arm.
- `4424a76f9` is issues only.

| file | command | revision | result |
|---|---|---|---|
| `merge.log` | `git merge --no-commit origin/main` | `016d6269e` + `058bea2d3` | the conflicts, every one resolved in `06241e941`'s message |
| `acpi-iort-test.log`, `acpi-iort-test-2.log` | `cargo test -p toyos-acpi --test iort` | `b89897e5e`'s tree | exit 0, 33 passed (before and after the controls) |
| `mutation-no-{overlap,coverage,alone}.{patch,log}` | the same, with each patch applied to `lib/acpi/src/iort.rs`, then restored | `b89897e5e`'s tree | exit 101 each: `a_range_is_translated_exactly_where_each_of_its_requesters_is` fails |
| `mutation-per-rid.{patch,log}` | `… a_range_of_every_bus` with `translates` asking `route` per requester | same | exit 101: 1 259 120 640 bytes read of a 22 516-byte table, against a bound of 4× its length |
| `ci-host-1.log` | `cargo run -- --ci host` | `b89897e5e` | exit 1: 1 of 109 red, `every_config_that_claims_a_pci_function_starts_its_declarer` on `launchcase`, fixed in `f234a58a2`. The `FAILED` lines inside `control` steps are mutations, as on every run. |
| `ci-host-2.log` | `cargo run -- --ci host` | `f234a58a2` | exit 0, 109 green |
| `ci-host-3.log` | `cargo run -- --ci host` | `4424a76f9` | exit 0, 109 green |
| `build-x86.log`, `build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `f234a58a2` | exit 0, 0. Later commits touch `tests/` and `issues/` alone. |
| `guests-1.log` | `cargo test --test toyos-build -- --nocapture` with 9 rows | `f234a58a2` | exit 1: 6 passed, 3 refused before booting by main's console-carrier check (`a_function_arrives_and_leaves`, `a_claim_waits_out_an_undeclared_machine`, `acpi_mediated_access`). The 6 that passed are `a_drives_row_holds_one_process_per_function`, `virt_claim_lpi`, `the_log_lands_on_the_boot_stick`, `a_link_ends_under_a_held_stream_and_comes_back`, `usbd_drives_the_spare` and `the_opening_exchange_with_qemus_agent_completes`. |
| `guests-2.log` | the same, with `a_function_arrives_and_leaves a_claim_waits_out_an_undeclared_machine acpi_mediated_access acpi_lock_given_back_on_one_cpu acpi_supply_outlives_holder acpi_press_is_one_sci` | `ded3c605c` | exit 0, 6 passed |
| `arm-cargo-run.log`, `arm-uart-1.log` | `cargo run -- --arch aarch64` with stdin on `/dev/null` and no terminal, stopped by PID | `ded3c605c` | Every claim was handed over (UART 232 the declaration, 252-342 the drivers), and the UART went quiet at 344. The port relayed one line in five minutes. Read as this launch's own and not judged. |
| `arm-cargo-run-tty.log`, `arm-uart-2.log` | the same under `script -q` (a pseudo-terminal), stopped by PID | `ded3c605c` | the terminal shows the log: diskserver serving the NVMe's partition and `vdagent: the host announces capabilities` |
| `metal-r4-judge-t14.log` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-r4-judge/t14 acpi_tables_loaded claim_reuses_its_remapping_entry domains_map_clear_of_the_host_bridges usbd_drives_the_type_c_controller`, over a copy of the r4 T14 readback | harness at `f234a58a2`, boot at `016d6269e` | exit 0, 4 passed |
| `metal-r4-judge-amd.log` | the same over the r4 AMD readback, `amdvi_translates_the_boot_controller amdvi_remaps_the_boot_controller amdvi_usbd_drives_its_own_entry` | same | exit 0, 3 passed |
| `metal-r5-*-stage.log` | `--metal --metal-readback <scratch>/metal-r5/{t14,amd} …` with the same rows | `4424a76f9` | exit 2, staged; no machine touched |

## Judging the r4 readbacks with the newer harness

The judge code in `tests/` between `016d6269e` and `f234a58a2` changes only
the QEMU-side `iommu_virtio_platform` judge and metal-driver scratch-disk
code. None of the judged rows' code changes.

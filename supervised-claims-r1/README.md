# ToyOS #1164, round 1, head 79473b788 on main 6dccc4956

Paths are masked: `<dev>` is the development directory, `<scratch>` the assignment's scratch, `<home>` and `<tmp>` the host's.

| file | command | revision | result |
|---|---|---|---|
| `sc-unit-4.log`, `sc-unit-5.log` | `cargo test -p toyos-supervisor` | WIP commits | exit 0 |
| `sc-guests-1.log` | 8 rows | first rebased WIP | exit 1: `acpi_release` did not compile, and the acpicase boots showed no program output. Fixed. |
| `sc-guests-2.log` | 6 rows | WIP | exit 1: logkeeper waiting on a never-started log server's port. The fix closes those ports. |
| `sc-guests-3.log` | the 6 acpicase and undeclared rows | WIP, on main | exit 0, 6 passed |
| `sc-guests-4.log` | the broad sample | WIP | 19 passed. The `virt_reboot` 4 and `virt_mask_windows` stalled: boots with no declarer waited for one, fixed by `comes`. `hosted_clang_hello` was stopped by hand while building LLVM. |
| `sc-guests-5.log` | the virt and acpicase rows, the state view | WIP | exit 1: 12 passed; the held row's `acpi_release` panicked off-BP under load and SYSTEM's ports were closed, both fixed |
| `sc-held-{1,2,3}.log` | `acpi_holder_is_refused_a_held_functions_configuration` | final code | exit 0 each |
| `sc-guests-6.log` | `acpi_mediated_access acpi_supply_outlives_holder a_claim_before_the_declaration_is_refused_at_once` | final code | exit 0, 3 passed |
| `sc-guests-7.log` | `virt_first_entry virt_fatal_halts_the_others_first` | final code | exit 0 |
| `sc-ci-host-1.log` | `cargo run -- --ci host` | before the lint fix | exit 1: clippy `unchecked_time_subtraction` in a test |
| `sc-ci-host.log` | `cargo run -- --ci host` | `79473b788` | exit 0, 109 green |
| `sc-build-x86.log`, `sc-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `79473b788` | exit 0, 0 |
| `metal-sc-*-stage.log` | `--metal --metal-readback <scratch>/metal-sc/{t14,amd} …` | `79473b788` | exit 2, staged |

"Final code" is the tree of `79473b788` but for the lint fix in a test and issue text.

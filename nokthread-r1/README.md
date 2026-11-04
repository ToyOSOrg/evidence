# ToyOS #1165, round 1: no kernel thread but the idle loop

Paths are masked: `<dev>` is the development directory, `<scratch>` the assignment's scratch, `<home>` and `<tmp>` the host's. Each command is `cargo <words>` from the worktree.

Revisions: `90b75011d` is the first commit on main `6dccc4956`; `edb3dfd72` and `483611b1e` are it and the diag fix rebased onto main `c43078a40`; `964b0b650` is the head.

| file | command | revision | result |
|---|---|---|---|
| `pre-build.log` | `run -- --build-only` | `90b75011d`'s tree, uncommitted | exit 0 |
| `pre-std-threads.log` | `test --test toyos-build -- std_threads_count_the_cpus_and_give_back_ended_threads` | as above | exit 0 |
| `pre-guests-1.log` | 12 x86 rows: the stop, the fatal paths, the console port, stdin | as above | exit 1: `acpi_lock_given_back_on_one_cpu` asserted COM1 is the kernel's port to AML; it is the console UART's row now, and the probe was moved to `ClaimedPort` |
| `pre-guests-2.log` | `acpi_lock_given_back_on_one_cpu acpi_mediated_access` and 13 `virt_` rows | as above, with the probe moved | exit 0, 15 passed |
| `pre-handover.log` | `the_uart_carries_the_boot_once_across_the_hand_over` | `90b75011d` | exit 0 |
| `control-*.log`, `control-*.patch` | each patch applied, built, its rows run, restored | `90b75011d` | each exit 1, as below |
| `pre-ci-host.log` | `run -- --ci host` | `90b75011d` | exit 1, 1 of 108 red: `no_diag_program_claims_the_screen`, fixed in `483611b1e` |
| `r1-build-x86.log`, `r1-build-arm.log` | `run -- --build-only`, `--arch aarch64` | `483611b1e` | exit 0, 0 |
| `r1-guests.log` | 16 rows, x86 and AArch64 | `483611b1e` | exit 0, 16 passed |
| `r1-ci-host.log` | `run -- --ci host` | `483611b1e` | exit 1, 1 of 108 red: `every_boot_config_runs_logkeeper` on main's new `virtpancase.toml`, fixed in `964b0b650` |
| `r2-guests.log` | `virt_pan_refuses_el1_a_user_page` and four console rows | `964b0b650` | exit 0, 5 passed |
| `r2-ci-host.log` | `run -- --ci host` | `964b0b650` | exit 0, 108 steps green |
| `r2-metal-{t14,amd}.log` | `test --test toyos-build -- --metal --metal-readback <scratch>/metal/{t14,amd} boot:testcases` | `964b0b650` | exit 2: staged, the machine not touched; `r2-metal-*-request.txt` lists the boots. `testcases` is the one boot asked for; `testcases-watchdog` matched the filter by its prefix and is not needed |

Controls, each red as it should be:

| patch | rows | red |
|---|---|---|
| `control-wire-from-zero.patch`: the UART's carrier fed from the boot's first line | `the_uart_carries_the_boot_once_across_the_hand_over` | `Boot: complete` on the UART 2 times |
| `control-detached-zombie.patch`: a detached thread's place kept | `std_threads_…` | detached thread 4102 of 4104 refused |
| `control-stack-kept.patch`: a detached thread's stack kept | `std_threads_…` | detached thread 1876 refused: stack commit failed |
| `control-yield-kept.patch`: `SYS_YIELD` a spin hint | `std_threads_…` | 5178 yields before the other thread ran |
| `control-stop-silent.patch`: the stop writes none of its records | `machine_shutdown_short_stop` | STALLED waiting for the last word |
| `control-fatal-silent.patch`: a fatal path writes none of its records | `virt_fatal_halts_the_others_first` | STALLED waiting for the fatal path's line |

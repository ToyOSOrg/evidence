# #934 round 1's answers, at e5b34b8a4

Paths masked as in `combined-r1/`.

| file | command | revision | result |
|---|---|---|---|
| `r1-ci-host.log` | `cargo run -- --ci host` | `e5b34b8a4` | exit 0, 108 steps green |
| `r1-build-x86.log`, `r1-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `e5b34b8a4`'s code (comments edited after) | exit 0, 0 |
| `r1-guests.log` | `cargo test --test toyos-build -- --nocapture a_function_arrives_and_leaves a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine virt_claim_lpi the_log_lands_on_the_boot_stick usbd_drives_the_spare` | `e5b34b8a4` | exit 0, 6 passed; lines 555-558: the plugged `edu` moves to domain2 before it is listed, and its second arrival is listed on that domain |
| `mutation-window-overflow.patch`, `.log` | the unchecked `limit + WINDOW_GRANULE` back, `cargo test --lib a_ports_windows` in `kernel/pci`, restored in the same run | working tree over `e5b34b8a4`'s parent | exit 101, `attempt to add with overflow` on the new case |
| `r1-metal-*-stage.log` | `--metal --metal-readback` | `e5b34b8a4` | exit 2, staged; no machine touched |

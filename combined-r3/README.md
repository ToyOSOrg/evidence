# #934 round 2's answers, at 97edf3932

Paths masked as in `combined-r1/`.

| file | command | revision | result |
|---|---|---|---|
| `r2-ci-host.log` | `cargo run -- --ci host` | `97edf3932` | exit 0, 108 steps green |
| `r2-build-x86.log`, `r2-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `97edf3932`'s code (issue text edited after) | exit 0, 0 |
| `r2-guests.log` | `cargo test --test toyos-build -- --nocapture a_function_arrives_and_leaves a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine virt_claim_lpi the_log_lands_on_the_boot_stick usbd_drives_the_spare` | `97edf3932` | exit 0, 6 passed; line 514 the slot armed, 551-556 the plugged `edu` listed and moved to its domain by its claim |
| `r2-metal-*-stage.log` | `--metal --metal-readback` | `97edf3932` | exit 2, staged; no machine touched |

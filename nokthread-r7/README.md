# ToyOS #1165, round 7: the console UART's driver starts with logkeeper

Masked as round 4's README says. Head `152cae5d1` on main `783569506`.

| file | command | host | result |
|---|---|---|---|
| `r7-ci-host.log` | `run -- --ci host` | this Mac | exit 0, 108 green |
| `r7-remote-x86.log` | `a_supervisor_that_fails_early_says_why_on_the_uart`, `the_uart_carries_the_boot_once_across_the_hand_over`, `the_uart_carries_the_log_again_once_the_console_carrier_goes`, `machine_shutdown_short_stop`, `console_image_boots`, `session_lifecycle` | x86 guest host | exit 0, 6 passed; the UART's claim is now pid 4's, started beside logkeeper (pid 10's at `8ac4f2187`, before main's plan) |
| `control-uart-late.patch`, `control-uart-late.log` | the plan's old rule, logkeeper alone first, against `the_uart_starts_with_the_log_before_the_declaration` | this Mac | exit 101, red as it should be |

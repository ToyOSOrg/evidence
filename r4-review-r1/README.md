# PR #1062, review r1 (round 4)

The tree is `a3c1c5c30`: one commit on `190f3b164`, rebased unchanged onto
`9b3711cdb` as `2de594d8a`. main's nine commits there touch no file this
change does.

- `ci-host-a3c1c5c30-green.log`: `cargo run -- --ci host`, exit 0, 108/108,
  run on the working tree that is `a3c1c5c30`'s.
- `guest-console-rows-a3c1c5c30-tree.log`: `cargo test --test toyos-build --
  the_opening_exchange_with_qemus_agent_completes
  the_uart_carries_the_log_again_once_the_console_carrier_goes
  machine_shutdown_short_stop machine_shutdown_wire_held
  a_drives_row_holds_one_process_per_function`, exit 0, 5/5.
- `cargo-run-merged-terminal.log`: `cargo run` with stdout to this file and an
  open stdin, the guest powered down over QMP once logkeeper quieted the UART.
  Lines 404 on are the UART's after the quiet line — the stop's
  `console: the UART carries the log again`, the irq/tlb counts and
  `Shutting down.` — which the terminal no longer saw before this round.

Masked: home and temp paths, user name, CPU model.

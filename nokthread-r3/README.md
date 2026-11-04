# ToyOS #1165, round 3: the log's origins and the console's input are grants

Paths are masked: `<dev>` is the development directory, `<scratch>` the assignment's scratch, `<home>` and `<tmp>` the host's. Each command is `cargo <words>` from the worktree. Every file is at `08e4bb8f0` on main `c43078a40` (main has since moved by issue files only).

| file | command | result |
|---|---|---|
| `r3-build-x86.log`, `r3-build-arm.log` | `run -- --build-only`, `--arch aarch64` | exit 0, 0 |
| `r3-guests.log` | `test --test toyos-build --` the hand-over row, the carrier-goes row, `machine_shutdown_short_stop`, `session_lifecycle`, `console_image_boots`, `virt_jobs_at_el2` | exit 0, 6 passed |
| `r3-ci-host.log` | `run -- --ci host` | exit 0, 108 steps green |
| `r3-metal-{t14,amd}.log`, `r3-metal-*-request.txt` | `test --test toyos-build -- --metal --metal-readback <scratch>/metal/{t14,amd} boot:testcases` | exit 2: staged, the machine not touched |

Controls, each applied as the patch, run and restored, each red as it should be:

| patch | check | red |
|---|---|---|
| `control-holds-input-unendowed.patch`: the supervisor endows the console's input to no row | `the_uart_carries_the_boot_once_across_the_hand_over` | exit 1: the UART says nothing after `Boot: complete`; the driver refuses to start without the input |
| `control-holds-config.patch`: `testcases.toml`'s UART row holds no console input | `test --lib -- every_boot_config_runs_logkeeper` | exit 101 |

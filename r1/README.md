# ToyOSOrg/ToyOS#1226, round 1

Branch `sdk-stdio-one-owner`. Logs are masked (local paths, temp paths, the runner's machine name).

## Guest rows (guest runner, `.github/workflows/guest-rows.yml`)

Filter: `libc_children stream_holders a_launch_gives_each_unsent_stdio_slot_a_null session_lifecycle a_supervisor_that_fails_early_says_why_on_the_uart the_uart_carries_the_log_again_once_the_console_carrier_goes virt_user_mode virt_jobs_at_el2` (x86_64 and aarch64 rows).

- `guest/red-c98119407-run43036786936.log`: run 43036786936 at c98119407, exit 1, 0 of 8 passed. On every row the system fileserver ended with code 101 at boot, after 14 syscalls and no `getpid`, and the supervisor ended waiting for os-release. Cause: the stream state's "no asker" mark was 0, which is every main thread's tid, so main-thread writes went to the ring's descriptor as bytes.
- `guest/green-ab77bd2d6-run43049938522.log`: run 43049938522 at ab77bd2d6 (the mark is `Tid::MAX`), exit 0, 8 of 8 passed. The red run above is this fix's negative control: the same rows, the same tree but for the mark.
- Later commits: 1a23f7246 changes only a `cfg` that is always true on the guest, and 7561f88e1 only the metal member `stream_state_is_one`, which no row above runs. Neither invalidates these runs.

## Host (on the development Mac, targeted per the testing policy)

- `host/before-gating-ab77bd2d6/`: `cargo test -p toyos` exit 0, `cargo clippy -p toyos --all-targets` exit 0, `cargo clippy -p toyos --lib --features fd-table` exit 101: the table's owner called stdio's `changed()`, which was compiled for ToyOS alone.
- `host/1a23f7246/`: the same three at tree 327f75455 (commit 1a23f7246), all exit 0. Clippy runs with the workspace's adopted lints and `-D warnings`.

## Metal staging (no machine touched)

`cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`

- `metal/stage-1a23f7246-link-red.log`: exit 101, `stream_state_is_one` did not link (`write`, `dup2` undefined): it lacked `#[link(name = "toyos_c", kind = "static")]`.
- `metal/stage-7561f88e1.log`: exit 2 (Staged), images `testcases` and `testcases-watchdog`; `metal/request-7561f88e1.txt` lists them.

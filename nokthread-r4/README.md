# ToyOS #1165, rounds 4 and 5: review r1's fixes and the supervisor's last words

Paths and identifiers are masked: `<dev>`, `<scratch>`, `<home>` and `<tmp>` are this host's; `<remote-host>` and `<remote-home>` the x86 guest host's; `<vendor>` and `<model>` a bench's. Each command is `cargo <words>` from the worktree, or `qemu-remote.sh <rev> <words>` on the x86 guest host (KVM).

Revisions: `8678b19c7` is review r1's fixes and option A, rebased onto main `9d39d737a`; `8ac4f2187` (the head) adds the kernel's line as it takes the UART back.

| file | command | revision, host | result |
|---|---|---|---|
| `r4-build-x86.log`, `r4-build-arm.log` | `run -- --build-only`, `--arch aarch64` | `8678b19c7`, this Mac | exit 0, 0 |
| `r4-guests.log` | 8 rows, x86 and AArch64 | `8678b19c7`, this Mac (loaded; run before the guest-host rule) | exit 0, 8 passed |
| `r4-ci-host.log` | `run -- --ci host` | `8678b19c7` | exit 0, 108 green |
| `r4-remote-x86.log` | 6 x86 rows | `8678b19c7`, x86 host | exit 1: `machine_shutdown_short_stop` STALLED |
| `r4-remote-stop-head.log`, `r4-remote-stop-head2.log`, `r4-remote-stop-head2-uart.log` | `machine_shutdown_short_stop` | `8678b19c7`, x86 host | exit 1 twice: the UART capture holds the stop's lines and `Shutting down.`, after the driver's boot backlog and before its quiet line, which the harness's UART filter waited for |
| `r4-remote-stop-base.log` | the same | main `9d39d737a`, x86 host | exit 0 |
| `r5-build-x86.log`, `r5-build-arm.log` | `run -- --build-only`, `--arch aarch64` | `8ac4f2187` | exit 0, 0 |
| `r5-ci-host.log` | `run -- --ci host` | `8ac4f2187` | exit 0, 108 green |
| `r5-remote-x86.log` | 10 x86 rows | `8ac4f2187`, x86 host | exit 0, 10 passed |
| `r5-metal-{t14,amd}.log`, `r5-metal-*-request.txt` | `test --test toyos-build -- --metal --metal-readback <scratch>/metal-r5/{t14,amd} boot:testcases` | `8ac4f2187` | exit 2: staged, no machine touched |
| `r3-metal-amd-judge*.log` | the AMD bench's readbacks of `08e4bb8f0`, judged | judged at `08e4bb8f0` | `boot:testcases-watchdog` exit 0 (`loader_watchdog_arms`, `watchdog_fed`); `boot:testcases` exit 1, 260 passed, 9 red, each a record's (below) |
| `r4-t14-judge-*.log` | the T14's readbacks of `08e4bb8f0`, judged | judged at `8678b19c7`, whose judges of these rows are `08e4bb8f0`'s | watchdog boot exit 0; `testcases` exit 1, 253 passed, 16 red, each a record's or the damaged DATA's (below) |

Controls, each applied as the patch, run and restored, each red as it should be:

| patch | check | red |
|---|---|---|
| `control-unsaid.patch`: the supervisor's panic says no last words | `a_supervisor_that_fails_early_says_why_on_the_uart`, this Mac | exit 1: the UART does not say the reason |
| `control-idle.patch`: the kernel lets the supervisor's exit by code end nothing | the same | exit 1: the boot never ends, as before this change |
| `control-waiting-ignored.patch`: a round speaks through records still waiting | logkeeper's `a_round_is_through_the_cursor_but_what_waits` | exit 101 |
| `control-resume-ignored.patch`: a UART carrier started again begins at the hand-over | logkeeper's `a_uart_carrier_started_again_resumes_where_its_channel_left_off` | exit 101 |

The metal reds. On both benches `console_uart_driven` is red only on `must_be_clean` finding another row's panic: on the AMD bench `counters_metal`'s wait for an EC query that bench never raises, the test defect PR #1163 fixes along with the three served-log ACPI rows that wait after it, on the T14 `usbd_spare`'s (`issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md`). Its own claim held on both: `uart: no console UART claim — nothing to drive`, neither bench having a COM1. `std_threads` exited 0 on both. The other reds are rows of the other bench riding this boot (that record), `i219_msi` (`issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md`) and, on the T14, the rows that need DATA, which an unrelated incident damaged.

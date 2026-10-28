# PR #1096 r1: FCH watchdog, at ToyOS 3f0beab0411118f5ee8c79c2ed71098b08664072

Every check ran on the tree committed as 3f0beab04 (the host rerun started after
the last source edit; the controls restored `lib/tco/src/fch.rs` byte-identical,
checked by `shasum -c`). Paths are masked as `<home>`.

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0 (105 steps green) |
| `ci-host-first-red.log` | the same, one edit earlier | 1: clippy `assertions_on_constants` in the new metal-crate test, fixed by a `const` block; 104 other steps green. The loom `FAILED` lines are the CI's own fence-off controls |
| `build-x86_64.log` | `cargo run -- --build-only` | 0 |
| `build-aarch64.log` | `cargo run -- --build-only --arch aarch64` | 0 |
| `qemu-console_image_boots.log` | `cargo test --test toyos-build -- console_image_boots` (q35: the loader's every-pass `locate`/`survey` finds the ICH9 TCO and says nothing) | 0 |
| `qemu-virt_reboot.log` | `cargo test --test toyos-build -- virt_reboot` (aarch64 virt, four reboot tests, each a second loader pass) | 0 |
| `metal-stage.log`, `metal-request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> --metal-host toyos@bench-amd loader_watchdog_arms watchdog_fed watchdog_resets` | 2, the harness's "staged, not judged"; no machine touched |

## Negative controls (`controls/`)

`run.py` applies each mutation to `lib/tco/src/fch.rs`, builds the `fch` host
test, runs it, and restores the file. Each `.patch` is the mutation as a diff
against 3f0beab04 and applies with `git apply`. `summary.log` is the run:

| mutation | the defect | caught by |
|---|---|---|
| `start-in-one-write` | run and trigger in one write, which starts no count | `an_unfed_timer_resets_the_machine_at_its_bound` (and four more) |
| `feed-writes-a-constant` | a feed that does not keep the bits it does not own | `every_write_keeps_the_bits_it_does_not_own` |
| `survey-stops-nothing` | a count the last boot left keeps running | `a_count_the_last_boot_left_running_is_stopped` |
| `stop-clears-fired` | the loader's stop clears `WatchdogFired`, the kernel's to report | `the_boot_after_an_expiry_reads_it_and_the_next_does_not` |
| `survey-keeps-reset-stat` | `S5ResetStat` left set after it is read | `the_boot_after_an_expiry_reads_it_and_the_next_does_not` |
| `arm-skips-the-tick` | the 1 s reset tick left in place | `an_unfed_timer_resets_the_machine_at_its_bound` (and five more) |

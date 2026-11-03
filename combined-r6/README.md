# #934 round 5: #1137 merged, a departed function's apertures revoked, r5 metal judged

Masked as in `combined-r5/`.

Commits over round 5's `4424a76f9`:

- `cce412876` is issues only: the owner's ruling, staged on the lifecycle track.
- `8388ab868` merges origin/main `a0e8f1333` (#1137). The device-set syscalls are 165 and 166, and the profile has 168 bins.
- `699baad1c` revokes a departed function's apertures from the device set's reader. It also changes `pciholder`, the hot-plug row and the issues.

| file | command | revision | result |
|---|---|---|---|
| `r5-ci-host.log` | `cargo run -- --ci host` | `699baad1c` | exit 0, 109 green |
| `r5-build-x86.log`, `r5-build-arm.log` | `cargo run -- --build-only`, `--arch aarch64` | `699baad1c` | exit 0, 0 |
| `r5-hotplug.log` | `cargo test --test toyos-build -- --nocapture a_function_arrives_and_leaves` | `699baad1c` | exit 0; the holder's line ends `kept=Some(Gone)` |
| `mutation-no-departure-revoke.{patch,log}` | the same, with the departure's take dropped, then restored | `699baad1c`'s tree | exit 1: `kept=None`, the row fails. An earlier attempt at this mutation did not compile and is not this log. |
| `r5-guests.log` | the same, with `a_drives_row_holds_one_process_per_function a_claim_waits_out_an_undeclared_machine acpi_mediated_access virt_claim_lpi the_log_lands_on_the_boot_stick a_link_ends_under_a_held_stream_and_comes_back usbd_drives_the_spare the_opening_exchange_with_qemus_agent_completes bar_map_again` | `699baad1c` | exit 0, 9 passed |
| `metal-r5-judge-t14.log`, `metal-r5-judge-amd.log` | `--metal --metal-readback <scratch>/metal-r5-judge/{t14,amd} …` over copies of the r5 readbacks | boot `4424a76f9`, harness `699baad1c` (the judged rows' code is unchanged) | exit 0: T14 4/4, AMD 3/3 |
| `metal-r5b-*-stage.log` | `--metal --metal-readback <scratch>/metal-r5b/{t14,amd} …`, the same rows | `699baad1c` | exit 2, staged; no machine touched |

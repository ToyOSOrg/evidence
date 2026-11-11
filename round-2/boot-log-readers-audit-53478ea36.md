# Every boot-log reader under tests/, read at 53478ea36

The question for each site: does it assert a line that a userland program
writes, or that the kernel writes on a program's behalf (a claim's hand-over or
refusal), out of a capture that may end before that line arrives? The boot log
ends at the boot's ready marker (`===READY===`, test-runner's first act, unless
the boot names another). The supervisor starts rows in this order: its first
rows (the log carriers and the ACPI declarer); then the disk drivers; then
storage; then every other row, test-runner among them; and last the non-disk
`drives` rows (`storage_up` in system/supervisor/src/main.rs).

Sites: `git grep -n -E 'boot_log\(\)|Serial::boot' 53478ea36 -- tests ':!tests/CLAUDE.md'`, 68 lines.
Read by the implementer, site by site. The verdict column records how each
site reads, not a test run.

Legend:
- clean-only: `Serial::boot(&qemu).must_be_clean()`. This asserts only that
  lines are absent, so a short capture cannot fail it.
- kernel: every line asserted out of the boot log is the kernel's own, written
  before the boot's ready marker, which is itself a kernel line.
- waited: each program line it asserts is waited for (`await_guest`,
  `await_marker[_new]`, `drain_until`, `await_exit`, `run_test`), or is written
  before a line that is waited for, by the same program or in a causal order
  named below.

| site | test | reads | verdict |
|---|---|---|---|
| common/faults.rs:37 | nested_nmi_is_loud | the kernel's nested-NMI report; ready marker is the kernel's arm line | kernel |
| common/faults.rs:118 | kernel_wx_leaf_is_refused | kernel staging and audit refusal; ready marker AUDIT_REFUSED | kernel |
| common/faults.rs:163 | a_stepped_tsc_is_slewed_then_demoted | kernel clock lines; drains to the last one asserted | kernel |
| common/faults.rs:206 | a_stalled_hpet_is_left_out | kernel clock lines; drains to CLOCK_REPORT | kernel |
| common/iommu.rs:68 | iommu_virtio_platform | unit arm: two hand-over lines, waited. No-unit arm: before this change, waited for 4 of the 10 refusals it asserts | **fixed here**: the wait is every refusal the judge asserts |
| common/iommu.rs:318 | vtd_firmware_left | the kernel's IOMMU hand-over lines, `Boot: complete` | kernel |
| common/iommu.rs:357 | amdvi_firmware_left | the kernel's AMD-Vi lines; XHCI_REFUSED is the kernel's refusal of usbd's boot-controller claim | kernel; the refusal is a disk driver's claim, which the supervisor makes before it starts test-runner |
| common/iommu.rs:416 | amdvi_selftest | kernel selftest lines; drains to the halt | kernel |
| common/iommu.rs:480 | a_virtio_function_without_access_platform_is_refused | the supervisor's refusal (waited), netstack's no-lease line (drained), virtio-net absent | waited |
| common/launchstdio.rs:34 | a_launch_gives_each_unsent_stdio_slot_a_null | boot log + `run_test` capture; SENT drained for; UNSENT absent | waited |
| common/power.rs:68 | machine_shutdown_short_stop | clean-only, then ACPI_ARMED and Q35_S5_SUPPLIED awaited each; HANDED_OVER_IN_ACPI_MODE is a kernel record written before them | waited |
| common/power.rs:113 | a_clean_stop_proves_its_image | the loader's lines, read after the reboot and the next boot are awaited | waited |
| common/serial.rs:102 | `Serial::boot` | the constructor itself | n/a |
| common/sessionlifecycle.rs:37 | session_lifecycle | every compositor/session/terminal line awaited in turn; the supervisor's "stop ends what stays" written before the kernel's REBOOTING, which is awaited | waited |
| common/vmconsole.rs:32 | the_uart_carries_the_log_again_once_the_console_carrier_goes | clean-only; QUIETED awaited; the driver's end awaited; BACK_ON_THE_UART must precede that end | waited |
| toyos.rs:2963 | acpi_mediated_access | the probe's and kernel's acpi lines, all written before the probe asks for the power-off; the wait ends at the stop's give-back or the job's end | waited |
| toyos.rs:3060 | acpi_supply_outlives_holder | waits for the power-off or the job's end; asserts lines before them | waited |
| toyos.rs:3113 | acpi_press_is_one_sci | PRESS_ARMED awaited; then the job's end awaited | waited |
| toyos.rs:3152 | acpi_holder_is_refused_a_held_functions_configuration | the second job's end awaited; the declaration lines and the refusal come before it | waited |
| toyos.rs:3181 | osbench_capability_groups_exit_0 | the last job's end awaited; the earlier jobs ran before it | waited |
| toyos.rs:3203 | console_image_boots | console ready and ARMED_BOTH awaited; KEYBOARD_RESET is ps2server's, before its ARMED_BOTH | waited |
| toyos.rs:3223 | the_uart_carries_the_boot_once_across_the_hand_over | UART_CARRIES awaited; UART_BOUND is the kernel's binding of the uart program's claim, before that program carries the log | waited |
| toyos.rs:3255 | a_supervisor_that_fails_early_says_why_on_the_uart | SUPERVISOR_ENDED awaited; the reason must precede it | waited |
| toyos.rs:3278 | a_spawn_from_an_image_frees_it_when_the_child_ends | | clean-only |
| toyos.rs:3301 | a_user_copy_faults_in_mid_copy_or_ends_as_bad_address | | clean-only |
| toyos.rs:3335 | a_bent_supervisor_is_refused_and_nothing_boots | the loader's lines, after `await_exit` | waited |
| toyos.rs:3365 | the_log_lands_on_the_boot_stick | usbd's and logkeeper's lines awaited, then the load's, then `await_exit` | waited |
| toyos.rs:3451 | a_usb_key_reaches_the_console | console ready, the keyboard's binding and the spawn awaited; must_be_clean | waited |
| toyos.rs:3488 | desktop_without_x2apic | `compositor: ready` awaited; the APIC and SMP lines are the kernel's | kernel |
| toyos.rs:3626 | virt_no_seed_refused | kernel lines; drains to `EARLY PANIC: panicked at` | kernel |
| toyos.rs:3711 | virt_low_ecam | kernel lines; drains to the supervisor's spawn, the last asserted | kernel |
| toyos.rs:3762 | virt_smmu | kernel selftest lines; drains to the halt | kernel |
| toyos.rs:4026 | virt_console (judge_virt_job) | each job's end awaited before its lines are read; the kernel's exit line awaited (await_kernel_exit) | waited |
| toyos.rs:4298 | virt_reboot | kernel PSCI lines; REBOOTING awaited through `ended_through_psci` | kernel |
| toyos.rs:4434 | virt_selftest | the selftest's verdict, drained for | kernel |
| toyos.rs:4524 | virt_early_panic | kernel lines; drains to the panic message | kernel |
| toyos.rs:4577 | virt_el2_drop | kernel lines; drains to REFUSED | kernel |
| toyos.rs:4614 | virt_early_fault | kernel lines; drains to the fault message | kernel |
| toyos.rs:4646 | virt_user_mode | kernel lines; drains to logkeeper's spawn, the last asserted | kernel |
| toyos.rs:5026 | a_window_is_drawn_at_the_scale_and_relaid_at_the_next | every line awaited in turn | waited |
| toyos.rs:5104 | the_opening_exchange_with_qemus_agent_completes | ANSWERED awaited; HANDED and OPEN must precede it | waited |
| toyos.rs:5137 | the_compositor_drives_the_virtio_gpu | FRAME, then FOLLOWED awaited; the scale lines are the compositor's, printed before its frame and its `mode` line | waited |
| toyos.rs:5179 | nvme_disk_boots | | clean-only |
| toyos.rs:5184 | nvme_disk_boots | each role's file server line awaited | waited |
| toyos.rs:5238 | the_data_partition_beside_the_stick_is_designated | DATA's server awaited, two `run_test`s, then `await_exit` | waited |
| toyos.rs:5274 | a_host_disk_beside_the_stick_is_left_alone | servers awaited, then `await_exit` | waited |
| toyos.rs:5388 | usbd_drives_the_spare | | clean-only |
| toyos.rs:5444 | a_claim_before_the_declaration_is_refused_at_once | the job's end awaited; NONE is said before any row starts | waited |
| toyos.rs:5468 | usbd_refused_on_amdvi | the kernel's AMD-Vi description ("has no SMI filter", "no message is remapped"); the refusal is read in the job's window | kernel |
| toyos.rs:5489 | a_drives_row_holds_one_process_per_function | both holders' lines awaited; each hand-over precedes its holder's line; `_OSC` precedes every `drives` row | waited |
| toyos.rs:5535 | a_function_arrives_and_leaves | ARMED and HOLDING awaited; the domain line must precede ARMED | waited |
| toyos.rs:5649 | hda_plays_to_the_controller_that_reaches_an_output | soundserver's PLAYING and the silent driver's line awaited; the offer precedes PLAYING | waited |
| toyos.rs:5837 | vector_state_survives_a_switch | | clean-only |
| toyos.rs:5861 | std_threads_count_the_cpus_and_give_back_ended_threads | | clean-only |
| toyos.rs:5887 | affinity_pins_hold_on_every_cpu | | clean-only |
| toyos.rs:5908 | kernel_objects_refused_alone | | clean-only |
| toyos.rs:5935 | memory_floor_holds_the_controls | ARMED_BOTH, then the job's lines and end awaited | waited |
| toyos.rs:5986 | crypto_instrument_prints_its_table | | clean-only |
| toyos.rs:6045 | holders_exported_over | | clean-only |
| toyos.rs:6046 | holders_exported_over | netstack's LEASED drained for; its link-open line precedes the lease | waited |
| toyos.rs:6194 | traffic_leaves_by_the_second_link_while_the_first_is_down | | clean-only |
| toyos.rs:6248 | a_link_ends_under_a_held_stream_and_comes_back | | clean-only |
| toyos.rs:6293 | udp_receive_times_out | | clean-only |
| toyos.rs:6312 | a_client_killed_mid_connect_gives_its_place_back | | clean-only |
| toyos.rs:6336 | stream_holders | | clean-only |
| toyos.rs:6378 | bar_map_again | | clean-only |
| toyos.rs:6447 | bar_map_behind_a_bridge | | clean-only |
| toyos.rs:6471 | lent_device_memory_refused | | clean-only |

Result: one site asserted a program's line its wait did not cover:
`iommu_virtio_platform`'s no-unit arm, fixed in 53478ea36. Some verdicts rest
on an order and not on a wait. These are lines one program writes in sequence,
a kernel record written inside the call that precedes a program's line, and
the supervisor starting disk drivers before test-runner. Each is named in its
row.

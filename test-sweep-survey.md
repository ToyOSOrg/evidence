# Test sweep survey: every test in the tree against the owner's integration ruling

ToyOS head: `ab655a115` (origin/main at the survey). Ruling as #890 places it, read as unconditional (the
orchestrator, on #890): a test the ruling refuses is cut, and where what it checked matters, a unit or
module test of its program holds it.

Where a test runs:
- **Q**: the QEMU guest suite (`tests/toyos.rs` `MACHINE_TESTS`, `SCREEN_TESTS`), which CI's `guest / suite`
  runs whole under KVM and the nightly under TCG.
- **M**: a T14 metal row (`METAL`), run by the orchestrator's metal bench.
- **S**: a member of the T14's `testcases` shared boot (`shared_metal`, discovered from
  `tests/guest/rust-tests/src/bin`); **D**: of its `shared-debug` boot (`ACTUATOR_TESTS`).
- **H**: a helper binary on `RUST_SKIP`, run only by the row or guest test named.
- **host**: a host test run by CI's `host` check.

Verdicts:
- **keep K**: the kernel's own integration, the kernel driven from userland (a probe, or a shipped program
  as the load or trigger).
- **keep MOD**: a test of one userland module (std's ToyOS platform, the SDK, a forked crate) that runs only
  on ToyOS, with no shipped program launched; a stand-in server inside the test's own binary is a module test.
- **keep SMOKE**: a very cheap smoke test of one program.
- **keep NARROW**: the kernel's arms stay; the named arms the ruling refuses are cut, held or replaced as
  named.
- **delete**: it integrates userspace programs, or launches software and drives it through steps, and what
  it checks is held by the unit or module tests named.
- **replace**: the same, and some of what it checks matters and is held nowhere: the named unit or module
  test is written in the build round.

## 1. QEMU guest suite: `SCREEN_TESTS` (34)

| test | runs | verdict | subject | held by / replacement / note |
|---|---|---|---|---|
| screen_panic_muted | Q | keep K | the fatal report reaches a panel with no serial port | |
| screen_fatal_behind_a_painter | Q | keep K | the fatal path takes the panel from a painter holding its latch | |
| screen_fatal_halt_composited | Q | keep K | the fatal path takes the panel back from the compositor and seals the black box | the compositor is the load only |
| screen_loader_clears | Q | keep K | the loader's screen carries none of the firmware's | |
| virt_early_panic | Q | keep K | AArch64 entry, PL011, survey and early panic on both channels | |
| virt_early_fault | Q | keep K | AArch64 vectors report an undefined instruction | |
| virt_el2_drop | Q | keep K | the entry's drop from EL2 | |
| virt_user_mode | Q | keep K | first EL0 process; seed, GIC, timer | supervisor's spawn of logkeeper is the witness only |
| virt_timer_preempts | Q | keep K | kernelprobe `preempt` | |
| virt_irq_storm | Q | keep K | `irq-storm` selftest | |
| virt_timer_floor | Q | keep K | `timer-floor` selftest | |
| virt_fp_isolation | Q | keep K | kernelprobe `fp_isolation` | |
| virt_first_entry | Q | keep K | kernelprobe `first_entry` | |
| virt_unmap_touch | Q | keep K | kernelprobe `unmap_touch` | |
| virt_debug_refused | Q | keep K | kernelprobe `debug_refused` | |
| virt_readonly_copyout | Q | keep K | `abuse_readonly_copyout` on AArch64 | |
| virt_ring0_timer_in_syscall | Q | keep K | `ring0_timer_in_syscall` on AArch64 | |
| virt_mask_windows | Q | keep K | preemption-off windows on AArch64 | |
| virt_smp | Q | keep K | SMP bring-up through SMC, counters and trace reads | |
| virt_el1_smp | Q | keep K | SMP bring-up through HVC | |
| virt_failed_ap_leaves_no_hole | Q | keep K | a CPU that fails to start leaves no hole | |
| virt_fatal_halts_the_others_first | Q | keep K | no sibling record after the fatal line | |
| virt_reboot | Q | keep K | PSCI SYSTEM_RESET through SMC | |
| virt_off_names_the_cpus_left_on | Q | keep K | power-off names the CPUs left on | |
| virt_reboot_refused_without_psci | Q | keep K | reboot refused with no PSCI | |
| virt_reboot_wire_held | Q | keep K | klogd holds the PL011 wire as the stop begins | |
| virt_reboot_wire_kept | Q | keep K | klogd keeps the wire through the stop's budget | |
| virt_jobs_at_el2 | Q | keep K | the job case entered at EL2 | |
| virt_random_differs | Q | keep K | two boots draw differently | |
| virt_smmu | Q | keep K | SMMUv3 refuses and records DMA | |
| virt_no_seed_refused | Q | keep K | no entropy source is refused by name | |
| consent_prompt | Q | **delete** | a package launched from the desktop and driven by keys through seven steps across the compositor, filepicker and supervisor | held by `lib/manifest/src/consent.rs:242` (only Always and Deny are kept), `:307` (a hang-up withdraws the launch); `lib/manifest/src/grants.rs:476` (the answer is for the exact binary, asked only at the screen), `:461` (revoke), `:398` (a folder outside the home is refused); `system/compositor/desktop/src/stack.rs:263`, `:279`, `input.rs:565`, `:594`, `:623`, `hit.rs:211`, `plan.rs:236`, `budget.rs:150` (the prompt layer); `spawn_image_object` (S, keep) for a prepared spawn running the bytes it read. Goes with it: `consent` (H), `tests/images/consentcase.toml`, its line in `build/build.rs:2985`, `Consent`/`ConsentStep` in `tests/toyos.rs` |
| virt_wall_clock_utc | Q | keep K | the wall clock reads the RTC as UTC | |
| virt_low_ecam | Q | keep K | a 16-bus ECAM window is mapped and walked whole | |

## 2. QEMU guest suite: `MACHINE_TESTS` (30)

| test | runs | verdict | subject | held by / replacement / note |
|---|---|---|---|---|
| iommu_virtio_platform | Q | keep NARROW | the kernel hands a claim over behind a unit and refuses one without; virtio functions negotiate `VIRTIO_F_ACCESS_PLATFORM` | keep: the kernel's handover (BAR moved, MSI-X armed), its refusals without a unit, and `declining_is_not_free` (the kernel's own virtio driver, `kernel/src/drivers/virtio.rs:166`). Cut: counting the negotiation lines of netstack's and soundserver's drivers and the userland fallbacks (diskserver refused, fileserver without DATA, null sink), held by `lib/virtio/src/tests.rs:227` and `:273` |
| amdvi_firmware_left | Q | keep K | an AMD-Vi unit left blocking is switched off before the stick is driven | |
| netstack_socket_churn | Q | **delete** | a guest job drives netstack against three host servers | held by `system/netstack/node/tests/streams.rs:1110` (a client that left is finished), `:1353` (a pipe that is no pipe resets), `:1371` (a refused watch resets), `listeners.rs:637` (a connect past the places is refused), `:681` (closing a listener frees its port), `datagram.rs:269` (a closed socket frees its port), `datagram.rs:79`. Goes with it: `netstack_socket_churn` (H), `holding_server`, `answering_server` |
| netstack_streams | Q | **replace** | megabytes through netstack to the host kernel's TCP and back, and two host peers queued before an accept | the stream rules are held by the node tests (`listeners.rs:500` two connects between accepts, `streams.rs` FIN and full-pipe tests), whose reader is `etherparse` and the RFCs. Held nowhere: a TCP its writers did not write. Replacement: a node test replaying a recorded Linux TCP peer's segments (a bulk echo past both windows ending in FIN; two connects queued before an accept), committed with its provenance as `system/netstack/node/tests/slirp.rs` replays slirp's DHCP. Goes with it: `netstack_streams` (H) |
| netstack_streams_e1000e | Q | **delete** | the same on the 82574 | the stream claims as above; the driver held by `system/netstack/i219` (91 host tests) |
| libc_sockets | Q | **replace** | libc's and std's socket calls driven against netstack and host peers | libc's half held by `sdk/libc/arch/src/stream_ends.rs:14`, `:24`, `socket_options.rs`, `internet_addresses.rs`; netstack's option by `streams.rs:1389`, `listeners.rs:890`. Held nowhere: std's half (a stream and its duplicate are one socket; each way a stream ends as std reports it, against the host TCP's report). Replacement: a host test of `sdk/std`'s ToyOS net end and option mapping, as `stream_ends.rs` holds libc's. Goes with it: `nodelay_accepted`, `stream_ends_std` (H), `tests/guest/c/{addr_order,nodelay_kept,sendto_unbound,stream_ends}.c`, `tests/guest/rust-tests/src/stream_ends.rs` (the harness's `#[path]` module), `ending_server` |
| https_fetch | Q | **delete** | an HTTPS client installed in the guest fetches from host servers through netstack | rustls's refusals by name are rustls's own suite's; `ring`'s ToyOS build held by `ring_kat`, which stays as an S member (keep MOD); the random source and wall clock by `random_draws` and `wall_clock_now` (S); sockets by the node tests. Goes with it: `https_get` (H), `tests/common/https.rs`. `issues/the-internet-clients-work-unchanged.md` stage 3 owes an `https_tls13` metal row of the same shape |
| nested_nmi_is_loud | Q | keep K | a nested NMI is reported loudly | |
| machine_shutdown | Q | **delete** | `run shutdown` powers q35 off | the same path, more asserted, is `machine_shutdown_wire_held`/`_kept`/`_at_the_seal` (keep); the kernel's power-off on a supplied sleep type is `acpi_mediated_access` and `acpi_supply_outlives_holder` (keep); `\_S5`'s evaluation is `system/acpiserver/aml/tests/evaluate.rs:509` |
| acpi_power_button | Q | **replace** | a QMP press through acpiserver and the supervisor to a power-off | acpiserver's half held by `system/acpiserver/src/sci.rs:164`, `host.rs:754`. Held nowhere: the kernel's half, the fixed power-button event delivered as one SCI to the `acpi` claim's holder with its line masked until served. Replacement: an arm of `acpi_mediated` (Q, keep) in which the probe holds the claim and a QMP press arrives once. The supervisor's stop on a press: `issues/the-supervisor-is-host-tested-and-owns-the-stop.md` stage 2 |
| acpi_mediated_access | Q | keep K | the kernel's mediated access for the `acpi` claim's holder | |
| acpi_lock_given_back_on_one_cpu | Q | keep K | the same on one CPU | |
| acpi_supply_outlives_holder | Q | keep K | a supplied sleep type outlives its holder | |
| acpi_press_across_a_lock_wait | Q | **delete** | acpiserver's Acquire bound and a press latched across the firmware's hold of the Global Lock | held by `system/acpiserver/src/sci.rs:274`, `:295`, `host.rs:787`, `:807`; the kernel's half of the lock by `acpi_mediated_access`. Goes with it: `acpi_mediated`'s `held` arm and `ssdt_acquiring_the_global_lock` (`tests/common/power.rs`) |
| machine_shutdown_short_stop | Q | keep K | a stop that left a thread running still powers off | |
| machine_shutdown_wire_held | Q | keep K | klogd holds the 16550 wire as the stop begins | |
| machine_shutdown_wire_kept | Q | keep K | klogd keeps it through the stop's budget | |
| machine_shutdown_wire_at_the_seal | Q | keep K | the stop holds the wire past the seal | |
| bar_map_again | Q | keep K | a claim's BAR asked for again | |
| lent_device_memory_refused | Q | **replace** | fileserver lets a hello go whose window is a device's BAR | held nowhere: the kernel's `NotRam` answer for a lent BAR, and fileserver's drop on it (`system/fileserver/src/main.rs:595`-`599`, untested). Replacement: the `lent_device_memory_refused` probe asks the kernel itself (keep K tier, a function no program holds), and a fileserver host test of the hello's decision lifted out of `main.rs` |
| console_image_boots | Q | keep SMOKE | `images/console.toml` boots and the console takes its panel | one program, nothing typed |
| desktop_without_x2apic | Q | keep K | every CPU in xAPIC mode; the desktop is the load | |
| nvme_disk_keeps_log_and_home | Q | **replace** | a boot driven through `mkdir`, `cp`, `echo`, `ls`, a reboot, `cat` and `grep` across diskserver, fileserver, logkeeper and toybox | the persistence is held by `system/fileserver/src/data.rs:884` (a closed file keeps its length across a remount), `:1047`, and logkeeper's `store.rs` tests. Held nowhere: a machine whose one disk is NVMe boots off it. Replacement: that boot to ready on `HeadlessNoUsb`, no job (the loader's and kernel's) |
| hosted_clang_hello | Q (on demand) | **delete** | clang and LLD installed on ROOT compile, link and run a program in the guest | the ruling's own shape; run by no CI (`ON_DEMAND`); its claim is `issues/toyos-builds-itself.md` M2's measurement, recorded in its PR. Goes with it: `ON_DEMAND` and its fixture in `tests/checks.rs:801`-`808`, `tests/common/hostedclang.rs`, `hosted_clang_hello` (H), `tests/guest/c/hello.c`, `tests/images/hostedclangcase.toml`, `build/build.rs:2986` |
| block_grants_reach_their_partitions | Q | **delete** | a job starts diskserver and mints its grants | held by `system/diskserver/src/main.rs:841` (opens, refusals, the running ROOT `Held`), `:861`, `:797`; the badge diskserver reads is the minted one by `port_badge` (keep K). Goes with it: `partition_grant` (H), `tests/images/blockgrantcase.toml`, `build/build.rs:2984` |
| update_writes_the_idle_slot_through_the_block_service | Q | **replace** | the supervisor grants `update` the idle slot through diskserver; `update` installs and marks it | held by `lib/update/src/slots.rs:399`, `:413`, `:381`. Held nowhere: `update`'s write of a signed image into the slot (ROOT partition and the FAT volume's three files) and its mark. Replacement: a host test of `system/update`'s install over an in-memory disk, the volume judged by `toyos-fat32-check`. The supervisor's grant: supervisor track stage 2. Goes with it: `update_idle_slot` (H), `tests/images/slotscase.toml`, `build/build.rs:2995` |
| usbd_drives_the_spare | Q | keep NARROW | a controller left to a claim, driven by usbd | keep: `xhci-leave`, the handover, the No-Op answered by an interrupt (usbd's smoke), the `DMA FAULT` record at the aimed address, the refusal where the kernel drives it. Cut: usbd's device naming and its restart, held by `lib/xhci` and `lib/xhci/sim/tests/{enumerate,scenarios}.rs` |
| usb_keyboard_rollover | Q | keep K | the kernel's USB HID driver reads a rollover report | |
| toyfetch_reports | Q | **delete** | `free` and `toyfetch` run and cross-checked | held by `apps/toyfetch/src/render.rs:198`, `:261` and its other five; the CPU count by `counters_read` (S). The `sysinfo` fork's ToyOS backend is read by no test after this (see unsure) |
| vector_state_survives_a_switch | Q | keep K | vector registers across switches, under TCG | |

## 3. T14 metal rows (`METAL`, 64)

| row | boot | verdict | subject | held by / replacement / note |
|---|---|---|---|---|
| blackbox_unclaimed_page | testcases | keep K | | |
| control_regs | testcases | keep K | | |
| ioapic_topology | testcases | keep K | | |
| klogd_hosted | testcases | keep K | | |
| irq_census_conservation | testcases | keep K | | |
| mask_windows | windowscase arm | keep K | | |
| mkdir_cap | testcases-mkdir | keep K | | |
| readdir_bound | testcases-readdir | keep K | | |
| wake_storm_cost | testcases | keep K | | |
| shipped_client_departures | testcases | **delete** | two shipped `tone` clients through cpal and soundserver, judged by soundserver's departure lines | held by `system/soundserver/src/client.rs:352` (the departure vocabulary; a death is not a word `Departure` has) and `cpal_drop_unreleased` (S, keep MOD). Goes with it: `null_sink_client_exits` (H) |
| audio_idle_suspend | testcases | **replace** | soundserver takes no CPU before any client | held nowhere. Replacement: a host test of soundserver's mix pass (`issues/soundservers-mix-pass-has-no-host-test.md`'s seam): with no client, no timer is armed and no stream started. Goes with it: `audio_idle_suspend` (H) |
| hda_tone | testcases | keep SMOKE | one tone plays to its end through the T14's HDA, no null sink | soundserver's one smoke on the hardware it drives; `audio_tone` (H) stays |
| hda_client_stall | testcases | **replace** | a client stalled past a lap of the HDA ring | held nowhere. Replacement: a mix-pass host test over a sink that replays every period: the stall is covered (`underruns`), nothing deferred, across a suspend and a resume. Goes with it: `hda_client_stall` (H) |
| soundserver_log_stall | logstallcase | **replace** | soundserver plays on while logkeeper reads none of its ring | logkeeper's count of what it could not write: `system/logkeeper/src/origin.rs:325`, `store.rs`. Held nowhere: soundserver's mix thread never waits on its log. Replacement: a host test of the record writer soundserver's threads use (`sdk/toyos/src/log`) against a full ring: it counts and returns, never waits. Goes with it: `soundserver_log_stall` (H), `tests/images/logstallcase.toml`, `build/build.rs:2989`, `log_stall_on_metal`, logkeeper's `--stall-until` if nothing else reads it |
| loader_watchdog_arms | testcases-watchdog, testcases | keep K | | |
| counters | testcases | keep K | | |
| acpi_server_events | testcases (held) | **replace** | acpiserver takes and counts the T14's embedded-controller events | held: `system/acpiserver/src/ec.rs`, `sci.rs:164`. Held nowhere: the T14's own firmware. Replacement: host tests loading the T14's DSDT and SSDTs, read by `acpidump` on its Ubuntu and committed with provenance, into the interpreter with a scripted host and controller. Goes with it: `acpi_hold` (H), `TESTCASES_HELD` |
| acpi_tables_loaded | testcases (held) | **replace** | acpiserver loads the T14's 14 definition blocks; `\_S5` is SLP_TYPa=7 | replacement: the same recorded tables, every block loaded and `\_S5` evaluated. The kernel's side is `acpi_table_inventory` (keep) |
| battery_read | testcases (held) | **replace** | the T14's battery and AC adapter through AML and the controller | held: `system/acpiserver/src/battery.rs` (13 tests, crafted). Replacement: the recorded tables' `_BIF`/`_BIX`/`_BST` evaluated over a scripted controller |
| acpi_server_death | acpicase | keep K | the kernel writes `ACPI_DISABLE` as the claim goes | acpiserver is only the holder killed; a probe could hold it |
| syscall_cost | testcases | keep K | | a measurement row |
| spawn_cost | testcases | keep K | | a measurement row; toybox `echo` is the child spawned |
| tlb_shootdown_waits | shared-debug | keep K | | |
| trace_record_cost | shared-debug | keep K | | a measurement row |
| watchdog_fed | testcases-watchdog | keep K | | |
| smp_roster_and_tsc_trail | testcases | keep K | | |
| pmm_accounting | testcases | keep K | | |
| acpi_table_inventory | testcases | keep K | | |
| timer_calibration | testcases | keep K | | |
| pci_inventory | testcases | keep K | | |
| tlb_shootdown_cost | latencycase | keep K | | |
| latency_wake | latencycase | keep K | | |
| boot_deadline_ends_a_wedge | deadlinewedge | keep K | | |
| usb_reset_records_the_phase_it_cut | usbload | keep K | | |
| usb_stick_left | usbbreak | keep K | | |
| hard_lockup_ends_a_deaf_cpu | hardlockup | keep K | | |
| blackbox_foreign_record | foreignrecord | keep K | | |
| process_tree | proctreecase | keep NARROW | a parent's end takes its subtree | keep: a killed and a faulting B take C (spawned directly) down; a spawn under B's dead `self` answers `Gone`; the loader's refusal admitted under B; `MAX_DEPTH`'s refusal, reached by a chain of direct spawns of itself instead of shells. Cut: D launched and E asked of the supervisor, the launcher's place refusals (`a_manage_only_handle_is_no_place`, `a_pipe_is_no_place`), std's launch refusals (`a_place_without_dup_is_refused`, `the_supervisor_is_asked_only_by_a_launch`, `a_named_image_is_spawned_directly`) and the shell's `detach`. Replacements: the launcher's arms in supervisor track stage 2's host tests; std's in a host test of `sdk/std/os/process.rs`'s launch checks; `detach` in a host test of the shell's command parser. Moves to the `testcases` boot as an S member |
| launch_toctou | proctreecase | **replace** | the launcher runs a row's own program while the caller's link is re-pointed | the kernel's half (a spawn from an image object runs the bytes it was handed) held by `spawn_image_object` (S). Held nowhere: launch resolution answering the row's own image, never the caller's re-opened path. Replacement: that host test in supervisor track stage 2 (`toyos-supervisor`'s launch resolution). Goes with it: `launch_toctou` (H) |
| launch_authority | proctreecase | **delete** | the owner's ruling's own case | held by `lib/manifest/src/launch.rs:288`, `:383`; a direct spawn holding no launcher by `endowment_denied` (S, `only_what_was_given`). Goes with it: `launch_authority` (H), `launch_authority`'s judge, the `proctest` row of `tests/images/proctreecase.toml` |
| port_badge | proctreecase | keep K | a badge is the minted bytes, read by its own acceptor | moves to the `testcases` boot as an S member when proctreecase goes |
| fs_share | proctreecase | **replace** | shells launched down a login session's chain against DATA's server | held by `lib/manifest/src/launch.rs:341` (a session's launches spend its one share). Held nowhere: fileserver's per-share bounds (streams, connections, connections awaiting a hello answered `ResourceExhausted` and let go first) in `system/fileserver/src/main.rs`. Replacement: a host test of those bounds lifted out of `main.rs`. Goes with it: `fs_share` (H) |
| app_view | proctreecase | **replace** | a package installed, launched through the supervisor, granted and revoked a folder through `grants` and a shell | held by `lib/manifest/src/lib.rs:695`, `:665`, `:716`, `:676`; `grants.rs:476`, `:461`, `:398`; `system/fileserver/src/rights.rs:32`; `resolve.rs:168`. Held nowhere: the launcher refusing a package whose folder is a file, and grants refused in the machine's session. Replacement: those two in supervisor track stage 2. Goes with it: `app_view` (H) |
| metal_sim_scanout_wc | metalcase | keep K | | |
| usb_reset_hands_devices_back | metaldevicecase, metalcase | keep K | | |
| blackbox_done_chain | metalcase | keep K | | |
| machine_reboot | metalcase | keep K | | |
| pci_capability_walk | shared-debug | keep K | | |
| read_fault_selftests | shared-debug | keep K | | |
| leak_rollback_selftest | shared-debug | keep K | | |
| lapic_spurious_vector | shared-debug | keep K | | |
| xhci_xecp_walk | shared-debug | keep K | | |
| xhci_descriptor_walk | shared-debug | keep K | | |
| sysret_ss_reload | shared-debug | keep K | | |
| input_merge | shared-debug | keep K | | |
| operation_nesting | shared-debug | keep K | | |
| iommu_firmware_left | shared-debug | keep K | | |
| claim_reuses_its_remapping_entry | testcases | keep K | | |
| domain_ends_below_the_host_bridges | testcases | keep K | | |
| claim_refused_without_remapping | iommu-no-remap | keep K | | |
| usbd_drives_the_type_c_controller | testcases-xhci-leave | keep K | the Type-C controller left to a claim: handover, MSI through remapping, usbd's No-Op by interrupt | usbd's first command is its smoke |
| isa_ports_are_the_binders_alone | isa-withheld | keep K | | |
| isa_lines_reach_their_holder | isa-withheld | keep K | | |
| crash_report_reads_no_kernel_memory | testcases | keep K | | |

## 4. T14 shared-boot members (98 Rust binaries, and the C corpus)

| test | runs | verdict | subject | held by / replacement / note |
|---|---|---|---|---|
| abuse_connect_flood | S | keep K | | |
| abuse_cwd_growth | S | keep K | | `/tmp` |
| abuse_dlopen_ledger | S (last) | keep K | | |
| abuse_elf_loader | S | keep K | | |
| abuse_elf_segments | S | keep K | | |
| abuse_gpu_resolution | S | keep K | | |
| abuse_handle_table | S | keep K | | |
| abuse_inbox | S | keep K | | |
| abuse_kernel_addr | D | keep K | | |
| abuse_listener_hijack | S | keep K | | |
| abuse_mmap_regions | S (last) | keep K | | |
| abuse_page_straddle | S | keep K | | |
| abuse_pipe_map | S | keep K | | |
| abuse_pipe_owner | S | keep K | | |
| abuse_pipe_ring | S | keep K | | |
| abuse_readonly_copyout | S | keep K | | |
| abuse_shared_grant | S | keep K | | |
| abuse_shm_length | S | keep K | | |
| abuse_spawn_argv | S | keep K | | |
| abuse_thread_name | S | keep K | | |
| abuse_thread_table | S (last) | keep K | | |
| abuse_tls_alloc | S | keep K | | |
| allocator_stress | S | keep MOD | std's allocator over the kernel's mappings | |
| blocking_read_stress | S | keep K | | |
| c_aligned_alloc | S | keep MOD | std's C allocator | |
| connect_before_serve | S | keep K | | |
| counters_read | S | keep K | | |
| counters_silent | D | keep K | | |
| cpal_drop_unreleased | S | keep MOD | cpal's ToyOS host against a stand-in server in its own binary | |
| debug_trap | S | keep K | | |
| demand_paging_sse | S | keep K | | |
| demand_window_race | S | keep K | | |
| disk_backtrace | S | keep NARROW | a program dying from a disk is recorded as its file and offset | keep the kernel's record. Cut: running `/system/bin/symbolize` on it, held by `lib/symbols/tests/name.rs` (`a_real_binarys_offset_names_its_function`) and `system/symbolize/src/main.rs`'s tests; `symbolize`'s row in `tests/images/testcases.toml` goes with it |
| dlopen_dedup | S | keep K | | |
| empty_dir_stat | S | keep K | | `/tmp`, and std's `is_dir` |
| endowment_denied | S | keep NARROW | what a process holds is what its parent gave it | keep the namespace and capability arms. Cut: `the_shipped_applet_reaches_both_answers`, which runs the shipped `ps` with and without `ROSTER`; the kernel's refusal is held by its own `the_roster_is_a_right_and_the_header_is_not`, the manifest's bit by `lib/manifest/src/lib.rs:822`; `ps`'s own refusal line by a toybox host test of `ps` over a refused roster (replace). `every_applet_holds_only_what_its_policy_names` reads the image and launches nothing: not refused by this ruling |
| exit_wait_storm | S | keep K | | |
| fault_gates | S | keep K | | `echo` is the witness that a process still starts |
| file_mtime | S | keep NARROW | a file's mtime is the wall clock at its write | keep `/tmp` and the undated arms. Cut: the `/home` and `/log` arms. Held nowhere: fileserver's DATA keeping the nanosecond and FAT the whole second of its flush. Replacement: a test in `system/fileserver/src/data.rs` and one in `fat.rs` |
| fs_cache_eviction | S | **replace** | an evicted block of DATA's server reads back off its disk | held in part by `system/fileserver/src/cache.rs:342`, `:297`, `:325`. Replacement: an assertion added there that every evicted clean block reads back from the disk byte for byte |
| fs_escape | S | **replace** | `/home` is a floor | held by `system/fileserver/src/resolve.rs:147`, `:186`, `:168`; a directory no capability names by `endowment_denied`'s names arms. Held nowhere: a `..` put on the wire past std is refused `InvalidArgument`. Replacement: a fileserver host test of the request's path decode, lifted out of `main.rs` |
| fs_large_file | S | **delete** | a file past the old extent cap, and a rename's length bound | held by `lib/bcachefs/tests/integration.rs:591`, `:607`, `:650` |
| fs_stream_offset | S | **replace** | a stream asked past the largest offset is refused | held nowhere: `system/fileserver/src/main.rs:729` and `:748`. Replacement: a fileserver host test of the request bounds lifted out of `main.rs` (also takes `lseek_past_eof`'s `/home` ceiling) |
| fs_truncate_persist | S | keep NARROW | `set_len` persists; a binary runs out of tmpfs | keep the `/tmp` control and the tmpfs spawn. Cut: `/home`'s truncate, held by `system/fileserver/src/data.rs:884`, `:911` |
| fs_turns | S | **replace** | threads sharing one directory's connection are served in turn | held nowhere off the guest. Replacement: a host test of the ticket handover in `sdk/std/sys/fs.rs:60`-`94`, lifted into code a host builds |
| futex_wake_counts | S | keep K | | |
| handle_lifetime | D | keep K | | |
| hierarchy_paths | S | keep NARROW | `/` is synthesized and read-only | keep `/` and `/media`. Cut: `/apps` and `/home` as two paths into one filesystem, held by `lib/manifest/src/lib.rs:838` and `system/fileserver/src/data.rs:828` |
| home_backing_revoked | S | **delete** | a read through a deleted `/home` file is refused | held by `system/fileserver/src/data.rs:901` |
| inbox_cancel_wakes | S | keep K | | |
| inbox_empty_write | S | keep K | | |
| inbox_log_post | S | keep K | | |
| isa_claim_refused | S | keep K | | |
| kill_ends_every_wait | S | keep K | | |
| lent_window_refused | S | **replace** | fileserver lets a hello go whose window is not `WINDOW_BYTES` | held nowhere: the kernel's answer for a pipe end and a region of another length, and fileserver's drop. Replacement: the probe asks the kernel's `lent` itself (keep K), and the fileserver hello test named under `lent_device_memory_refused` |
| lseek_past_eof | S | keep NARROW | a seek past EOF is a position | keep `/tmp`. Cut: `/home`, held by `system/fileserver/src/data.rs:869`; its ceiling goes to the request-bound test under `fs_stream_offset` |
| memmap_exec_refused | S | keep MOD | memmap2's ToyOS backend | |
| mmap_prot | S | keep K | | |
| mmap_stress | S | keep K | | |
| munmap_reissues_read_window | S | keep K | | |
| munmap_reissues_second_read_window | S | keep K | | |
| mutual_kill | S | keep K | | |
| netstack_gone_mid_bind | S | keep MOD | the SDK's net client against a port it holds and closes | no netstack runs |
| nvme_home_roundtrip | S | **delete** | a file round trip on `/home` through fileserver and diskserver | held by `system/fileserver/src/data.rs:869`, `cache.rs:297`, `:325` |
| pipe_flag_forgery | S | keep K | | |
| pipe_other_end_gone | S | keep K | | |
| poll_wake_pipe | S | keep K | | |
| poller_capacity | S | keep K | | |
| process_lifecycle | S | keep K | | |
| query_modules_size | S | keep K | | |
| random_draws | S | keep K | | |
| ring0_timer_in_syscall | D | keep K | | |
| sched_stress | S | keep K | | |
| shm_release_reclaims | D | keep K | | |
| spawn_child_ends_first | D | keep K | | |
| spawn_image_object | S | keep K | | |
| spawn_lands_claimed | D | keep K | | |
| stat_identity | S | keep NARROW | one file is one `(dev, ino)` | keep `/tmp`. Cut: `/home` and `/log`, held by `system/fileserver/src/data.rs:947`, `fat.rs:628`, `volume.rs:287` |
| std_alloc | S | keep MOD | | |
| std_fs | S | keep MOD | | `echo` is the far end of a pipe |
| std_fs_write | S | keep MOD | | `/tmp` |
| std_io | S | keep MOD | | |
| std_mmap | S | keep MOD | | |
| std_process | S | keep MOD | std's `Command` over the kernel's spawn and pipes | `echo` and `cat` are the children |
| std_sync | S | keep MOD | | |
| std_threading | S | keep MOD | | |
| std_tls_cranelift | S | keep MOD | | |
| std_tls_dlopen | S | keep MOD | | |
| std_tls_multi_crate | S | keep MOD | | |
| std_unwind | S | keep MOD | | |
| std_unwind_so | S | keep MOD | | |
| syscall_unassigned | S | keep K | | |
| toybox_file_tools | S | **replace** | `cp`, `mv` and `hexdump` spawned and judged on their bytes | held nowhere: toybox has no host test. Replacement: host tests of toybox's `cp` (streams past `FLUSH_BYTES`; no short file or `.part` left by a refusal), `mv` (a move across mounts is refused, no copy fallback) and `hexdump` (the recorded `xxd` bytes). The rename on `/home` is `system/fileserver/src/data.rs:978`; `is_dir` is `empty_dir_stat` |
| trace_read | S | keep K | | |
| user_copy_spans_windows | S | keep K | | |
| vector_state | S | keep K | | |
| wall_clock_now | S | keep K | | |
| window_refusal | S | keep MOD | the SDK's window client against a stand-in compositor in its own binary | |
| C corpus (138 of 162 TinyCC cases) | S | keep MOD | libc and the compiler, each case one program judged against TinyCC's committed output | an external oracle; one program per case, no steps |

## 5. Helper binaries on `RUST_SKIP` (46): each follows its row

| helper | run by | follows |
|---|---|---|
| cyclictest | latency_wake | keep |
| wake_storm_cost | wake_storm_cost | keep |
| syscall_cost | syscall_cost | keep |
| spawn_cost | spawn_cost | keep |
| tlb_shootdown_waits | tlb_shootdown_waits | keep |
| ring_park_herd | mask_windows | keep |
| idle_span | mask_windows | keep |
| ccheck | the C corpus | keep |
| disk_backtrace_child | disk_backtrace | keep |
| fault_gate_child | fault_gates | keep |
| isa_grant | isa_ports_are_the_binders_alone | keep |
| isa_lines | isa_lines_reach_their_holder | keep |
| pci_reclaim | claim_reuses_its_remapping_entry, claim_refused_without_remapping | keep |
| counters_metal | counters | keep |
| trace_flood | trace_record_cost | keep |
| panic_halts_first | virt_fatal_halts_the_others_first | keep |
| process_tree | process_tree | keep, narrowed; becomes an S member |
| launch_toctou | launch_toctou | goes |
| launch_authority | launch_authority | goes |
| port_badge | port_badge | keep; becomes an S member |
| app_view | app_view | goes |
| consent | consent_prompt | goes |
| fs_share | fs_share | goes |
| netstack_socket_churn | netstack_socket_churn | goes |
| netstack_streams | netstack_streams | goes |
| nodelay_accepted | libc_sockets | goes |
| https_get | https_fetch | goes |
| ring_kat | https_fetch | keep MOD; becomes an S member |
| stream_ends_std | libc_sockets | goes |
| readdir_bound | readdir_bound | keep |
| mkdir_cap | mkdir_cap | keep |
| hda_client_stall | hda_client_stall | goes |
| audio_tone | hda_tone | keep |
| audio_idle_suspend | audio_idle_suspend | goes |
| null_sink_client_exits | shipped_client_departures | goes |
| soundserver_log_stall | soundserver_log_stall | goes |
| acpi_release | acpi_server_death | keep |
| acpi_hold | acpi_server_events and its boot | goes |
| acpi_mediated | acpi_mediated_access, acpi_lock_given_back_on_one_cpu, acpi_supply_outlives_holder | keep; its `held` arm goes; gains the press arm |
| stop_short | machine_shutdown_short_stop | keep |
| bar_map_again | bar_map_again | keep |
| lent_device_memory_refused | lent_device_memory_refused | rewritten as the kernel probe |
| hosted_clang_hello | hosted_clang_hello | goes |
| partition_grant | block_grants_reach_their_partitions | goes |
| update_idle_slot | update_writes_the_idle_slot_through_the_block_service | goes |
| usbd_spare | usbd_drives_the_spare, usbd_drives_the_type_c_controller | keep, narrowed |

## 6. Other guest programs

| program | verdict | note |
|---|---|---|
| `tests/guest/kernelprobe` (5 probes) | keep K | the `virt_*` jobs |
| `tests/guest/metalprobe` (5 commands) | keep K | the device boot `usb_reset_hands_devices_back` rides |
| `tests/guest/test-runner` | infrastructure | the guest's job runner, no test |
| `tests/guest/proctest` | **delete** | an interactive subprocess test run by no harness, yet listed in `images/system.toml` (`[programs.proctest]`, and in three rows' `starts`), so it ships; `std_process` (S) holds std's `Command`. Its last reader is `launch_authority` and `tests/images/proctreecase.toml` |
| `tests/guest/c/*.c` (5) | follow | four with `libc_sockets`, `hello.c` with `hosted_clang_hello` |

## 7. Host tests that drive whole programs

None found. No host test spawns a program's binary (`CARGO_BIN_EXE` appears nowhere), and the only host
test that spawns a process is `lib/tmpdir/tests/reclaim.rs`, which spawns itself. The host suites closest to
the line, read and kept as module tests:

| suite | verdict | why |
|---|---|---|
| `system/netstack/node/tests/*` | keep MOD | the node module against scripted peers and faked pipe ends; `etherparse` reads every frame |
| `system/netstack/shard/tests/net.rs`, `shard/tcp/tests/net.rs` | keep MOD | two shards composed on a simulated segment |
| `lib/xhci/sim/tests/*` | keep MOD | the driver library against a simulated controller |
| `system/acpiserver/src/{host,main}.rs` tests | keep MOD | the server's decisions with a scripted kernel |
| `apps/calc/tests/parser_identities.rs` | keep MOD | `eval` on a string |
| `lib/tmpdir/tests/reclaim.rs` | keep MOD | spawns itself |

## Counts (sections 1 to 4, `proctest`, and the C corpus as one)

| | keep | of which narrowed | delete | replace | total |
|---|---|---|---|---|---|
| QEMU screen tests | 33 | 0 | 1 | 0 | 34 |
| QEMU machine tests | 16 | 2 | 8 | 6 | 30 |
| T14 metal rows | 53 | 1 | 2 | 9 | 64 |
| T14 shared members | 89 | 7 | 3 | 6 | 98 |
| C corpus | 1 | 0 | 0 | 0 | 1 |
| `proctest` | 0 | 0 | 1 | 0 | 1 |
| **all** | **192** | **10** | **15** | **21** | **228** |

Of the 192 kept: 160 the kernel's own (keep K), 20 module tests (keep MOD, the corpus among them), 2 smoke
tests (`console_image_boots`, `hda_tone`), 10 narrowed.

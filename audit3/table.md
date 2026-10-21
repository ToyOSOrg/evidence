# Audit batch 3 classification

Read against origin/main db0cf636d16d265ac400ab5f32658ed81f5cd632; records whose cited code changed up to a8ea09d209c514fdcffcdbe58f3c1826e6aa40e9 (final base) re-read there. Line numbers are at db0cf636d unless stated.

| record | class | evidence |
|---|---|---|
| storage-still-comes-up-before-the-supervisor-runs | already deleted on main | 13ed7b4f4 |
| the-boot-volumes-server-holds-a-claim-that-writes | already deleted on main | 13ed7b4f4 |
| usb-disk-index-stable-nothing-enumerates-on-the-first-controller | already deleted on main | 13ed7b4f4 |
| usb-short-read-reds-beside-other-guests-and-is-green-alone | already deleted on main | 13ed7b4f4 |
| usb-transport-break-flushedstick-can-break-after-the-reboot | already deleted on main | 13ed7b4f4 |
| xhci-flap-wedges-under-kvm | already deleted on main | 13ed7b4f4 |
| xhci-waits-are-spins | already deleted on main | 13ed7b4f4 |
| tearing-is-what-gop-cannot-give-back | owner-held | uncommitted edit in primary checkout |
| suite-rows-that-are-measurements-or-make-several-claims | partly stale | toybox_file_tools.rs deleted by ff1a11dbd; syscall_cost/spawn_cost tests/toyos.rs:770,785 print-only; trace_record_cost :845 "Read, not held"; counters :719, acpi_tables_loaded :740, timer_calibration :904 (+tsc_agrees_with_cpuid :6365) still multi-claim; other guest bins present with stated checks |
| sys-debug-actions-and-two-loader-words-that-nothing-calls | still-valid | sdk/abi/src/syscall.rs:796-848, boot.rs:164,168; kernel arms dispatch.rs:508-571; git grep -w finds no caller outside sdk/abi/kernel except LOG_PATTERNED in panic_halts_first.rs |
| syscall-preemption-is-incidental | still-valid | kernel/src/arch/x86_64/syscall.rs:64,68 raise/lower preempt count around the handler; aarch64 trap.rs:213,245 |
| t14-desktop-froze-at-64s | partly stale | compositor drop line is `compositor: dropping client N` (system/compositor/src/client.rs:259, session.rs:516), not `dropping pid` (a24100a03 wording); rest is historical analysis, unreproduced |
| t14-keyboard-will-not-report-its-scancode-set | superseded (delete) | kernel i8042 driver replaced by ps2server (ed1ec1512, #899); probe resets kbd with translation on, no set query/fallback (system/ps2server/src/probe.rs:9-17); undecoded runs named (stream.rs:56,261); T14 ps2server_arms passed at a42489c7c (#899 evidence) |
| t14-lost-every-integrated-input | partly stale | driver now ps2server; HEALTH_DONE, i8042/mod.rs lines, declare_source paragraph gone; counters repeat gated on irqs moved, <=1/10 s (stream.rs:55,308-319); healthy-stream instrument held by ps2/tests/decode.rs:358; the 6.6 s loss itself unexplained |
| t14-rows-hold-toyos-to-linuxs-choice-or-copy | partly stale | T14_DEFINITION_BLOCKS gone (14241dc96); count now Bench::blocks constants T14 14 / AMD 17 (tests/toyos.rs:5907,5924), still not from the boot's own tables |
| test-runner-holds-logread-where-no-log-builtin-runs | partly stale | log-gate/log-storm/log-close builtins gone; partclaimcase, blockdcase, doommusiccase, logrotatecase, sshdcase gone; netcase grants it to logkeeper only; testcases' grant used through dup by disk_backtrace/inbox_log_post; residual: metalcase.toml:74 test-runner logread with no dup, no reader; testcases.toml:45 comment cites a "log gate" |
| the-aarch64-boot-cpus-id-read-is-held-against-nothing | still-valid | kernel/src/arch/aarch64/smp.rs:38,63; irqchip.rs:141-153,206 |
| the-aarch64-kernel-builds-with-dead-code-allowed | still-valid | .cargo/config.toml:24 |
| the-ack-delay-abi-doc-names-one-cpu | fixed (delete) | sdk/abi/src/syscall.rs:813-821 doc now states each other CPU in turn, smallest wait answered, arming left until disarm or a fresh two-second window; matches kernel/src/arch/x86_64/tlb.rs:232 ARM_WINDOW_NANOS |
| the-acpi-row-is-released-with-an-acpi-disable-the-firmware-has-not-answered | still-valid | kernel/src/arch/x86_64/acpi_mode.rs:113 HANDBACK, leave() :414-445 logs and returns past the bound; enter() :350-357 answers Ok on SCI_EN set |
| the-acpi-servers-firmware-writes-reach-itss-and-registers-no-fence-sees | still-valid | lib/userbound/src/firmware.rs:295 RangeRegistersDiffer, :591 ESPI_IOD_IOE fence; list items not refuted by spot checks |
| the-acpi-servers-holder-drives-the-embedded-controller-unfiltered | partly stale | EC ports no longer opened in the IOPB: each access is the kernel's mediated access (system/acpiserver/src/host.rs:41-52,173-180; kernel acpi_mode.rs:16-21); server now issues RD_EC/WR_EC for AML (ec.rs:18-24); no fence on the value written, so defect stands |
| the-amd-benchs-ssdt8-scopes-a-controller-no-table-defines | still-valid | tests/toyos.rs:5924-5925 AMD bench refuses block 9 (SSDT8) |
| the-anti-rollback-floor-is-a-firmware-variable | still-valid | loader/src/floor.rs:6-25 NV+BS variable; main.rs:806-870; no TPM |
| the-ap-trampoline-is-written-at-0x8000-whatever-the-memory-map-says-is-there | still-valid | kernel/src/arch/x86_64/smp.rs:17; kernel/src/main.rs:380 |
| the-boot-map-reaches-4-gib-and-firmware-decides-what-lands-in-it | partly stale | report_reach (loader/src/main.rs:506) now checks four: kernel image, parameter buffer, microcode patch, kernel arguments; still not the memory map; Virt still 2G (tests/common/qemu.rs:2263); receives the fold of the-memory-map-buffer-is-the-unreported-pointer |
| the-bootstraps-own-build-cannot-start-rust-objcopy-on-an-apple-host | uncertain | not re-run on a post-#769 Apple host; build/toolchain.rs:462,660 |
| the-c-allocators-set-no-errno-where-posix-has-them | still-valid | updated by #980 (db0cf636d); sdk/std/sys/pal/c_allocator.rs refused() sets nothing |
| the-c-driver-names-no-start-file | still-valid | llvm fork b7420fe534 clang/lib/Driver/ToolChains/ToyOS.cpp:38-40,94-97; sdk/libc/src/arch/x86_64.rs:10 _start in libc |
| the-compiler-workspace-resolves-the-published-toyos-abi | partly stale | committed rust/Cargo.lock (rust fork 11e31a5277) itself names registry toyos-abi 0.1.0 (lock :5854) since fork c1b88133ec79; not the path package |
| the-compositor-ignores-a-message-it-does-not-know | partly stale | session.rs:1247 `_ => {}` stands; compositor_stall.rs deleted by 520c0d129 so the dependency paragraph and exit half are moot |
| the-compositor-keeps-a-committed-regions-mapping-for-as-long-as-the-client-does | still-valid | client.rs:137-147; kernel/src/object/shm.rs:160,174; unmap_from caller only inbox/mod.rs:84 |
| the-console-loses-typed-keystrokes-under-host-load | uncertain | one-off red, test deleted 4c16f476d; no layer measured |
| the-cpu-that-spawns-a-toybox-applet-reads-1-4-ms-of-preemption-off-on-the-t14 | still-valid | metal readings; exit unmet |
| the-crash-evidence-records-x86-fault-registers | still-valid | kernel/src/panic.rs:16,28,61-69,101 |
| the-deadline-header-promises-any-interrupt-and-only-the-timer-entry-polls | partly stale | defect stands (deadline.rs:11-13 vs poll only in timer entries); call sites now poll/poll_in_kernel at x86 idt/timer.rs:65,84,99 and aarch64 trap.rs:186-188; line cites stale |
| the-direct-maps-page-directories-come-from-a-512-kib-heap | still-valid | kernel/src/mm/alloc.rs:582; paging.rs:1039-1051 |
| the-global-pipe-lock-spans-a-user-copy | partly stale | mechanism stands (pipe.rs:190,197,238-275,290-303; pmm write_bytes zeroing); line numbers, netd/logd names and MAX_PASS_NS line stale |
| the-hard-lockup-detector-samples-no-amd-cpu | still-valid | kernel/src/hardlockup/mod.rs:177-193 |
| the-hdmi-audio-function-1002-1637-is-driven-at-no-address-width | still-valid | system/hda/driver/src/controller.rs:169 |
| the-hosted-rustc-names-a-linker-toyos-does-not-have | still-valid | issues/nothing-builds-the-toyos-hosted-rustc.md open |
| the-hosted-rustcs-stage2-carries-seventeen-proc-macro-libraries-no-image-needs | still-valid | same |
| the-i8042s-holder-holds-the-machines-reset-line | still-valid | kernel/src/arch/x86_64/pio.rs:245; ps2server uses direct port I/O (system/ps2server/src/hw.rs) |
| the-intel-driver-writes-txdctl-and-tidv-against-the-82574-datasheets-newer-revision | still-valid | system/netstack/i219/src/lib.rs:7,1108,1116 |
| the-kernel-depends-on-toyos-fat32-and-uses-none-of-it | partly stale | dependency removed by 13ed7b4f4 (git grep fat32 -- kernel empty; Cargo.lock kernel has none); residual: three comments lib/fat32/Cargo.toml:2, build/fatformat.rs:5, build/image.rs:578 |
| the-kernel-has-no-stack-protector | still-valid | no stack-protector flag in build/.cargo/kernel |
| the-kernel-heap-has-none-of-slubs-hardening | still-valid | kernel/Cargo.toml:500 dlmalloc 0.2 |
| the-kernel-resolves-a-path-by-rules-of-its-own | partly stale | resolve_for_open_depth now resolve_for_open (kernel/src/vfs.rs:435); rules and pins stand (sdk/libc/arch/src/path_resolution.rs:100,117,125) |
| the-kernel-runs-without-a-shadow-stack | still-valid | no CET setup |
| the-kernel-runs-without-indirect-branch-tracking | still-valid | no ENDBR_EN |
| the-kernels-generator-is-keyed-once-and-never-reseeded | still-valid | kernel/src/random.rs:11 "Nothing reseeds" |
| the-loader-says-it-boots-its-kernel-on-a-pass-that-hands-the-machine-back | partly stale | blackbox.rs:150 phrase and main.rs:229 hand-back stand; blackbox_foreign_record is now a metal row (tests/toyos.rs:975) asserting FOREIGN_DONE, and tests/checks.rs:1181 host check holds the full phrase |
| the-loaders-lines-carry-no-time-on-an-x86-cpu-that-states-no-tsc-rate | still-valid | loader/src/main.rs:832; tests/toyos.rs:314 |
| the-machine-stops-without-saying-which-thread-took-the-time | still-valid | lib/quiesce/src/lib.rs:101 record counts, names none |
| the-memory-map-buffer-is-the-unreported-pointer | superseded (fold, delete) | framebuffer now inside the boot map's scanout regions (lib/bootmap/src/lib.rs:22,131-143); margin is MAP_MARGIN 64 (loader/src/main.rs:58), not +8; the memory-map report is already the exit of the-boot-map-reaches-4-gib..., which receives the T14 reading owed |
| the-nmi-entry-can-hand-the-lockup-sample-cs-for-rflags-and-no-test-reds | still-valid | kernel/src/arch/x86_64/idt/nmi.rs:45-47; hardlockup/mod.rs:267 |
| the-panel-seeds-the-loaders-own-file-so-the-gcd-map-is-logged-nowhere | partly stale (renamed) | console now seeds from logkeeper's served stream (system/console/src/main.rs:197,441), not /log's *.log files; screen_console_shell gone; residual: loader/src/gcd.rs:142-160 logs only free MMIO ranges |
| the-perf-state-declaration-refuses-hybrid-intel-and-amd-cppc | still-valid | kernel/pure/cpu.rs:115-121 |
| the-pipe-abi-has-no-word-for-an-unreachable-host-or-a-lookup-to-try-again | still-valid | system/netstack/src/serve.rs:202-204,250 |
| the-power-offs-give-back-line-is-in-no-black-box-tail | partly stale | seal_tail before shutdown's settle stands (machine.rs:146-156, power.rs:63-66, acpi_mode.rs:578); kernel xhci::seal_shut deleted (13ed7b4f4) |
| the-program-loader-runs-a-binary-whose-relr-table-it-never-reads | still-valid | lib/elf/src/dynamic.rs:52-80 drops other tags; kernel/src/elf/mod.rs:399 |
| the-readonly-copyout-test-forms-mut-over-pages-nothing-may-write | partly stale | abuse_readonly_copyout.rs:67,84 stand; tls_dtv_race deleted by 520c0d129 |
| the-reset-word-is-spelled-twice | partly stale (line cites) | kernel/src/syscall/machine.rs:190 and build/bootlog.rs:17 still two literals; line numbers dropped |
| the-running-slots-volume-is-claimable | fixed (delete) | 13ed7b4f4: hold_source gone, kernel/src/device.rs:47-52 Claimed has no partition kind, DeviceType has no partition class; residual is the rejected issues/the-block-service-does-not-refuse-the-running-root.md |
| the-shell-runs-a-command-whose-redirect-it-could-not-open | partly stale | system/shell/src/main.rs:755-770 stands; fs_share.rs deleted by ff1a11dbd; exit no longer demands a guest probe |
| the-shell-says-not-found-for-every-spawn-error | partly stale | shell :548,587,637,672,685 `not found` on Err(_) stands; process_tree.rs now spawns links directly (:294-318), its clause dropped |
| the-smmuv3-and-its-crates-declare-what-the-aarch64-kernel-also-declares | still-valid | exit queries still print matches (kernel/src/arch/aarch64/paging.rs:40-56, kernel/smmu/src/table.rs:29-40,110) |
| the-smmuv3s-global-errors-are-read-and-never-delivered | still-valid | no GERROR_IRQEN; GERROR read only in smmu/mod.rs:91, fault.rs:98 |
| the-so-caches-refusals-are-narrower-than-its-reach | partly stale | vfs.rs:696 BackingId size+mtime, clock.rs:214 mtime 0; cache.rs:156 256 MiB; line cite and the deleted `rtc-dead` machine in exit corrected |
| the-socket2-forks-ownedfd-holds-a-table-key-not-a-handle | fixed (delete) | re-read at a8ea09d20: #978 (a6ab2801b) one descriptor table, sdk/toyos/src/fd.rs; socket2 2aa6b00 (Cargo.lock:3900) installs each socket as an fd object (toyos.rs:337-366) and releases it on last close; std OwnedFd drop calls toyos::fd::close (rust a56b4057 library/std/src/os/fd/owned.rs:243) |
| the-socket2-forks-so-broadcast-setter-does-nothing | partly stale (pin) | 2aa6b00 toyos.rs:648,706 still no-op |
| the-supervisors-claim-of-a-pci-function-the-t14-lacks-holds-preemption-off-for-3-8-ms | superseded (delete) | #926 path change, as the record said; pcidev::claim takes an arrival (kernel/src/pcidev/mod.rs:752); preempt-off windows owned by syscall-preemption-is-incidental's mask_windows exit |
| the-sysroots-core-and-alloc-carry-the-compiler-profiles-debug-assertions | fixed (delete) | 5f732156a: build/sysroot.rs:1137 debug-assertions-std = false; its message records the no-panic proof re-run against the sysroot |
| the-t14-hung-after-rebooting-with-its-i219-faulted | partly stale (one clause) | kernel no longer has xHCI controllers to quiesce (13ed7b4f4); hang unexplained, uncertain |
| the-t14-mouse-may-be-another-defect | partly stale (rewritten) | kernel xHCI gone; usbd configure.rs:111-114 writes ESIT payload, hid.rs:96-98 SET_IDLE, :158-160 names an ending code; no T14 USB-mouse reading under usbd |
| the-t14s-firmware-interrupts-every-cpu-every-2-2-s-under-toyos | still-valid | metal measurements; exit (read at the stop's report) unmet |
| the-t14s-power-button-event-came-up-to-17-s-after-ec-query-0x28 | still-valid | on-demand owner check owed; its "first head whose server runs _REG..." now exists (14241dc96) but the readings are not done |
| the-t14s-superspeed-stick-enumerates-at-high-speed-under-toyos | uncertain | exit already names usbd; no reading under usbd recorded |
| the-t14s-thermal-modes-do-not-move-its-package-power-limits | still-valid | lib/userbound/src/firmware.rs:126-129 PL1/PL2 kernel's; tests/toyos.rs:5898-5904 |
| the-toolchains-memmap2-branch-answers-ok-from-make-exec | still-valid | rust lock memmap2 toyos @87ae85a1; fork origin/toyos src toyos.rs:136 make_exec Ok(()); guest workspace on toyos-0.9.11 |
| the-virtio-drivers-match-only-a-non-transitional-device-id | still-valid | system/netstack/src/main.rs:71-75; images/system.toml:123; virtio_console.rs:23; qemu.rs non-transitional |
| the-wifi-demos-commits-still-resolve-on-origin | uncertain | GitHub-side state not re-read (would need the E15 list and API); left unchanged |
| the-window-protocol-keeps-a-retired-message-type | still-valid | sdk/window/src/lib.rs:75; compositor client.rs:173, session.rs:1216 |
| the-x86-clock-calibrates-against-an-hpet-or-the-boot-panics | still-valid | kernel/src/arch/x86_64/boot.rs:113 |
| thread-exits-completion-post-is-the-second-one | fixed (delete) | fa1e3254d removed TaskHandle::publish_released; Hw::release (hw.rs:356) only finalizes; thread_exit (process.rs:1237-1263) posts once |
| three-kernel-byte-views-still-rest-on-a-hand-layout-claim | still-valid | sdk/abi/src/pci.rs:66,83,114; kernel/src/syscall/device.rs:329; object/ops.rs:463 |
| tlb-shootdown-waits-can-pass-a-munmap-that-does-not-wait | still-valid | kernel/src/arch/x86_64/tlb.rs:223-257 EVERY holds every Asked answer |
| toybox-is-one-row-for-every-applet | partly stale (rewritten) | shipped row receives power connector, syscap roster (images/system.toml:237-240); init -> supervisor declared (system/supervisor/src/main.rs:2378); DECLARED_OVER_GRANTS in endowment_denied.rs:123 |
| toyos-abi-decodes-only-the-roster-header-not-its-entries | partly stale | readers now toybox/src/roster.rs:37-38, rust-tests/src/roster.rs:47, kill_ends_every_wait.rs:240-241, process_tree.rs:371, abuse_thread_name.rs:57; writer machine.rs:311-312 |
| toyos-dns-decodes-what-a-published-crate-decodes | partly stale (name) | system/netstack/dns own reader; netd -> netstack |
| toyos-elides-limit-has-one-user-and-lives-in-a-shared-crate | still-valid | only system/logkeeper/src/origin.rs:27 uses limit |
| toyos-has-no-c-compiler-inside-it | still-valid | no in-guest C compiler row |
| toyos-poller-is-sync-and-a-watch-moves-the-tail-in-two-steps | still-valid | sdk/toyos/src/poller.rs:205,273-275 |
| toyos-ssh-leaves-its-secrets-in-freed-memory | still-valid | build/ssh/src/kex.rs:149 derive returns [u8;64] |
| toyos-ssh-offers-only-a-classical-key-exchange | partly stale | ML-KEM-768 exists (lib/crypto/src/mlkem.rs, hybrid.rs:26 for_ssh, tests/wycheproof.rs:247 KATs); toyos-ssh kex.rs:30 offers curve25519 alone |
| tsx-stays-as-firmware-left-it | still-valid | no TSX MSR access in kernel |
| two-builds-of-one-llvm-key-differ-in-their-bytes | still-valid | build/llvm.rs:495,522; no two-checkout check |
| two-checkouts-of-one-tree-build-different-guest-bytes | still-valid | no remap-path-prefix/trim-paths in build |
| two-clicks-the-compositor-reads-at-once-are-one-click | partly stale | fold_mouse (desktop/src/input.rs:153) stands; consent_prompt deleted by ff1a11dbd |
| two-processes-started-at-an-entry-point-nothing-had-mapped | uncertain | single CI sighting; unreproduced |
| two-std-maps-still-answer-other-for-a-dead-peer | partly stale (renamed std-net-maps-every-other-syscall-error-to-other) | TcpStream now via toyos::net::stream + stream_refused (connection.rs:63-76,192-195); syscall_err `_ => Other` (:46-49) remains for UdpSocket and listener; process.rs map gone |
| two-submitters-of-one-ring-race-its-last-completion-slot | still-valid | kernel/src/inbox/polls.rs:243-260 room() then complete in separate holds |
| user-pointer-checks-have-no-spectre-v1-fence-and-smap-is-optional | still-valid | control_regs.rs:150 CR4_OPTIONAL includes SMAP; no lfence in user_ptr |
| user-programs-have-no-protection-keys | still-valid | no PKE |
| user-programs-run-without-a-shadow-stack | still-valid | no CET |
| userlands-wall-clock-has-whole-seconds-and-an-mtime-has-nanoseconds | still-valid | sdk/abi/src/syscall.rs:1205; std time.rs:38; libc time.rs:49; clock.rs:214 |
| values-no-document-states-stand-where-another-os-was-their-source | still-valid | fileserver resolve.rs:26; tcp conn.rs:31 |
| virt-claim-lpi-boot-stalled-in-firmware-once-under-load | uncertain | tests/toyos.rs:349; unreproduced |
| volatile-composites-on-mmio-dma-structs | partly stale | one site left: virtio.rs:428 Dma::write of VirtqDesc via mm/dma.rs:126; xHCI Trb discussion removed with the driver |
| vtd-keeps-eime-off-under-an-xapic-and-no-test-reaches-it | still-valid | kernel/src/arch/x86_64/vtd/mod.rs:289-294 |
| watch-window-spins-out-a-hold-its-poster-is-queued-behind | superseded (delete) | dc62efca4 deleted watch::window and the actuator; fact folded into the inbound reference |
| what-is-owed-on-file-size | partly stale | lib/xhci gone (kernel xHCI to usbd 13ed7b4f4); build_child_handles in kernel/src/loader/start.rs:192; soundd path; residual subjects stand (process.rs:1110,1348) |
| whether-a-region-may-be-lent-is-a-runtime-option | partly stale | shm.rs:100-103 ram() still Option-based; HDA left the kernel (#950) |
| x2apic-is-enabled-without-reading-firmwares-opt-out | partly stale | mode chosen by CPUID alone in control_regs.rs:318-327; opt-out only logged vtd/mod.rs:137 |
| x86-64-reads-the-cmos-for-a-wall-clock-the-loader-already-hands-it | still-valid | kernel/src/arch/x86_64/rtc.rs; drivers/acpi.rs:170 |

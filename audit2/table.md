# Audit batch 2, read at db0cf636d16d265ac400ab5f32658ed81f5cd632, rechecked and rebased onto a8ea09d209c514fdcffcdbe58f3c1826e6aa40e9 (after #978, #981)

| record | class | evidence | action |
|---|---|---|---|
| partition-claim-gives-up-reds-beside-other-guests-and-is-green-alone | fixed (already closed) | deleted on main by 13ed7b4f4 (#971) | none |
| scheduler-pass-blocks-in-xhci | fixed (already closed) | deleted on main by 13ed7b4f4 (#971) | none |
| std-calloc-overflow-writes-past-a-fifteen-byte-block | fixed (already closed) | deleted on main by e4e66e52d (#980) | none |
| io-uring-enter-trips-the-one-queue-invariant | partly stale | kernel io_uring and WaitQueue gone (232f69bb6, aaddf38a7); kernel keyboard gone (13ed7b4f4); the assertion is now `kernel/pure/sched/watch.rs:132` "a task waits on at most one watch"; root cause never found | rewrite + rename |
| kernel-functions-return-with-their-used-registers-intact | still-valid | .cargo/config.toml has no zero-call option; rustc fork 11e31a52 options.rs has no zero_call | none |
| kernel-text-is-writable-and-every-kernel-page-executable | partly stale (cite) | still valid: `kernel_leaf` paging.rs:66-67 is P|W|G, no NX, used by `init` paging.rs:1057; cited lines 946-949 now point at debug_global_leaf | correct cite |
| kernel_stack_addr-names-an-offset-not-an-address | superseded | PR #583 merged without the rename (sdk/abi/src/boot.rs:9 still `kernel_stack_addr`); the rename is a step of issues/the-loader-does-only-what-must-precede-the-handover.md:175 | delete |
| kernelslice-outlives-its-allocation | still-valid | region.rs:14 Copy no lifetime; holders elf/cache.rs, elf/mod.rs, process.rs:256 | none |
| libc-accept-writes-its-callers-address-before-it-can-still-fail | still-valid | socket.rs:321-344 fill before alloc_socket, ENOMEM | none |
| libc-answers-einval-for-every-error-it-does-not-name | partly stale | mapping is `errcode::of` (sdk/libc/src/errcode.rs), still `_ => EINVAL`; after #978 libc's own descriptor table answers EMFILE (posix_io.rs `fd_errno`), the kernel handle table's ResourceExhausted still reaches EINVAL | correct site and example |
| libc-answers-epipe-and-raises-no-sigpipe | partly stale | SIGALRM now handled by signal/sigaction (misc.rs:144-160, alarm.rs); Gone->EPIPE is in errcode.rs; SIGPIPE still never raised | correct text |
| libc-close-of-a-socket-ends-the-process | fixed (already closed) | deleted on main by #978 (a6ab2801b): a socket is an `Object::opaque` descriptor in the fd table and `close` releases it (sdk/libc/src/socket.rs:103-129); #978 filed libc-close-of-a-socket-is-unproven-on-a-connected-socket for the guest case | none |
| libc-dl-iterate-phdr-allocates-on-every-walk | still-valid | link.rs:30-52 `answer()` Vec via listing::whole, name Vec | none |
| libc-dlsym-rtld-default-panics-as-unimplemented | still-valid | misc.rs:457 `expect("dlsym: RTLD_DEFAULT not implemented")` | none |
| libc-getaddrinfo-ignores-its-service-and-its-hints | still-valid | socket.rs:743-777 `_service`, `_hints`, port 0, SOCK_STREAM; gai_strerror one text socket.rs:825 | none |
| libc-getsockname-and-getpeername-answer-a-null-buffer-with-success | still-valid | fill_sockaddr socket.rs:133-138 returns on null | none |
| libc-has-no-pread-or-pwrite | still-valid | no pread/pwrite in sdk/libc/src or include; no positional syscall in sdk/abi/src/syscall.rs | none |
| libc-host-tests-take-the-host-c-library-as-their-oracle | partly stale | fparts_differential.rs:8-17 also calls host `round` and `lround`; rest holds | correct list |
| libc-lacks-names-llvm-for-a-toyos-host-calls | still-valid | no shm_open/shm_unlink/scanf/ctime in sdk/libc | none |
| libc-loses-the-kernels-word-on-three-write-paths | partly stale | send's TCP arm answers through `stream_errno` (socket.rs:363-366, 539-549); sendto's UDP `Datagrams::send` socket.rs:170 `map_err(|_| EIO)` and stdio.rs:16-21 `sys_write` with no errno remain | rewrite to two paths, rename |
| libc-munmap-refuses-part-of-a-mapping | partly stale (owner direction) | code holds: posix_io.rs:620-630, kernel vm.rs:193-201; the owner's uncommitted requirements/memory.md (2026-10-21) has the track's refusal of partial unmaps revised, so the "or rule it final, kind: rejected" exit is dropped | drop that alternative |
| libc-printf-ignores-the-h-and-hh-length-modifiers | still-valid | conversion.rs:67 skips h/hh | none |
| libc-reads-a-long-double-as-a-double | still-valid | conversion.rs:73 skips L; tests/toyos.rs:1612 still declines; strtold (arch/x86_64.rs:96) returns st0 widened from strtod, which the parenthetical already allows | none |
| libc-refuses-what-toyos-cannot-yet-answer | partly stale | after #978 `F_DUPFD_CLOEXEC` works, `F_DUPFD` answers the lowest free at or above its floor (sdk/toyos/src/fd/table.rs:68-71, 117-119), and `F_GETFD`/`F_SETFD` of an unheld descriptor answer `EBADF` (sdk/libc/src/posix_io.rs:472-481); record locks and F_GETFL/F_SETFL/F_GETOWN/F_SETOWN remain; every other name still in refused.rs | trim the fcntl bullet |
| libcxx-takes-the-generic-locale-path-on-toyos | still-valid | llvm-project at b7420fe5 (rust 11e31a52's src/llvm-project) has no support/toyos.h | none |
| listing-home-answers-not-found-and-its-bound-has-no-guest-test | partly stale | the bound is system/fileserver/src/main.rs:803-805 `Error::LimitExceeded`, not userland/fsd's ResourceExhausted; readdir_bound covers only /tmp; /home's NotFound not re-measured (uncertain half kept) | correct sites |
| log-flush-retry-deadman-arm | superseded | the kernel fsync deadman went with the durability ledger (80a1f1ceb; ops.rs:648-655 fsync owes nothing); kernel USB went (13ed7b4f4); test deleted 9ebf080e8 | delete |
| log-reserve-window-negative-times-out-beside-other-guests | uncertain | test and actuators deleted (9ee7a7573, 4db54ffa5, 3b8102cf5); an early-boot hang with no mechanism, never re-measured | none |
| logkeeper-ends-the-boots-log-on-one-refused-create-and-nothing-durable-says-so | partly stale | defect holds: system/logkeeper/src/store.rs:202-207 one `create` error -> None, no retry; logd/`userland/logd` and `policy::fate` gone (system/logkeeper/src/main.rs:612-645: any refused append or flush ends the volume); kernel usb-storage gone (13ed7b4f4) | correct "what is known" |
| logkeeper-flushes-the-records-its-own-refused-flush-made | partly stale (residual uncertain) | the four records were the kernel's fsync retry and kernel usb-storage, both gone (80a1f1ceb, 13ed7b4f4); logkeeper now ends its volume on a refused flush (main.rs:625-632) and no server retries a flush; whether any current flush makes records that re-trigger a flush is unmeasured | rewrite to the residual |
| map-mmio-takes-an-address-past-the-direct-map-window | partly stale | map_mmio still unbounded (paging.rs:710-719, 925); DMAR/IVRS base bound is `iommu_unit::register_window` (iommu_unit.rs:35,78-83), `vtd::window`/`pcidev::probe_dword` gone; ECAM windows now checked against DIRECT_MAP_WINDOW (drivers/acpi.rs:139-142) | correct sites |
| metal-device-probe-usbread-answered-iofailed-once-beside-other-guests | superseded | one sighting with no mechanism through the kernel's usb-storage, which is gone (13ed7b4f4: usbd drives xHCI); the test was deleted (24aa31815) | delete |
| metal-job-reboot-drained-no-kernel-output-beside-other-guests | uncertain | test deleted (99ee9625d); no mechanism found | none |
| metalprobes-usb-read-is-answered-from-fileservers-cache | partly stale | still holds: tests/guest/metalprobe/src/usb.rs:87-108 reads back a file it just wrote; cache is system/fileserver/src/cache.rs CLEAN_LIMIT, not userland/fsd | correct paths |
| mio-deregister-fd-leaves-a-pending-poll-live | partly stale | still holds at mio 9f34d36c (Cargo.lock after #978): `deregister_handle` (selector.rs:247-251) only drops the registration; drain loop (:205-) matches by token alone; text named deregister_fd, POLL_ADD, CQE, pin e8068c2 | correct names and pin |
| most-t14-leases-land-one-dhcp-retry-late | partly stale | netd/smoltcp gone, netstack runs toyos-dhcp; netstack logs no DISCOVER or OFFER (no such log in system/netstack); the exit still names netd | correct to netstack |
| mutual-kill-panicked-on-the-t14-with-stdio-slot-1-not-a-log-ring | still-valid | sdk/toyos/src/log/stdio.rs:208-210, 277 unchanged; no cause recorded | none (main masked its home path in 58e5b4a2c) |
| n2-does-not-compile-for-toyos | still-valid | build/n2.rs:17 still pins b1fead52 | none |
| netstack-drives-one-card | still-valid | system/netstack/src/main.rs:71, 316 first match | none |
| netstack-ends-for-the-boot-on-a-nic-it-cannot-drive-on | still-valid | card.rs:74, virtio_net.rs:89 panic; system.toml restart only on other rows | none |
| netstack-holds-a-pending-request-for-a-client-that-left | partly stale | the connect half is gone: a stream's connection is watched from the connect for its hang-up (serve.rs:11-15, 739-741); `Sockets::receiving` (serve.rs:124) is still unwatched; `Sockets::connecting` no longer exists | keep the receive half |
| netstack-keeps-receiving-for-a-client-that-closed-its-receive-end | partly stale | streams are a lent region, no receive pipe; `shutdown_read` only sets the client's own `read_shut` (sdk/toyos/src/net/stream.rs:465-470), so netstack keeps receiving into the ring and the peer is not told; cited test is now `a_client_that_leaves_with_text_unread_resets` | rewrite to current shape |
| netstack-lookup-slots-have-no-per-client-share | partly stale | MAX_LOOKUPS is system/netstack/dns/src/lib.rs:77, global; connections now carry a row/session badge (serve.rs:26-29), but sessions are multipliable; "netd" | correct |
| netstack-refused-accept-hung-waiting-for-a-wake-that-never-came | superseded | netd and its listen.rs gone (netstack replaced it), test deleted 7967fba91, `netcase_against_host` gone from tests/ | delete |
| netstack-replaces-one-programs-cached-answers-to-keep-anothers | still-valid | dns/src/lib.rs:92, 926; test dns/src/tests.rs:1496 | none |
| netstack-resolver-asks-a-dead-primary-first-on-every-lookup | still-valid | Lookup::start dns/src/lib.rs:663-680 starts every server at `now`, no history across lookups | none |
| netstack-socket-ids-are-ambient | partly stale | streams are no longer named by a number (serve.rs:11-15); listener and datagram ids (serve.rs:298-310, 429-492) still checked only against the table; netd -> netstack | correct scope |
| netstack-watches-both-pipes-of-every-connection-on-every-pass | fixed | c91e72b83 (2026-10-11) gave a pipe end's leaving its own watch (kernel/src/pipe.rs:126-129, "a byte moved through the pipe wakes no poll that asked about a leaving") and made netstack submit only a changed or answered watch (system/netstack/src/watches.rs `Armed`, host-tested at :97, :105); both exit clauses met; the commit named the record but did not delete it | delete |
| netstacks-places-are-one-number-for-every-client | partly stale (cite) | guest `netstack_socket_churn` cut (c6a2861e8); host tests listeners.rs:613,633,797 hold | drop guest cite |
| netstacks-receiver-round-trip-reads-no-finer-than-a-millisecond | still-valid | shard/tcp/src/rx.rs:39 one tick | none |
| no-claim-gets-an-address-space-under-virtio-iommu | still-valid | no virtio-iommu in kernel/src; pcidev/mod.rs:652,660 | none |
| no-console-between-boot-and-terminal | partly stale (names/cites) | holds: panic_console/mod.rs:730 returns once SCREEN_OWNED_BY_USERLAND; glyph_char mod.rs:1171-1177; logd is logkeeper, test `every_boot_config_runs_logkeeper` (build/build.rs:3005); screen_diag_boot's record deleted, so its pointer now names the deleting commit | correct names, cites, inbound ref |
| no-entry-or-switch-clears-the-bhb-fills-the-rsb-or-issues-an-ibpb | still-valid | no IBPB/PRED_CMD/BHB/RSB in kernel/src | none |
| no-guest-case-reads-std-filesystem | still-valid | no C++ guest using std::filesystem or ifstream under tests/ | none |
| no-kernel-address-is-drawn-per-boot | still-valid | mm/mod.rs:33 constant PHYS_OFFSET; no randomization in kernel or loader | none |
| no-physical-memory-fairness | owner-held | uncommitted owner edit in primary checkout | untouched |
| no-program-runs-with-speculative-store-bypass-disabled | still-valid | no SSBD/SPEC_CTRL in kernel/src | none |
| no-rule-decides-l1tf-mitigation-for-an-affected-intel-cpu | still-valid | no L1TF decision in kernel/src | none |
| no-test-runs-the-shipped-trace-reader | still-valid | system/trace has no test; only tests/guest/rust-tests/src/bin/trace_read.rs | none |
| no-user-address-is-drawn-per-spawn | still-valid | loader/mod.rs:49 USER_VM_BASE, vma.rs:14 STACK_BASE constants (lines drifted by one) | none |
| no-watchdog-arms-on-an-amd-machine | still-valid | kernel/src/arch/x86_64/watchdog.rs has no AMD arm | none |
| nothing-launches-a-script-by-its-interpreter-line | still-valid | no `#!` handling in kernel, system or sdk | none |
| nothing-reclaims-what-a-stop-leaves-on-a-fat-volume | still-valid | lib/fat32/src/repair.rs; test refused_writes.rs:618 | none |
| null-sink-applies-one-connect | uncertain (annotated) | never explained; every component it names has been replaced: soundd is soundserver with its own null-sink thread (system/soundserver/src/main.rs:56-68, 87f0b2aa0, aa7767b5f), the kernel's io_uring and PIPES waits are gone (232f69bb6), tests/desktopaudiocase and null_sink_shipped_client deleted (520c0d129); not re-seen | add a current-state note, keep open |
| one-checkout-of-one-tree-builds-two-kernels | still-valid (not re-measured) | [profile.toyos] still inherits dev (Cargo.toml:344-352), no gate compares builds | none |
| one-diskserver-session-can-hold-every-device-slot | partly stale | blockd gone; the pull is `toyos_blockserve::Sessions::pull` (lib/blockserve/src/sessions.rs:212-226), run by each disk driver (system/nvme); still only the ring's DEPTH bound | correct site |
| one-mapping-is-written-in-two-ledgers | still-valid | vm.rs:193-208 mmap_regions plus free_and_unmap; owner's uncommitted memory checkpoint lists it to reconcile, not decided | none |
| one-program-that-fills-a-servers-table-holds-every-other-client-out | still-valid | lines pinned at 1a7464692; fileserver's share now in bounds.rs:43-66, soundserver MAX_CONTROL_CLIENTS and surface MAX_CLIENTS=4 unchanged | none |
| one-write-far-past-a-files-end-holds-data-s-server | partly stale (names) | still holds: lib/bcachefs/src/fs.rs:1032 resolve_or_alloc_block, fileserver single-threaded (main.rs:26-30), no gap bound in bounds.rs; "fsd" is fileserver | rename fsd |
| os-toyos-io-traits-keep-a-posix-name | superseded | #978 (a6ab2801b, fd-design revision 8) makes a `RawFd` a number in the process's one descriptor table, as on unix, and gives the kernel handle its own word, `std::os::toyos::io::AsRawHandle` (sdk/std/os/io.rs:1-35); the traits now name what POSIX names | delete |
| pci-is-enumerated-on-segment-group-0-alone | still-valid | lib/acpi/src/mcfg.rs:36, 64-65 | none |
| per-cpu-scheduler-and-pmm-state-shares-lines-every-cpu-writes | still-valid | pmm.rs:249-279, user_ptr.rs:305-309, CpuHandle unpadded cpu.rs:2213, Frontier fair.rs:29-45 (line cites drifted, names hold) | none |
| physical-memory-past-64-gib-panics-the-boot | still-valid | pmm.rs:36-37 MAX_PAGES, :118 assert | none |
| probe-mounts-on-a-checksum | partly stale (paths) | still holds: system/fileserver/src/data.rs:211-229 mounts first; superblock.rs:236-262 backup fallback; guest arm `volume_from_another_disk` gone | correct paths |
| process-start-skew-on-a-runner | uncertain | a CI-runner reading never re-measured; scheduler balance changed since | none |
| process-stats-exits-101-beside-other-guests | superseded | both recorded reds are the test's own premise (a park it could not attribute to the connection); test deleted 4a5b228d2, and the first red carried no text | delete |
| pulling-the-boot-stick-freezes-the-t14 | uncertain | already annotated "Since usbd" (13ed7b4f4): kernel holds no USB lock; whether the T14 still freezes is unmeasured | none |
| remove-all-follows-a-link-swapped-in-mid-walk | still-valid | build/libcxx.rs:47 flag; no openat/fdopendir/unlinkat in sdk/libc | none |
| remove-dir-all-empties-a-directory-and-leaves-it | partly stale | std fixed: sdk/std/sys/fs.rs:848-859 ends with `rmdir(path)` (in 3831f291b); residual: system/pkg/src/main.rs:201-204 keeps `remove_tree` with a doc comment giving this defect as its reason (its other reason, an explicit stack, stands) | rewrite to residual |
| rust-and-c-objects-carry-two-triples | still-valid | fork 11e31a52 targets/{x86_64,aarch64}_unknown_toyos.rs:10 `*-unknown-none-elf` | none |
| rustc-llvm-cannot-build-for-a-toyos-host | still-valid | fork 11e31a52 compiler/rustc_llvm/build.rs has no toyos arm (stdc++ default at :508) | none |
| screen-diag-boot-leaves-no-i8042-line-on-the-panel | superseded | the kernel's i8042 and its health line left for ps2server (febfd21e8); test deleted 8bf3fc24d | delete; fix ref in no-console-between-boot-and-terminal |
| screen-panic-muted-reads-the-panel-before-the-report-has-reached-its-armed-line | still-valid | tests/toyos.rs:3430 one `screendump_until("PANIC:")` then asserts the armed line | none |
| servers-let-a-client-go-on-the-handshake-limit-with-its-request-unread | still-valid | lines pinned at 1a7464692; the same eight files declare HANDSHAKE_TIMEOUT today | none |
| sharedmemory-slices-rest-on-a-size-nobody-checks | partly stale | a peer's region now maps through `lent`, which judges its size against fstat (sdk/toyos/src/shm.rs:55-62); `adopt` (:46-53) is still safe with an unchecked size, held only by its doc; aliasing premise unchanged | correct first bullet |
| shell-c-discards-the-cwd-its-launch-carried | fixed | system/shell/src/main.rs:25-29 runs `-c` with no set_current_dir (b3770cf6d); the exit's guest probe is not owed for what inspection establishes | delete |
| slint-and-egui-are-not-supported-by-the-owners-choice | still-valid | nothing in the tree builds slint or egui | none |
| smp-ap-hole-and-log-reserve-window-red-under-a-loaded-host | partly stale | the root-read half is gone: the kernel reads ROOT only from the loader's in-memory image (kernel/src/rootfs.rs:1-12) and drives no USB (13ed7b4f4); the spawn half stands under a new name, `spawn_supervisor` panics on any refusal (kernel/src/loader/mod.rs:487); tests deleted | keep the spawn half |
| so-cache-refusals-saw-the-kernel-refuse-nothing-once | uncertain | one CI sighting, no mechanism; the budget check is kernel/src/elf/cache.rs:233-242; test and `so-cache-tiny` gone | none |
| softbuffer-reads-a-toyos-window-behind-its-lock | still-valid | softbuffer b36854df src/backends/toyos.rs:31 derefs the handle unlocked | none |
| soundserver-past-due-wake-max-1 | partly stale | the device wait's `armed` now arms the next future grid point when past due (system/soundserver/src/mix.rs:185-192); the null sink's wait keeps `.saturating_sub(now).max(1)` (:765); userland/soundd paths gone | narrow to the null sink |
| spawn-thread-disagrees-about-a-reaped-parent | still-valid | process.rs:914-915 panic vs :955 `admit_thread_insert` -> None | none |
| spawned-process-never-starts | uncertain | investigation record; cause of a CPU going quiet never found | none |
| spec-ctrl-and-gds-stay-as-firmware-left-them | still-valid | no IA32_SPEC_CTRL / MCU_OPT_CTRL access in kernel/src | none |
| sshserver-authorized-keys-unprotected | partly stale | keys are /state/sshserver (sshserver main.rs:28-45); installed packages no longer see /state (lib/manifest/src/lib.rs:305-318), every shipped row still sees the whole tree | narrow the claim |
| sshserver-holds-one-channel-and-does-not-say-so | partly stale (paths) | still holds at system/sshserver/src/main.rs:157-172, 478; `userland/sshd` named | correct path |
| sshserver-reports-a-killed-program-as-exit-lost | still-valid | main.rs:57, 443-472 | none |
| sshserver-still-speaks-rsa | partly stale (path) | system/sshserver/Cargo.toml:9 `rsa`; Cargo.lock:3356 | correct path |
| stats-does-not-resolve-the-command-its-user-typed | still-valid | system/toybox/src/stats.rs:12 | none |
| std-and-libc-allocate-under-a-spinlock-with-no-futex | still-valid | sdk/std/sys/alloc.rs:56-70 spin; sdk/libc/src/lib.rs spin; #980 made malloc.rs the one C allocator over whichever heap, as the record already says | none |
| std-and-libc-drop-the-answer-thread-join-gives | still-valid | sdk/std/sys/thread.rs:56-58; pthread.rs:84 | none |
| std-answers-every-spawn-refusal-but-notfound-as-other | fixed | sdk/std/sys/process.rs:406-417 maps each `toyos::spawn::Refused` (Invalid -> InvalidInput) and every `SyscallError` through `to_io_error` (sdk/std/sys/pal/mod.rs:23-37), since 61a283a40; the cited spawn_cwd test is gone and the exit's assertion is a match inspection establishes | delete |
| std-calls-undated-what-it-did-not-stat | partly stale | mtime half fixed: DirEntry::metadata is lstat (sdk/std/sys/fs.rs:239-241), FileAttr carries the server's/kernel's mtime (:140-158); set_times half holds (:695-697, :943-949 answer Ok) | rewrite to the set_times half, rename |
| std-file-lock-answers-ok-and-locks-nothing | still-valid | sdk/std/sys/fs.rs:560-574 | none |
| std-leaks-a-thread-stack-per-spawn | still-valid | sdk/std/sys/thread.rs:9-55 Thread holds only a tid | none |
| std-lookup-host-answers-no-address-as-other | partly stale | still `Other` "DNS lookup failed: no results" (connection.rs:671), but `net_err_to_io` now names eight kinds (:17-29); netd is netstack; `dns_resolve`/`DNS_NO_ADDRESS` no longer in tests/ | correct names, drop the gone test from the exit |
| std-maps-a-device-error-to-other-not-uncategorized | partly stale | `Io => Other` holds (sdk/std/sys/pal/mod.rs:33); every load-bearing consumer it names is gone (logd policy.rs, tests/common/volumes.rs; no `ErrorKind::Other` in system/), so the reason it was kept no longer applies | rewrite to the std arm alone |
| std-names-its-toyos-backend-by-a-path-out-of-the-fork | still-valid | 14 arms in fork 11e31a52 library/std/src; sdk/std/os/ffi.rs:5, sys/pal/mod.rs:7 | none |
| std-reads-a-query-modules-byte-count-as-a-module-count | still-valid | sdk/std/sys/pal/mod.rs:135-155 reads `count` records | none |
| std-says-a-launch-moves-its-handles-to-the-launcher-even-when-the-move-is-refused | partly stale | std's launch handling moved to `toyos::spawn::Spawn::ask_launcher` (sdk/toyos/src/spawn.rs:197-268, 61a283a40), whose prose is right; `CommandExt::provide` (sdk/std/os/process.rs:41-43) still points at `endow`'s "after a successful spawn" (:25); #978 touches the file | keep the provide half |
| std-says-this-machine-has-one-cpu | still-valid | sdk/std/sys/thread.rs available_parallelism NonZero 1 | none |
| std-udp-socket-ignores-its-timeouts | still-valid | connection.rs recv_from/send_to ignore read/write_timeout_ms | none |
| stdio-buffering-saw-one-long-line-arrive-as-two | uncertain | one sighting, test deleted 2dfe1008e | none |
| stds-toyos-backend-keeps-assembly-outside-an-architecture-module | still-valid | sdk/std/sys/pal/mod.rs:49-67 naked `_start` under target_arch | none |
| stds-toyos-files-carry-lines-rustfmt-would-rewrap | uncertain | measured at fork a0d44493347; not re-run (needs the stage0 nightly rustfmt) | none |
| steal-probe-node-dies-with-its-victim | still-valid | kernel/loom feature victim-retires-mid-probe (Cargo.toml:250) and the single node cpu.rs:251 | none |
| stop-the-device-voice-keep-the-wake | still-valid | soundserver stops the device only with no stream (system/soundserver/src/mix.rs:655-662), so a connected silent client keeps it open | none |

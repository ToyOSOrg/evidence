# S0-a metal A/B, round 6: the rules, set before any boot (2026-11-05)

Round 5 failed rule 1 on AMD (`pipe.throughput.1024` moved worse by 1.3%) and left AMD's IPC hot rows
unclean. Since then:
- **Found and fixed:** a holder's paged read copied each frame into fresh memory through the user
  mapping, so every destination page took a fault exception. That was the large spawn's cost (KVM:
  8193 copy faults and 8.2 ms of copying per spawn against main's 4.7 ms). The chunk is now faulted
  in first: 378cea3a7.
- **KVM, on the guest runner:** `proc.spawn_wait.large` went from +37% to +9% against main, and
  `thread.spawn_join` is back inside main's range (r10).

Images:
- **base** = `s0a-r10-base-kvm` 49496f0a3: main e11b6a784 + the probe;
- **head** = `s0a-r10-fin-kvm` 2730ee698: PR head 378cea3a7 + the probe;
- **diag** (T14 only) = `s0a-r10-finsdk-kvm` 5860cc9a6: head with `sdk/toyos/src/sync.rs` as main's,
  for the malloc-churn question below; a measurement, never a verdict on #1150;
- **testcases** = PR head 378cea3a7, no probe.

Both measurement commits are identical in base, head and diag. Their row tweak changes only a QEMU
row and nothing in a metal image. Every benchcase boot runs main's whole `benchcase.toml`. Each value
is a row's p50 from its boot's osbench output.

## Order of boots
- **AMD:** eight benchcase boots as four adjacent pairs, the order alternating so drift falls on both
  arms: 1-base 2-head | 3-head 4-base | 5-base 6-head | 7-head 8-base. Then 9-testcases.
- **T14:** 1-base 2-head 3-head 4-base, 5-diag 6-diag, then 7-testcases.

## Rule 1, hot rows: `pipe.throughput.64`..`4096`, `ipc.reqrep.8`, `ipc.reqrep.4096`, `ipc.reqrep_handle.8`
- **AMD, judged by pair:** a pair is two adjacent boots, so it shares the machine's state (round 5's
  boots 3 and 4 both ran IPC slow). For each hot row and pair, head is BETTER or WORSE than its own
  pair's base. A hot row is a REGRESSION, blocking landing, when head is worse in all four pairs, by
  any amount. It MOVED better when head is better in all four. Anything else is UNCHANGED, and the
  four per-pair ratios are reported.
- **T14, round 5's rule:** a hot row moved when both head values lie outside both base values, on
  the same side. Moved worse by any amount is a REGRESSION.
- **Other `pipe.throughput.*` and `ipc.*` rows:** the same judgement. Worse past 5% of base's mean is a
  REGRESSION.

## Rule 2, other rows
Any other row worse past 5% is REPORTED, with whether its work crosses a user copy and the probe's
numbers for it. It is not by itself a verdict. These rows are named here because round 5 reported
them:
- `proc.spawn_wait.large`: expected still worse on both benches, by less. The KVM residual is about
  85 ns per 4 KiB page written, possibly the TLB fill of writing each page through the user mapping;
  a metal value is what tells.
- `thread.spawn_join.*`: on the T14 it ran at 3791 MHz on head against 4189 MHz on base, after a
  longer spawn phase. Each value is reported with its row's `mhz`.
- `mem.malloc_churn.*`: T14 only, KVM shows no difference. If diag matches base and head does not,
  the cause is the SDK change's place in the binary, and that is reported. If diag matches head, it is
  not.
- `persist.fsync_clean`, `wake.storm.call.w1`, `time.sleep_late.1us` and `tail.stolen.10s`: reported.

## Rule 3, the probe
Each arm's mean ns per call for `SYS_READ`, `SYS_WRITE`, `SYS_MESSAGE_SEND` (133),
`SYS_MESSAGE_RECV` (159) and `SYS_PAGED_READ` (156) in the osbench processes, as evidence.

## Rule 4, testcases
Members: round 5's fifteen (messages_are_whole, blocking_read_stress, pipe_other_end_gone,
poll_wake_pipe, std_io, std_process, ends_sent_over_each_other_both_end, kill_ends_every_wait,
mio_waker_coalesces, query_modules_size, user_copy_faults, std_fs, std_fs_write, lseek_past_eof,
file_mtime). Added for the paged read this round changes:
- a_served_file_reads_through_its_paged_object;
- a_served_files_read_never_tears_against_its_write;
- a_pager_s_end_answers_its_waiting_holders_gone;
- a_held_files_fstat_is_its_servers_stat.

These four run under QEMU only in the nightly suite. Every member exits 0, judged by re-running the staging command with the readback in place. The log
holds no "user_ptr: a user copy" panic and no kernel panic.

## Rule 5, validity
A boot marked INVL, or whose image hash differs from `image-sha256.txt`, is not a value. It is rerun
once, and the rerun is recorded.

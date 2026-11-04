# S0-a metal A/B, round 5 (user copies through the user mapping): the rules, set before any boot (2026-11-04)

Images:
- **base** = `s0a-ab5-base` 62e7c7144: main a0e8f1333 with the probe;
- **head** = `s0a-ab5-head` 3ff1584a2: the PR head e23d11219 with the probe;
- **testcases** = the PR head e23d11219, without the probe.

The probe prints each syscall number's mean wall time per call in the exit lines.
In both benchcase arms, `benchcase.toml` runs only `osbench_boot`, `osbench_identity`,
`osbench_system` and `osbench_ipc` (orchestrator, 2026-11-04). Both arms are main-based
images and the benches' DATA is now #1152's native format, so no row may read DATA.
These are measurement-only commits, the same in both arms.

The testcases boot's members are messages_are_whole, blocking_read_stress,
pipe_other_end_gone, poll_wake_pipe, std_io, std_process,
ends_sent_over_each_other_both_end, kill_ends_every_wait, mio_waker_coalesces,
query_modules_size and user_copy_faults. round 4's `/home`-backed members (std_fs,
std_fs_write, lseek_past_eof, file_mtime) are left out for the DATA reason.

Benches: the AMD bench, and the T14 once DATA is restored. Order per bench: base, head,
base, head (benchcase, the `osbench` row), then testcases. Each value is the row's p50
from its boot's osbench output.

1. **Rows judged** (the owner's ruling of 2026-11-04):
   - The hot rows are `pipe.throughput.64`..`4096`, `ipc.reqrep.8`, `ipc.reqrep.4096` and
     `ipc.reqrep_handle.8`. A row has MOVED when both head values lie outside the range
     of both base values, on the same side.
   - A hot row that MOVED worse, by any amount, is a REGRESSION and blocks landing.
   - Any other `pipe.throughput.*` or `ipc.*` row that MOVED worse past 5% of base's mean
     is a REGRESSION.
2. **Expected, from the KVM A/B on the i7-8700K** (`r8/`): every hot row unchanged or
   better, and `pipe.throughput.16384`/`65536` and `ipc.reqrep.65536` better. A hot row
   that is neither moved nor clean (one boot in AMD's slow mode, as in rounds 2-4) is
   reported as such, and is not a pass.
3. **The probe:** for the pipe benchmark's process and the two `osbench_ipc` processes,
   each arm's mean ns per call for `SYS_READ`, `SYS_WRITE`, `SYS_MESSAGE_SEND` (133)
   and `SYS_MESSAGE_RECV` (159). It is evidence, not a verdict.
4. **The gate and the copies on hardware:** in the testcases boot every listed member
   exits 0, `user_copy_faults` included. The boot log holds no "user_ptr: a user copy at
   preemption depth" panic and no kernel panic.
5. A boot that is invalid (marked INVL, or whose image hash differs from
   `image-sha256.txt`) is not a value. It is rerun once, and the rerun is recorded.

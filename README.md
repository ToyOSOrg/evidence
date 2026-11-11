# ToyOS PR 1238: a spawn's path is one line, and no judge finds a child by it

Head 9f94ce818 is cafb947fd rebased onto main b56693152. The rebase took only
`issues/` commits, so `git diff cafb947fd 9f94ce818 -- . ':!issues'` is empty
and a result at cafb947fd holds for the head's code. Logs are masked (paths,
user, host, CPU model). Each exit code is the command's own.

## host-targeted/ (9f94ce818)

`targeted.sh` ran both commands; each log starts with its revision and command
and ends with its exit code.

- `toyos-abi.log`: `cargo test -p toyos-abi`, exit 0. 50 unit tests plus 4
  more pass, `a_spawn_path_is_one_bounded_line` among them.
- `bootlog.log`: `cargo test --lib bootlog` in the build system, exit 0, 16
  passed. The run includes `a_spawns_pid_is_read_from_the_records_head` and
  `the_kernel_writes_the_records_the_host_reads`.

## host-full/ (cafb947fd)

`ci-host.log` is `cargo run -- --ci host`, exit 1, with 108 of 110 steps
green. The green steps include the harness's own checks, the kernel's library,
clippy with warnings denied and the kernel's models. Two steps were red:

- The build system: `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`
  failed. It is the known macOS failure recorded in the ToyOS issue
  `the-llvm-environment-test-breaks-git-on-macos`. The bootlog tests pass in
  the same step.
- The workspace's host members: files vanished from `target/debug` under a
  concurrent build in the same target directory, so it did not compile. The
  `toyos-abi` tests it owes are in `host-targeted/`.

## controls/ (9f94ce818)

`spawn-path-keeps-control-characters.patch` drops the control-character test
from `toyos_abi::syscall::spawn_path`. `control.sh` checks that the patch
applies, applies it, builds the tests and runs the claim's test. It then
restores the tree and runs the test again. In the log, the mutated build exits
0. `a_spawn_path_is_one_bounded_line` then fails with exit 101, because the
path `"a\nb"` is taken. After the restore the tree is clean and the test exits 0.

## guest/ (cafb947fd)

Dispatched through `guest-rows.yml`.

- `43031069755-x86_64.log`: `session_lifecycle`, `a_usb_key_reaches_the_console`
  and `a_claim_before_the_declaration_is_refused_at_once`, 3 passed.
- `43030459072-aarch64.log`: `virt_user_mode`, `virt_low_ecam` and
  `virt_first_entry`, 3 passed.

## scan/

The scan asks whether a job's spawn record (the format before this change,
`spawn: /system/bin/<job> pid=`) ever precedes the test runner's
`===TEST_START <job>===`. The test harness's `run_test` used to move such a
record into the test's window.

- Input: the 199 files under the session's agent scratch directories that
  held `===TEST_START ` on 2026-11-11. Most are metal readbacks' `kernel.log`
  from both benches; the rest are harness output and guest-row logs.
- Method: `order.awk`, one pass over all the files.
- Result: `result.txt`. Of 1508 starts, 1503 have the job's spawn record after
  the marker.
- Flagged: `flagged.txt` lists the 2 starts the script calls "before", both
  `osbench_procs` in one branch's T14 and AMD readbacks. The flagged records
  are not the job's own spawn. In each readback, 224 records of
  `/system/bin/osbench_procs` lie between the preceding job's
  `===TEST_START test_rs_spawn_stages===` and its `===TEST_END`, so that job
  spawned them by the same path. The runner's own spawn of `osbench_procs`
  (pid 4720 on one bench, 4718 on the other) is the record 1 ms after the
  marker. So no job's own spawn record precedes its marker.
- Unmatched: `unmatched.awk` lists the 5 starts with no spawn record in
  `unmatched.txt`. One is a job the runner could not find (`did not run`). Four
  are in two kernel-log excerpts, which hold neither the record nor the end of
  the boot.

## metal/ (staged at 9f94ce818, not yet run)

`staging.log` is `cargo test --test toyos-build -- --metal --metal-readback
<dir> abuse_spawn_path_and_name hda_tone hda_tone_resampled
tone_beside_a_log_write claim_reuses_its_remapping_entry
i219_messages_on_its_msi_vector process_tree`. Its compile lines are dropped.
It exits 2, the harness's code for "staged, nothing judged": 6 registrations
and 1 shared member over 2 boots. The two system files hold the boots' job
lists. Readbacks and verdicts are added here when the T14 run returns.

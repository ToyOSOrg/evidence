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

## metal/ (staged at 9f94ce818; its T14 run is in metal-9f94ce818/)

`staging.log` is `cargo test --test toyos-build -- --metal --metal-readback
<dir> abuse_spawn_path_and_name hda_tone hda_tone_resampled
tone_beside_a_log_write claim_reuses_its_remapping_entry
i219_messages_on_its_msi_vector process_tree`. Its compile lines are dropped.
It exits 2, the harness's code for "staged, nothing judged": 6 registrations
and 1 shared member over 2 boots. The two system files hold the boots' job
lists.

## metal-9f94ce818/ (the T14 run of those images)

The orchestrator flashed the two images to the T14 and read back each boot's
log partition. It judged them with the same command from a clean detached
worktree at 9f94ce818 (`judge.log`, exit 1: "6 passed, 1 failed, 2
boot(s)"). Each boot's `kernel.log`, `loader.log`, `boot.txt` and
`verdict.txt` are here. They are masked: host paths, and the machine's vendor,
model and firmware strings.

| row | boot | result |
|---|---|---|
| `abuse_spawn_path_and_name` (shared member) | testcases | pass: 11 refusals, and the 4096-byte path started a child that exited 0 |
| `process_tree` | proctreecase | PASS: `a chain of 62 links stopped at a depth refusal` |
| `hda_tone` | testcases | PASS |
| `hda_tone_resampled` | testcases | PASS |
| `tone_beside_a_log_write` | testcases | PASS |
| `claim_reuses_its_remapping_entry` | testcases | PASS |
| `i219_messages_on_its_msi_vector` | testcases | FAIL: `test_rs_i219_msi exited 1` |

The i219 red is the job's own exit and is not from this change. Its lines
repeat the signature of the ToyOS issue
`i219-msi-passes-only-when-the-network-sends-it-a-frame`: no frame arrived
under traffic, and the MAC saw 0 frames. The change touches no NIC, interrupt
or network code.

`testcases-kernel.log` also shows that the runner's own start lines carry no
`pid=` in their head (0 of 13 do). So the round-2 audio judge, which takes a
start line only without one, opens the same windows on this readback.

# Round 2 (6cdc1d015): the review's fixes

6cdc1d015 is the PR's one commit, carrying the review's fixes, rebased onto
main f79df9574. Main's new commit touches none of the PR's files.
`fixes.diff` is `git diff 9f94ce818 6cdc1d015` limited to the files the fixes
touch. `range-diff.txt` is `git range-diff b56693152..9f94ce818
f79df9574..6cdc1d015`.

## r2/host-targeted/ (6cdc1d015, clean tree)

`targeted.sh` ran each command in order. Each log starts with its revision and
command and ends with its exit code; all exit 0.

- `abi.log`: `cargo test -p toyos-abi`. 50 unit tests plus 4 more pass.
- `sdk.log`: `cargo test -p toyos --lib spawn`. 7 pass, among them the new
  `a_path_label_is_the_path_as_the_kernel_takes_one`.
- `bootlog.log`: `cargo test --lib bootlog`. 16 pass, among them
  `the_writers_write_the_lines_the_host_reads`, whose supervisor needle is now
  derived from `LOGKEEPER_STARTED`.
- `checks.log`: `cargo test --test toyos-checks`. 44 pass, among them
  `metal_audio_judges` with its new planted case.
- `clippy-abi.log`, `clippy-sdk.log`, `clippy-build.log`: clippy with warnings
  denied, in the shapes CI gives each package.

## r2/controls/ (6cdc1d015)

`controls.sh` handles each patch the same way: it checks the patch applies,
applies it and runs the claim's test. It then restores the tree, shows it
clean and runs the test again.

- `sdk-label-keeps-control-characters.patch` keeps every character in
  `path_label`. `a_path_label_is_the_path_as_the_kernel_takes_one` fails with
  exit 101 on `"/tmp/a\nb…"`, and passes after the restore.
- `audio-start-takes-a-jobs-line.patch` drops the `pid=` test from the audio
  judges' start line. `toyos-checks`' `metal_audio_judges` fails with exit 101:
  "a tone after a job's line that reads as its start refused a log it has to
  pass". It passes after the restore.

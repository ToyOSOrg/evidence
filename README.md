# PR 1272: a process's threads have their requests to a directory in flight at once

- `checks/`: the change's tree before its rebase onto #1258's last two commits (`tree.txt`), one log a step ending
  with its exit code (`tags-checks.sh`, `tags-subset.sh`): the SDK's `fs::`, `files::` and `sync::` tests and its
  two clippy shapes; the loom models (`loom-flight.log`, preemption bound 3) and the loom crate's clippy; the default
  and `testcases` images; and, in `summary-7.txt`, osbench's Linux half linted for both architectures.
- `controls/`: each a patch applied, run and restored, at preemption bound 2: the turn not handed on
  (`no-hand-on`), and a reply filed by a plain store (`file-by-store`); both red as a deadlock in
  `each_caller_is_answered_its_own_reply_whoever_receives`. `deadlock-before-swap.log` is that model's first red,
  before the swap, with the futex modelled as a blocking sleep.

## Review round 1 (head ab93cc983)

- `r1/checks/`: the head's tree (`tree.txt`): the SDK's `fs::`, `files::` and `sync::` tests and its two clippy
  shapes; the six loom models (`loom-flight.log`, preemption bound 3, 2 for the slot-reuse and four-thread models)
  and the loom crate's clippy; the default and `testcases` images, which compile ToyOS's libc and std's backend.
- `r1/controls/`: each a patch applied to `flight.rs`, run model by model and restored (`tags-wakes.sh`, at
  preemption bound 2): the filing wake deleted, the leader's hand-on wake deleted and the hand-on of a request given
  back unsent deleted, each red as a deadlock in the models `summary.txt` names; and `fail-ignores-link`, `fail`
  ignoring the connection, red on the fresh-connection model's own assertion. The first round's plain-store control
  is withdrawn: it reds only through loom's partial modification order.

## Review round 2 (head b92c7d2ff, on #1258's merge of main c8095992a)

- `r2/checks/`: the tree before the last model was added (`tree.txt`; that model's test is the only later change):
  the SDK's tests and two clippy shapes, toyos-blockring's tests and clippy (its assertion that the reply bound lies
  past its silence bound), seven loom models, and the loom crate's clippy; `loom-flight-8.log` and
  `clippy-loom-8.log` are all eight models and the loom crate's clippy at the head.
- `r2/controls/`: `turn-per-dir`, round 1's `flight.rs` under the new model in which each connection receives for
  itself, red as a deadlock; then each wake deleted, run model by model (`tags-wakes.sh`, `summary.txt`), each red as
  a deadlock in at least one model, the give's hand-on in the failed-send model; and `fail-ignores-link`, red on the
  fresh-connection model's own assertion.
- `r2/step1-merge/`: #1258's merge of main (c8095992a): the kernel's three clippy shapes, its pure tests, the SDK's
  and the ABI's checks; `engine/` the engine's and file server's tests and clippy after `write_run` regained its
  placement (the file server's clippy findings are main's four).

## Review round 3 (head 04ced8dae, on #1258's 66de9f97b)

- `r3/checks/`: the head's own tree (`tree.txt`): the SDK's tests and two clippy shapes, toyos-blockring's tests and clippy without the assertion,
  the file server's tests (which compile its assertion that the SDK's block bound is blockring's) and clippy (main's
  four findings), nine loom models and the loom crate's clippy.
- `r3/controls/`: each patch run model by model and restored (`tags-wakes.sh`, `summary.txt`): the three wake
  deletions, and the hand-on ignoring its connection, red as a deadlock in `a_turn_handed_on_stays_on_its_connection`
  alone. `flight.rs` is unchanged since round 2, whose turn-per-Dir and fail-ignores-link controls stand.

## Rebased onto #1258's merge of main (a2e4dfdac), head ba7b635ec

- `r4/`: the head's tree: the SDK's tests and clippy, blockring's, nine loom models and the loom crate's clippy, the
  file server's tests and clippy (main's four findings), and the default and `testcases` images, all rc 0 but that
  clippy. The rebase took main's typed received handles (`one` answers a `ReceivedHandle`, which `export` and
  `stream` type) and `adopt` taking a `Connection`.

## Rebased onto #1258's round 8 and main 3c5c55584 (358182128), head 6bf86dd13

- `r5/range-diff.txt`: `git range-diff a2e4dfdac..ba7b635ec 358182128..6bf86dd13`, every commit `=`.
- `r5/`: the head's tree (`tree.txt`, clean): the SDK's tests (214) and two clippy shapes, nine loom models, the file
  server's tests, and the `testcases` image, whose sysroot builds libc's and std's arms from both branches; each log
  ends with rc 0.

## Rebased onto #1258's round 9 (cb8701bee), head 2e7dd79aa

- `r6/range-diff.txt`: `git range-diff 358182128..6bf86dd13 cb8701bee..2e7dd79aa`. Commits 2 to 4 are `=`; the
  first differs only in a context line of `a_served_file_reads_through_its_paged_object.rs`, whose writer binding
  round 9 made `mut`.
- `r6/check-rust-tests.log`: every `tests/guest/rust-tests` binary type-checked for `x86_64-unknown-toyos` at the
  head (`tree.txt`) against the ToyOS sysroot #1258's round-8 image built, with the harness's guest C
  environment: rc 0, no warnings. The host checks of `r5/` stand: the rebase changed no file of this PR's but that
  context line.

## Guest run at 2e7dd79aa

- `r7/run-job.log`: guest-rows 43152649297 at the head 2e7dd79aa: `nvme_disk_boots`,
  `the_data_partition_beside_the_stick_is_designated`, `the_log_lands_on_the_boot_stick`, `virt_user_mode` and
  `testcases_members_exit_0` passed, "testcases: 242 member(s) exited 0, and the list's reboot ended the boot";
  the runner's host name, home and temporary paths masked.

## Rebased onto main ee15a2e5b (#1258 merged, beside #1252), head d88c74fa1

- `r8/range-diff.txt`: `git range-diff cb8701bee..2e7dd79aa origin/main..d88c74fa1`. #1252 made a directory
  capability a connector the process holds (`Dir::connect(BorrowedHandle)`, `Dir::named`) where it had been a name
  in a namespace. The rebase keeps that and this PR's shared connection: `connect` makes the `Dir` and its first
  connection through `connection()`, `reconnect(&self)` connects through the held connector (`PermissionDenied` is
  `NotHeld`, as main has it), the SDK's capability table keeps `Arc<Dir>`, the supervisor's sync and three guest
  tests drop the `mut` their `Dir` no longer needs. Commit 4 is `=`.
- `r8/`: at the head (`tree.txt`): the SDK's tests and two clippy shapes, nine loom models, the file server's
  tests, the `testcases` image (its sysroot, libc and std, the supervisor and pkg compiled without a warning of
  theirs), and every `tests/guest/rust-tests` binary type-checked against that image's sysroot, rc 0.
  `supervisor.log` and `clippy-supervisor-pkg.log` are rc 101 because the supervisor is a ToyOS program that does
  not build for the host (`os::toyos`); the image build is its compile.

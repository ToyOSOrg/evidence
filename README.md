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

- `r3/checks/`: the tree before its commit and rebase onto #1258's round 6 (`tree.txt`; that rebase touches no file
  of this change): the SDK's tests and two clippy shapes, toyos-blockring's tests and clippy without the assertion,
  the file server's tests (which compile its assertion that the SDK's block bound is blockring's) and clippy (main's
  four findings), nine loom models and the loom crate's clippy.
- `r3/controls/`: each patch run model by model and restored (`tags-wakes.sh`, `summary.txt`): the three wake
  deletions, and the hand-on ignoring its connection, red as a deadlock in `a_turn_handed_on_stays_on_its_connection`
  alone. `flight.rs` is unchanged since round 2, whose turn-per-Dir and fail-ignores-link controls stand.

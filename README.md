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

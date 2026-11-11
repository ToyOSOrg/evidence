# PR 1272: a process's threads have their requests to a directory in flight at once

- `checks/`: the change's tree before its rebase onto #1258's last two commits (`tree.txt`), one log a step ending
  with its exit code (`tags-checks.sh`, `tags-subset.sh`): the SDK's `fs::`, `files::` and `sync::` tests and its
  two clippy shapes; the loom models (`loom-flight.log`, preemption bound 3) and the loom crate's clippy; the default
  and `testcases` images; and, in `summary-7.txt`, osbench's Linux half linted for both architectures.
- `controls/`: each a patch applied, run and restored, at preemption bound 2: the turn not handed on
  (`no-hand-on`), and a reply filed by a plain store (`file-by-store`); both red as a deadlock in
  `each_caller_is_answered_its_own_reply_whoever_receives`. `deadlock-before-swap.log` is that model's first red,
  before the swap, with the futex modelled as a blocking sleep.

# ToyOS #1175, round 9: rebased onto main `2c2f957cb`

Masked as round 4's README says. Head `98d66179e`. The rebase kept `issues/a-holders-queued-line-can-reach-the-console-after-the-last-word.md` deleted (its queue is gone; the commit says how #1171's hunk resolves) and fixed one comment the deleted `watch::wait` left stale. `kernel/src/watch.rs` (#1168) and `kernel/src/sched/driver.rs` (#1170) merged without conflict.

| file | command | host | result |
|---|---|---|---|
| `r9-ci-host.log` | `run -- --ci host` | this Mac | exit 0, 108 green |
| `r9-remote-x86.log` | the six console rows | x86 guest host (`qemu-remote.sh`; the guest runner has no runner registered) | exit 0, 6 passed |

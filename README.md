# PR 1258: an open file written and stated through its paged object, against credit

- `host-checks/`: each touched crate's host tests and clippy shapes (`step1-checks.sh`), one log a step ending with
  its exit code; `summary.txt` lists them.
- `controls/`: four negative controls (`step1-controls.py`), each a patch in `patches/` applied, built and run, then
  restored; each log ends with the test's red.
- `host-checks/fileserver-moved.log`: the file server's tests again at ee1f81480, the head that narrows when the
  server answers a file's size and time from its object.

## Review round 1 (head 66702d63e, rebased onto main 45935f4b9)

- `r1/checks-1/`: every step on the round's tree before its last fixes. Four were red: the pure tests' model wanted
  `vec!` in scope, a test asserted the removed short-call set, and the kernel's two targets called a reverted
  `write_abandon`. All fixed, then:
- `r1/checks-2/`: the pure tests (28), the file server's (130 + 3) and the kernel's three clippy shapes, rc 0.
- `r1/checks-3/`: after the rebase onto main (#1234 reworked the descriptor table the SDK calls into): the SDK's
  tests and clippy, the ABI's, and the kernel's two targets, rc 0.
- `r1/controls/`: seven mutations, each applied, built and run, then restored; every one red on its test's
  assertion (f1 the span's overflow at the last pages, f2 the write-back for room, f3 the server's write without the
  hold, f4 a writer overtaking a queued read, s1 two holders' writes at once, s2 an append at the volume's stale end,
  f6 the pager keeping a holder's paid credit). s2's first patch did not build; `summary-s2.txt` is its rerun.

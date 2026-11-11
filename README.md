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

## Review round 2 (fixes a5a4ea522; main merged 16a50e21d; heads 1b46c51e3 and b55f2b5ef)

- `r2/checks-r2/`: every touched crate's tests and clippy shapes on a5a4ea522's tree (B1 to B5, S1), rc 0 but the
  file server's clippy, whose four findings are main's (below).
- `r2/controls-r2/`: six mutations (`step1-r2-controls.py`), each applied, built and run, then restored; every one
  red on its test's assertion: b1 a holder's span unchecked, b1 the SDK passing any offset, b2 a live `stat` while
  the pager holds, b2 the server's stamp after its hold, b3 a long span clamped, s1 a holder taking the side over a
  waiting pager.
- `r2/checks-merge/`: after main's merge (#1233's waits; 68297d7a4's tree, whose kernel, file server and engine
  sources are 16a50e21d's), the pure tests (31), the kernel's three clippy shapes, the file server's and the
  engine's, rc 0.
- `r2/controls-merge/`: a restarted read that does not ask anew, red in main's wait model (`merge-anew.sh`).
- `r2/checks-head/`: 1b46c51e3's tree (a read counts each write it meets once): the pure tests, the kernel's three
  clippy shapes, the SDK's tests and two clippy shapes, rc 0. `r2/checks-head-fileserver/`: the file server's tests
  there.
- `r2/checks-reach/`: b55f2b5ef's tree (a holder's write ends within a served file's largest size): the pure
  tests, the kernel's, SDK's and ABI's tests and clippy shapes, the file server's tests, rc 0; the file server's
  clippy over every target at the head and at main e10b6fd49 (`clippy-fileserver-all*.log`): the same four
  findings at both, in lines the PR does not change. `r2/controls-reach/`: the span checked against the last page
  rather than a holder's reach, red (`reach.sh`).

# #1152 round 13: the two testcases members red at 9fe8f779e

- `members-9fe8f779e-{t14,amd}.txt`: the two members' own lines from the
  coordinator's testcases boots at 9fe8f779e (other log lines left out).
  `test_rs_pipe_other_end_gone`: a watch of OTHER_END_GONE on a memory object
  answered `PermissionDenied`, the test expected `NotSupported`.
  `207_libc_names`: `entry: a another type` where `DT_UNKNOWN` was expected.
- `judge-9fe8f779e-{t14,amd}.txt`: those readbacks judged offline by the
  staging command itself (`cargo test --test toyos-build -- --metal
  --metal-readback <dir> boot:proctreecase boot:testcases`, run again with
  the readbacks in place): both members FAIL there. `verdict.txt` is the
  boot's own verdict (bootlog), by design; members are judged by that
  second invocation. Rows of the other bench fail by bench, as staged with
  `boot:` filters.
- The shared members do not run as filtered QEMU rows (`declared()` holds
  only registered rows; run 41955464726 refused the filter), so no guest
  runner reproduction; the restaged testcases boots at 6fd7151b6 judge the
  fixes.

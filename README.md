# PR 1064 evidence

r1 (revision in r1/ci-host-2.rev):
- ci-host-2.log: `cargo run -- --ci host`, exit=0, 103 steps green.
- m*-*.patch / .log: negative controls for `located`, `Carrying` and
  `adoptable`. Each patch was applied, built and run with
  `cargo test -p toyos-metal --lib`, then reverted. Each one exited 101 at
  the test its log names.
- bench/adhoc-bench.{patch,log}: `located`, `adoptable` and `sd_disks` run
  on the two benches' unprivileged `lsblk --pairs` listings, read by the
  coordinator. The test was a throwaway and is not committed. Exit 0.

r2 (revision in r2/ci-host.rev):
- ci-host.log: `cargo run -- --ci host`, exit=0, 103 steps green.
- m1–m5 rerun on the revised tree. m2, m3 and m5 were regenerated for the
  renamed lines. Each exits 101 at its named test.
- metal-prep.log: the T14 request staged at the head. Exit 2 is the
  harness's report that the readback is still owed.

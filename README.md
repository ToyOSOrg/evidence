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

r3 (revision in r3/ci-host.rev; the narrow sudo rule removed):
- ci-host.log: `cargo run -- --ci host`, exit=0, 103 steps green.
- m1–m5 regenerated at this tree; each exits 101 at its named test.

t14-477c14c21: the coordinator's T14 run with this PR's tool at 477c14c21,
`acpi_server_death`. One boot, 1 passed. The judge log and the boot's
readback, masked. The flashed image and the raw log partition are given by
SHA-256 only.

driver/: `toyos-metal`'s own output, masked.
- t14-477c14c21.log and t14-a73258407.log: the coordinator's T14 runs
  (`t14-run.sh`), both exit 0. Each shows the content-based selection line,
  the stick found again after the boot, and every `sudo -n` line it ran.
- amd-a73258407-summary.txt: the coordinator's summary of the two AMD dry
  runs (image, and `--adopt-scratch /dev/sdb`), both rc=0. Only the
  summary was kept.

r4 (revision in r4/ci-host.rev):
- ci-host.log: exit=0, 103 steps green.
- m6: `admit`'s BOOT count removed; exits 101 at
  an_image_admits_only_a_toyos_table.
- admit-real-image.log: the real staged acpicase image is admitted, and the
  run stops at the ssh step (127.0.0.1, connection refused).

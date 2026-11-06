# #1193 round 4: rebased onto main 0b2dec674 (after #1188 and #1189)

- logs/range-diff.txt: every commit `=` against 83ddb42f4..d080680d2; no
  conflict was resolved.
- logs/ci-host-8.log: `cargo run -- --ci host` at 9b0fe9ca6, 109 steps green
  (the worktree's fork checkout first moved to main's pin, as the build asks).
- logs/build-x86-10.log: the x86-64 image at 9b0fe9ca6, exit 0.
- logs/guest-x86-r4.log: run 42120668541, x86 usbd_drives_the_spare,
  nvme_disk_boots and bar_map_again at 9b0fe9ca6, green.
- logs/guest-arm-r4.log: run 42120673220, aarch64 virt_claim_lpi at 9b0fe9ca6.
  claim_lpi passes (16 messages read as 16 interrupts); the row is red on
  claim_bar_fault: a read into the BAR returned Ok(16), not BadAddress.
- logs/guest-arm-main.log: run 42124293522, the same row at main's own
  0b2dec674 (branch storm-main-check): the same red, the same Ok(16). The red
  is main's, not #1193's.

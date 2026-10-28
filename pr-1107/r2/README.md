# PR 1107, round 2

Host: a Linux x86_64 machine with KVM (paths masked as `/home/<user>`). Each run used a fresh
detached worktree with an empty `target/`. `cargo test --test toyos-build` is the full suite at
the default width.

- `20261028T221436Z-0eb2c09d043d84b5e66bcf229668e041790aa49a.log`: the fix (PR head
  `0eb2c09d043d84b5e66bcf229668e041790aa49a`). Exit 1, 82 of 84 passed.
  - `the_log_lands_on_the_boot_stick` passed in 18 s (5 files and 2547028 bytes of this boot's
    log on the stick).
  - The two reds are `amdvi_selftest` and `amdvi_firmware_left`. Both boots timed out at the same
    second after 63 s, with nothing at all on the console or the UART. They are independent of
    this change: the run below differs from this head only inside `the_log_lands_on_the_boot_stick`'s
    wait, and both tests passed there.
- `20261028T221351Z-7745af98d16b61ddb29001451cfc721920105f27.log`: the control. It keeps the old
  exact-line wait and adds a temporary census of the console during that wait
  (`controls/old-wait-census.patch`, against the PR head). Exit 0, 84 of 84 passed. The census:
  954 lines, of which 952 are `stick_load` lines from 0 to 1516. Lines 902-1466 (565 lines) are
  missing as one contiguous block, 0 lines are partial, there is no `went unshown` report, and line
  1500 was seen. Whole contiguous old lines missing and no partial lines is the signature of
  logkeeper shedding its oldest held console lines, not of bytes dropped in QEMU. logkeeper only
  reports the count once its backlog falls below half, which it had not done yet. Here the gap
  ended before line 1500, so the old wait passed; one that spans it is the recorded stall.
- `ci-host.log`: `cargo run -- --ci host` on macOS at `0eb2c09d0`, exit 0, 105 steps green.

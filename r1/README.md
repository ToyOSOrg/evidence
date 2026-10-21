# ToyOSOrg/ToyOS#973, round 1 (S1: one message carries a frame and its handles)

Head `96d307a12b6751a20afb481826b56b7ede49d670`, tree identical to `e4b868d7d77f38101155880d331fc59b78927d28` (the amend changed only the message), base `e62ebc084`.
Host: macOS on Apple silicon, 14 cores; x86_64 guests under QEMU TCG. Paths masked: `~` is the user's home, `<user>` a personal name, `$TMPDIR` the per-user temp directory, `<checkout key>` the checkout's throwaway signing key.

| file | command | revision | exit |
|---|---|---|---|
| ci-host.log | `cargo run -- --ci host` | e4b868d7d | 0 (87 steps) |
| build-only-x86_64.log | `cargo run -- --build-only` | 7ad43877a + two comment renames, i.e. e4b868d7d's tree less the guest test files, which this build does not contain | 0 |
| build-only-aarch64.log | `cargo run -- --build-only --arch aarch64` | e4b868d7d | 0 |
| guest-qemu.log | `cargo test --test toyos-build -- <12 rows in final-exits.txt's script>` | e4b868d7d | 0 (12/12) |
| mutations/ | `run.sh`: base, then each patch applied with `git apply`, built, `cargo test -p kernel --lib --features sched-check message::`, reverted | 7ad43877a + comment renames (`kernel/pure/message.rs` identical to e4b868d7d) | base 0; window-ignores-pins 101; admit-takes-handles-without-bytes 101; both restored 0 |
| metal/fix-stage.log, fix-request.txt | `cargo test --test toyos-build -- --metal --metal-readback <dir> <11 binaries>` | e4b868d7d's tree | 2 = staged, no machine touched |
| metal/control-*.{log,txt}, release-closes-nothing.patch, stage.sh | the same with `FrameRx::release` closing nothing, applied and reverted in `stage.sh` | e4b868d7d + patch | 2 = staged; restored 0 |

Metal is staged, not run: no verdict about the machine is in this round.

## Metal readbacks (run by the coordinator on the T14, LENOVO 20W0003AMZ, BIOS N34ET71W 1.71)
Text files only (images omitted); a USB stick's serial number masked as `<serial>`.
- `metal-run/fix/`: images staged at tree e4b868d7d. `judge-fx.log`: 11 passed, 0 failed, 3 boots (`testcases`, `shared-debug`, `proctreecase`).
- `metal-run/control/`: the `FrameRx::release` closes-nothing image. `judge-ct.log`: 1 passed (`message_carries_its_handles`), 1 failed: `ends_sent_over_each_other_both_end` exited 101, panicking "two ends sent over each other kept each other open" at the 10 s ceiling (`control/testcases/kernel.log`), as predicted.
- `verdict.txt` in each image directory records the boot's completion; the tests' verdicts are the judge logs.

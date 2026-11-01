# PR #1094 round 3: the scratch cycle judged whole, and Ubuntu's restart as its control

Branch head a995bedf3ca9f5fd5a2a253fa8627ca9f720c003 (one commit on main 190f3b164).
Paths are masked: $WORKTREE is the branch's worktree, $SCRATCH the agent's scratch
directory, $HOME and $TMP the host's.

| file | command | exit |
|---|---|---|
| host/ci-host.log | `cargo run -- --ci host` at efd05be87 (host/ci-host.rev) | 1: 107 of 108 steps green; the red step is workspace clippy, `redundant_clone` at `tests/checks.rs:1220-1221` (three clones in the new judge test) and nothing else |
| host/clippy-rerun.log | `cargo clippy -p toyos-build -p toyos-metal -p toyos-manifest --all-targets --keep-going -- <the adopted lints> -D warnings` at a995bedf3, after removing the clones | 0 |
| host/checks-judges.log, host/checks-judges-2.log | `cargo test --test toyos-checks -- metal_judges_read_the_page a_shared_chunk`, before and after the clone fix | 0, 0 |
| host/metal-unit.log | `cargo test -p toyos-metal --lib` at a995bedf3 (86 tests, 5 of them `scratch::tests`) | 0 |
| host/m1-outcome-ignored.{patch,log} | negative control: the judges' outcome check disabled (`scratch_came_back` never refuses); the judge test | 101: the "a lost disk" case reds |
| host/m2-attached-not-lost.{patch,log} | negative control: `Cycle::lost` reads `attached` as served; the judge test | 101: the same case reds |
| metal/stage.log | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/r3/metal scratch_written_through_a_deadline_reset scratch_written_through_a_reboot`, tree as committed in efd05be87 | 2 (staged; nothing ran on a machine) |
| metal/request.txt | the T14 protocol: re-adoption, a one-rotation pilot, the series, stop and decision rules | - |
| qemu/serial-reboot.log, qemu/qemu-reboot.out | `qemu/run.sh` on the staged scratchreboot image, with a second usb-storage stick laid scratch-typed by `qemu/mkgpt.py` (256 MiB) | QEMU 0 |
| qemu/serial-deadline.log, qemu/qemu-deadline.out | the same on the staged scratchdeadline image | QEMU 0 |

QEMU, read from the serial logs: the reboot image wrote 64 MiB durable (13.931 s),
asked for the reboot (13.934 s), usbd reported `the machine stops: 2/2 connected
port(s) reset, halted=true, reset=true, 8/8 port(s) unpowered` and exited code=0,
and the kernel rebooted (14.031 s). The deadline image armed its 40000 ms deadline
at 8.148 s and wrote until the reset: 928 MiB durable by 47.383 s, wrapping the
254 MiB partition. QEMU's usb-storage has no flash to lose, so neither run says
anything about a stick's return; they establish the load against main's block
client and usbd.

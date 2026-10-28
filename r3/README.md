# PR #1074, round 3

- `judge/`: session 2's p1 benchcase (red: `osbench_sched`'s `wake.onto_busy` placement refusal) and testcases (255/6), and session 3's head testcases (256/5, every red a recorded row), each judged with `cargo test --test toyos-build -- --metal --metal-readback <dir> <row>`.
- `logs/`: the host suite at d06c669d2 and cd42d13a4 (both 104 green); QEMU 7 at cd42d13a4 (7/7); the working-set control (the steady-stream test red with the rule removed); the first QEMU stall at d06c669d2 and its reruns.
- `soak/`: the seven-test batch run repeatedly in three detached worktrees at once. `head-*` is 5e0cb52b0, `main-*` is 576bebf3a, `base-*` is 544f9cc3c. `netstack_holders_exported_to_children` stalls at all three. #1083 explains the stalls: QEMU's macOS host forward queues one connection, so the harness's back-to-back second connect was reset. The fix is in the harness.

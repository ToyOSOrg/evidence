# pr-1073 r6: the counters instrument fixed; the group-start diagnostics

- **`shipped-rows-out-of-range.txt`.** In the run4 and run5 benchcase boots, 87 per-CPU lines of the instrument as it stood at `d60d727aa` printed `deep_permille` above 1000, up to 2278 (four lines are file headers).
  - A period is credited when it ends, so one begun before the row counted whole.
  - A counters read within 10 ms of another is served that read's values, so the readings' window was not the row's.
- **The fix, at `b1ae80c02`.**
  - Each CPU's window is now taken from its own counter stamps (`osbench_rules::window`). A shared reading, or a window more than 10 % off the row, is refused by name.
  - `deep_permille` is replaced by `deep_ended` and `deep_ended_us`.
  - `mutations/window-unchecked` exits 101.
  - `logs/ci-host-11.log` is `cargo run -- --ci host` at `55269e97f` (the fix with main merged): exit 0, 104 steps, the window tests among them.
  - `logs/qemu-osbench-instr.log` is QEMU `osbench_capability_groups_exit_0` at `55269e97f`: exit 0.
- **`diag/D1`, `D2`, `D3`.** The group-start diagnostics. The judge exits 0 for each.
  - D3 was re-judged from a clean tree at `145e65934` (`logs/judge-D3-clean.log`).
  - `diag-D1.txt` and `diag-D2.txt` tabulate the counters around each clock window. Thirteen of the 17 windows show one reading served twice.
  - D3 (`diary-clock.patch`) reads the scheduler's diary per CPU across each window.
- **`request-B6.txt`.** B6 benchcase at `55269e97f`.

Paths are masked.

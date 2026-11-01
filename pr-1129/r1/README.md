# PR #1129 r1 (`b8bd0ea02`)

- `ci-host.log`: `cargo run -- --ci host`, 108 steps all green, exit 0.
- `qemu.log`: `affinity_pins_hold_on_every_cpu`, `std_threads_count_…` and `libc_children` on QEMU x86-64, exit 0.
- `s4.log`: the two simulator tests, `a_split_pair_moves_once_into_one_llc` and `a_server_woken_from_two_llcs_in_turn_does_not_follow_them`, exit 0.
- `h1.log`: the three host tests, exit 0.
- `measure-rule.txt` and `measure-stateless.txt`: moves per seed over 40 seeds, from a temporary print-only test that was never committed, under the rule and under the stateless variant.
  - server: rule 36 moves in all, at most 3 in a run; stateless at most 21 in a run, about 220 in all.
  - pair: exactly 1 under both.
- Controls. Each is a checked patch (`mut-<name>.diff`) whose host run is in `mut-<name>-host.log` and whose sim run is in `mut-<name>-sim.log`. Each was restored in the same run.
  - `no-rule`: reds `a_split_pair…` and `a_task_woken_twice_from_another_llc_moves_into_it`.
  - `stateless`: reds the server scenario, `a_task_woken_from_two_llcs_in_turn_stays_home` and the moves-once test.
  - `ignores-mask` (host only): reds `a_task_masked_out_of_its_wakers_llc_stays_home`.

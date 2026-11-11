# PR #1266: a thread's request follows its bursts

Paths are masked: `<wakeperf>` is the assignment's scratch directory, `<scratch>` its parent, `<home>` the user's home.

- `latency/fix-breaches.txt`: of 400 seeds of `kernel-sim run interactive_mix:1:4`, the runs whose sleeper waited over 2.25 ms on two or more wakes: main (#1260's head 9e31612fc) and the fix (f543b1a80; 578c9dfd0 changes no decision for a running task's word). Counted with `count-breaches.sh` over a build carrying `simdbg.py`'s measurement-only print.
- `latency/fix-policy-control.txt`: `an_interactive_wake_waits_out_at_most_one_request` at 400 seeds on main: red. `fix-policy-interactive.txt`: the same at the fix: green, with its distributions.
- `share/share-main.txt`, `share/share-fix.txt`: `a_short_request_buys_no_share` on main (the scenario and test applied there) and at the fix.
- `checks/fix-checks.log`: tests and clippy at 578c9dfd0. `checks/fix-mutations.log`, `mutations3.py`: the negative controls at f543b1a80 (578c9dfd0 after it changes no verdict they read). `checks/fix-models.log`: `cargo run -- --ci host models` at 578c9dfd0, 79 steps green.

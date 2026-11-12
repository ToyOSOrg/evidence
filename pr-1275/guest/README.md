# PR 1275: guest rows

Run 43150987184 (https://github.com/ToyOSOrg/ToyOS/actions/runs/43150987184), dispatched with `gh workflow run guest-rows.yml --ref window-compositor-wait-bound -f filter='testcases_members_exit_0 a_window_is_drawn_at_the_scale_and_relaid_at_the_next'`. The guest runner checked out `0f38389b6ca873dbc4f69db4d1e593279c1e4f04`, x86-64 under KVM. The host was quiet: 0.04 CPUs of other work.

- `a_window_is_drawn_at_the_scale_and_relaid_at_the_next`: PASS. `[scale] 400x200 under 56 rows at 2, relaid 200x100 under 28 at 1`.
- `testcases_members_exit_0`: PASS. 241 members exited 0, `window_refusal` among them, and the list's reboot ended the boot.
- The run: `5 step(s), all green`.

The log is the run's own, with the runner's home and temporary paths masked.

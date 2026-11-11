# PR #1259, round 2: the guest red fixed

- `guest-43081676127-summary.log`: guest run 43081676127 at 470bf6fee (`virt_vm_map_shares bar_map_again bar_map_behind_a_bridge lent_device_memory_refused`), the run's filter, each row's verdict and the suite's line: 4 passed of 4. The full log is the run's own, `gh run view 43081676127 --log`.
- 470bf6fee fixes the one red of run 43062438931 (`virt_vm_map_shares`, `PermissionDenied` at `vm_map_shares.rs:57`): the test read its own statistics through a handle that carries no `READ`, and now reads three child runs' peaks through the spawner's handle.
- The head ae99d1d29 is 470bf6fee plus a record of what is owed on metal, so code-identical.

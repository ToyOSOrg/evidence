# pr-1150 r11: round 5's regressions traced on KVM, the paged-read fix, round 6 staged

All KVM runs are `osbench_capability_groups_exit_0 --nocapture` on the guest runner, with the row's
groups set to procs/mem/system. Its red verdict in these runs is the row waiting for the wrong last
job; every row printed. `kvm/table.txt` summarises them, and `kvm/*.txt` are the harness lines.
- **base** `s0a-r10-base-kvm` (main e11b6a784 + probe): kvm-1, kvm-4, kvm-6.
- **head** `s0a-r10-head-kvm` (199228a81 + probe): kvm-2, kvm-5.
- **headsdk** (head, `sdk/toyos/src/sync.rs` as main): kvm-3.
- **fix** (head + populating ahead inside the copy fault, `7f2bd71f1`, dropped): kvm-7, kvm-8.
- **fin** (`378cea3a7` + probe): kvm-9, kvm-10.
- **c*** runs add `copyprobe.py`'s measurement commit: machine-wide user-copy calls, bytes and ns,
  and copy faults, in every exit line. `cpdiff.py` takes the median difference between consecutive
  exits of the large spawn's child: one spawn's copying.

Findings:
- **The large spawn:** 8193 copy faults per spawn on head, one per page, and 8.2 ms of copying
  against base's 4.7 ms. With 378cea3a7 there is one fault per spawn and 5.1 ms of copying (the
  populate is outside that figure). `proc.spawn_wait.large`: base 7.63-7.79 ms, head 10.5-10.6,
  fin 8.37-8.42.
- **The fault-ahead variant:** it changed nothing, because each copy spans a single page.
- **`thread.spawn_join.default`:** fin 35.35/35.70 µs, inside base's 35.26-35.97.
- **`mem.malloc_churn.*`:** identical in every variant.

Checks at 378cea3a7:
- `host-ci-378cea3a7.log`: rc=0, 108 green.
- Guest rows (`kvm/guest-rows-41984456896.txt`): 6 of 6.

`ab6/`: round 6's rules (set before any boot), request, hashes and staging logs.

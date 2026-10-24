# PR 1058, round 2: T14 A/B and review r1 fixes

T14 boots run by the orchestrator, base 05873236d against head 53f73a63c, benchcase and
testcases images staged with
`cargo test --test toyos-build -- --metal --metal-readback <dir> osbench spawn_cost`.
All four boots rc=0; the judges pass on both sides, "2 passed, 0 failed, 2 boot(s)"
(t14-*-judge.log).

**Masked** (by `mask.py`, rerun over the original readbacks in commit 3 of this branch,
replacing commit 2's copies):
- every GUID except a GPT partition *type* GUID (one that some line names after "of type",
  public constants such as C12A7328-…), as `<partition-guid>`: the internal NVMe's and the
  stick's partition unique GUIDs, wherever they appear (partition lines, sessions, device paths);
- the 16-byte `guid [..]` lists of the stick's partitions, as `guid [<partition-guid>]`;
- the machine's vendor, product and BIOS strings, as `<vendor>`, `<product>` and `<bios>`;
- host paths, as `<path>`.
Nothing else is changed.

| row (p50) | base | head |
|---|---|---|
| process.spawn_wait (std Command of osbench nop) | 6.494 ms | 0.551 ms |
| proc.posix_spawn_wait.std | 6.506 ms | 0.515 ms |
| proc.spawn_wait.tiny | 54.6 µs | 54.8 µs |
| proc.spawn_wait.large | 228.6 µs | 229.0 µs |
| spawn_cost (/system/bin/toybox, median of 50) | 4333 µs | 363 µs |

That testcases image carried spawn_cost's 10 jobs only, no shared members.

Review r1 fixes at head 4ce692580: `cargo run -- --ci host` exit 0, 103 steps green
(ci-host-tail-4ce692580.log). The whole head testcases shared boot (242 jobs), staged with
`--metal-readback <dir> boot:testcases`, booted on the T14:
t14-head-4ce692580-testcases-kernel.log, masked the same way. In it
`test_rs_abuse_shared_grant`, `test_rs_dlopen_dedup`, `test_rs_std_tls_dlopen` and
`test_rs_abuse_dlopen_ledger` end `exit=0`. The orchestrator's judge of that boot is pending.

## The 4ce692580 testcases judge: 253 passed, 7 failed (t14-head-4ce692580-testcases-judge.log)

None of the seven is #1058's:
- `klogd_hosted`: the DMA fault at 79.146 s is `test_rs_usbd_spare_fault`'s own,
  deliberate one. Its line just before says "the command ring aimed at 0x50200000, past the
  grant", and it exits 0. That job belongs to the AMD-Vi row
  `amdvi_usbd_drives_its_own_entry`, which rides the T14's boot. Recorded:
  issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md.
- `amdvi_translates_the_stick_controller`, `amdvi_remaps_the_stick_controller`: the T14 has
  no AMD-Vi unit. `amdvi_usbd_drives_its_own_entry`: `test_rs_usbd_spare_vector` panics with
  "the function has no MSI-X capability" on the T14's xHCI (8086:9a13). Same record.
- `acpi_server_events`, `acpi_tables_loaded`, `battery_read`: `test_rs_acpi_hold` started at
  79.38 s and panicked "within 0ns". Its wait ends at 54 s counted from boot. Recorded:
  issues/acpi-hold-gives-up-at-a-time-counted-from-boot-whatever-its-runner-was-given.md.
No line touches a program image's memory. The base control at 05873236d (same filter,
both images) is staged for the T14.

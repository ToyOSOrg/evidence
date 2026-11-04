# pr-1150 r5: small pipe calls in one process hold, and ab4 staged

- `host-6.log.gz`, `host-6.rev`: `cargo run -- --ci host` at 05f6c884f, rc=0, 109 steps green.
- `members-4.log`, `members-4.rev`, `ccheck-4.log`: the testcases boot via `--debug`
  under QEMU x86_64 on the development Mac at 05f6c884f.
  - 230 of 238 exit 0; the other 8 need `SYS_DEBUG`, as in every round. The C corpus is
    143 of 143. No gate panic.
  - This ran before the owner's rule that x86 guest tests run only on the remote KVM host. The
    the remote KVM host run of the relevant guest tests is the one #1150 relies on.
- `probe-qemu.log.gz`: the measurement-only `s0a-probe` branch's osbench bench groups
  under QEMU, rc=0, its exit lines carrying `probe_ns_per_call`. It is a format check, not
  a timing.
- `ab4-*`, `stage4.sh`, `stage4.log.gz`: round 4's metal, staged and not run. The rules
  were set before any boot.
  - base `s0a-probe-base` 9af33a79a and head `s0a-probe` 13cca17b9 benchcase, both
    carrying the probe;
  - testcases at 05f6c884f, without it.

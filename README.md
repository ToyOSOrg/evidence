# pr-1084 evidence

r1: head 27bf960ec (code) and 74c60af4d (records and a comment only).

- r1/logs/ci-host-1.*: `cargo run -- --ci host` at 27bf960ec, exit 0.
- r1/logs/qemu-2.*: `cargo test --test toyos-build -- virt_smp virt_el1_smp osbench_capability_groups_exit_0 acpi_mediated_access` at 27bf960ec, exit 0.
- r1/mutations/restore-join.*: the join restored as a checked patch, `virt_smp` exit 1 at counters_read ("cpu0's stamp did not move"), patch reverted in the same run.
- r1/metal/: the T14 benchcase staged at 74c60af4d (exit 2, no machine touched).

Paths are masked as $HOME and $TMP.

# Stage 1a, build review round 1's fixes, head 2443f9bb2

Merged `origin/main` at `3ba4a4a2f`. QEMU 11.1.1 TCG, arm64 host.

| check | command | exit | log |
|---|---|---|---|
| guest arms | `cargo test --test toyos-build -- --nocapture usbd_drives_the_spare acpi_mediated_access acpi_supply_outlives_holder` | 0, 3 passed | `guest.log` (`end_returns_claims`: 100 rounds, line 2092) |
| host, clippy matrix included | `cargo run -- --ci host` | 0, 77 steps green | `host-ci.log` |

`../stage-1a/mutation-scope-bypassed-miswritten.log`: the first bypass
mutation, which pushed into the scope and also queued, so every object was
released twice and the kernel panicked at `shm.rs:187`. An invalid mutation,
kept because the PR body named it.

# PR 917, round 4 at 58e0324dd1aa93dab3a3b9f27536c5af9364ce2e

Home paths are masked as `$HOME` and `$TMPDIR`. All checks ran at `58e0324dd`. Exit 101 is a test failure.

| check | command | exit | file |
|---|---|---|---|
| host checks | `cargo run -- --ci host` | 0, 77 steps green | `host-ci.log` |
| driver crate | `cargo test` in `system/netstack/i219` | 0, 105 passed | `cargo-test-toyos-i219.log` |
| claim judge check | `cargo test --test toyos-checks metal_claim` | 0 | `toyos-checks-metal_claim.log` |
| `i219_msi` built for x86-64 and AArch64 | `cargo run --release` of `i219_msi-both-arches-driver.rs` | 0 (632704 and 692232 bytes) | `i219_msi-both-arches.log` |
| `git diff --check origin/main...HEAD` | — | 0 | `diff-check.log` |
| m7: `reuses_its_entry` reading every record on the boot | mutation, then the claim check | 101, `handed over 3 time(s) and released 3` (the shared boot's shape) | `m7-reclaim-judge-unscoped.*` |
| m1: no `IAME` | mutation, then the race test | 101, `... raised no message, with keeps=true one_per=true` (the failing permit arm is now named) | `m1-no-auto-mask.*` |

| T14 staging, both rows in one boot | `cargo test --test toyos-build -- --metal --metal-readback <dir> claim_reuses_its_remapping_entry i219_messages_on_its_msi_vector` | 2 (staged; 2 registrations over 1 boot, 7 jobs) | `metal-readback-stage.log`, `request.txt` |

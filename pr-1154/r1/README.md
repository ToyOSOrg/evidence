# PR #1154 r1: kernel entry (registers, AC, SMAP/SMEP required, PAN)

Tested revision: 7a8263e5e (guest runs, controls, `--ci host`). The pushed
head 938c4a7cb adds only `tests/images/virtpancase.toml` to `build/build.rs`'s
`ALL_CONFIGS` test list, which no guest or kernel build reads; the one step it
changes was rerun at 938c4a7cb (`build-lib-after-all-configs.log`).

Host: Apple silicon; x86-64 guests under TCG (`qemu64,+smap,+smep,...`),
AArch64 `virt` under HVF. QEMU 11.1.1.

| File | Command | Exit |
|---|---|---|
| build-x86_64.log | `cargo run -- --build-only --arch x86_64` | 0 |
| build-aarch64.log | `cargo run -- --build-only --arch aarch64` | 0 |
| guest.log | `cargo test --test toyos-build -- scratch_entry_jobs virt_first_entry virt_pan_refuses_el1_a_user_page virt_el2_drop virt_no_seed_refused virt_jobs_at_el2`, with `scratch-entry-jobs.patch` applied (uncommitted) | 0 (6/6) |
| controls/nc1-nc3.log | the same filter on `scratch_entry_jobs virt_pan_refuses_el1_a_user_page` with `controls/nc1-no-zeroing.patch` and `controls/nc3-no-pan.patch` applied | 1 (both red, as intended) |
| controls/nc2.log | `scratch_entry_jobs` with `controls/nc2-no-clac.patch` applied | 1 (red, as intended) |
| ci-host.log | `cargo run -- --ci host` | 1: 1 of 109 steps red, `every_shipped_boot_config_is_covered` (the new case missing from `ALL_CONFIGS`) |
| build-lib-after-all-configs.log | `cargo test -p toyos-build --lib` at 938c4a7cb | 0 (375 passed) |

`scratch-entry-jobs.patch` is a scratch machine test, not committed: it boots
the test kernel on x86-64 q35 and runs `test_rs_first_entry` then
`test_rs_ring0_clears_ac`, whose shared boots otherwise run only on metal.
Each control patch was applied, built, run and reverted in the same run.

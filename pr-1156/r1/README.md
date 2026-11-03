# PR #1156 r1: the kernel's RELRO is read-only, and the W^X audit says so

Revision 4c030265f. Apple silicon host; AArch64 `virt` under HVF, x86-64 q35 under TCG.

| File | Command | Exit |
|---|---|---|
| toyos-elf.log | `cargo test -p toyos-elf` | 0 |
| kernel-wx.log | `cargo test -p kernel --lib --features sched-check wx::` | 0 (12 passed) |
| clippy.log | `cargo run -- --clippy` | 0 |
| guest.log | `cargo test --test toyos-build -- kernel_wx_leaf_is_refused virt_first_entry vector_state_survives_a_switch` | 0 (4/4) |
| controls/no-relro-arm.log | `cargo test --test toyos-build -- virt_first_entry vector_state_survives_a_switch` with `controls/no-relro-arm.patch` applied, then reverted | 1 (both boots stop in the audit, as intended) |

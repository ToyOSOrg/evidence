# PR #1156 r2: RELRO must open its segment and must exist

Revision 6c2e82a2a. Apple silicon host; AArch64 `virt` under HVF, x86-64 q35 under TCG.

| File | Command | Exit |
|---|---|---|
| toyos-elf.log | `cargo test -p toyos-elf` | 0 |
| clippy.log | `cargo run -- --clippy` | 0 |
| guest.log | `cargo test --test toyos-build -- kernel_wx_leaf_is_refused virt_first_entry vector_state_survives_a_switch` | 0 (4/4) |
| controls/relro-opens-inside.log | `cargo test --test toyos-build -- virt_first_entry` with `controls/relro-opens-inside.patch` (RELRO taken to open 8 bytes into its segment) | 1: `PT_GNU_RELRO at ... opens no writable PT_LOAD`, as intended |
| clippy-after-restore.log | `cargo run -- --clippy` | 0 |

The control's patch is a diff against r1, so it shows r2's `image.rs` with
the mutation. Restoring it reverted `image.rs` to r1. The r2 edit script was
re-applied from the same base, which reproduces the tested text, and the
kernel was recompiled under clippy before the commit.

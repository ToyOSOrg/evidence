# PR #1155 r1: the kernel heap's fresh superframe is zeroed

Revision cc347f3eb. Apple silicon host; AArch64 `virt` under HVF, x86-64 q35 under TCG.

| File | Command | Exit |
|---|---|---|
| clippy.log | `cargo run -- --clippy` | 0 |
| guest.log | `cargo test --test toyos-build -- virt_first_entry vector_state_survives_a_switch` (a boot of each architecture, which grows the heap) | 0 (2/2) |

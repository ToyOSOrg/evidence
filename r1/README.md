# ToyOSOrg/ToyOS#1007 (std and libc heap locks on a futex), round 1

Head now `fe8295e86` on `main` `68dbf80c7` (rebased from `496473973`; the diff is unchanged).

| file | command | revision | exit |
|---|---|---|---|
| hl-build.log | `cargo run -- --build-only` (rebuilds std's sysroot for both targets) | worktree of `496473973` | 0 |
| hl-guest.log | `libc_children std_threads_count_the_cpus_and_give_back_ended_threads console_image_boots virt_user_mode virt_smp` | same | 0 |
| hl-sweep.log | `allocator_stress c_aligned_alloc std_alloc std_threading std_threads abuse_thread_table` in one q35 boot (`scratch-sweep.patch`) | same | 0 |
| hl-host.log | `cargo run -- --ci host` | `496473973` | 0 |

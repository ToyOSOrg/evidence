# ToyOSOrg/ToyOS#1010 (memory stage 3b: strict commitment) and the stack head, round 1

Head `3446e9c33`, the top of #1002, #1003, #1007's commit, #1008 and #1010 on `main` `68dbf80c7`.

| file | command | revision | exit |
|---|---|---|---|
| ch-host.log | `cargo run -- --ci host` | `3446e9c33` | 0 |
| ch-build.log | `cargo run -- --build-only` | `3446e9c33` tree | 0 |
| ch-clippy.log | kernel clippy, 3 feature sets × 2 architectures | WIP of `3446e9c33` | 0 |
| ch-guest4.log | 76 shared Rust tests in one q35 boot, plus 15 QEMU rows: q35 and virt (`libc_children`, `virt_smp`, `virt_unmap_touch`, `virt_readonly_copyout`, `virt_first_entry`, `virt_timer_preempts`, `virt_fp_isolation`, both W^X rows, compositor and window rows, `nvme_disk_boots`, ...) | `3446e9c33` tree | 0 |
| ch-clang.log | `hosted_clang_hello`, the acceptance check for scattered object frames (row 5 of `issues/toyos-builds-itself.md` records its refusal on `main`, not re-measured here) | `3446e9c33` | 0 |
| ch-guest1/2/3.log | earlier rounds: the `mmap_prot` order fix (guest1 red, guest2 green), the 1 TiB commitment assertion (guest3) | WIP | 1, 0, 0 |
| controls/reserve-not-promised.* | `mmap_stress allocator_stress` with commitments never promised | WIP + patch | red: "a committed tebibyte", "16GB allocation should fail" |
| controls/promise-never-refuses.* | an invalid control, kept for the record: with promises never refused, page-table frames were refused instead, so both tests stayed green; it showed the refusal must be removed at the commitment, as the control above does | WIP + patch | 0 |
| metal-staging/ | `--metal --metal-readback <dir> boot:testcases boot:shared-debug pmm_accounting osbench`: 4 images, not run | `3446e9c33` | 2 = staged, not run |

`crypto_parity` and `mkdir_cap` are left out of the head's sweep: the first was silent past the sweep's 120 s ceiling in QEMU and finished with exit 0 (ch-guest1), and the second fills a VFS cap later tests need.

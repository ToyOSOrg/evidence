# The backing-memory stack, round 3

The stack is #1003 `5cd37f606`, #1008 `78e83ba1b` and #1010 `dadeebe0a`, rebased onto `main` `028244feb` after #1002 merged. Every check below ran at the stack head `dadeebe0a` unless a row says otherwise. Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| h6-host.log | `cargo run -- --ci host`: 102 steps | `dadeebe0a` | 0 |
| h6-clang.log | `cargo test --test toyos-build -- hosted_clang_hello` | `dadeebe0a` | 0 |
| h6-guest.log | `scratch_shared_sweep` (77 shared Rust tests in one q35 boot, every one exit 0, through `scratch-sweep.patch`, which is not committed), together with `libc_children`, `iommu_virtio_platform`, `kernel_wx_leaf_is_refused`, `virt_kernel_wx_leaf_is_refused` and `virt_user_mode`, all PASS | `dadeebe0a` | 101, see below |
| h6-wedge-sample.txt | `sample` of that harness process while it was wedged | | |
| h6-guest2.log | the 11 rows the wedge left unstarted: `console_image_boots`, `nvme_disk_boots`, `hda_plays_to_the_controller_that_reaches_an_output`, `the_compositor_drives_the_virtio_gpu`, `std_threads_count_the_cpus_and_give_back_ended_threads`, `the_log_lands_on_the_boot_stick`, `virt_smp`, `virt_fp_isolation`, `virt_first_entry`, `virt_unmap_touch`, `virt_readonly_copyout` | `dadeebe0a` | 0 |
| h6-testkernel.log | on the test kernel: `tlb_shootdown_waits` ×3, `abuse_kernel_addr`, `global_leaf_discharge`, `global_leaf_flush` | `dadeebe0a` | 0 |
| controls/reach-no-runner-r3.* | `tlb_shootdown_waits` with `user_change` never interrupting a CPU running the space | `87ac63d37` plus the round-3 fixes in the worktree; `tlb.rs` is byte-identical to the head's | 101 at `tlb_shootdown_waits.rs:162` |
| controls/reach-every-cpu-r3.* | the same with `user_change` shooting down every CPU | the same | 101 at `tlb_shootdown_waits.rs:211`, part 3's count |
| controls/keeping-ignores-keep.* | `cargo test -p kernel --lib frames::` with `alloc_frame_keeping` ignoring the kept reserve | `frames.rs` byte-identical to the head's | 101: `a_frame_kept_for_the_kernel_goes_to_the_kernel_alone` |
| hda-3446.log | `hda_plays_to_the_controller_that_reaches_an_output` under QEMU at `3446e9c33`: red with the HDA driver's `Unlendable` | `3446e9c33` | 1 |
| cm-guest.log | `counters_metal` with its load capped at 22,000 children | before the rebase | 0 |
| r3-metal-prep.log, metal-request.txt | metal staged with `--metal-readback`: `boot:testcases boot:shared-debug pmm_accounting osbench` at the head, and osbench's benchcase at `028244feb` | | 2 = staged, not run |

## The h6-guest exit

The run's exit is 101 because I stopped its harness by PID after 20 minutes without progress. This is the open record `issues/a-suite-that-builds-its-sysroot-can-wedge-on-its-own-locks.md`. The head needed a new sysroot. After that, 11 workers waited on `using sysroot 67b902b1e50f4e8b — held, but the holder left no readable note`:

- no QEMU was running;
- `lsof` showed the key's lock file open only in the harness, seven times;
- the sample shows workers in `flock` under `sysroot::ensure`, one of them in `keyed_building`, and others on a mutex.

None of the stack's commits touches `build/buildlock.rs` or `build/sysroot.rs`. h6-guest2 reran the 11 unstarted rows with the sysroot made, and all passed.

## The DMA fault on the T14 at 00:0d.0

The `testcases` readback at `3446e9c33` has one line `iommu: DMA FAULT owner=process unit3 stream=00:0d.0 addr=0x0000000050200000`, at 85.304 s. In the same millisecond, `test_rs_usbd_spare_fault` logs `usbd_spare: the command ring aimed at 0x50200000, past the grant at 0x10200000`, then ends `exit=0`.

That job is the AMD bench's `amdvi_usbd_drives_its_own_entry` row. It aims the controller past its grant on purpose. It ran on the T14 because `boot:testcases` takes every row whose arm boots `testcases`, whatever machine the row is for. Under `NEVER_CLEAN`, that line then turns red every other judge of the boot that reads a clean log, `klogd_hosted` among them.

The two `main` T14 `testcases` readbacks I compared have no DMA fault. They also did not run `test_rs_usbd_spare_fault`, so they show only that the fault needs that job; they do not compare it against `main` with the job run. The fault's address and timing tie it to the job's deliberate aim, not to user memory.

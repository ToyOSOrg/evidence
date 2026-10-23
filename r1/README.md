# #1045, round 1: kernel objects a process causes are charged

Head `8288896ed` (stack on `main` `40e528614`). Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| ci-host-3.log.gz | `cargo run -- --ci host`: 103 steps green | `0f03dc503` | 0 |
| sweep-4.log.gz | every shared Rust test (82) in one q35 boot of the shipping kernel, through `scratch-sweep.patch` (never committed) | `0f03dc503` | 1: `mkdir_cap` only, whose deletion the head commit carried and the amend then landed; 80 green, `kernel_objects_refused` among them, no kernel panic |
| sweep-tk-3.log.gz | the actuator tests and the shootdown and global-leaf tests on the test kernel | `0f03dc503` | 0 |
| qemu-rows-2.log.gz | 22 QEMU rows: `libc_children` (`spawn_children_cap` green), spawn, stream and launch rows, the virtio and BAR rows, and on AArch64 `virt` `virt_claim_lpi`, `virt_smp`, `virt_smmu`, `virt_unmap_touch`, `virt_readonly_copyout`, `virt_user_mode` | `8288896ed` | 0 |
| guest-4.log.gz | `kernel_objects_refused` alone | before the rebase | 0 |

`0f03dc503` and `8288896ed` differ only by deleting `tests/guest/rust-tests/src/bin/mkdir_cap.rs`, which nothing else references, so the host run and the sweeps hold for the head.

## Negative controls

Each patch was applied to the head's file, run, and reversed in the same command.

| control | what it breaks | result |
|---|---|---|
| room-ignores-reserved | promises and process frames may take superframes reserved for charges | `a_charge_reserves_what_the_heap_grows_into` and `fragmentation_never_takes_what_charges_or_promises_hold` red |
| split-whole-first | single frames split a whole superframe before a split one | three frames tests red, the fragmentation model among them |
| ring-from-kept | a pipe's ring may take a kept superframe | `kernel_objects_refused` red: "a pipe's first write, its ring with every frame taken", `Ok(())` |
| dirs-uncharged | directories charge nothing | `kernel_objects_refused` red: the guest went silent while making directories, and the harness's ceiling ended it (`STALLED`); no verdict line was reached |

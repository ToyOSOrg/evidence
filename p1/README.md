# PR #947 evidence: Wi-Fi P1, BARs in place in 4 KiB pages

Head verified: 3ef1e64c90edf83f654a3a2e4efe2c662ff213f3 (guests3, builds, ci-host3).
Final head 5f4418f37 adds only a merge of origin/main 979d4c539, which touches
three non-kernel files (tcp, issues) none of these checks' kernel or harness paths read.

- logs/ci-host3.log: cargo run -- --ci host, exit 0, 86 steps green.
- logs/build-final-x86.log, logs/build-final-a64.log: cargo run -- --build-only [--arch aarch64], exit 0.
- logs/guests3.log: cargo test --test toyos-build -- usbd_drives_the_spare bar_map_again bar_map_behind_a_bridge lent_device_memory_refused a_drives_row_holds_one_process_per_function the_compositor_drives_the_virtio_gpu iommu_virtio_platform virt_claim_lpi nvme_disk_boots, exit 0, 9/9.
- logs/guests1.log (2e7aeecdd+fix, red): bar_map_again and bar_map_behind_a_bridge red; the job read the virtio NIC's first BAR, now BAR 1 (the MSI-X table, withheld before by the deleted probe). Fixed in 3ef1e64c9; logs/guests2.log the four affected rows green.
- logs/ci-host2.log (1a2caf737, red): kernelkeys row for the deleted HashMap and a clippy literal; fixed in 75cd78bcd.
- mutations/: two negative controls, each applied with git apply, the crate's tests run (exit 101, the named test red), reverted, rerun (exit 0): page-share-only-the-bar (pages.rs checks only the BAR's bytes, not its whole last page) and aligned-window-a-whole-leaf (a 2 MiB-aligned short window becomes a 2 MiB leaf).
- metal/: --metal-readback staging only (exit 2 = staged, machine untouched) for the T14 and AMD bench rows.

## Bench round 1, at 5f4418f37 (run by the orchestrator)

bench/t14 and bench/amd: readbacks (kernel/loader logs, verdicts; device serial numbers masked), judges (judge-p1.log, judge-p1a.log), manifests (m947-*.txt/.log). T14 3/3 PASS. AMD 2/3: amdvi_translates_the_stick_controller and msix_table_read_in_place PASS; the first claim behind a bridge on metal handed 03:00.4's BAR 0 over in place and usbd drove it; amdvi_usbd_drives_its_own_entry red because end_returns_claims selected 1022:1639 by id and the bench has two (fixed in dc185149c). Kernel survey line: AMD 14 memory BARs, T14 21, 0 sharing a 4 KiB page on either.

## Round 3, at ecab33411 (review fixes, main c0b154791 merged)

round3/: ci host exit 0 (86 green); build-only x86-64 and aarch64 exit 0; 11 QEMU claim rows exit 0 (r3-guests.log; r2-guests.log the spare rows after the end_returns_claims fix at e136dafeb). All four bench images re-staged (stage-*.log exit 2 = staged, untouched), because ecab33411 changes how every user unmap frees its leaf tables. q35-boots/: the q35 survey lines from boots at 75cd78bcd (the red run's kept serial; the survey code is unchanged since): 11 to 14 memory BARs per machine shape, 0 sharing.

## Round 4, at 824e0478a6b7b75f354bfb7e3e130bf73316ee71 (main 80be9e85c, #944, merged)

round4/: ci host exit 0 (86 green); build-only x86-64 and aarch64 exit 0; the 11 QEMU claim rows exit 0; all four bench images re-staged here (exit 2 = staged, untouched). Round 3's staging is superseded.

## Round 5, at 4c72cf3f327d374b178ccad7f1a9428299a3b16b (main 0e6716fc0 merged; disable_msix and Msix::disabled deleted with their last callers)

round5/: build-only x86-64 and aarch64 exit 0; the 11 QEMU claim rows exit 0; AMD testcases-amd-xhci-leave re-staged alone (exit 2 = staged, untouched). ci host exit 1, 85 of 86 green: the one red is build/llvm.rs the_caller_s_environment_reaches_neither_the_build_nor_the_key, which runs git under SDKROOT=/no/such.sdk and on this host the /usr/bin/git shim then fails to find the developer tools (r5-llvm-alone.log reproduces it alone). The branch does not touch build/llvm.rs or build/sysroot.rs and the same step was green at round 4, so the red is this host's, not P1's.

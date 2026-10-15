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

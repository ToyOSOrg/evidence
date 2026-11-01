# PR #1137 r1: the firmware window's checks, at firmware-window 4be4b0f5b

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 108 steps green.
- `ci-host-red-clippy.log`: the run before, at b6d7e4256, exit 1. Kernel clippy found `type_complexity` on the window functions' result. 4be4b0f5b names it `pcidev::Opened`.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- Negative controls. Each patch is applied, its package's tests run, and the patch is reverted in the same run. Each compiles, and its run exits 101:
  - `mutation-ram-allowed` (`toyos-userbound`): RAM the kernel hands out no longer refuses a window. `a_window_past_firmwares_own_memory_is_refused` fails.
  - `mutation-device-allowed` (`toyos-userbound`): a device's window no longer refuses one. The same test fails.
  - `mutation-firmware-anywhere` (`toyos-manifest`): `firmware` accepted without `drives`. `a_firmware_window_is_named_and_only_on_a_drives_row` fails.

  They ran on the tree before the clippy fix, which renamed a kernel type and touched neither package.
- `metal-readback.log`: the `igd_opregion_window` metalcase image staged, sha256 958742b4ce621c68…. Exit 2 is staged, not run.

The IGD OpRegion facts come from Intel's "IGD OpRegion/Software SCI/_DSM for Skylake Processors BIOS Specification", revision 0.5. They are cited at each site:
- §2.3: firmware reserved, NVS, cacheable, under 4 GB;
- §3.1.1-§3.1.2: the signature, and the size in KB of 8;
- §3.1.7: MBOX;
- Table 3-1: mailbox 4 at 400h, 6 KB;
- §5.1.2: ASLS at FCh.

Paths are masked.

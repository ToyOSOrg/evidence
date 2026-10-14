# Lifecycle stage 1.2 (ToyOSOrg/ToyOS#926)

Paths are masked: `$WORKTREE` is the branch's worktree, `$SCRATCH` the agent's scratch, `$HOME` and `$HOST` the developer machine's.

| file | command | revision | target | exit |
|---|---|---|---|---|
| `logs/ci-host-2.log` | `cargo run -- --ci host` | `14a707b1b` (main `2c3f61a3e` merged) | host (macOS, aarch64) | 0, 83 steps green |
| `logs/ci-host-1.log` | same | `26609b4cd` (before the merge) | host | 1, clippy `type_complexity` in a manifest test; fixed by `37cd4e1a7` |
| `logs/build-only-3.log` | `cargo run -- --build-only` | `14a707b1b` | image | 0 |
| `logs/guest-2.log` | `cargo test --test toyos-build -- --nocapture a_drives_row_holds_one_process_per_function usbd_drives_the_spare the_opening_exchange_with_qemus_agent_completes bar_map_again lent_device_memory_refused iommu_virtio_platform virt_claim_lpi` | `14a707b1b` | QEMU 11.1.1, x86-64 q35 profiles and aarch64 `virt` (VirtIts) | 0, 7 passed |
| `logs/guest-drives-1.log`, `logs/guest-claims-1.log` | the same arms, before the merge | `26609b4cd` | QEMU | 0 |
| `logs/mutation-refused-retries.log` | `refused-retries.patch`, `cargo test -p toyos-supervisor`, reverted | `14a707b1b` + patch | host | 101: `a_refused_start_is_not_retried_until_its_record_changes`, round 0 |
| `logs/mutation-ambiguous-goes-on.log` | `ambiguous-goes-on.patch`, `cargo test -p toyos-supervisor`, reverted | `14a707b1b` + patch | host | 101: `two_matching_functions_refuse_the_start_naming_both` |
| `logs/mutation-overlap-never.log` | `overlap-never.patch`, `cargo test -p toyos-manifest`, reverted | `14a707b1b` + patch | host | 101: the grammar's and the render's overlap tests |
| `logs/mutation-one-process-per-row.log` | `one-process-per-row.patch`, the drives guest arm, reverted | `14a707b1b` + patch | QEMU `HeadlessTwoEdu` | 1: one holder, stalled waiting for the second |
| `logs/metal-stage-t14.log`, `metal/t14-request.txt` | `cargo test --test toyos-build -- --metal --metal-readback <dir> usbd_drives_the_type_c_controller` | `c3f4e070f` (code as `14a707b1b`) | staged only | 2, the staging outcome |
| `logs/metal-stage-amd.log`, `metal/amd-request.txt` | same, `amdvi_translates_the_stick_controller` | `c3f4e070f` | staged only | 2 |
| `classes/config-0x00-0x08.txt` | QEMU 11.1.1 HMP `o /w 0xcf8`, `i /w 0xcfc` on dwords 0x00 and 0x08 of `edu`, virtio-sound, virtio-serial (non-transitional), virtio-net (non-transitional), `nvme`, `qemu-xhci`, `nec-usb-xhci`, `e1000e` at devices 1–8 of a q35 | — | QEMU | the class codes the images' matchers spell |

`c3f4e070f` differs from `14a707b1b` only in `issues/`.

`metal-runs/` holds the orchestrator's T14 and AMD bench runs of the two staged rows: both passed.

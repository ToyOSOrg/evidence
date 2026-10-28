# pr-1086: the T14's iGPU fault in the VT-d hand-over

Branch `igpu-fault` of ToyOSOrg/ToyOS. Logs are full command output. Each command's exit code is its log's last line (`exit=N`). Paths are masked.

| file | command | revision | exit |
|---|---|---|---|
| host/ci-host.log | `cargo run -- --ci host` | rebased tree before `vtd_firmware_left` was added (kernel changes identical to 30a70716f) | 0 |
| host/ci-host-lint.log | `cargo run -- --ci host lint` | 30a70716f | 0 |
| qemu/vtd_firmware_left.log | `cargo test --test toyos-build -- vtd_firmware_left` | 30a70716f | 0 |
| controls/vtd_firmware_left-mutated.log | the same, with controls/vtd_firmware_left-mutation.patch applied (`in_flight` forced to `Identical`, cycles armed); tree restored after | 30a70716f + patch | 1 (expected red; also shows the switch under translation and 400 cycles on QEMU's unit) |
| controls/iommu_firmware_left-judge-on-prefix-readback.log | `cargo test --test toyos-build -- --metal --metal-readback <copy of a 576bebf3a T14 shared-debug readback> iommu_firmware_left` | 30a70716f judging a pre-fix boot | expected red: "unit0 still took translation off" |
| t14/metal-prepare.log | `--metal --metal-readback <dir> iommu_handover_cycles boot:shared-debug` (staging only; exit 2 is the harness's staged status) | 30a70716f | 2 |
| t14/fault-boot-excerpt.log | IOMMU lines of the halted T14 shared-debug boot at 7ef0a48c8 (orchestrator runner log) | 7ef0a48c8 | halted |
| t14/boot-counts.txt | per orchestrator T14 log: unit0 translating lines, cycled hand-overs, iGPU fault lines (to 2026-10-28) | — | — |

Totals from boot-counts: 787 boots with one off-to-on transition on unit0 and no iGPU fault; 46 cycled (`iommu-firmware-left`) boots with one fault.

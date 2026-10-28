# PR #1074, round 7: the final A/B

- **Machine and order:** T14, booted off its NVMe by the orchestrator's runner, in the order base1, head1, base2, head2, base3, head3, then head testcases and the watchdog. Every boot came back (runner rc=0).
- **Images:** base is main 9d818b3ed and head is tree 9e1d8397c (52c9e14b1, later reworded to b7c364a43). Both are clean benchcase images with no counters.
- **Files:**
  - `rows-*.txt`: each boot's osbench lines.
  - `verdict-*.txt`: each guest's own verdict. All read `passed`.
  - `rejudge-*.log`: the harness's judgement of each readback, with #1095's harness (78ade1ec0) merged locally onto b7c364a43, because the runner's boot file predates the harness on b7c364a43. Paths and machine lines are masked, and guest log echoes are dropped.

## pipe.throughput p50 MB/s, base / head by pair

| Write size | Pair 1 | Pair 2 | Pair 3 | Mean |
|---|---|---|---|---|
| 4096 | 2977 / 3071 | 3081 / 2987 | 3002 / 3006 | 3020 / 3021 |
| 16384 | 4758 / 4790 | 4814 / 4824 | 4797 / 4805 | 4790 / 4806 |
| 65536 | 7616 / 7596 | 7806 / 7547 | 7811 / 7521 | 7744 / 7555 (−2.4 %) |

- **The 64 KiB gap:** the head is lower in all three pairs. A rank test over the boots' p50s gives U = 0, one-sided p = 0.05, the floor for 3 against 3.
- **Sample ranges:** in pairs 2 and 3, head's maximum is below base's minimum (7563 < 7706, 7543 < 7711). Pair 1 overlaps (head 7488–7608, base 7596–7630).
- **Base's own spread:** its boot-to-boot p50 spread is 2.5 %.
- **Ping-pong:** `pingpong.pipe.cross_core` and `same_cpu` p50 are lower (faster) on the head in every pair.

## Judges (rejudge-*.log)

- **Bench boots:** base1–3 and head1–2 pass. head3 is red on `wake.onto_busy refused=partner_2_was_not_placed`, the placement starvation recorded at `issues/a-spawn-can-miss-a-cpu-holding-parked-threads-for-seconds-at-boot.md`.
- **Testcases and watchdog:** 255 passed, 6 failed. None is a pipe path.
  - `tone_beside_a_log_write`, `amdvi_translates_the_boot_controller` and `amdvi_remaps_the_boot_controller` are rows #1095 adds, which the image predates.
  - `amdvi_usbd_drives_its_own_entry` and `usbd_drives_the_type_c_controller`: the image's `usbd_spare` binary assumes the USB-boot layout ("no one spare controller on this machine"). #1095 rewrites that check for NVMe boot.
  - `i219_messages_on_its_msi_vector`: the MAC saw 0 frames on the wire, as `issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md` records, and as every earlier session's testcases readback shows.

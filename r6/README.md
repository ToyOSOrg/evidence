# PR #1100 at 31be41287: rebased onto 0c7e62ca7

## Host checks

The head is `31be41287`: the two energy commits rebased onto `0c7e62ca7` (#1097, `persist` on DATA), plus `issues/the-t14s-idle-package-stays-in-pc2.md`. Two conflicts were resolved by keeping both sides: osbench's README, and `tests/toyos.rs`, which keeps `data_on_the_nvme` beside `osbench_energy_measured`.

| check | revision | exit | log |
| --- | --- | --- | --- |
| `cargo run -- --ci host` (105 steps, all green) | `31be41287`, clean tree | 0 | `logs/ci-host-final.log` |
| `cargo test --test toyos-build -- osbench_capability_groups_exit_0` (QEMU x86_64; identity, fair and energy each exit 0) | `31be41287` | 0 | `logs/qemu-capability-final.log` |
| `cargo run -- --ci host`, the rebase before the issue file | `c523c9471` | 0 | `logs/ci-host-rebase.log` |

## Phase 3 staging (`phase3/`, measurement only, not the PR's code)

- `scout-t14.md`: the ToyOS scout boot. The branch is `power-scout` at `9fd3114fc`.
  - Staging log: `logs/scout-stage.log`. It exits 2 by design: the image is staged and no machine was touched.
  - Image sha256: 388c76c0…dc53c89.
- `linux-ab.md` and `ab-remote.sh`: the Linux halves, boot B (`nomodeset`) and boot A's runtime steps.

Home and temporary paths are masked as `<home>` and `<tmp>`.

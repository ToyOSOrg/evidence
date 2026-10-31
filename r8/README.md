# PR #1100 review round 1, at cf0fc945f

| check | revision | exit | log |
| --- | --- | --- | --- |
| `cargo run -- --ci host` (105 steps green; its FAILED lines are its negative controls) | `cf0fc945f`, clean | 0 | `logs/ci-host-r1b.log` |
| the same | `55922d7a9` | 0 | `logs/ci-host-r1.log` |
| `cargo test --test toyos-build -- osbench_capability_groups_exit_0` (QEMU) | `55922d7a9` | 0 | `logs/qemu-capability-r1.log` |
| `cargo clippy -p osbench --target x86_64-unknown-linux-musl -- -D warnings` | `cf0fc945f` | 0 | `logs/clippy-x86_64-unknown-linux-musl-r1.log` |
| the same for `aarch64-unknown-linux-musl` | `cf0fc945f` | 0 | `logs/clippy-aarch64-unknown-linux-musl-r1.log` |
| `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos` (sha256 a6655896…f28fbfb2b192ea3d7943a057c8cc) | `55922d7a9` | 0 | `logs/build-linux-r1.log` |
| the changed `counters` judge over round 1's T14 readback (`890f5c709`'s boot) | `55922d7a9` + `judge-select.patch` | 0, `PASS counters` | `logs/judge-r1.log` |
| negative control: that readback with the bring-up line saying `package_energy=false` (`judge-r1-neg.diff`) | the same | 1, `FAIL counters: ... carries ... package_energy ... and its bring-up said ... package_energy=false` | `logs/judge-r1-neg.log` |

## How the judge was run

The command was `cargo test --test toyos-build -- --metal --metal-readback <dir> counters`, with only the `testcases` readback in `<dir>`.

No filter word takes the `counters` row alone. Every substring of "counters" also names the shared member `counters_silent`, whose boot has no readback, and an offline run judges only once every selected boot has one. So `judge-select.patch` drops `counters_silent` from the shared selection, and nothing else. It was applied for the two judge runs and reverted in the same command. `git apply --check` passed before it was applied, and the tree's diff was empty after.

Clippy reruns used the default toolchain. The nightly has no clippy component.

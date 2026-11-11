# PR #1131 r11: targeted host checks of the rebased head, and the one finding fixed

Head `5418cb1a5424ff20fd2b4a5a1eecb30dc77d3f09` (branch `nvme-apst`) on main `34cb4c918`: the measured
`349ccb26b` and `047e0a708` rebased with no code line changed, and the records. Run on a macOS arm64
host. Paths are masked. `$ADOPTED` is the `-W` list of the repository's adopted clippy lints, as
`build/clippy.rs` splices it.

## `host/`: at `5418cb1a5`

| log | command | exit |
|---|---|---|
| `test-nvme-apst.log` | `cargo test -p nvme-apst` | 0: 9 passed |
| `test-nvme.log` | `cargo test --manifest-path system/nvme/Cargo.toml` | 0: 5 passed |
| `clippy-nvme-apst.log` | `cargo clippy -p nvme-apst --all-targets -- $ADOPTED -D warnings` | 0 |
| `clippy-nvme.log` | `cargo clippy --manifest-path system/nvme/Cargo.toml --all-targets -- $ADOPTED -D warnings` | 101: one finding, `large_enum_variant` on the PR's new `Power` |
| `clippy-osbench-x86_64.log` | `cargo clippy -p osbench --target x86_64-unknown-linux-musl -- $ADOPTED -D warnings` | 0 |
| `clippy-osbench-aarch64.log` | `cargo clippy -p osbench --target aarch64-unknown-linux-musl -- $ADOPTED -D warnings` | 0 |
| `test-harness-checks.log` | `cargo test --test toyos-checks` | 0: 44 passed |

No gate lints the driver: the merge gate's clippy excludes every userland program. The finding
is the PR's own code.

## `host-after-fix/`: `5418cb1a5` plus `fix.patch`, committed as `902ca4e30`

`fix.patch` boxes `Power::Autonomous`'s plan. The run reverts it, lints, and reapplies it.

| log | command | exit |
|---|---|---|
| `test-nvme.log` | `cargo test --manifest-path system/nvme/Cargo.toml` | 0: 5 passed |
| `clippy-nvme.log` | the driver's clippy, as above | 0 |
| `control-clippy-nvme.log` | the same with `fix.patch` reversed | 101: the one `large_enum_variant` finding |

The reapplied tree equals `fix.patch`, and the commit's diff equals it byte for byte.

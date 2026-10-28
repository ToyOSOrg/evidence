# PR #1100 round 1: host checks, the QEMU capability run, and the metal requests

Revision 93317a104de7671430865049063d52f8740cadc4 (`power-scoreboard`).
Paths are masked: `<home>`, `<scratch>`, `<tmp>`, `<user>@<amd-bench>`.

| check | command | exit | log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` at the revision (`ci-host-2.rev`) | 0, 105 steps green | `logs/ci-host-2.log` |
| ABI counters tests | `cargo test -p toyos-abi --lib counters` | 0 | `logs/abi-test.log` |
| kernel library cpu tests | `cargo test -p kernel --lib cpu::` | 0 | `logs/kernel-pure-test.log` |
| benchcase image | `cargo run -- --build-only --boot-config tests/images/benchcase.toml` | 0 | `logs/build-benchcase-2.log` |
| QEMU q35 | `cargo test --test toyos-build -- osbench_capability_groups_exit_0` (energy among its jobs) | 0 | `logs/qemu-capability-1.log` |
| Linux half check | `cargo +nightly-2026-07-22 check -p osbench --target x86_64-unknown-linux-musl` | 0 | `logs/osbench-linux-check.log` |
| osbench clippy, both Linux targets | `cargo clippy -p osbench --target {x86_64,aarch64}-unknown-linux-musl -- -D warnings` | 0 | `logs/clippy-*-2.log` |
| Linux binary | `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos` | 0 | `logs/build-linux.log`, `linux-SHA256SUMS` |
| metal staging, T14 and AMD | `cargo test --test toyos-build -- --metal --metal-readback <dir> osbench_energy [counters]` | 2 (staged; no machine touched) | `logs/metal-stage-*.log` |

The QEMU run and the image build were taken on the working tree one edit
before the commit: the commit adds only a clippy fix in
`tests/guest/osbench/src/sys/linux.rs`, which no ToyOS build compiles.
The host CI run before that fix (not published) was red on that clippy finding alone.

`run-plan.md` is the orchestrator's plan for the metal and Linux runs.

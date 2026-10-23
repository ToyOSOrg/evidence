# PR #1053, round 1: osbench's comparison rows, at f644cefae2158921cd634e8d4f06e0a19739a33e

Development Mac (arm64, macOS). No bench was touched; no Linux x86 machine was available.

| check | command | exit | log |
|---|---|---|---|
| host checks | `cargo run -- --ci host` at f644cefae | 0 (103 steps green) | logs/ci-host-2.log |
| Linux build | `cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos`, and the peer for Linux musl and the Mac | 0 | logs/build-linux.log, linux-SHA256SUMS |
| ToyOS image | `cargo run -- --build-only --boot-config tests/images/benchcase.toml` (tree before the last edits) | 0 | logs/build-benchcase-1.log |
| metal staging, T14 and AMD | `cargo test --test toyos-build -- --metal --metal-readback <dir> osbench` at f644cefae | 2 = staged, machine untouched | logs/metal-stage-*.log, metal-*-image.sha256 |
| QEMU TCG smoke | the new groups plus mem, time, system in one boot (logs/qemu-smoke-config.toml, an uncommitted case), 4 vCPU, no NIC | every job exit 0 | logs/qemu-smoke-serial.log |
| control m1 | controls/m1-same-cpu-passes.patch (the same-CPU refusal removed), `cargo test -p osbench-rules pair` | 101, `a_pair_on_one_cpu_is_refused` red | logs/control-m1-same-cpu-passes.log |
| control m2 | controls/m2-before-only.patch (only the before-readings compared) | 101, the three moved-side tests red | logs/control-m2-before-only.log |

The QEMU smoke ran on the tree before three edits, none on a path it took: `net`'s ToyOS rows
reported unsupported up front (`net` was not in the smoke list), crunch's `unit` field renamed
`work_unit` with `units_per_s` fractional, and `Peer::connect`/`Echo::round_trip` returning `()`
(host-tested). QEMU numbers are TCG's and say nothing about either bench.

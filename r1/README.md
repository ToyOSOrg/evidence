# PR #1065, round 1: osbench network rows

Revision: c3b124b3f (branch `bench-net`), base eba9e8eac.

| check | command | exit | log |
|---|---|---|---|
| host CI | `cargo run -- --ci host` at c3b124b3f | 0 (103 steps green) | logs/ci-host-2.log |
| Linux build | `cargo +nightly-2026-07-22 build -p osbench -p osbench-lan --target x86_64-unknown-linux-musl --profile toyos` | 0 | logs/build-linux-c3b124b3f.log |
| image | `cargo run -- --build-only --boot-config tests/images/benchcase.toml` (pre-commit tree; the later edits are internet.rs and the compare crate, which the QEMU runs below cover) | 0 | logs/build-benchcase-1.log |
| metal staging | `cargo test --test toyos-build -- --metal --metal-readback <dir> osbench_lan osbench_internet` | 2 = staged, nothing run | logs/metal-stage-net-1.log |

An earlier host CI at e60ee7a88 was red on one clippy lint (`manual_midpoint` in osbench-compare), fixed in c3b124b3f.

## QEMU smoke of `osbench internet` on ToyOS (not a registered test; exploratory)

`qemu/inetsmoke.toml` is benchcase.toml with netstack on QEMU's virtio-net and the job list
`osbench_internet`, built as a temporary `tests/images/` config; `qemu/run.sh` runs it under TCG
(x86_64 guest on an arm64 host) with user-mode networking to the public internet.

- `serial-inet-5-small.txt`: final code with `qemu/smoke-small-sizes-2.patch` (2 MB down, 1 MB up,
  because TCG moves about 0.2 MB/s through TLS and 25 MB passes the 30 s request patience). Every row
  measured, job exit 0. `internet.https.rtt` p50 (18.8 ms) is about `tcp.connect`'s (17.0 ms): the
  agent keeps its connection. TCG's clock and throughput are no evidence of speed.
- `serial-inet-6-nonic.txt`: the same image with no NIC (`qemu/run-nonic.sh`): every row
  `unsupported`, exit 0 — the AMD bench's case.
- Intermediate code, findings fixed before the commit: `serial-inet-1.txt` (virtio NIC without
  `iommu_platform`, refused by the supervisor: no NIC), `serial-inet-2.txt` (the lookup ran before the
  lease and read `NotConnected` as no network stack: now a bind tests for netstack and the lookup is
  retried until the lease), `serial-inet-3.txt` (ureq's `limit(0)` refused an empty body; 25 MB under
  TCG past the patience).

Lines are filtered to osbench's and the runner's; addresses and MACs are masked.

## Negative controls (`controls/`)

Each a checked patch, applied, `cargo test -p osbench-compare -p osbench-lan`, restored in the same run.

- m1 ties counted as whole wins: first passed (exit 0) — the tie case then in the test could not tell
  the two apart. A discriminating case was added (`[2, 2]` against `[1, 2]`: p = 1 with half wins,
  1/2 with whole ones); rerun red (exit 101): `control-m1-ties-count-as-wins-2.txt`.
- m2 answer length unbounded: red (exit 101).
- m3 better/worse direction flipped: red (exit 101), two tests.

## Endpoint probes from the development host (once, before the design)

`speed.cloudflare.com`: `__down?bytes=25000000` 200; `__down?bytes=100000000` 403; `__up` with 10 MB
200; on a reused connection `__down?bytes=0` took about 31 ms against `cdn-cgi/trace`'s 11 ms, so the
round-trip row asks `cdn-cgi/trace`. Response headers carry the client's address and location, so
osbench reads none.

# PR #1069, round 4: the corrected head, d184223b0, on both rings (2026-10-28)

Four ToyOS runs at `d184223b0` (16-descriptor ring), interleaved with four Linux runs of osbench built
at the same revision (`session/`, `linux-d184223b0.SHA256SUMS`), then two runs with 256 descriptors
(`ring-256.patch`, `toyos/ring-256-*`). Masked as round 1's. Same path. Means are the stop counters'
sums over their counts.

| `lan.wired.tcp.upload` | p50 MB/s | cwnd-held of 15 s | stops | mean cwnd | mean SRTT | card full |
|---|---|---|---|---|---|---|
| ToyOS, 16 | 58, 61, 59, 57 | 2.35, 2.08, 2.41, 2.40 s | 640, 712, 625, 639 | 348, 310, 340, 354 KB | 5.1, 4.1, 5.4, 5.6 ms | 101,224, 106,959, 100,908, 100,246 |
| ToyOS, 256 | 60, 57 | 4.57, 4.92 s | 893, 893 | 506, 488 KB | 8.0, 8.0 ms | 79,567, 77,036 |
| Linux | 113, 112, 112, 113 | | | 1,505, 2,014, 1,552, 1,973 segments | 7.7, 11.8, 12.4, 10.5 ms | |

- ToyOS resent one segment, D-SACKed, across the six runs; no loss probe ended a slow start.
- Linux's TCP_INFO: busy 15.0 s a row, held by the peer's window 0.05–0.94 s, by the send buffer for none.
- `ci-host-8.log`: `cargo run -- --ci host` at `d184223b0`, exit 0.

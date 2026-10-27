# PR #1069, round 2: the instrumented session at 132d5ef75 (2026-10-28)

The coordinator ran it; the files are the coordinator's, masked as round 1's. The path is the same: the
T14's I219 at 1000 Mb/s to the AMD bench's Linux `osbench-peer` over its Wi-Fi. Four ToyOS runs at
`132d5ef75` (16-descriptor ring, as main), interleaved with four Linux runs of osbench built at the same
revision (`session/`), then two ToyOS runs with the 256-descriptor ring (`ring-256.patch`,
`toyos/ring-256-*`).

| `lan.wired.tcp.upload` | p50 MB/s | retransmitted | RTO / recoveries | loss probes | card full |
|---|---|---|---|---|---|
| ToyOS, 16 ring | 36, 32, 31, 33 | 0, 1448, 0, 0 bytes | 0 / 0 | 7, 5, 2, 4 | 60,665–66,044 |
| ToyOS, 256 ring | 36, 36 | 0, 0 | 0 / 0 | 0, 3 | 7,183, 35,871 |
| Linux | 111, 112, 111, 111 | 0 segments | 0 / 0 | 0 | |

Loss is ruled out, and so is the ring's depth: a ninth of the full-ring waits at the same rate.

The ToyOS `send_limited` split at this revision is not a reading: it charges a Nagle hold to congestion
(review r2's blocker 1). It read user about 1.2 ms (12 ms in one run), window 0, congestion 7.0–14.0 s of
each row's 15 s.

# PR #1069, round 3: slow start growing per ACK, at afe0c7dac (2026-10-28)

Four ToyOS runs at `afe0c7dac` (16-descriptor ring, as main), interleaved with four Linux runs of osbench
built at the same revision (`session/`). Masked as round 1's. Same path.

| `lan.wired.tcp.upload` | p50 MB/s | resent | stops at cwnd | mean cwnd at a stop | mean SRTT at a stop | card full |
|---|---|---|---|---|---|---|
| ToyOS | 58, 59, 58, 59 | 2, 1, 3, 2 segments, 1, 1, 3, 2 D-SACKed | 430, 431, 416, 468 | 222, 228, 192, 194 KB | 5.8, 5.9, 4.5, 4.7 ms | 102,699, 102,537, 100,053, 106,424 |
| Linux | 111, 110, 112, 112 | 0 | | 1,706, 2,208, 1,960, 1,748 segments (TCP_INFO, a round's end) | 9.8, 11.7, 9.7, 10.2 ms | |

- ToyOS's 15 s rows were held by cwnd for 1.5–2.1 s, by the peer's window for 87–189 ms, and by the sender
  itself for about 1 ms; the rest was sending, or waiting for room on the card.
- Linux's (TCP_INFO, the five rounds summed): busy 15.0 s, held by the peer's window for 0.80–1.36 s, by
  the send buffer for none.
- The cwnd and SRTT means are the stop counters' sums divided by their counts; Linux's are each round's
  final TCP_INFO, averaged over five rounds.

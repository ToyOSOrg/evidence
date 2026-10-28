# PR #1075, round 1: what the T14's full transmit ring waits on (c54355277, 2026-10-28)

Two ToyOS runs of `osbench lan` with the transmit-ring counters (d2 rerun with the worktree at
`8f718357e`, the same code rebased). ToyOS boot logs cut to osbench's, the runner's and the I219's
inherited-register lines; no address, MAC or interface name.

| `lan.wired.tcp.upload` | p50 MB/s | full answers | ring full | unreported at a full answer | frames on the wire |
|---|---|---|---|---|---|
| d1 | 58 | 139,504 | 10.44 s of 15 | 0 (max 0) | 630,673 |
| d2 | 57 | 137,375 | 10.21 s of 15 | 0 (max 0) | 616,142 |

No frame was on the wire unreported at any full answer: the part sends what it holds at about 42,000
frames a second, and the ring sits full about 70 % of the row. The boot log's inherited TCTL,
0x3003f0f8, has MULR (bit 28) set, which the bring-up then cleared.

# PR #1069, round 1: the readings its records cite

The coordinator ran both sessions; the files are the coordinator's, masked. ToyOS boot logs are cut to
osbench's and the test runner's lines, and home paths in logs are replaced by `~`. The session files carry
no address, MAC or interface name. The path is the T14's I219 at 1000 Mb/s to the AMD bench's Linux
`osbench-peer` over its Wi-Fi.

## `aeba59fb0/`: main, 2026-10-24

The first interleaved session, four ToyOS runs and four Linux runs of `osbench lan` and `osbench
internet` (`toyos/`, `session/`, `session/compare.md`).
- `lan.wired.tcp.upload` p50: ToyOS 62, 63, 65 and 64 MB/s; Linux 113, 110, 111 and 112.
- `lan.wired.tcp.connect` p50: ToyOS 3.02, 2.05, 3.00 and 3.06 ms; Linux 1.24, 2.01, 1.97 and 1.28.

## `af239c8bb/`: the 256-descriptor transmit ring, 2026-10-27

Four ToyOS runs at `af239c8bb` (`toyos/t14-toyos-*`) interleaved with four Linux runs (`session/`), then
two runs of the same code with the stream region shrunk to 2 MiB (`region-2m.patch`,
`toyos/region-2m-*`).
- Upload p50: ToyOS 36, 36, 39 and 44 MB/s; Linux 112 in all four. Each ToyOS run's rounds spread from
  about 30 to 67 MB/s. This refutes the ring depth as the limit, and the ring was reverted.
- Connect p50: ToyOS 3.00, 3.00, 2.95 and 2.97 ms at the 8 MiB region; 2.03 and 2.06 at 2 MiB. Linux
  8.03, 1.93, 2.02 and 2.01; Linux minimums 1.08, 1.01, 0.98 and 1.28.

## `logs/`

- `ci-host-5.log`: `cargo run -- --ci host` at `132d5ef75`, exit 0.
- `linux-lan-local-132d5ef75.txt`: the Linux build staged for the next session, run against a peer on the
  same VM. It shows only that the rows carry the `stack_*` fields; its rates mean nothing.
- `linux-132d5ef75.SHA256SUMS`: that build's hashes.

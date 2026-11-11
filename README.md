# ToyOS against Linux, both benches, 2026-11-11

ToyOS at main `ad5db5a6527aad5ef8a37f9f7599dcbc69de6cee` against each bench's Ubuntu as installed (Linux 6.8.0-147), measured by `osbench` built from that revision for both systems. A labelled current-state comparison: it measures and fixes nothing.

- `t14/scoreboard.md`, `amd/scoreboard.md`: each bench's table, the rows behind Linux first.
- `<bench>/compare.md`: `osbench-compare`'s whole table over the runs, each run's p50 listed.
- `<bench>/linux-<i>.txt`, `toyos-<i>.txt`: every run's osbench lines (ToyOS's from the readback's kernel log).
- `<bench>/toyos-<i>.judge.log`, `.judge-clock.log`: the offline judge of each readback. `<bench>/chain.log`: the order run.
- `session/request.txt`: what was asked, with the rule, before any run. `session/sha256.txt`: images and binaries.
- `method/`: the mask and the script that turns a compare table into a scoreboard.

## What ran

Per bench, with the bench reserved: L1 T1 L2 T2 L3 T3 L4 T4 L5. A ToyOS run is one boot of the `osbench` metal row's image off the bench's NVMe; a Linux run is `timeout 2100 ./osbench all </dev/null` as the runner's user from its home. Every Linux run exited 0 and ran all 16 groups (190 to 250 s by its groups' own spans). Every boot ran all 16 groups to their end.

| | T14 (UTC) | AMD bench (UTC) |
|---|---|---|
| L1 | ended 07:53 | ended 07:55 |
| T1 | 08:03:07 to 08:06:27 | 08:05:50 to 08:09:10 |
| L2 | ended 08:12 | ended 08:15 |
| T2 | 08:22:27 to 08:25:47 | 08:24:54 to 08:28:15 |
| L3 | ended 08:31 | ended 08:34 |
| T3 | 08:40:53 to 08:44:14 | 08:44:17 to 08:47:38 |
| L4 | ended 08:49 | ended 08:53 |
| T4 | 08:59:42 to 09:03:02 | 11:39:49 to 11:43:09 |
| L5 | ended 11:41 | ended 11:48 |

**The host's network was down from about 09:00 to 11:35 UTC.** The T14's fourth boot ran in sequence, by its own log's clock, and was only read back at 11:37; its group spans equal the other three boots'. The AMD bench's fourth boot was lost to the outage and repeated at 11:39. So each bench's L5, and the AMD bench's T4, stand some three hours after the rest. No row's L5 or T4 value stands apart from its system's other runs for that; the compare tables list every run.

**The judge.** `boot:benchcase` selects the two rows of this boot (`osbench`, `clock_holds_over_minutes`: PASS in all eight) and two I219 rows of another boot that shares the label, whose job this image does not carry, so each `judge.log` ends exit 1 on those two alone. `clock_holds_over_minutes` judged by name exits 0 for all eight (`judge-clock.log`). The `osbench` filter also takes the energy boot, which did not run.

## The rule, set before the runs

A run's value is its p50. A row is **behind** or **ahead** when `osbench-compare`'s exact two-sided Mann-Whitney p is under 0.05, which with four boots against five runs means every run of one system beat every run of the other; **at parity** when it is not and the medians lie within 1.10; **unresolved** otherwise. Each p is its row's alone: about 1.6% of rows resolve by chance with no difference anywhere. One boot set a bench is a measured comparison of this revision, not a bound: nothing here is asserted by a test.

The hotness order is this scoreboard's own; the tree declares none. 0: what the manual's performance page names (build throughput, application launch). 1: paths every program pays per operation. 2: per-object paths. 3: the rest.

## Reading it

- **The AMD bench's Linux timed L1 to L3 through the HPET and L4, L5 through the TSC**, as each boot chose. An HPET timestamp costs about 1.2 µs, which every per-operation Linux figure of those runs carries, and its all-CPU rows read a third lower in them (`fair.shared.total` 3.3 M against 5.1 M chunks/s). The median of five is an HPET run's. The AMD table therefore carries a second ratio against the two TSC runs, which is the fairer reading and, at two runs, resolves nothing.
- **The T14's durable writes were slow in all four boots**, for the whole of `persist`: `write_4k_fsync` 6.49, 6.21, 6.57, 5.72 ms against Linux's 0.87 to 1.08 ms; `seq_write_fsync` 189, 201, 167, 175 MB/s against 574 to 597. The 2026-10-28 scoreboard read that mode in two boots of five.
- **The T14's `pingpong.futex.cross_core` read 257, 250, 257 and 4,573 ns** in its four boots, against Linux's 3,326 to 3,376. The row is bimodal per boot and unresolved; which mode is the round trip the row means is not established here.
- The T14's Linux `fair.apart.total` is bimodal per run (1.65 M and 2.39 M chunks/s), and `pingpong.pipe.same_cpu` ranges 2.9 to 7.0 µs, so neither resolves.

## Counts

- T14: 174 rows besides the clock gauges; 134 have a direction and both systems' values: behind 70, unresolved 5 (2 reading behind), at parity 7, ahead 52.
- AMD bench: 174 rows besides the clock gauges; 134 have a direction and both systems' values: behind 35, unresolved 15 (0 reading behind), at parity 8, ahead 76.

## Not measured

- **Not run yet**: `osbench_energy` on both benches and `osbench_lan` on the T14 (staged, the benches were taken).
- **Unsupported on ToyOS**: `net.*` (no loopback), `nvme.read.*` (no raw namespace for a program; Linux's needs root and was not run as root), `crunch.all.*` (no package temperature), `fair.session.*`, `lan.wifi.*`.
- **No row exists**: graphics (a frame's cost, a present, application launch to first frame) and audio against Linux; a build of real compiler work; a page-cache-cold file read; the first durable write after the drive idles.

## Masking

The identity group (PCI, USB, DMI, NVMe identity) is dropped from every run. The CPU model reads `<bench>-bench-cpu`, the disk model `masked`; paths, the bench's host name and the machine and firmware names in the judge logs are masked.

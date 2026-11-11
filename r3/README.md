# ToyOS #1234, round 3: the metal A/B and the T14 testcases boot, both at d8f9a490b

The boots measured d8f9a490b against its base 34cb4c918; the PR's head is now dafb2e860. Its descriptor calls' machine code equals d8f9a490b's but for S3's register save in `toyos_fd_acquire`'s loop (`r2/disasm/local-d8f9a490b-vs-s3.diff`). The images were staged with `--metal-readback` (`r1/metal-staging/`) and booted by the orchestrator. Every boot's driver verdict is `passed`.

## osbench A/B (`osbench/`, `ab-*.txt`)

The `osbench` row's benchcase image, 4 boots a side on each bench, booted base-head-head-base twice. `osbench/<side>/<bench>/boot-N.txt` holds each boot's verdict and its `bench=` lines. `tools/ab.py` turns them into `ab-t14.txt` and `ab-amd.txt`.

Review r1's criterion covers `pipe.*`, `ipc.*` and `fs.*read_4k*`/`write_4k*` on p50, the median of each side's four boots. No head row may be slower than base by more than base's own spread (the max minus the min of its four p50s), and none may exceed twice its machine's recorded value. The recorded value is the ToyOS median in `issues/toyos-against-linux-on-both-benches-the-scoreboard.md` for that bench, where the scoreboard lists the row. It lists only rows behind Linux, so some rows have no record.

- T14: 25 rows judged. None is slower beyond base's spread, and none is over twice its record.
- AMD: 25 rows judged. None is slower beyond base's spread, and none is over twice its record.

The gains, as head over base medians:

| row | T14 | AMD |
|---|---|---|
| `pipe.throughput.64` | 114.5 -> 139 MB/s (+21%) | 114 -> 144.5 MB/s (+27%) |
| `pipe.throughput.256` | 435.5 -> 528 MB/s (+21%) | 461 -> 558.5 MB/s (+21%) |
| `pipe.throughput.1024` | 1595.5 -> 1841.5 MB/s (+15%) | 1770.5 -> 2167.5 MB/s (+22%) |
| `pipe.throughput.4096` | 4873.5 -> 5362 MB/s (+10%) | 3016 -> 3034 MB/s (+1%, within spread) |
| `fs.mem.read_4k_at` | 1039 -> 972.5 ns (-6%) | 1477.5 -> 1383 ns (-6%) |
| `fs.disk.read_4k_at` | 1060 -> 966.5 ns (-9%) | 1463 -> 1357.5 ns (-7%) |
| `ipc.reqrep.8` | 6186 -> 6113 ns (-1%) | 6912.5 -> 6983 ns (+1%, within spread) |

## T14 `testcases` shared boot (`testcases-t14-d8f9a490b/`)

The driver's verdict is `passed`. `jobs.txt` is every job's start and end marker. Of 256 jobs that ended (`reboot` ends the boot), 251 exit 0. The other five:

- `test_rs_wake_onto_busy` exit 36: its code is its p99 in µs, and its row passes under 1000 µs.
- `test_rs_served_file_offset` exit 101 and `206_libc_refusals` exit 1: main's stale tests. The first asserts that `spawn(None)` is refused `InvalidArgument`, where #1189 refuses it in the SDK. The second expects `_SC_ARG_MAX: 65536`, where #1200 answers 2093056 (`job-*.txt`). #1219 updates both and passed them on the T14. They failed alike in #1204's testcases boot, before this change existed. Neither path goes through the descriptor table.
- `test_rs_usbd_spare_vector` exit 101: "the function has no MSI-X capability", the AMD-bench row judged on the T14 (`issues/a-metal-row-names-no-machine-so-another-benchs-boot-carries-it.md`).
- `test_rs_i219_msi` exit 1: "the burst never filled the ring, or the transmit wake it asked for never came", with 1 frame on the wire. This is the recorded network-dependent outcome (`issues/the-intel-nics-room-and-wake-are-unread-on-hardware.md`, `issues/i219-msi-passes-only-when-the-network-sends-it-a-frame.md`).

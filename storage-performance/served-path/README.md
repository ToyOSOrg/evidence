# Where a DATA stat and open spent their time (QEMU/KVM probe)

A scratch probe (`probe.patch`, never for landing) times every request the file
server answers, by op code, and counts the engine's dirent lookups and inode reads
the DATA volume makes for it; a QEMU row boots the bench image with
`osbench_persist` alone, on the profile whose disk carries a designated DATA
partition. `cargo test --test toyos-build -- probe_osbench_files` on the x86 guest
host (KVM), one run each:

- `before-path-fix.txt`: the probe on 3f5f7b218 (ecf8c799c).
- `directory-cache.txt`: on the first cut of the fix (c0e0aa454): directories
  remembered, STAT still resolving its name twice.
- `final-path-fix.txt`: on the final fix (60a85af0d): every name remembered, STAT
  and OPEN resolving the name once.

Op codes: 2 OPEN, 4 CLOSE, 8 WRITE, 12 STAT, 20 UNLINK. Each `PROBE` line is the
mean over 1000 requests. Client p50s are osbench's `fs.disk.*` lines.

| | before | directories | final |
|---|---|---|---|
| STAT server mean | 41.7 us, 11 lookups + 4 inodes | 13.8 us, 2 + 2 | 5.2 us, 0 + 1 |
| fs.disk.stat p50 | 58.4 us | 30.9 us | 24.3 us |
| fstat (round trip, no engine) | 17.0 us (server 2.7) | 16.9 us | 17.1 us |
| OPEN server mean | 52.5 us, 14 + 5 | 25.0 us, 4 + 4 | 11.0 us, 0 + 3 |
| fs.disk.open_close p50 | 78.4 us | 50.2 us | 36.4 us |

One STAT is one request from the client in both trees; main's answered the same
request from a map in memory. The extra time was the server resolving the same
path four times through the engine, from the root each time.

Each run ends with `fs.disk.setup refused=the_volume_is_full`: QEMU's DATA is 128
MiB, and the 16 MiB setup file, written in 1 MiB calls, holds a transaction's
metadata credit for each reserved 4 KiB block until it is written back, as the
per-page reservations before it did. The rows above ran before it.

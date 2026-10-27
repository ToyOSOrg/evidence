# PR 1067: an fsync of a clean file asks the disk for nothing

Change: ToyOS 991f08d9a654ab872ccdc55eec37205277e72e4b on base aeba59fb0. Host: macOS (aarch64). Paths are masked.

| Check | Command | Exit | Log |
|---|---|---|---|
| Host CI | `cargo run -- --ci host` | 0 (103 steps green) | logs/ci-host-991f08d9a.log |
| Guest, x86-64 QEMU | `cargo test --test toyos-build -- the_log_lands_on_the_boot_stick` | 0 | logs/guest-log-lands-991f08d9a.log |
| Shipping image | `cargo run -- --build-only` | 0 | logs/build-only-991f08d9a.log |
| T14 readback staging, no machine touched | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/t14 osbench` | 2 (Verdict::Staged by design) | logs/metal-readback-991f08d9a.log |

Negative controls, each a patch in patches/ applied to 991f08d9a, built, run with `cargo test -p fileserver --lib` and reversed:

| Mutation | Exit | Red test |
|---|---|---|
| m1: the cache always asks the disk to flush | 101 | cache flush-debt test and the FAT clean-sync test |
| m2: a refused flush clears the debt | 101 | cache test, "a refused flush is owed with no block dirty" |
| m3: no debt at mount | 101 | cache test, "the first flush asks the disk" |
| m4: level ignores `dirty` | 101 | FAT test, "a sync with nothing changed wrote or flushed the disk" |

Disk-request probe (patches/probe.rs, a temporary test appended to fat.rs): base (the change reversed) against the change, exit 0 for both. It prints writes and flushes per sync for a clean sync, a 4 KiB overwrite and a 4 KiB append, with a second dirty-then-synced file open. Logs: logs/probe-base.log and logs/probe-change.log.

## Review r1: head 211829921 on main 8348c2a2c

The branch was rebased onto 8348c2a2c, and this commit adds the review fixes.

| Check | Command | Exit | Log |
|---|---|---|---|
| fileserver host tests | `cargo test -p fileserver --lib` | 0 | logs/fileserver-r1.log |
| m4r1: level drops the `dirty`/`needs_reconcile` check | patches/m4r1.patch, `cargo test -p fileserver --lib`, then reversed | 101 (FAT clean-sync test red) | logs/neg-m4r1-211829921.log |
| Host CI | `cargo run -- --ci host` | 0 (103 steps green) | logs/ci-host-211829921.log |
| Guest, x86-64 QEMU | `cargo test --test toyos-build -- the_log_lands_on_the_boot_stick` | 0 | logs/guest-log-lands-211829921.log |
| T14 readback staging, no machine touched | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/t14 osbench` | 2 (staged) | logs/metal-readback-211829921.log |

The earlier T14 run was invalid: it was flashed by the pre-#1064 tool onto the wrong stick. No timing evidence exists yet.

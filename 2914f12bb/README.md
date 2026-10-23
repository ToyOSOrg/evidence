# PR 1031 round 2 at 2914f12bb (base d2b2b6949), macOS aarch64 host

| check | command | exit |
|---|---|---|
| lifecycle host tests | `cargo test -p toyos-supervisor` | 0 (16) |
| host CI | `cargo run -- --ci host` | 0 (101 steps) |
| image | `cargo run -- --build-only` | 0 |
| QEMU x86-64 | `cargo test --test toyos-build -- a_host_disk_beside_the_stick_is_left_alone nvme_disk_boots the_log_lands_on_the_boot_stick` | 0 (3/3) |
| metal staging | `cargo test --test toyos-build -- --metal --metal-readback <dir> nvme_leaves_the_benchs_disk_alone` | 2 (Staged by design) |

Control c5: `c5-session-line-unparsed.patch` rewords blockserve's session line so the judge parses none.
- With the new judge: QEMU host-disk test exit 1, "no nvme driver opened a session, so none was seen on DATA".
- c5b, with `judge-fix.patch` reverted (the round-1 judge): exit 0, the vacuous pass the review named.
Both mutations reverted in the same command. Home paths masked as `~`.

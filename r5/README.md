# #1123 rebased onto c1218e845 (#1104), head 82237eac5492eefad357d963efc85ffbc44d49b0

- host-ci.log: `cargo run -- --ci host`, rc=0, 108 steps green. The rebase renumbers the paged syscalls 153-158 (bins 160) above #1104's SYS_CLOCK_NOW 152; nothing else changed.

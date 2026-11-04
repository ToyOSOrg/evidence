# ToyOS #1164, the re-review blocker, at 12e913653

Masked as in `supervised-claims-r1/`.

| file | command | revision | result |
|---|---|---|---|
| `sc-r4-unit.log` | `cargo test -p toyos-supervisor` | `12e913653` | exit 0; `only_a_disk_driver_starts_inside_storages_window` among 8 `declaration` tests |
| `mutation-window-1.{patch,log}` | that test, with disk drivers held back inside the window, then restored | same tree | exit 101: "a disk driver that ends inside the window is the homes' way to disk" |
| `mutation-window-2.{patch,log}` | that test, with every `drives` row let into the window, then restored | same tree | exit 101: "a drives row inside the window starts before its home" |
| `sc-r4-ci-host.log` | `cargo run -- --ci host` | `12e913653` | exit 0, 109 green |

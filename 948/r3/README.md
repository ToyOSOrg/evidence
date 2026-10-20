# PR #948, merge of origin/main 4225780c3 (#953, #954) at 7b77570b9

Paths are masked: `$DEV` is the parent of the worktree, `$HOME` the user's home.

| file | command | exit | revision |
|---|---|---|---|
| ci-host.log | cargo run -- --ci host | 0 (87 steps) | 7b77570b9 |
| build-x86_64.log, build-aarch64.log | cargo run -- --build-only [--arch aarch64] | 0, 0 | 7b77570b9 |
| qemu-x86_64.log | cargo test --test toyos-build -- nvme_disk_boots machine_shutdown_short_stop hda_plays_to_the_controller_that_reaches_an_output | 0 (3 passed) | 7b77570b9 |
| neg7.patch/.log | git apply neg7.patch (drop PermissionDenied from Why::of_lent); cargo test -p toyos-pci-claim; git apply -R | 101 (red, intended) | 7b77570b9 |

PR #963 round 1, tree 191dd46186d0f44736a6bc5e0e510ed74c16fbd0, host macOS aarch64.
- ci-host.log: `cargo run -- --ci host`, EXIT=0
- build-x86_64.log / build-aarch64.log: `cargo run -- --build-only --arch <a>`, EXIT=0 each
- guest-pr1.log: `cargo test --test toyos-build -- nvme_disk_boots` (QEMU x86-64), EXIT=0
Paths masked: <tree> worktree, ~ home, <tmp> temp.

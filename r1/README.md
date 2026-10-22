# ToyOSOrg/ToyOS#1001, round 1

Every check ran at the committed head `fb8a96facee9a3b35d386f1293520d04445f427d` on `c36253222`, with a clean tree before and after (`checks.txt`). Masked: `~` home, `<user>` a personal name, `$TMPDIR`, `<checkout key>`.

| file | command | exit |
|---|---|---|
| libc-copies.log | `cargo test -p toyos-libc-copies` (signal dispositions, error texts against `errno.h`) | 0 |
| mutations/ | a handler kept rather than refused; a code `errno.h` defines left without text: each applied, tested, reverted | 101 each |
| ci-host.log | `cargo run -- --ci host` | 0 |
| build-x86.log, build-aarch64.log | `cargo run -- --build-only [--arch aarch64]` | 0, 0 |
| guest.log | `libc_children console_image_boots nvme_disk_boots` | 0 (3/3) |
| metal-staging/ | the testcases image: `std_fs` and the 141 corpus cases of `corpus.txt`, `213_honest_answers` among them | 2 = staged, 1 image, not run |

`checks-attempt1-red.txt` and `ci-host-attempt1-red.log` record the first run, at the head before `fb8a96fac`: clippy was red on an unused constant, which the host test now reads.

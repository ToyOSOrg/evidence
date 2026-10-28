# PR 1107, round 1

Host: a Linux x86_64 machine with KVM, Arch Linux, QEMU 11.1.2. Paths are masked as
`/home/<user>`. Each run used a fresh detached worktree with an empty `target/`.

- `20261028T191522Z-e4bdb0a5d633a5fa0166d7b7f1f49286d1fdcd59.log`: `cargo test --test toyos-build`
  at `e4bdb0a5d633a5fa0166d7b7f1f49286d1fdcd59`, exit 1, 82 passed and 2 failed of 84.
  `the_log_lands_on_the_boot_stick` stalled waiting for `stick_load: line 1500 ` with the guest at
  line 36806 and 18767 console lines read.
- `20261028T193240Z-main.log`: `cargo test --test toyos-build -- virt_reboot_refused_without_psci
  the_log_lands_on_the_boot_stick` at `a5b330f392caa6342b324c00681587f09d35a19e`, exit 0.
- `ci-host.log`: `cargo run -- --ci host` on macOS at the PR head `bc280b4bbb3972dce0dfaaf79130f78e856b84af`.

CI sightings (public): nightly runs 40075324820, 40291133102 and 40661873043, job `kvm / suite`.

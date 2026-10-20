# PR #948 review round

Head a597bb04a83993d10a0ad051a646e2431a3c3fdb (33bc10b58 review fixes, merge of main 0e6716fc0, a597bb04a soundserver fix).

| file | command | exit | revision |
|---|---|---|---|
| neg5.patch/.log | drop Why::of's Io => Faulted arm; cargo test -p toyos-pci-claim | 101 (red, intended) | 33bc10b58 |
| neg6.patch/.log | make from_code read 29 as Gone; cargo test -p toyos --lib fs:: | 101 (red, intended) | 33bc10b58 |
| ci-host-r3.log | cargo run -- --ci host | 1: soundserver (semantic conflict with main, fixed in a597bb04a) and build llvm env test | 9f8ca81e2 |
| ci-host-r4.log | cargo run -- --ci host | 1: 1 of 86 red, build llvm env test only (host: Xcode git shim under SDKROOT=/no/such.sdk; branch changes nothing under build/) | head |
| build-x86_64-r3.log, build-aarch64-r3.log | cargo run -- --build-only [--arch aarch64] | 0 | head |
| qemu-x86_64-r3.log | cargo test --test toyos-build -- nvme_disk_boots machine_shutdown_short_stop | 0 | head |

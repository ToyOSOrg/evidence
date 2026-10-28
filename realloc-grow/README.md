# PR 1070: growing a large allocation without copying it

Branch `realloc-grow`; base aeba59fb0. Paths, the host name and temp directories are masked.

- `linux-disasm/`: osbench's `realloc_grow` loop in the Linux build (`x86_64-unknown-linux-musl`, nightly-2026-07-22, profile `toyos`).
  - At aeba59fb0 the loop calls only `Instant::now`.
  - With the `black_box` fix it calls `__rust_alloc`, `memset`, `__rust_realloc` and `__rust_dealloc` (`fixed-call-targets.txt`). That binary is unchanged at 204243e7f (a no-op rebuild, sha256 2e47f53a11e4f53b...).
- `qemu/`: rust-tests and corpus jobs run by name in the harness's `--debug` guest (`tests/images/testcases.toml`, QEMU x86-64 q35, TCG, 2 vCPUs, 4 GiB). The guest was released by clearing `DEBUG_WAIT` over the gdb stub.
  - `aeba59fb0+kernel-mmap_stress.txt`: the kernel primitive and the first version of the guest test, before the allocator change.
  - `151e90a0a-*`: the first commit.
  - `204243e7f-tree-*`: the C case.
- `control/`: the promise-leak mutation (`m2-promise-whole-length.patch`, applied onto 204243e7f and reverted in the same run), and `mmap_stress` reddening on it. Memory in use grew 536870912 B, which is 32 moves x 16 MiB.
- `ci/ci-host-204243e7f.log`: `cargo run -- --ci host`, exit 0. `ci-host-1-diskfull.log` is an earlier run whose only failures were the host disk filling up (`No space left on device`), kept because the PR mentions it.

## Round 2 (review r1)

- `t14-204243e7f/`: the coordinator's T14 readbacks at 204243e7f. MACs, IPv4 addresses and UUIDs are masked.
  - `benchcase`: osbench, all groups. Verdict: passed.
  - `testcases`: `allocator_stress`, `mmap_stress` and `215_large_realloc`. Verdict: passed. This is the retry; the first attempt failed in main's flasher read-back race.
  - `linux-mem-{1,2}.txt`: the bench's Linux running the fixed osbench (sha256 2e47f53a...).
- `qemu-dcb6c7855/`: `allocator_stress`, `std_alloc`, `std_mmap`, `215_large_realloc` and `mmap_stress` at dcb6c7855, in the same `--debug` guest as before. All exit 0.
- `ci/ci-host-dcb6c7855.log`: `cargo run -- --ci host`, exit 0, 103 steps.

## Round 3 (merge of main 0e7ecd0c8, ea7bbb1b7)

- `qemu-ea7bbb1b7/`: `mmap_stress`, `allocator_stress` and `215_large_realloc`, all exit 0.
- `ci/ci-host-ea7bbb1b7.log`: host CI, exit 0, 104 steps.

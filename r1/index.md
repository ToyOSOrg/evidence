# pr-1237 r1: ToyOS 4a9e332e8e70d5feefbe72820e2869bfcb26cdbe

| File | Command | Target | Exit |
|---|---|---|---|
| `host/checks.log` | `cargo test -p toyos --lib dl` | host (aarch64-apple-darwin) | 0, 21 passed |
| `host/checks.log` | `cargo test --test toyos-checks` | host | 0, 44 passed (`suite_split` among them) |
| `host/checks.log` | `cargo clippy -p toyos --all-targets -- <adopted lints> -D warnings` | host | 0 |
| `host/checks.log` | `cargo clippy -p toyos-build --all-targets -- <adopted lints> -D warnings` | host | 0 |
| `host/checks.log` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-b boot:testcases` | x86-64 images, no machine | 2 = staged, nothing measured |
| `guest/virt_jobs_at_el2-run43046428666.log` | guest-rows dispatch, filter `virt_jobs_at_el2` (run 43046428666) | AArch64 QEMU job case, emulated | success; `relro_sealed` line present |
| `metal/request.txt` | the staging's request: the T14's `testcases` shared boot (the `testcases-watchdog` boot came with `loader_watchdog_arms` and is not needed for this PR) | T14 | not yet run |
| `control/relro-unsealed.patch` | the negative control: `seal()` not called (branch `executable-relro-read-only-mut`, 6e1dcac0f) | | its guest run is queued |

Host paths, user and host names are masked (`<scratch>`, `<home>`, `<user>`, `<host>`); the guest runner's CPU model is `<cpu-model>`.

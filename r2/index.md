# pr-1237 r2: review round 1, ToyOS b2172a8d6 (comment, manual and host-test edits on 4a9e332e8)

| File | Command | Target | Exit |
|---|---|---|---|
| `guest/virt_jobs_at_el2-mut-run43046434572.log` | guest-rows dispatch, filter `virt_jobs_at_el2`, on `executable-relro-read-only-mut` (6e1dcac0f: `seal()` not called; `r1/control/relro-unsealed.patch`) | AArch64 QEMU job case, emulated | failure, as the control must: `relro_sealed`'s holder asserts "a store to PT_GNU_RELRO did not end the program as a memory fault (exit status: 0)", its storing copy prints "the store to PT_GNU_RELRO landed", and every other job of the case ends exit=0 with its line, `abuse_readonly_copyout` after it included |
| `host/checks.log` | `cargo test -p toyos --lib dl` at b2172a8d6's tree | host (aarch64-apple-darwin) | 0, 21 passed |
| `host/checks.log`, `control/header-start-not-subtracted.{patch,log}` | the new case's control: `executable_relro` without the header segment's start subtracted, applied, tested, restored | host | 101: `an_executables_relro_pages_are_counted_from_its_header` fails at the new case (`Ok(Some((4096, 4096)))` against `Ok(Some((0, 4096)))`) |
| `host/checks.log` | `cargo clippy -p toyos --all-targets -- <adopted lints> -D warnings` | host | 0 |

Host paths, user and host names are masked; the guest runner's CPU model is `<cpu-model>`.

# pr-1243 r6: the guest boot of 8d57dcf87, and the rebase onto main 3b93f3770 (head 003c0e3e2)

| File | Command | Revision | Exit |
|---|---|---|---|
| `guest/std_threads-run43082719564-8d57dcf87.log` | guest-rows dispatch, filter `std_threads_count_the_cpus_and_give_back_ended_threads --nocapture` (run 43082719564) | 8d57dcf87 | success. No `EARLY PANIC`, no `mitigation:` panic, no "recorded no words". cpu0's `mitigations: cpu0 words … hypervisor=true smt=false … mcu_opt_ctrl=- de_cfg2=- c001_1029=- c001_1029_found=-` and its 17 lines; the second vCPU logs none, being alike. The row passes with 2 CPUs |
| `host/a-r6.log` | `cargo test --test toyos-checks`; `cargo clippy -p toyos-build --all-targets -- <adopted lints> -D warnings`; `cargo test -p kernel --lib mitigation`; `cargo clippy -p kernel --target x86_64-unknown-none -- <adopted lints> -D warnings` | 003c0e3e2 on 3b93f3770 | 0 each: 52 passed; 19 passed |
| `host/range-diff.txt` | `git range-diff e558cc153..8c203f6e8 3b93f3770..003c0e3e2` | | commits 1–4 differ in context lines only (main's `copies_go_down` arm beside the `boot.rs` hunk; `microcode_on_metal`'s new `bench` argument beside the metal row); 5 is equal; 6, `003c0e3e2`, is new and touches only `tests/toyos.rs` |

The kernel's own change is the same across the rebase: `git diff -U0 e558cc153 8c203f6e8 -- kernel` and `git diff -U0 3b93f3770 003c0e3e2 -- kernel` add and remove the same 1799 lines in the same 7 files. 8c203f6e8 differs from 8d57dcf87, which the guest booted, only in two comments and a `#[cfg(test)]` assertion (r5).
Host paths, user and host names are masked; the runner's CPU model is `<cpu-model>`.

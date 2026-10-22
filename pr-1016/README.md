# #1016: one SHA-2, toyos-crypto's

Head be8ac5caa, on main 18a38738b. 55ecebe1e only names the PR in the issue.

- `ci-host.log`: `cargo run -- --ci host` at be8ac5caa. Exit 0, 93 steps green.
- `ci-host-first-red.log`: the run at the commit before the rebase, on #993's branch. RED on the loader's clippy step only: the crate's `unsafe` code built for UEFI lacked `SAFETY:` comments, which that step's `undocumented_unsafe_blocks` requires. The comments were added before the rebase (`ci-host.log`).
- `consumer-tests.log`: `cargo test -p toyos-update --features toyos-update/sign -p toyos-swap -p pkg -p toyos-icon -p toyos-crypto`. Exit 0, run before the rebase; #1015 touched only ChaCha20.
- `build-x86_64.log` and `build-aarch64.log`: `cargo run -- --build-only`, for each `--arch`. Both exit 0.
- `qemu-bent-supervisor.log`: `cargo test --test toyos-build -- a_bent_supervisor_is_refused_and_the_other_slot_boots`. PASS: the loader's SHA-256 refuses the bent slot's section and boots the other.
- `controls/aarch64-m{1,2}.patch|log`: on the Mac, SHA256H2 fed the new ABCD instead of the old (m1), and SHA512H's (D, E) operand swapped (m2). Each makes `hash::tests::dispatched_compression_matches_the_portable_rounds` fail (exit 101). Both were reverted in the same run, and the test passes again.
- `mac-shabench*`: exploratory, an M4 Pro under load, best of 7, from a scratch program (`mac-shabench.rs`) built with and without the crate's `portable` feature.
- `metal-request.txt` and `sha-parity-probe.patch`: the staged T14 and AMD boots that set toyos-crypto's SHA-256 beside toyos-sha2-hw's in `crypto_parity`, against ring. The probe is never landed.

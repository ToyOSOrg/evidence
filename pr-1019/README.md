# #1019: the image signature on toyos-crypto's Ed25519

Code at 69245a231; 269e38913 names the PR in the issue.

- `ci-host.log`: `cargo run -- --ci host` at 69245a231. Exit 0, 93 steps green.
- `controls/accept-all.patch|log`: `sig::verify` made to accept every signature. `lib/update/tests/ed25519_oracles.rs` fails (exit 101). The patch was reverted in the same run.
- `build-{x86_64,aarch64}.log`: `cargo run -- --build-only --arch …`, both exit 0.
- `qemu-bent-supervisor.log`: `cargo test --test toyos-build -- --nocapture a_bent_supervisor_is_refused_and_the_other_slot_boots`. PASS on QEMU's x86-64 and AArch64 machines. The loader's lines show both slots' signatures verifying with the crate, with the new tick count. QEMU's counter says nothing about speed.
- `speccheck-verdicts.txt`: the twelve "Taming the many EdDSAs" cases, read by a scratch program. Each case shows the crate's result (a refused key printed as its error), `dalek`'s `verify_strict` and ring. The crate's verdict equals `verify_strict`'s on all twelve; ring accepts cases 0, 1, 2 and 11.
- `metal-request.txt`: the staged T14 and AMD boots, shared with #1016. Each bench's loader log gives stage 6's verification time.

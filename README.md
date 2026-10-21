# Evidence for ToyOS PR #957: a process's end says how

- `host/`: `cargo run -- --ci host` at cbcf3f9f9 (the branch before main was merged) and at 05bf6c9bc (its head after the merge), both exit 0.
- `image/`: `cargo run -- --ci image` at 05bf6c9bc, exit 0.
- `virt/`: AArch64 QEMU `virt` rows. The first run had two reds, both test expectations, which were then fixed; then the rerun, and the head run.
- `control/`: the AArch64 negative control (every fault read as memory, `virt_claim_lpi` red) and the patch for the T14 negative control (a kill published as exit 137).
- `metal/`: the T14 requests as staged. Not run by the implementer.

Round 2 (review fixes): host at the head 3dd7cc436; the red host run at f86e2df47 (sshserver cfg); image and AArch64 virt at f86e2df47; the T14 request re-staged; the T14 readings of the mutant (red as required) and of fault_gates at 3efa38eb7.

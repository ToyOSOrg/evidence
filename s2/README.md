# S2: the link hop's cost on the T14 (a scout, never landing)

Job `test_rs_s2_link_hop` at f2ceadc7a (local branch `s2-link-hop` off #1106, never pushed; its source is `s2_link_hop-f2ceadc7a.patch`). Two child processes share one `toyos-link` region and connection. They move 2^18 frames of 1,514 bytes, each side copying each frame once through `toyos::shm::Bytes`, with a doorbell after every batch of 1, 8 or 32. "rx" is driver to stack, "tx" is stack to driver.

The CPU cycles per frame are both processes' `cpu_ns` from the kernel's process stats, converted to TSC cycles at the run's own measured TSC rate. That is the hop's cost on one CPU. The elapsed cycles per frame run from the producer's first frame to the consumer's last; the two processes ran on two CPUs at once, since ToyOS has no CPU pinning.

| Log | Command | Revision | Exit |
|---|---|---|---|
| s2-smoke-1.log | `cargo test --test toyos-build -- s2_link_hop_smoke` (QEMU; completion only) | f2ceadc7a | 0 |
| request.txt | `--metal --metal-readback <dir> s2_link_hop` (staged) | f2ceadc7a | 2 |
| metal-s2-judge.log | the orchestrator's T14 boot (rc=0), judged with the same command | f2ceadc7a | 0 |

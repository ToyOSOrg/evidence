# PR #1056 evidence: ChaCha20-Poly1305 and OpenSSH in one stitched AVX2 pass

Text only; paths masked (`<scratch>`, `<worktree>`). Binaries are not published: they embed development-host paths.

- `r1/`: round 1 on the T14 and the AMD bench (`amd/`, `t14/` are the bench outputs as returned): six probe
  variants, the lib and differential tests at fe9a2f22b. `README.txt` is the run sheet, `SHA256SUMS` the binaries'
  hashes, `v-*.patch` the variants against fe9a2f22b, `work-r1-A.diff` fe9a2f22b against main b48c7dd9d.
- `r2/`: the round-2 run sheet and hashes (head 2c00ebbdc against main), outputs appended when returned.
- `vm/`: QEMU TCG (AVX2, BMI2, no AVX-512) under Alpine's 6.6 virt kernel, the test binary as /init (`vm.sh`,
  `initramfs.py`), at 2c00ebbdc: lib, vectors, Wycheproof, differential, the probe's agreement checks, and each mutant
  (`vm-mutant-*.log`). Correctness only.
- `mutants/`: the eleven patches (`mutants.py` writes them).
- `parts.rs`: the probe's additions (keystream and Poly1305 rows, the clock line).
- `inspect/uops-zen2-tgl.txt`: uops.info's measured ports and throughput for the instructions the kernels use.

## Round 2 (head 2c00ebbdc) and the rebase (035c36d30)
- `r2/{amd,t14}/`: the probes (main against 2c00ebbdc), the unit and differential tests, and the eleven mutants'
  unit tests, as the benches returned them. Every mutant exited 101 on both benches.
- The round-2 metal readbacks (cryptocase, cryptoctcase) are not here: the staging directories were deleted before
  they were published. What was read from them: `crypto_instrument` failed on both benches at
  `crypto_parity.rs:648` (the guest test still asked a refused ChaCha20-Poly1305 record to be left as it was), in
  `agrees_with_ring_at_every_length` before any row was timed; `crypto_secret_timing` passed.
- `vm/*-035c36d30.log`: the suites at the rebased head on the AVX2 VM; `r2/qemu-crypto-instrument-035c36d30.log`:
  the parity instrument under QEMU with the fixed assertions (78 rows in each build).
- `r3/`: the optional AMD run sheet on seal at 1 KiB, and its two variant patches.

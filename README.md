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
- **Round 2's metal readbacks are lost.** The staging directories (`kernel.log`, `judge-g.log` of `cryptocase` and
  `cryptoctcase` on both benches) were deleted before they were published, and no copy exists.
  - What was read from them before deletion: `crypto_instrument` failed on both benches at `crypto_parity.rs:648`
    (the guest test still asked a refused ChaCha20-Poly1305 record to be left as it was), in
    `agrees_with_ring_at_every_length` before any row was timed.
  - The round-2 `cryptoctcase` pass on both benches at 2c00ebbdc rests only on the orchestrator's judge summary
    ("1 passed, 1 failed, 2 boot(s)", `crypto_instrument` the failure). No readback here supports it.
- `vm/*-035c36d30.log`: the suites at the rebased head on the AVX2 VM; `r2/qemu-crypto-instrument-035c36d30.log`:
  the parity instrument under QEMU with the fixed assertions (78 rows in each build).
- `r3/`: the optional AMD run sheet on seal at 1 KiB, and its two variant patches.

## Round 3 (head 035c36d30)
- `r3/metal/{t14,amd}/`: the `cryptocase` readbacks (kernel.log, loader.log, boot.txt, verdict.txt, the image's
  system.toml) and each judge's log; paths and the AMD bench's host masked. `crypto_instrument` passed on both
  ("1 passed, 0 failed, 1 boot(s)").
- `r3/amd/`: the optional seal probe: the head and the two variants (`r3/v-*.patch`), head run twice.

## Review r1 fixes (head ca676da20)
- `r4/inspect/chacha20_poly1305-ca676da20.s`: the AVX2 one-pass kernel and `keystream`, from the head's Linux probe
  build. 40 MULX, no MUL. The bulk loop runs 0x30404e..0x3051e5; the only calls inside that range are on the tail
  branch, `keystream` and `block::xor`, once per message. The full-batch path calls nothing. The other calls
  (`Poly1305::update`/`update_padded`, the panic paths through the GOT) lie outside the loop.
- `r4/vm/`: the one-pass test on QEMU TCG. `vm-w8-max.log` has AVX2 and BMI2 and passes. `vm-w8-nobmi2.log`
  (`-cpu max,-bmi2`) fails by name: "this host's CPU lacks AVX2 or BMI2". The control, `vm-035c36d30-nobmi2.log`, is
  the old test on the same CPU: it dies on an invalid opcode.
- `r4/request-{t14,amd}.txt`: the `cryptoctcase` boots staged at ca676da20, whose instrument now times
  ChaCha20-Poly1305 and OpenSSH at 1 KiB.
- `r4/README-probe.txt`, `r4/v-short-first.patch`: the optional AMD probe on 0–192 B through `short()` first.

## Round 4 (head ca676da20)
- `r4/metal/{t14,amd}/`: the `cryptoctcase` readbacks (kernel.log, loader.log, boot.txt, verdict.txt, system.toml)
  and the judge logs, masked. `judge-t14.log` and `judge-amd.log` are the verdicts: `crypto_secret_timing` passed,
  "1 passed, 0 failed, 1 boot(s)" each. `judge-g.log` is the orchestrator's first judge, run with the wrong rows; it is
  kept as returned and decides nothing.
- Every ChaCha20-Poly1305 and OpenSSH row passes on both benches at 64 B and, newly, at 1 KiB (the stitched paths):
  max |t| 0.59–2.93. The leaky control leaks and the null control passes (kernel.log `ct` lines).
- `r4/amd/`: the optional short-first probe, head against `short()` tried first, alternated twice.

## Correction (review r2)
- The listing in `r4/inspect/` holds 20 MULX and 4 IMUL (h2·r0) in each of `chacha20_poly1305` and `keystream`,
  and no MUL. The "40 MULX, no MUL" above summed both functions and left out the IMULs.

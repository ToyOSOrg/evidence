# PR 1085: ToyOS designates its own DATA partition

Logs and negative controls; paths masked to `<home>` and `<tmp>`.

- `spec-PROVENANCE.txt`: UEFI 2.10 chapter 5 provenance, the quotes relied on,
  and the bench sector counts read from earlier boot logs.
- `logs-*`: host tests, the image build, the QEMU run, the metal staging.
- `controls-*`: each negative control as a patch and its run.

Round 1, continued:
- `logs-ci-host-r0.log`: `cargo run -- --ci host` at `a72018eb9`, exit 1: the
  uncovered designation image and a redundant clone, both fixed in `33617eeff`.
- `logs-ci-host.log`: `cargo run -- --ci host` at `fe22e03c6`, exit 0, 105 steps green.
- `logs-build-only.log`: `cargo run -- --build-only` at `fe22e03c6`, exit 0.
- `controls-usbd-floored-count.*`: the floored count put back; the tail-read test reds.

Round 2 (review r1), at `0343c0aa8`: `r2/`: host CI exit 0 (105 steps), image build exit 0, the QEMU pair exit 0, per-crate host tests, the login-gate control (reds without the check), and both benches staged (exit 2, staged).

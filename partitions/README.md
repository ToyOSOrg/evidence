# PR 1085: ToyOS designates its own DATA partition

Logs and negative controls; paths masked to `<home>` and `<tmp>`.

- `spec-PROVENANCE.txt`: UEFI 2.10 chapter 5 provenance, the quotes relied on,
  and the bench sector counts read from earlier boot logs.
- `logs-*`: host tests, the image build, the QEMU run, the metal staging.
- `controls-*`: each negative control as a patch and its run.

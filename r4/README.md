# PR #1094 round 4: the scratch survey only on scratch cycles; write:scratch stated

Head ed155ea36274c1feef512d6eaafc25d2cfe40527. Paths masked as in r3.

| file | command | exit |
|---|---|---|
| host/metal-unit.log | `cargo test -p toyos-metal --lib` (86) | 0 |
| host/checks-metal.log | `cargo test --test toyos-checks -- metal_` (24, the new `metal_only_a_scratch_load_boot_cycles_the_scratch_disk` and the judges among them) | 0 |
| host/m3-every-boot-cycles.{patch,log} | negative control: `Batch::cycles_the_scratch_disk` true for every boot with a job; the new check | 101 |
| host/clippy.log | `cargo clippy -p toyos-build -p toyos-metal -p toyos-manifest --all-targets --keep-going -- <adopted lints> -D warnings` | 0 |
| host/manifest.log | `cargo test -p toyos-manifest` | 0 |
| host/issues-sourcegate.log | `cargo test -p toyos-build --lib -- every_pending_exception_cites_an_issue_that_exists sourcegate` | 0 |
| metal/stage.log | `cargo test --test toyos-build -- --metal --metal-readback $SCRATCH/r4/pilot/metal scratch_written_through_a_deadline_reset scratch_written_through_a_reboot`; the staged invocations carry `--scratch-cycle` | 2 (staged) |
| metal/pilot-request.txt | the T14 pilot: re-adoption, one O, R, D, A rotation, judging, stop rules | - |
| metal/series-request.txt | the attended series and its decision rule, held until the pilot is read and the owner attends | - |

Not rerun: the full `cargo run -- --ci host` (r3, at efd05be87: 107/108, the one red fixed in a995bedf3).
This round changes toyos-metal, the harness and its checks, a doc comment in toyos-manifest and issue
text, each covered by the rows above. The QEMU smoke (r3) stands: the guest load, its image and usbd are unchanged.

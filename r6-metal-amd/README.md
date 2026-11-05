# PR #1185: AMD metal at `4937c2bdc`

The image was staged from a clean tree at `4937c2bdcdbe486cd414e89a2f693fba392d35ce`:
`testcases/image.img`, sha256 `de9d9b74259a6f6fb6a80a15326e139fc61d8fd6f8f273319c24fa5972c19739`.
The coordinator matched that hash before flashing. The boot ran rc=0 with `--fat32-check`,
and its verdict is `passed`.

- `judge.log`: `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-r4-amd
  nvme_leaves_the_benchs_disk_alone`, judging the AMD readback in place (copied, with the
  staged config, into its own directory). Exit 0, `PASS nvme_leaves_the_benchs_disk_alone`.
  The machine line is masked.
- `lines.txt`: the AMD bench's drive came up under the geometry checks (512-byte sectors,
  4 I/O queues). LOG was served writable (`FAT32, `) 14 ms after its mount, so recovery
  ran and did not refuse.
- `stick-recover.log`: the log partition has 0 complaints under `toyos-fat32-check`.
  Recovery on a host copy changed nothing, and a second run changed nothing.

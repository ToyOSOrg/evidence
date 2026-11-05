# PR #1185: T14 metal at `4937c2bdc`

The images were staged from a clean tree at `4937c2bdcdbe486cd414e89a2f693fba392d35ce`; their
hashes are in `image-hashes.txt`. The coordinator ran T14 usbload, then testcases, each with
`--fat32-check`. Both runner rc=0, and both verdicts `passed`.

- `judge.log`: the staging command run again with the readbacks in place. Exit 0:
  `nvme_leaves_the_benchs_disk_alone` PASS and `the_disk_survives_a_reset_under_load` PASS.
  7257 KiB of load lines reached the stick before the reset.
- `*-lines.txt`: on both boots the T14's drive came up under the geometry checks, and LOG was
  served writable (`FAT32, `, not `FAT32 read-only`) about 20 ms after its mount. So the r2+
  recovery ran on the real stick and did not refuse it.
- `stick-*-recover.log`: `toyos-fat32-check` on each readback's log partition found 0
  complaints. `Fat32::recover` on a host copy changed nothing, and a second run changed nothing.

These boots show the clean-stick case: the reset left no stop state, and each boot reflashes LOG.
Repairs and refusals are held by the host tests. The AMD testcases boot has not run: the bench
did not answer.

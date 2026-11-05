# PR 1195: logkeeper: the console no longer waits for /log to open

All guest runs are `guest-rows.yml` on the guest runner (x86-64, KVM). Logs are
`gh run view --log`, with the runner's home and hostname masked.

- `diag-run-42036387265.log`: main 0f085b199 plus `diagnostic.patch` (QEMU
  `-trace serial_*`, and QMP `info registers -a`, `info pic`, `info lapic` on
  the stall). The row stalls. After the kernel's last inline byte, the 16550
  trace's only access is `serial_write [0x01] <- 0x01`, with no LSR or IIR read.
  Both vCPUs show `HLT=1 RFL=00000246` twice, 2 s apart.
- `press-run-42038000569.log`, `press-run-42039351255.log`,
  `press-run-42039919410.log`: `acpi_press_is_one_sci` at 883809d3d, PASS (2 s)
  each.
- `rows-run-42038076347.log`: the other four acpicase rows,
  `the_log_lands_on_the_boot_stick` and `nvme_disk_boots` at 883809d3d, 6 passed.
- `host-checks-883809d3d.log`: `cargo run -- --ci host`, exit 0, 108 steps
  green, on macOS aarch64.

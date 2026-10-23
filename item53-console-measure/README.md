# Item 53: the console gate measurement (UART stdio against virtio stdio)

Investigation only. Nothing here lands. The base is `origin/main` `a88030e05`, with `throwaway.patch` applied in a scratch worktree.

- **Host:** Apple M4 Pro, 14 cores, macOS, QEMU 11.1.1, shared with other agents. Load averages were 7 to 38 during the runs (`runs/progress.txt`).
- **Configurations:**
  - q35 runs under TCG: an x86-64 guest on an arm64 host.
  - `virt` runs under HVF and under TCG (`Profile::Virt`, `Profile::VirtTcg`).
  - q35 under HVF does not exist on this host, and no KVM host was used.
- **The `MEASURE_CONSOLE=uart|virtio` switch** chooses QEMU's wiring:
  - `uart`: `-chardev stdio -serial chardev:uart0`, with no virtconsole function.
  - `virtio`: the virtconsole function on stdio and the UART on a file.

## Rows

- **`measure_flood_*`:** the throwaway `console-flood` actuator logs 4000 records, each a 121-byte message (about 0.57 MB on the wire), in the inline-drain phase right after `virtio_console::init`. Each record is drained synchronously.
  - `guest_flood_ms` is the kernel's own clock around the loop.
  - `ready_ms` is the host's time from QEMU spawn to the `console-flood: done` line.
  - Backend 1 is the UART and backend 2 is virtio. Every run's backend was checked against its side.
- **`measure_boot_*`:** spawn to `===READY===` on `tests/images/testcases.toml`.
- **`crypto_instrument_prints_its_table`:** spawn to ready, plus the three crypto jobs (about 145 KB of job stdout).

The rows were run five times per side, and crypto three times. The two sides alternated, with the order flipped on every repetition (`matrix.sh`).

## Results (milliseconds: median, then min to max)

| row | uart | virtio |
|---|---|---|
| flood q35 TCG, guest | 479 (469–711) | 93 (87–420) |
| flood virt TCG, guest | 552 (538–690) | 61 (58–67) |
| flood virt HVF, guest | 1975 (1600–4003) | 66 (38–102) |
| boot q35 TCG, to ready | 3794 (3302–4400) | 3679 (3427–5158) |
| boot virt TCG, to ready | 1881 (1237–3961) | 1344 (1299–1916) |
| boot virt HVF, to ready | 509 (485–803) | 577 (531–1390) |
| crypto q35 TCG, to ready | 8592 (3788–8754) | 4932 (3617–10126) |
| crypto q35 TCG, jobs | 231024 (177930–574513) | 320521 (281872–333141) |

All 66 runs exited 0, and all 30 flood runs carried 4000 of 4000 distinct records.

## Stalled reader (`stall/`)

`MEASURE_STALL=100000:<s>` stops the harness's stdout reader for `<s>` seconds after 100 KB.

- **16550 (q35 TCG), 20 s, run twice:**
  - The flood completed, but 629 and 785 of the 4000 records were missing or damaged (3371 and 3215 distinct).
  - The kernel said nothing: no `the UART took no byte` alert.
  - The guest's loop took 20.3 s.
  - QEMU's `hw/char/serial.c` drops the byte after `MAX_XMIT_RETRY` (4) EAGAIN retries, so the drop happens inside the device and the guest sees THRE again.
  - Source: QEMU master, https://gitlab.com/qemu-project/qemu/-/raw/master/hw/char/serial.c, sha256 `b67d258a7dcb02174ad25eac3fc8ebc89b625aabf87e74f6f8ace7d94eb8b18f`, lines 108 and 264–279. This is master, not the 11.1.1 tag.
- **PL011 (virt HVF), 20 s, run twice:** no loss (4000 of 4000), and the guest stalled for the whole pause. QEMU's `hw/char/pl011.c` writes with `qemu_chr_fe_write_all`, which blocks (same source, sha256 `2107db218737608e0f84545b245650d1821c100fe0a226ed77144907b25210c9`, line 257).
- **virtio console (q35 TCG for 3, 8 and 20 s; virt HVF for 3 and 20 s):**
  - Every run went silent for good. Nothing arrived after the reader resumed, and the boot ceiling expired (`Boot timed out`).
  - The UART file holds no panic report (`stall/measure_flood_q35-virtio-20s-uart.log`).
  - QEMU's `hw/char/virtio-console.c` says a console port drops data on EAGAIN without throttling (master, sha256 `016d12fbaf851ac738ca57ad2b6b713c88909090e2d83b4734d43f2567f478c1`). That alone would not explain a wedge, so **the cause is not established**.

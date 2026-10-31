# PR #1100 phase 2: what holds the T14's package in PC2

These are measurement scouts, not the PR's code. They back
`issues/the-t14s-idle-package-stays-in-pc2.md`.

## ToyOS park scout (`toyos-park/`)

- Branch `power-scout` at `348a972ea`, a test-actuators kernel on the benchcase image with netstack.
- The judge's verdict: passed.
- `osbench-lines.txt` holds the boot's osbench lines and the kernel's park lines.

Each step was 30 s idle, parked cumulatively. Each park answered D0, and the kernel logged each one.

| step | package p50 (mW) |
| --- | --- |
| 0_base (first row) | 8851 |
| 0_hold_800us (every core held at an 800 µs wake latency) | 6618 |
| 0_released | 7269 |
| 1 SD reader 0a:00.0 | 7206 |
| 2 Wi-Fi 09:00.0 | 7167 |
| 3 audio 00:1f.3 | 7181 |
| 4 USB4 DMA 00:0d.2 | 7117 |
| 5 USB4 DMA 00:0d.3 | 7190 |
| 6 TCSS xHCI 00:0d.0 | 7436 |
| 7 HECI 00:16.0 | 7235 |
| 8 PCH xHCI 00:14.0 | 7159 |
| 9 iGPU 00:02.0 | 7083 |

- PC2 was 994-995 ‰ and PC3 and deeper 0 at every step.
- PP0 was about 300-317 mW and PP1 0-22 mW, so about 6.8 W lies outside both planes.

## Linux unbind ladder (`linux-ladder/`)

- The T14's Linux, as root, from a systemd unit. Binary sha256 b108a25c…ac486d2f, which is `power-scout`'s osbench.
- Each step is one `osbench energy`. `.state` gives each function's driver, runtime PM status and PMCSR.
- One link name is masked (`<vpn>`).

The idle package's p50 at steps 0-9: 1635, 1679, 1614, 1700, 1641, 1638, 1721, 1713, 1583 and 1603 mW. The eight functions unbound and left in D0 cost Linux nothing measurable.

Steps 8 and 9 (PSR off, then the default) are **void**. `ladder-psr-status.txt` was empty because debugfs was not mounted, so nothing shows that PSR changed.

# PR 1089, round 3: the AMD bench's run of chain-1089 and its usbload control

Masked as in r1/r2 (`<worktree>`, `<scratch>`, `<home>`, `<guid>`); lines the server marks as this machine's own are dropped.

- `judge-testcases.log`: the testcases boot at 31db18c19 judged at 31db18c19. Exit 1. `idle_entered` fails on cpu8's 0 periods, which is an instrument defect fixed in b9df2d0f9. `nvme_leaves_the_benchs_disk_alone` fails because the bench's DATA was designated by #1085. Everything else passes, `acpi_tables_loaded` among it.
- usbload, `stick_survives_a_reset_under_load`, on the AMD bench:
  - 31db18c19, first run: **failed**. The stick did not return after the deadline reset, and its port stayed dead through a host reboot until AC power-off. Judged by no harness: no readback.
    - `usbload-failed-log-without-load-lines.txt`: the recovered log partition's files, every non-load line.
    - `usbload-failed-log-tail.txt`: its last three lines.
    - `usbload-failed-deadline.txt`: the deadline's arming.
    - Integrity of the recovered load lines (a Python check over the 8 log files): 7807 lines, numbered 0..7806, each 900 bytes, payload all 'x', no gaps, none malformed.
    - The log ends at 45.701 s; the deadline was armed at 5.741 s for 40000 ms.
  - 5870531b2 (main, #1089's base), control: `judge-usbload-main.log`, exit 0, 7237 KiB reached the stick. Run took 107 s.
  - 31db18c19, retry: `judge-usbload-1089.log`, exit 0, 7239 KiB. Run took 131 s.

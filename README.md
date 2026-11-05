# PR #1187 evidence, round 1

Every run is `guest-rows.yml` on the guest runner (x86-64, KVM), its full log masked of host paths and the runner's name.

- `main-15c26bfbc-42008942191.log`: main's tree on a branch at 15c26bfbc. `acpi_mediated_access` red, `acpi: 64 threads in a row started on the boot processor`. `acpi_lock_given_back_on_one_cpu`, `the_uart_carries_the_log_again_once_the_console_carrier_goes`, `session_lifecycle`, `the_log_lands_on_the_boot_stick` green.
- `fix-0383550b0-acpi-42010705757.log`: the PR head, filter `acpi_`. `acpi_mediated_access` green with 0x51..0x53 `asked from cpu1`, x2APIC `[1, 1, 1]`. Three more acpi rows green. `acpi_press_is_one_sci` STALL: its console stopped after the kernel's `Boot: complete`, and no userland line reached it in 17 s. Its arm makes no firmware call, so the change does not reach it; its serial was not kept by the job's artifact step, which kept another lane's file.
- `mutation-held-to-cpu0-42010736954.log`: the PR head with the held CPU changed to 0. Red as predicted: `firmware call 0x51 was asked from cpu0, where the probe held its asker to cpu1`.
- `session_lifecycle-*.log`: three more runs of `session_lifecycle` on this branch (it does not touch that row), green. With the base run above, 4 of 4.

# Round 2: the T14

- `t14-acpicase-*`: the orchestrator's T14 boot of the `acpicase` image staged at 0383550b0 (`--metal-readback`), rc=0, verdict `passed`; machine model, firmware version, disk identifiers and GUIDs masked.
- `judge-acpi_server_death.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> acpi_server_death` over that readback, exit 0, `PASS acpi_server_death`. The job's `acpi_release: claimed from the CPU of x2APIC id 7`; the kernel's `ACPI_ENABLE 0xf0 written to SMI_CMD 0xb2 on cpu0, asked from cpu7`; the disable, left to the scheduler, `asked from cpu3`.

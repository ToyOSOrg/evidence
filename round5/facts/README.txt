How host-trace-pc00-ec-hkey-ini.txt was made.

tracer-main.rs (with tracer-Cargo.toml) loads the T14's DSDT and SSDT1..13, as dumped,
into toyos-aml at the round's head with interpreter-trace.patch applied (it prints each
method's entry and exit, nothing else), then evaluates \_SB.PC00._INI, the controller's
_INI and its hotkey device's _INI in that order, printing every access but reads of ACPI
NVS. What the host answers is a model, not the machine:
- ACPI NVS reads answer the NVS dump taken under Linux, with the AML's writes kept;
- the SMI mailbox's reads (0x949B8FD8..0x949B8FF0) answer 0x10 in every byte, so the
  firmware's flags carry bit 4 and not bit 7, the branch the T14 took;
- 00:00.0 offset 0x48 answers 0xFEDC0001 and offset 0x60 0xC0000001 (MCHBAR and the
  ECAM window: the latter the kernel's own log reads on the T14, the former assumed);
- every other read answers 0, and every write is accepted.
Under that model the controller's _INI makes the T14's refused write, byte 0x01 at
0xFD6E0A70, from BPWC through \_SB.SGOV; the hotkey device's _INI writes MCHBAR bytes.

# PR #1154 metal at 938c4a7cb, run by the orchestrator on both benches

Excerpts from each boot's kernel.log, taken by grep, not whole logs; machine
records are left out. Both boots on both benches have verdict `passed`.

- `control_regs`: every CPU holds SMEP and SMAP (T14 8 of 8, cr4=0x00360ee8; AMD 16 of 16, cr4=0x00340ee8).
- `test_rs_first_entry` (testcases) and `test_rs_ring0_clears_ac` (shared-debug) exit 0 on both. No `AC WITNESS` on either.
- The testcases boot's non-zero exits are all jobs owned by other metal rows, failing on device or environment
  grounds (no MSI-X on the spare's function, no frame on the i219's wire, and on the AMD the T14's i219 and its
  ACPI server lines absent). None of them is a member this change adds or touches.

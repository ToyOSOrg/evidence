# Round 3, ToyOS head a99cd8cb51c5bde619384e650304b824282d0707

Review r2's blocker (the FS-base cache read before `load_gdt` zeroes FS's base) and two citation and wording
suggestions; the change is to `arch::x86_64::percpu` and comments in `arch::x86_64::tlb`.

- `clippy-x86.sh`: the four x86 kernel clippy shapes (default, boot+test actuators, boot actuators, instruments),
  run at a99cd8cb5 with a clean tree (`rev.txt`): exit 0 each (`summary.txt`, one log per shape).
- Round 2's guest runs (f06faad8a) and metal staging (`../r2/stage/`) stand for the rest: the kernel differs from
  f06faad8a only in the FS-base cache's value from bring-up to the first switch-in (review r2).

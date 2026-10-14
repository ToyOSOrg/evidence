PR #895, S2's GOP half at ToyOS 6fd69e2b4a76082b7b82596d442f52c0eec7687e.

t14/, amd/: the metalcase boot of `cargo test --test toyos-build -- --metal --metal-readback <dir> gop_edid_scale`,
staged at that head and run by the orchestrator on each bench; the readback's kernel.log (the kernel's and every
program's lines), loader.log, boot.txt and verdict.txt, and the judge's output. Both judged gop_edid_scale PASS.
The boot stick's USB serial number is masked.
  T14:       "EDID: GOP handle 0 of 2 shows the scanout and publishes 128 byte(s), the base block handed over",
             "compositor: display 1920x1080, panel 309x173 mm, scale 1.5"
  AMD bench: "EDID: GOP handle 1 of 2 shows ...", "compositor: display 1920x1080, panel 309x174 mm, scale 1.5"

ctl-t14.log, ctl-amd.log: the negative control. gop_edid_scale judged (`--metal-readback` on copies of M1's
readbacks, whose loader carries no S2 line) at the same head: exit 1 on both, naming the missing loader line.

mutations.log: three mutations applied as checked patches and restored by one script: the tie going up, no
step-down to the least screen, and a 0 mm timing taken as a size; each turns its named test red. (Each
"cargo test exit 0" there is the exit of grep, not of cargo; the FAILED lines are cargo's.)

s2-qemu.log: `cargo test --test toyos-build -- desktop_without_x2apic --nocapture` on metal-sim, exit 0.

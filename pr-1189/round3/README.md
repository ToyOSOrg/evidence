# pr-1189 round 3: nothing in the kernel parses an ELF

- `hostci.log` at `revision` (bb1e9ada6): `cargo run -- --ci host`, exit 0, 108 steps all green.
- `build.log`: `cargo run -- --build-only` at b36b16e12, exit 0 (bb1e9ada6 changed only the build library's memo path).
- `controls/`: negative controls, each a checked patch applied, built, run and restored:
  - mut10: the kernel table keeps the first symbol at an address, not the sized one. It passed at first; the tie case `of_two_at_one_address_the_sized_one_is_kept` was added, and it then red (`mut10.log`).
  - mut11: a writable-and-executable segment laid out writable; red.
  - mut12: holes between segments unreserved; red.
  - mut13: the section's reader accepts a relocation past the image; red.
- `rows-42080820355.txt` at b36b16e12: 18 of 19. `virt_random_differs` red, `virt_random_differs-not-toyoskrn.txt`: a second boot in one process signed the memoized kernel ELF into the slot. Fixed in bb1e9ada6; the local run after the fix is `virt_random_differs-local-after-fix.log`.
- `rows-42089538985.txt` at bb1e9ada6: 18 of 19, every aarch64 row green, `virt_random_differs` among them. `session_lifecycle` stalled at the desktop reopening (`session_lifecycle-stall.txt`), a supervisor race recorded as `issues/a-desktop-reopened-as-its-session-ends-is-handed-the-ended-session.md`.
- `metal-request.txt`: the T14 boots staged at bb1e9ada6 with each image's sha256.

- `metal-bb1e9ada6/`: the T14 boots at bb1e9ada6, image hashes as staged: `testcases` (16 members, `abuse_spawn_maps` and `start_refuses_itself` among them) and `shared-debug` (`abuse_kernel_addr`), judged 17 passed, 0 failed (`judge.log`).
- `control-mut14-request.txt`, `controls/mut14.patch`: the guest negative control staged for the T14: `lay()` ignoring its vacancy check, on a never-pushed commit over bfb75f056. Not yet run.
- `control-mut14/`: the guest negative control ran on the T14 (image hash as staged). Under a kernel whose `lay()` ignores its vacancy check, `abuse_spawn_maps` went red at "a range on the clock page": the spawn was not refused (the child ran, pid 16, exit 0), and the member exited 101 (`member.txt`). Every refusal before it was still answered.

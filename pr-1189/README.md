# #1189: the loader is the program's (TLS and dlopen leave the kernel)

- `hostci2.log`: `cargo run -- --ci host` at `96cbf3838`, exit 0, "108 step(s), all green" (macOS host).
- `mut1.patch` + `mut1.log`: negative control for `kernel/pure/vm.rs`'s
  `no_protection_allows_a_write_and_an_execution` — `Prot::ReadWrite` made to
  allow `Exec`; the test reds (exit 101); restored.
- `mut2-dtpmod.pl` + `mut2.log`: negative control for `toyos-libc-copies`'
  `dlimage_relocations` — a `DTPMOD` of the relocating module itself written
  as 0; `each_relocation_is_worth_what_its_psabi_says` reds; restored.
- `hostq2.log`, `elf-test.log`, `toyos-tls-test.log`, `reloc-test.log`: the
  focused host runs taken while building (earlier revisions; `hostci2.log` is
  the one at the reviewed head).
- `rows/run-42010800343-d89b8bf63.log`: guest rows at `d89b8bf63`; 3 green,
  the rest red because `tests/guest/rust-tests` did not build (libloading's
  bundled `libtoyos_c`, abuse_elf_loader's dead code), fixed at `96cbf3838`
  and `c6c2c3dd2`.
- `rows/run-42018194698-c6c2c3dd2.log`: guest rows at `c6c2c3dd2`, x86-64 and
  aarch64; 18 of 19 green, `libc_children` red at `tty_interrupt: stalled at
  the nested line held`.
- `tty/`: local QEMU runs of `libc_children` (not guest evidence, a
  reproduction): the branch stalled locally in 1 of 8 runs (run1; the
  instrumented and plain reruns and the five-run loop passed) and once on the
  guest runner, main `15c26bfbc` in 1 of 7 (`base-...-run3-stalled.log`), the same stall
  as `issues/libc-childrens-tty-interrupt-can-stall-at-the-nested-shells-line.md`.
- `metal-f66dd9a22/`: the T14 `testcases` boot of image sha256
  `0a1d5e1a5e5951b7aa17d86efce5e9fb5005ec47494d53bb5645c175f6e013e0` at
  `f66dd9a22`, judged by re-running the staging command with the readback in
  place (`judge.log`, exit 1): 13 of 15 members passed — std_tls (DT_NEEDED),
  std_tls_multi_crate, std_tls_dlopen, std_tls_cranelift, std_unwind_so,
  dlopen_dedup, std_threads, affinity_pins, mmap_stress, disk_backtrace and C
  cases 204, 206 and 207. `abuse_elf_loader` (`tls_template_2m`) and
  `abuse_elf_segments` (`tls_huge`) exited 101: each asserted the kernel refuses
  a PT_TLS its TLS allocation could not hold, which no longer exists; removed at
  `42ed99c14`, restaged for the T14. Vendor, model and BIOS strings masked.
- `metal-42ed99c14/`: the T14 boot of `abuse_elf_loader` and
  `abuse_elf_segments` at `42ed99c14`, image sha256
  `7c52e4baacb2a9d729ade70be68dd8a39dff3bd760ad3589b06ec04018adabc0`, judged
  with the readback in place (`judge.log`, exit 0): 2 of 2 passed.

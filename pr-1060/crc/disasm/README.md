Loaders built by the readback at a0aba9cc8 (x86-64) and by the QEMU run at fcd809961 (aarch64); crc32c's code is unchanged since b0c014009.

- x86-64: `llvm-objdump -d --no-show-raw-insn target/x86_64-unknown-uefi/toyos/bootloader.efi`
  (the toolchain's `llvm-objdump`). Every `crc32` lies in one function, `0x140050f40..0x140051043`:
  62 instructions, 16 `crc32`, no `%xmm`/`%ymm` operand (`x86_64-unknown-uefi.crc-functions.txt`,
  each region from after the previous `ret`/`int3` to the next `ret`).
- aarch64: `llvm-objdump -d --mattr=+crc` finds no `crc32c`, and a scan of every aligned word of
  `target/aarch64-unknown-uefi/toyos/bootloader.efi` for the CRC32C{B,H,W,X} encoding
  (`w & 0x7FE0F000 == 0x1AC05000`, bit 12 set) finds none. The aarch64 loader runs no CRC.
  Its one engine read, `microcode::find`, is called on both architectures, but the aarch64
  `microcode_cpu` is presumably `None` (its body not read), which would leave the read
  unreachable and the linker free to drop it.

amd-memcpy round 9, orchestrator's rulings after round 8: the distance check inline from 256 B, and
a placement test of the 256 KiB row. rule.txt and judge9.py were written before any boot.

- Code (#1133 97ae8d604; head6 fb4ca4a2b): memcpy-disasm.txt. Base6's memcpy is main's. Head6's runs, under
  256 B, main's instructions plus `cmp rdx,0xff; jbe` and one `mov rdi,rax`; from 256 B, six more inline
  (`mov ecx,eax; sub ecx,esi; and ecx,0xfff; dec ecx; cmp ecx,0x1fe; ja`) and no call; a copy at a
  distance in 1..511 tail-jumps to copy_short_alias. memmove's forward branch is the same.
- Host: CI at 97ae8d604 108 steps exit 0; libc tests x86-64 (Rosetta) and arm64 exit 0; the guard
  mutation reds an_overlapping_forward_copy_a_page_apart_agrees, exit 101, restored.
- Staged: base6 85c7607d5 and head6 fb4ca4a2b (stage logs end in exit 2, "staged, nothing judged").

amd-memcpy round 8: the orchestrator ruled after round 7 that small copies must not pay for the route.

Disassembly (memcpy-disasm.txt, from each build's osbench):
- base4/base5 (main's code): push rbp; mov rbp,rsp; mov rcx,rdx; mov rax,rdi; rep movsb; pop rbp; ret.
- head4 (round 7): memcpy did not inline copy_forward. It saved rbx, called copy_forward (its own frame,
  then a distance computation and two branches), and restored rbx. Every copy paid this, which
  explains the 64 B-1 KiB rows' 5-7%.
- head5 (PR 643b89bc8): copy_forward is inlined and returns dest. A copy under 4 KiB runs main's
  instructions plus `cmp rdx,0xfff; jbe` and one `mov rdi,rax` (dest must come back in rax and the asm
  consumes rdi). A copy of 4 KiB or more jumps to copy_long (a tail jump, no frame kept).
- 256 KiB: in head4 and head5 it runs about 15 more instructions before the same `rep movsb` from the same
  data addresses: nanoseconds against an 8.5 us copy. Round 7 also showed copyat's own unrouted
  256 KiB d0 copy 5% slower on head4 (8.5 -> 9.0 us) but not at 64 KiB or 1 MiB. Code placement
  (memcpy and rep movsb at different addresses in every build) and buffer placement remain candidates;
  nothing here establishes either. Round 8 tests whether the gap survives main's code shape.

Checks: host CI at 19f36d8fe and at abfe08bf4 (108 steps, exit 0 each); libc tests x86-64 under
Rosetta and arm64, exit 0; mutation-guard (overlap guard removed) reds
an_overlapping_forward_copy_a_page_apart_agrees, exit 101, restored.
Staged: rule.txt, request.txt (stage logs end with exit 2, "staged, nothing judged").

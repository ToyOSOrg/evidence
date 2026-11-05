amd-memcpy round 7: #1133 rebased onto main 15c26bfbc (head 3c646d942).

Does the change still claim something real?
- Vendor fact, read from the document: Software Optimization Guide for AMD Family 17h Models 30h
  and Greater Processors, 56305 rev. 3.02 (March 2020), §2.12 Load-Store Unit, p. 39: "The
  processor uses address bits 11:0 to determine STLF eligibility. Avoid having multiple stores with
  the same 11:0 address bits, but to different addresses (different 47:12 bits) in-flight
  simultaneously where a load may need STLF from one of them." The archive 56305.zip (sha256
  881e216643a1a8142bd1f61945bc898b7ed3cc4c2a5a3135a0ee0aaa8bbb8bc6) holds 56305-3.02.pdf
  (sha256 aacf45aa521285831176e45ad8246264270269648f1c74856a78302faf8c413e).
- Metal: the AMD stall in libc's forward rep movsb is measured in this branch's rounds 2 and 5
  (copyat 8 KiB d16 2595-2615 ns against 90) and independently in #1139's in-process rows
  (evidence 776c503ac402da3dc9c419fb2593a0b8ec79eabe, kmemcpy/round-3: d 8..31 stall at
  4-64 KiB, nothing tried from 32 up does).
- #1139 replaced the kernel's copy and took the kernel issue; #1150's round 7 found the paged read's
  user copies at distance 0. Neither touches libc's copy, so the libc claim stands.

Here:
- ci-host-3c646d942.log: `cargo run -- --ci host`, 108 steps green, exit 0.
- libc-x86-rosetta.log: `cargo +stable test -p toyos-libc-copies --target x86_64-apple-darwin
  --release`, 108 passed, exit 0.
- rule.txt, request.txt, image-sha256.txt: the AMD A/B staged with --metal-readback (base4
  6cdf182b0, head4 993461c7f, branch amd-memcpy-ab4). stage-*.log end with exit 2, the harness's
  "staged, nothing judged" verdict. Both images were built with one doc-comment line in
  tests/guest/osbench/src/copyat.rs differing from the commits (the 56305 title); a doc comment
  does not reach the binary.

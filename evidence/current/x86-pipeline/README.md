# x86 batch candidate: native validation pending

The hosted x86 candidate adds four independent AES CTR lanes, hardware SubWord
and four-block CLMUL GHASH. Byte reflection uses SSE2 shifts/masks, polynomial
multiplication uses three CLMUL products, and one reduction folds the aggregated
four products. All indices, counter values, shifts, loop counts and CPU guards
are public; each vector memory access stays within a fixed array or complete
batch. GCM's existing length bound implies the last counter is at most u32::MAX.
The UEFI register-preserving per-block implementation remains the fallback.

`cross.log`: Linux x86, Windows MSVC and x86 UEFI clippy, dispatched and portable,
all warnings denied, exit 0. `arm-gates.log`: ARM dispatched/portable release
suites (46 tests each), all-target all-feature clippy, Rust 1.89 host library
check and formatting, all exit 0. None executes the new x86 implementation.
`assembly.log`: baseline Linux and UEFI release library assembly scans contain
no AVX mnemonics or YMM/ZMM operands. Full assembly is retained losslessly in
the `.s.gz` files; this scan is not a complete constant-time or erasure review.
`package-list.log`: analysis tools, benchmarks, evidence and private communication
are excluded from the deliverable package.

Two new native x86 mutation anchors break the batch counter and H^4 power.
The runner executes architecture-appropriate controls: twelve on either ARM
or x86 (fourteen defined in total). Native baseline correctness and x86 mutant
failures must pass before accepting this candidate. A subsequent matched
benchmark comparison must measure improvement; the older Linux/ring numbers
are the baseline and do not describe this candidate. UEFI runtime, ToyOS
userland custom targets, current timing and independent external review remain
open. Physical compiler/stack key copies remain outside the wiping guarantee.

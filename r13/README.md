# pr-1150 r13: round 6's open costs diagnosed; round 7 (diagnostic) staged

- **AMD large spawn, the Zen 2 4K-aliasing hypothesis: refuted.**
  - `kvm-cwin.txt` / `window-kvm.txt`: a copy probe splitting each user copy by destination-minus-
    source modulo 4 KiB found 0 of 8242 copy-outs per large spawn in `copy.rs`'s AMD window (1-31
    bytes, at least 64 long). Machine-wide over the run it found 21 of about 4.6 million reads.
  - The paged read copies a frame at offset `within` into the destination at the same offset
    modulo 4 KiB, so the distance is 0 on any machine.
- **T14 malloc churn:**
  - std's allocator does not reach the SDK lock: std's futex `Mutex` calls `toyos_abi` directly.
  - `symbols.txt`: head places dlmalloc's `malloc` and `free`, `__rdl_alloc`, `__rdl_dealloc`,
    std's `dealloc` and `lock_contended` 32 bytes off diag's alignment modulo 64. The churn loop
    itself is aligned the same in both.
  - The pad arm (32 inert bytes beside `lock_word`) restores diag's alignment for every one of
    them, and keeps head's spin.
- `ab7/`: the diagnostic round's rules (set before any boot), request and hashes.

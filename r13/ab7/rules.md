# S0-a metal round 7, diagnostic: the rules, set before any boot (2026-11-05)

No #1150 code changed since round 6 (images 378cea3a7; the PR head adds comments and an issue
record only). The hot rows passed in round 6, so nothing here re-judges them. This round answers
two questions round 6 left open (coordinator's rulings 1 and 2), and boots only what they need.

Every arm carries the per-syscall probe and is built from main's whole `benchcase.toml`.

## Question 1, AMD: where the large spawn's extra 1.4 µs per page goes
- **Refuted before this round:** the Zen 2 4K-aliasing hypothesis.
  - On KVM, a probe splitting each user copy by distance modulo 4 KiB found 0 of the 8242
    copy-outs per large spawn inside the 1-31-byte window (evidence r13).
  - The paged read copies a frame at offset `within` into the destination at the same offset
    modulo 4 KiB, so the distance is always 0. That holds on any machine.
- **Arms:**
  - **cbase** = `s0a-r10-cbase-kvm` 14e7768ac: main + probe + copy probe (`pieces`: reach, pin
    and copy per page).
  - **cwin** = `s0a-r13-cwin-kvm` 46effaacf: 378cea3a7 + probe + copy probe, with the destination's
    `fault_in` timed separately (`cp_fi`) and copies split by window (`cp_rdw`, `cp_wrw`).
- **Order:** 1-cbase 2-cwin 3-cwin 4-cbase.
- **Read:** `cpdiff.py` over the exits of the large spawn's child gives, per spawn, the copy-out
  calls, bytes, time, copy faults and `fault_in` time. For each arm, ns per page copied, and for
  cwin the populate's ns per page.
- **What decides:**
  - Head's copy-out costs more per page than cbase's whole reach-pin-copy: the cost is in the copy
    through the user mapping on Zen 2, and a fix there is designed and measured next.
  - The populate costs it: `fault_in` is investigated.
  - Neither, with the spawn row still worse: the cost is outside the copy, and the probe's
    per-syscall line for `SYS_PAGED_READ` (156) and `SYS_SPAWN` (25) points next.
- **Gap:** the copy probe's timestamps add equally to both arms. The spawn row is reported with
  its arms, not judged.

## Question 2, T14: is the malloc-churn loss the SDK spin or code placement
- **Already shown:**
  - std's allocator never reaches `sdk/toyos/src/sync.rs`. It takes std's futex `Mutex`
    (`sdk/std/sys/pal/futex.rs`), which calls `toyos_abi::syscall` directly.
  - The two osbench binaries place the hot allocator functions 32 bytes apart modulo 64: dlmalloc
    `malloc` and `free`, `__rdl_alloc`, `__rdl_dealloc`, std's `dealloc`, `lock_contended`. The
    churn loop itself has the same alignment in both (r13 symbol tables).
- **Arms:**
  - **base** = `s0a-r10-base-kvm` 49496f0a3.
  - **head** = `s0a-r10-fin-kvm` 2730ee698.
  - **pad** = `s0a-r13-pad-kvm` 71a9faa9a: head + 32 inert bytes beside `lock_word`, which returns
    every one of those allocator functions to the diag arm's alignment. It keeps head's spin and
    every code path.
- **Order:** 1-base 2-pad 3-head 4-pad.
- **What decides,** on `mem.malloc_churn.16.t1` and `.4096.t1`, whose values sit within 1.5% of
  each other in an arm on this bench:
  - pad reads base's (within 3%): the loss is code placement. The spin stays and the layout
    sensitivity is recorded as an issue.
  - pad reads head's (within 3%): placement is refuted, and the spin is investigated as the cause.
  - Anything between is reported as unresolved.

## Validity
A boot marked INVL, or whose image hash differs from `image-sha256.txt`, is not a value. It is
rerun once, and the rerun is recorded.

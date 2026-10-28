# Pager and swap: combined plan, revision 7

Design only. It builds on memory design revision 18 (§3, §5, §7, §8), storage design revision 12 (§2.5, §3.5, W2)
and the contracts on `main` at `717baf3ac`: #1057's per-job ledgers, floors and `SHM_FOR_JOB`, #1070's
`vm_remap`, and #1071/#1076's shared-memory rights. #1074 and #1077 (`SYS_SHM_COMMIT`) are still drafts, so this
plan cites them from their PR text.

Revision 7 applies the architect's answers to r6.2's owner questions (2026-10-28):
- Storage waits, and ending a process on established, unrecoverable loss, are accepted.
- Blanket `EIO` is not approved. §0 now says which calls report what.
- Bounded wiring with explicit authority is accepted. Its sizes, the swap size and the spare are engineering
  choices, justified in §5 and §8.
- One window's fault freezing every app is a requirements conflict. It is resolved in §5 by containing the delay
  to the affected client, with the network and file services on the same rule.
- A stopped memory service keeps its recoverable state (§3.2).
- Changes to approved texts are engineering (§11).

Reviews r1–r5 and the r6 follow-ups (R1–R8, N1–N3) stay resolved, except where this revision replaces their
subject; each such case is named in the change list.

**Labels.**
- **[P]**: published.
- **[C]**: read in code at `717baf3ac`, unless another revision is named.
- **[M]**: a recorded measurement, with its run named.
- **[D]**: arithmetic over [C] and [M] facts.
- **[E]**: an estimate or inference.

Unlabelled text is this plan's proposal.

## Requirements this plan serves

A brief of the owner's memory requirements that bear on paging and swap. They are cited below as **Q-1** to
**Q-15**. Q-15 is from the scheduling requirements.

- **Q-1. Strict commitment.**
  - Address reservation, backing commitment and lazy population are separate.
  - A successful commitment covers that memory's later ordinary faults.
  - New commitments are refused rather than other apps killed to recover capacity.
- **Q-2. Swap.**
  - Swap is encrypted and authenticated, with boot-lifetime keys, on preallocated internal storage.
  - [owner requirement, private] [owner requirement, private] the first release.
- **Q-3. Surviving a crash.**
  - Swapped memory survives a memory-service crash and an authorized restart, through [owner requirement, private] need not be recovered across a reboot.
- **Q-4. Loss.**
  - [owner requirement, private]
  - Unaffected work is preserved, and contents are never invented.
  - [owner requirement, private] never authorizes termination.
- **Q-5. Who pages what.**
  - One authoritative file-page cache serves both [owner requirement, private] file servers own file write-back.
- **Q-6. Executable pages.**
  - [owner requirement, private] uninstalls never [owner requirement, private]
  - Essential recovery code stays resident.
- **Q-7. Prepared paths.**
  - The [owner requirement, private] are [owner requirement, private] happen in advance, and dirty data is bounded.
  - No concurrent write is lost during write-back.
- **Q-8. Locked memory.**
  - [owner requirement, private] need [owner requirement, private] and [owner requirement, private]
- **Q-9. Reclaim and responsiveness.**
  - Reclaim is balanced by [owner requirement, private]
  - Pressure is reported and the user keeps control.
  - No workload is automatically suspended or killed for pressure.
- **Q-10. Controls.** Enough capacity is protected for system inspection and the [owner requirement, private] quotas.
- **Q-11. Ownership of charges.**
  - Each allocation has [owner requirement, private] and [owner requirement, private] the
    [owner requirement, private] tables.
- **Q-12. Shared files.** [owner requirement, private] with no quota
  and no access to the protected reserve.
- **Q-13. Clients and services.**
  - Client-owned bulk buffers are preferred.
  - [owner requirement, private]
  - There is [owner requirement, private]
- **Q-14. Stacks.** Each stack's selected capacity is committed before the thread starts, populated lazily, and
  guarded. Caller-selected sizes are supported, with ordinary creation failure.
- **Q-15. Scheduling allowances.** Helpers share their job's allowance, and authorized launchers create
  independent jobs.

Root `CLAUDE.md` adds two rules: audible or visual quality is never weakened without the owner's explicit
agreement, and a privilege beyond a device claim is granted only in the signed image's `system.toml`.

## Changes from revision 6.2

- **Error reporting (§0.1).** r6's "a syscall touching lost memory answers `EIO`" is replaced:
  - a syscall's access to its caller's own memory is the caller's own touch, and ends it as a load would;
  - data a service serves keeps its own contract (`EIO` for file data);
  - waits never become errors.
- **Contained delay (§5).** A service never waits on one client's memory in a path that serves others.
  - The compositor wires the window buffers it shows, from a worker off its loop.
  - netstack, the file server and logkeeper copy client memory through the non-faulting `mem_read`/`mem_write`,
    which r4 defined for the memory format.
  - **Deleted:** C-overlay, its present handshake and its per-backend question. The compositing loop no longer
    waits on swap. This replaces R1's resolution.
- **Stopped service (§3.2).** The backing is a boot-lifetime kernel object. A spent restart budget or a stop
  preserves it for an authorized manual restart. Only established loss fails pages, and only the boot's end
  destroys the backing.
- **Sizes justified (§5, §8):** the 8 MiB wire default, the swap size and the spare, with how each is adjusted.
- **Owner questions.** §11 lists only the remaining quantified compromises. Changes to approved texts are
  engineering notes.
- **Citations.** The requirements are briefed above, not cited from a private file.

## 0. What changes for programs

Committed anonymous memory is still never refused at a fault and never reads invented contents (Q-1, Q-4). What
is new:

- **It may wait on storage** in a load, a store, or a syscall that copies it. [owner requirement, private] (Q-9).
- **It can be lost.** A swap read that fails after the driver's recovery, or that fails authentication, is an
  established loss of that page (Q-4). How each access reports it is in §0.1.
- **Commitment can outlive the backing that covered it** (§3.2).
  - If the swap device leaves, or retired blocks exceed the spare reserve, new commitments are refused.
  - A swappable fault that finds no frame waits. It is reported overdue, naming the deficit, and is never ended
    (Q-4, Q-9).
- **A stopped or exhausted memory service** leaves faults on swapped pages waiting, reported overdue. Its state is
  kept for an authorized manual restart (§3.2). Stopping the waiting program is the user's way out (Q-9).
- **`mlock`/`vm_wire` is refused past the job's wire allowance** (`ENOMEM`) (§5).
- **Resident memory** (§5) keeps memory §3's old guarantee: no fault on it does I/O or waits.
- **Executable and read-only image pages never go to swap** (§6).
- **One program's swapped memory delays only that program.** Services that serve many programs never wait on one
  program's memory in their shared path (§5).

### 0.1 Which access reports what

| Access | Page swapped, storage progressing | Storage stalled, service stopped, or a deficit | Page lost (established) |
|---|---|---|---|
| A load or store | waits | waits, reported overdue | ends the process with the diagnostic (Q-4) |
| A syscall's access to its caller's own memory: a buffer, an argument structure, an IPC payload, a futex word | waits; the copy faults the page in before taking any lock (§3) | waits, reported overdue; kill ends it | ends the caller with the same diagnostic, as if it had loaded the page |
| A futex wait whose word is swapped or lost | a spurious return; the user loop's re-read is a load (row 1) | the same | the same: the re-read ends the process |
| A service's `mem_read`/`mem_write` of a client's object (§5) | `Pending`; that client is deferred alone | `Pending`, deferred | `Lost(cause)` to the service |
| `read()`/`write()` of a memory-format file whose page is lost | — | — | `EIO` from the file server, the file contract |
| A mapper's load of that file page | as row 1 | as row 1 | ends the mapper, as for a mapped file whose data storage lost (memory §7.5) |

**Why a syscall's own memory gets no errno.**
- **POSIX has no error that means "your own memory was lost".** `EFAULT` means an address outside the process's
  valid space, and `EIO` means the file or device failed [P, POSIX.1-2024, `<errno.h>` and `read()`]. Neither is
  true here.
- **Rust and libc treat any errno as a recoverable per-call result.** std returns an `io::Error`, which a caller
  may log and carry on from. That program would then run on memory that no longer holds its contents, which
  Q-4's [owner requirement, private] excludes.
- **Partial results would be lost silently.** A receive that has already dequeued bytes from a pipe, socket or
  IPC queue cannot hand them back as a failure (memory §7.8, item 54's reason 2).
- **Ending the caller is Q-4's own rule** for a process that touches lost memory. The kernel's copy is that
  process's access, made on its own thread.
- **Unaffected work continues.** Other processes are untouched. A peer of the ended process sees an ordinary peer
  end, the same contract as any process ending.

**Why served data keeps its contract.** A memory-format file is file data, not the reader's memory. Its loss is a
file I/O failure, so `read()`/`write()` answer `EIO` and `fsync` answers `EIO`, as memory §7.5 already rules for
files.

**Waits are never errors.** A wait advances on storage progress and ends on established failure or kill (memory
§7.8, Q-4). `O_NONBLOCK` concerns the descriptor, not the caller's memory [P, POSIX `open()`: "the open file
description"], so a non-blocking call may still wait for its own buffer's swap-in, as on any paged system.

## 1. Ownership

| Component | Owns |
|---|---|
| Kernel | Memory objects, mappings and protection. Faults and their waits; accessed and dirty harvesting; reverse records. **The backing object**, one per boot: per-block state, claim number and tag, the swap key, the claim counter. Both commitment rules and the frame rule (§4). Safe replacement: revalidate, unmap, shootdown, futex revoke, free. The mechanical no-I/O fallback; invalidation when a server ends. No policy, filesystem or cryptography; encryption stays in userland (Q-3) |
| Memory service (new; signed row; `reclaimer` role) | Watermarks and its declared reserve `M`; reclaim selection over file and anonymous pages; swap-out and swap-in; block placement; sealing and opening; pressure figures. It keeps nothing that a restart needs |
| File servers (pagers) | As memory §7 and storage §2.5. They copy client windows through `mem_read`/`mem_write` (§5) |
| Storage driver | The swap session's I/O. diskserver opens and reopens sessions, for a driver restart and a memory-service restart alike [C, `lib/blockring/src/lib.rs:31-34`] |
| Supervisor | Signed roles as spawn attributes (pager, reclaimer, resident); floors, restart holds and wire allowances as the permission service decides them; restarts, automatic and manual; the backing's management handle, which grants no read |
| Compositor | Resident. Window buffers are charged to their clients (§4). It wires the buffers it shows, from a worker off its loop (§5) |
| netstack, logkeeper | Copy client regions through `mem_read`/`mem_write`, deferring a client whose pages are not resident (§5) |

The `reclaimer` role is a privilege beyond a device claim, so it is granted only in the signed image's
`system.toml` (root `CLAUDE.md`). It serves Q-5's memory service, and follows memory §7.3's signed-pager-role
pattern.

Deleted on the way [C]: the file server's data cache (`system/fileserver/src/cache.rs`) at W2, and
`kernel/src/file_cache.rs` behind kernel tmpfs at W3. No SDK cache.

## 2. Page lifecycle

```text
 file page: absent ─fault→ request ─mem_supply→ clean ─store/write→ dirty ─begin→ cleaning ─end→ clean
              ▲                                   │ dropped, no I/O (policy order, or the kernel's fallback)
              └───────────────────────────────────┘   truncate: mem_resize as memory §7.3

 anon page:  resident ─clean_begin(blocks)→ cleaning: block b claimed, claim number c
                ▲  ▲          │ store, write copy since begin, or write failed: kept (b freed, or retired)
                │  └──────────┘
                │             │ every write acknowledged ─▶ a flush answers Durable ─▶ clean_end
                │             ▼
                │          swapped(b): b referenced, claim c held in the kernel's record for b
                │             │ fault: the waiter records (b, c)
                └─ mem_supply(b, c) from M; b freed in the same hold ◀─┘
 discard, decommit, release or exit from any state: a swapped entry frees b and allocates nothing
```

- **One family of operations over a page location**, an object offset or a private leaf. `clean_begin` and
  `clean_end` are memory §7.3's `mem_writeback_begin`/`end`, generalised, and so are `mem_supply` and
  `mem_fail`, with one host model. The ABI may split them by right (pager versus reclaimer). The begin/end
  contract, the `kept` bitmap and the range rules are §7.3's.
- **File pages are never swapped.** Dirty ones are written to their file and clean ones are dropped.
- **The memory format** (`/tmp`, no-DATA boots):
  - each file is one resizable anonymous object that the file server creates and owns;
  - `MAP_SHARED` and `read()`/`write()` share it;
  - `mem_read`/`mem_write` answer `Pending(ticket)`, `Busy` or `Lost(cause)`, through a ticket table the caller
    committed, which raises `available`;
  - growth and shrinking go through `mem_resize`;
  - a *served* mark makes its creator's teardown invalidate every mapping through the RAM-object reverse index,
    as memory §7.6 does for paged objects.
- **Anonymous pages** are private memory, `mem_create` objects, #1077's committed parts of objects, and memory
  §6's private snapshots, each by its charged job (§4).
  - **`clean_begin`** names the blocks it will write, chosen by the service from `backing_query`. The kernel
    claims them atomically and refuses the whole call, changing nothing, if any is not free. Each claim gets the
    next claim number.
  - On a private page it marks the leaf with the software bit `CLEANING`, write-protects, shoots down and
    clears dirty, all under the space lock.
  - A store faults, re-dirties and clears `CLEANING`.
  - A kernel **write** copy takes its pin under the space lock [C, `kernel/src/user_ptr.rs:156-162`] and clears
    `CLEANING` there.
  - A read copy leaves `CLEANING` alone. It cannot dirty the page, and a frame freed while pinned is reissued
    only after its last unpin [C, `kernel/pure/frames.rs:10-14`].
  - A page with a write pin is never begun. So `CLEANING` still set at `clean_end` means exactly "not stored to
    or write-copied into since begin".
  - Shared objects keep §7.3's per-page flag in their index.
- **`clean_end`** is called only after every write of the batch was acknowledged and a later flush answered
  durable (§3.1).
  - A still-`CLEANING` leaf becomes a non-present entry holding the block number. The claim number stays in the
    kernel's record for the block.
  - The encoding keeps the implied frame number clear of cacheable physical memory, as Intel's L1TF guidance asks
    of not-present entries [P].
  - Then come the shootdown, the futex revoke (memory §7.3, kept) and the free.
- **A fault on a swapped entry** records (b, c) in its waiter and raises `requested`. `mem_supply` names (b, c)
  and is refused unless b is referenced with claim c. v1 supplies only waiters, with no read-ahead.
- **#1070's `vm_remap`** moves every non-empty leaf [C, `kernel/src/mm/space.rs:677-698`].
  - A swapped entry and a `CLEANING` leaf move with their bits.
  - `move_leaves` rewrites each moved frame's reverse record under the space lock it already holds.
  - So `clean_end`, which names the frame's token, finds the page at its new address.

## 3. Correctness

- **Concurrent access.** One backing per mutable file (memory §7.2). The lock order is object, then space.
- **No kernel lock across a wait, for all user memory (stage S0-a).** Every user copy faults or swaps in its
  chunk before it takes any kernel lock, then pins under a re-check. No pin is held across a wait.
  - This closes `issues/a-user-copy-demand-pages-under-whatever-its-caller-holds.md` and
    `issues/a-pipes-lock-spans-a-user-copy-and-its-first-allocation.md`.
  - A copy that meets a lost page drops its pins and ends its caller (§0.1). Nothing it has already copied is
    reported as a result.
  - **Futex:** the waiter's re-translation after it arms never waits. A swapped or lost word returns as a
    spurious wake.
- **Permissions.** Handle rights bound `max_prot` (memory §2). Since #1076, `WRITE` is the right to map writable
  or lend to a device [C, `SYS_SHM_MAP`, `SYS_DEVICE_DMA_MAP`]. Lending moves a charge from `A` to `W` (§4).
  `mem_read` needs `READ` on the object and `mem_write` needs `WRITE`, as for mapping. The reclaimer reads only
  pages it has begun.
- **File-server failure**: memory §7.6, unchanged.

### 3.1 The last recoverable copy

**Invariant.** At every instant each live anonymous page has exactly one authoritative copy. Nothing writes that
copy except the page's owner, through stores or copies into its own memory. A copy becomes authoritative before
its predecessor stops being so, in one hold of the lock that orders them. A durable replica may exist beside it.
Three rules carry the invariant:

- **R-a. A referenced block is never written.** A block is claimed only from the free state, at `clean_begin`,
  before any write is issued. A referenced block leaves that state only by release (its page is gone) or by
  swap-in (in the same hold that installs the frame).
  - The service's write path takes the `Claim` that the begin answered and consumes it. So a write to an
    unclaimed block is not representable in the service's code.
  - The kernel cannot stop a buggy signed service from writing a wrong block, since the service holds the
    partition. AEAD (§3.2) turns such a write into a diagnosed loss, never into wrong data.
- **R-b. A frame is freed only when its block would survive a driver reset.** That is when a flush answers
  durable after every write of the batch was acknowledged.
  - The block client answers `Durable` only after it has reissued every write a loss may have dropped. It can
    do that because it keeps each acknowledged write's data in the arena until a flush covers it
    [C, `lib/blockring/src/client.rs:10-19,263-276`, `system/diskserver/src/session.rs:6-8`]. R-b rests on that
    retention.
- **R-c. Swap-in installs before it frees.** The kernel copies the service's plaintext into a frame from `M`,
  installs it, and frees the block, all under the space lock. Until then the block is untouched, by R-a.

| State | Authoritative copy | Being written | Survives |
|---|---|---|---|
| Resident | frame | the frame, by its owner only | everything except the owner's exit |
| Cleaning: writes in flight or acknowledged, flush pending | frame (write-protected) | the claimed block, which nobody reads | service crash: the kernel fails the cleaning, so the page stays resident and dirty. Driver reset: the write is reissued or refused, and the frame is still authoritative |
| Durable, before `clean_end` | frame; the block is a durable replica | nothing | as above |
| Swapped | block | nothing (R-a) | service and driver restarts; a stopped service (§3.2) |
| Swap-in, read in flight | block | the arena block and then the service's buffer, which nobody else reads | a read refused or lost is issued again, since `requested` is level state |
| Supplied | frame | the frame, by its owner | — |

**What can still lose a page.** These are the only cases, and each is diagnosed:
- media corruption of a referenced block, which fails authentication;
- the device leaving (`gone`), when the service calls `mem_fail` over referenced blocks in batched ranges.

The boot's end discards swap by design (Q-3), and is not a loss to any running process.

**Cost of R-b.** The figures are [D] from [C]: the arena has 511 slots [C, `sdk/toyos/src/transport/arena.rs:27-30`]
and the ring has `DEPTH` 64 entries [C, `lib/blockring/src/layout.rs:22`].
- **Proposed caps, not in code today:** writes hold at most 447 arena blocks and 48 ring entries, which leaves 64
  blocks and 16 entries for swap-in reads. The service flushes once 223 acknowledged writes are held.
- **Memory.** Between acknowledgement and flush, each written page is held twice. Its frame stays allocated
  (R-b), and its ciphertext stays in the arena (the client's retention). The arena is inside the session's fixed
  2 MiB region, so it adds nothing to the commitment. The frames are 0.9–1.75 MiB of pages per batch that reclaim
  yields only at the flush. That is a delay in reclaim's yield, not a new charge.
- **Flush on a shared device.** A flush is the device's, so it also flushes DATA's cache. A device with no
  volatile write cache answers at once [C, `lib/blockserve/src/sessions.rs:51-53`]. The T14's flush cost is
  unmeasured (P5).

**File pages** follow storage W2: a write-back ends at the write's acknowledgement, and durability is `fsync`'s.
Swap cannot adopt that rule, because a lost swapped page ends a process, whereas a file write without `fsync` was
never promised.

### 3.2 Interrupted writes, nonces, block ownership and restart

**Block state.** The kernel keeps one 8-byte record per block: 3 state bits and a 61-bit claim number. A 16-byte
tag sits beside it.

```text
 free ─clean_begin→ claimed(c) ─clean_end ok→ referenced(c) ─release / swap-in→ free
   ▲                    │ clean_end failed or kept, or the service ended → free
   │                    │ the service reports a device error → retired (a spare replaces it)
   └────────────────────┘
 referenced ─mem_fail / device gone→ failed ─release→ free
```

- **Claim numbers are the generation and the nonce.** One counter in the backing object is advanced once per
  claim and never reused within a boot.
  - A stale `mem_supply` or `mem_fail` naming (b, c), after b was freed and claimed again as c′, is refused.
  - A stale ciphertext of b fails to open under c′.
  - Swap lives one boot (Q-3).
- **AEAD.**
  - The key is 256 bits, drawn from the kernel RNG when the backing is created at boot. It lives only in the
    backing object and is handed out only to the attached reclaimer. Sealing and opening are the service's.
  - The nonce is derived from the claim number: epoch e = c >> 26 and sequence s = c mod 2^26. The subkey is
    HKDF(key, e) [C, `lib/crypto/src/kdf.rs`]. A sequence stays far below the value `toyos-crypto` refuses for
    GCM [C, `lib/crypto/src/aead.rs:100`].
  - **Why 2^26 pages (256 GiB) per subkey.** RFC 8446 §5.5 allows 2^24.5 full-size records (2^14 B each) per
    AES-GCM key "while keeping a safety margin of approximately 2^-57" [P]. That is 2^34.5 AES blocks. A 4 KiB
    page is 2^8 blocks, so the limit is 2^26.5 pages [D]. 2^26 stays under it.
  - **ChaCha20-Poly1305.** RFC 8446 §5.5 says that for ChaCha20/Poly1305 "the record sequence number would wrap
    before the safety limit is reached" [P]. Its integrity bound in the CFRG's AEAD-limits work grows with
    forgery attempts [P, draft-irtf-cfrg-aead-limits; to pin at the site]. Here each forgery attempt is a failed
    authentication, which fails that page.
  - One epoch length for both keeps one code path, within both limits [E].
  - **No AAD.** The kernel ties each claim to one block, so the nonce binds the place.
  - The tag goes to the kernel record through `clean_end`, and comes back with each `requested` notice.
  - AES-256-GCM is used where the CPU has AES and carry-less multiply, which is x86-64 today. AArch64 uses
    ChaCha20-Poly1305 today, because the crate has no AArch64 AES path [C, `lib/crypto/src/arch/aarch64.rs`].
- **Uniqueness has two parts.**
  - The kernel never repeats a claim number. This is structural, and the P3 host model asserts it.
  - The service seals each claim at most once. The begin's `Claim` is consumed by the seal. A retry after a
    failed write is a new begin with a new claim. A reissue after a loss sends the same ciphertext and is not a
    seal.
  - `toyos-crypto` gains `SealingKey::at(key, next)` and `seal_at(sequence, ..)`, which refuses a sequence below
    `next` and advances past it. That is monotone with gaps, so the crate also refuses a double seal of one claim.
    It is documented as the caller's uniqueness contract and lands with its pin.
- **An interrupted write** can leave its claimed block holding anything [E]. The block becomes referenced only
  through R-b. So no reference names a block whose last write was interrupted, and the next claim overwrites a
  torn block.
- **Reuse of a dead incarnation's claims.** When the memory service ends, the kernel frees its claimed blocks.
  A write the dead process put on the wire cannot land after a write of the restarted service to the same block:
  1. A session holds its partition until each command it issued has been answered.
     - `place` hears every hang-up and retires closing sessions before it judges an open
       [C, `lib/blockserve/src/sessions.rs:112-116`].
     - `retire` releases a hold only when nothing of that session is in flight [C, `sessions.rs:298-313`].
     - An overlapping open is refused `Held` [C, `sessions.rs:121`, `lib/blockhold/src/lib.rs:3-5`].
  2. So every write of the restarted service is submitted after the dead session's commands completed.
  3. Ordering is the host's to enforce. Requests in flight are unordered, and a client that needs one to follow
     another waits for the first's answer [C, `lib/blockring/src/lib.rs:28-29`]. The NVMe specification orders
     nothing among outstanding commands [P, NVMe Base 2.0, command ordering; to pin at the site].
  4. **A driver restart resets the controller first.** The driver clears `CC.EN`, waits for `CSTS.RDY` = 0, and
     only then answers what was aborted [C, `system/nvme/src/main.rs:234-243`, `system/nvme/src/nvme.rs:644-657`,
     citing Controller Level Reset §3.7.2 at `nvme.rs:25`]. A new driver does the same in `enable`
     [C, `nvme.rs:327-333`].
  5. **New prerequisite (S0-b).** Today a reopen while the dead session still has commands in flight is refused
     `Held` and fails. It must instead wait for that session's retirement. The device's protocol timeouts bound
     the wait (memory §7.8, "where each bound lives").

**What survives what.**

| State | Owner | Memory-service crash, stop or spent budget | Driver or diskserver restart |
|---|---|---|---|
| Block state, claim numbers, tags, key, counter | kernel backing object | kept | kept |
| Swapped entries | page tables | kept | kept |
| Requests | waiter records, level state | kept, and re-reported to the next process that attaches | kept; reads refused at the session's end are issued again |
| Begun cleanings | kernel | failed at teardown: pages resident and dirty, claims freed | the service ends them failed, or reissues the same ciphertext to the same claim |
| Acknowledged, unflushed writes | the block client in the service | lost with the process, harmlessly: by R-b no referenced block depends on them | reissued as identical bytes [C, `client.rs:10-19`] |
| Placement cursor | service | rebuilt from `backing_query` | kept |
| Policy history | service | lost [E: it costs refault accuracy for about one scan cycle] | kept |
| The session | service and driver | reopened through diskserver after the old hold retires | reopened |

This is Q-3's [owner requirement, private]. Nothing in it depends on what the dead
process did last.

- **Attach.** A restarted reclaimer calls `backing_attach`, receives the key and the next claim number by copy,
  and starts. It needs no flush first and has no `Lost` path.
  - Attach requires the `reclaimer` role and is refused while another live process is attached.
  - The supervisor holds only the backing's management handle, which grants no read.
- **A stopped service, or a spent restart budget.** Bounded automatic restarts do not authorize destroying
  recoverable state.
  - The backing, its records and every swapped entry are kept.
  - Faults on swapped pages wait, reported overdue as "memory service not running", with the time it ended.
  - An authorized manual restart (memory §7.8's manual path, which spends no crash budget) attaches and serves
    them.
  - Until then the user may stop any waiting program (Q-9). Kill cancels its waits, and its exit frees its
    blocks.
  - Nothing is failed and nothing is invented.
- **The cases kept apart.**
  - **Established, irrecoverable loss** fails exactly the pages it covers: an authentication failure, a read
    failed after the driver's recovery, or the device leaving. Each touch then reports as §0.1 says.
  - **Intentional final teardown** is the boot's end, at shutdown or reboot. The backing is a kernel object of
    the boot, so no handle's close, no supervisor decision and no service's end destroys it. Swap is not
    recovered across a reboot (Q-3).
- **Swap I/O failure.**
  - A failed write ends its cleaning with `kept`, and the service retires the block.
  - A failed or unauthenticated read becomes `mem_fail(b, c, cause)`. It never yields zeros.
- **Shrinking backing.** `S` counts the partition less a spare reserve (§8). A retired block takes a spare, so `S`
  and every commitment it covers stand until the spares run out.
  - The device leaving, or retirements past the spares, makes `S` smaller than the commitments it covered.
  - New commitments are then refused at their call.
  - Existing commitments stand. A swappable fault that finds no frame takes the fallback, and otherwise waits,
    reported overdue with the deficit (committed minus `R + S`).
  - The wait is never ended (Q-4). Frames return as processes end or are stopped.
  - Where the internal device that holds swap also holds DATA, its departure is already the session's failure
    [E: a machine can have two internal disks].

## 4. Commitment accounting

Units are frames and #1057's superframes. The symbols:
- **R**: frames managed;
- **K**: the kept superframes;
- **F_j**: job *j*'s floor (`memory.min`: the first `F_j` of its use is guaranteed [P, cgroup v2]);
- **W_j**: its resident charges (below);
- **A_j**: its swappable commitment;
- **S**: swap blocks added, less the spare reserve and the retirements past it;
- **M**: the reclaimer's reserve, at most one superframe.

```text
 resident rule:  Σ_j max(F_j, W_j)        + K + M ≤ R
 backing rule:   Σ_j max(F_j, W_j + A_j)  + K + M ≤ R + S
 frame rule:     a W promise is a #1057 promise: a frame held back, never taken by a swappable fault.
                 An A promise is a backing unit, which holds no frame.
```

- **The frame rule is what makes "resident never waits" true**, for memory charged to a resident job or wired.
  - A resident fault draws its held frame, exactly as every fault does today
    [C, `kernel/pure/frames.rs:16-21`: "A promise is a frame no other allocation may take"].
  - A swappable fault takes a frame only from frames neither promised nor held back. With none free, it first
    takes memory §3's mechanical fallback: any clean, unpinned, unprotected slack page, preferring the service's
    latest candidates. The fallback never takes a `W` frame. Only if no slack page exists does the fault wait
    for reclaim.
  - With `S = 0`, no fault ever depends on the service, and the rules reduce to #1057's.
- **Residency follows the job an object is charged to.** A charge is `W` when its job is a resident job, or when
  it is resident by kind (below). Otherwise it is `A`.
  - An object's charge is its creator's job, or the job a creator names with `SHM_FOR_JOB`
    [C, `kernel/src/syscall/ipc.rs:340-351`]. This is Q-11: one owner, kept through sharing.
  - **Window buffers** are created by the compositor with `SHM_FOR_JOB` for their client, so they are the client's
    `A`.
    - This follows Q-13's preference for client-owned bulk buffers.
    - `budget.rs` calls its RAM/8 cap "a mitigation" for a buffer that "is charged to nobody", and names a kernel
      memory limit as what should replace it [C, `system/compositor/desktop/src/budget.rs:41-49`]. Charging the
      client is this plan's reading of that fix.
    - The compositor still creates them, as #1076 decided.
    - **A charge-only right.** Today `SHM_FOR_JOB` requires `WRITE` on the job [C, `ipc.rs:346`]. On a job,
      `WRITE` also places a spawned child in it [C, `kernel/src/loader/start.rs:186`]. With the `FLOOR` `SysCap`,
      it also sets the job's floor [C, `kernel/src/syscall/proc.rs:283-292`, `kernel/src/object/job.rs:36-40`].
      - A new job right `CHARGE`, in `toyos-abi`, is what `SHM_FOR_JOB` requires. No spawn, floor or allowance
        path accepts it.
      - A client grants `dup_narrowed(job, CHARGE | TRANSFER)` at connect. `TRANSFER` is what lets the handle
        travel [C, `job.rs:36-40`: "`DUP` and `TRANSFER` to hand that on"]. This is the explicit authority Q-13
        asks for.
      - **The compositor may not pass it on.** At receipt it narrows the handle to `CHARGE` alone and closes the
        received one. The kernel does not strip `TRANSFER` on arrival, so this narrowing is the compositor's
        contract, checked in its review and in the C-wire row.
      - The rights the kernel mints to a job [C, `job.rs:36-40`] gain `CHARGE`. So the supervisor's own
        `SHM_FOR_JOB` use for log rings [C, `system/supervisor/src/main.rs:325`] works unchanged.
      - **Owner: the kernel/memory track, in P1.**
  - **Log rings.** The supervisor creates each child's ring for the child's job (#1057). So the memory service's
    ring is resident, and an app's ring is the app's `A`. An app's own ring write may therefore wait on its own
    ring's swap-in, which delays only that app. `sdk/toyos/src/log/stdio.rs:14-17`'s "never waits" then holds
    for resident and wired rings only, and the header says so.
- **Every increase of `W_j` checks both rules.** That covers page-table builds, heap charges, runs, `vm_wire`,
  floor sets, lending, and `vm_remap` growth of a resident range. An increase of `A_j` checks the backing rule.
  - #1070's `vm_remap` is already promised, charged and all or nothing [C].
  - #1077's `SYS_SHM_COMMIT` charges the object's job [PR text]. Under swap, its eager zeroing of an `A` charge
    may wait for frames, since it is a syscall holding no lock.
- **`W_j`** holds:
  - page tables (which also hold swapped entries), kernel-heap charges and runs;
  - wired ranges, at the wirer's charge (§5);
  - resident-by-kind objects;
  - a pager's `C`;
  - everything charged to a resident job.
- **`A_j`** holds the rest of a job's committed private pages and charged objects. That includes #1077 commits,
  private snapshots, and never-writable copied pages (§6).
- **Resident by kind**, charged in `W` whatever the job:
  - kernel-created objects the kernel writes from another context: inbox rings, TLS blocks, the clock page;
  - any object lent to a device (`dma_map`, `create_for_device`). Lending moves its charge from `A` to `W` and
    checks both rules; #1076 already gates lending on `WRITE`;
  - sealed immutable versions, in the shared-files account (Q-12; memory §7.6 and §9.4);
  - boot payloads.
- **In #1057's terms** [C, `frames.rs:335-338`]: reserved, kept and floor-whole superframes stay whole and free,
  and are never backing. A floor also gives `memory.min`'s reclaim protection: a job is never reclaimed below
  `min(F_j, use_j)`.
- **Superframes under pressure**, as r4:
  - targeted evacuation of a superframe whose frames are all clean, swappable or free, by drop and swap-out;
  - this is eviction, never migration;
  - unmovable 4 KiB frames are drawn from their own superframes;
  - a request that can wait does so, and is otherwise refused `ResourceExhausted` and reported;
  - heap growth that cannot wait takes a kept superframe, and the next evacuation refills `K` first.
- **Shared backing is charged once**, to its charged job or inside the pager's `C`. Only reserved backing counts,
  with no ratio (unlike Linux overcommit mode 2 [P]).
- **Ledger.** #1057's `committed` splits into resident and swappable. `resident`, `swapped`, `refaults`, stall
  time, the wired total, the wire allowance and wire refusals join `SYS_ACCOUNT_INFO`. A swapped page stays its
  job's charge. Swap I/O CPU time is the service's.

## 5. Bounded progress, contained delay, and what stays resident

**`resident` processes** (whole-process, from a signed row). Everything charged to their jobs is `W`. Their
images come from objects the supervisor holds, never through a file server. Each row states its `restart-hold`
in superframes. Each program declares its stacks (§7).
- the stop, input and restart path: the supervisor, the input servers, usbd (it carries HID), and the compositor;
- the swap chain: the memory service, the storage driver, and diskserver, which reopens sessions after a driver
  or memory-service restart.

### 5.1 Contained delay: a service never waits on one client's memory in a path that serves others

**The conflict.** r6's option B charged window buffers to their clients, so they could swap, and the resident
compositor mapped them.
- A fault on one cold window stopped the compositing loop. Every app's drawing and input routing froze, and the
  stop control needed a separate thread with a per-backend present handshake.
- That spends unaffected work (Q-4) and every client's responsiveness on one client's memory.
- netstack has the same shape: it maps each client's stream region, charged to the client under #1077, so one
  swapped ring page would stall every connection.
- The file server, for each client's 2 MiB window [C, `sdk/toyos/src/fs.rs:65,748`], and logkeeper, for each
  program's 2 MiB log ring [C, `sdk/toyos/src/log/region.rs:22`], are the same case.

Q-9 allows a client to be slow on its own memory. It does not allow a service to make every client slow because
of one client's memory, which also breaks Q-13's bounding of client-driven effects.

**The rule.** A service's shared path touches client memory only in one of two ways, chosen by how it uses that
memory. Both put any wait on the client whose memory it is.

- **Copy-shaped access: non-faulting copies.** A service that copies data in or out of client memory does so with
  `mem_read`/`mem_write` on the client's object, never through a mapping.
  - These calls already exist in this plan for the memory format (§2). They answer at once.
  - On a non-resident page they answer `Pending(ticket)` and request swap-in, and `available` is raised when the
    page arrives. The service defers that client alone and serves the others.
  - `Busy` means the service's ticket table is full, and it retries after its next completion. `Lost` is §0.1's
    row.
  - Words the protocol reads or writes as atomics, such as a ring's cursors, sit in a header page that the
    service wires (below), at its own charge: 4 KiB per region.
  - **Users:**
    - netstack's stream rings (their 4 KiB header [PR #1077] wired, the data spans copied);
    - the file server's client windows (requests staged in them, copied);
    - logkeeper's rings. The slot bodies are copied, and each slot's `published` word is read from the copy.
      That is already safe, because "a reader trusts nothing it reads beyond the equality and bound tests"
      [C, `sdk/toyos/src/log/ring.rs:24-28`], and a slot is accepted only if its copied `published` word matches.
- **Per-frame pixel access: the compositor wires what it shows.**
  - The compositor wires the buffer of every window on the current screen, visible or covered, at its own charge
    and within its granted allowance. Under the additive rule below, the client keeps its `A`.
  - It unwires a window that leaves the screen: minimized, or on another workspace.
  - Wiring happens on a worker thread, never on the loop. A window shown again appears only once its wire has
    completed. Until then the loop does not compose it, and the window stays as it was off screen.
  - So the loop never touches an unwired buffer and never waits on swap. The delay of a returning window is that
    window's alone.
  - Covered windows stay wired, so uncovering one never shows missing pixels. No placeholder is ever drawn, and
    visual quality is unchanged (root `CLAUDE.md`).

**Why not one mechanism for both.**
- Non-faulting copies for the compositor would mean a strided kernel copy per window per frame, or a staging copy.
  The staging copy adds 8.3 MB per full-screen 1080p frame, or ≈ 500 MB/s at 60 Hz [D]. A partly resident window
  would also have nothing to draw.
- Wiring netstack, file-server and log memory would keep every idle connection, window and ring resident. That is
  2 MiB per file-server client and per program's log ring [C], and up to 8 MiB + 4 KiB per grown stream region
  [C, #1077's `REGION_BYTES`], which never shrinks (`issues/a-stream-ring-never-shrinks.md`).
- So each access shape takes the mechanism that costs it least.

**The emergency presentation path becomes ordinary.**
- The compositing loop no longer waits on swap. Its remaining blocking waits are its file I/O on the loop, which
  memory §7.8 already records as a dependency to move off the loop.
- So the stop overlay can be drawn by the loop, as the volume overlay is today
  [C, `system/compositor/src/session.rs:1986,1993`, `system/compositor/src/render.rs:311`].
- r6's C-overlay (its own thread, an atomic present handshake, and a per-backend question) is deleted. The cost is
  one wiring worker and a per-window "on screen and wired" state.

**What it costs** [D from §7's measurement; the screen size is the T14-class 1920×1200 [E]]:
- **Resident window memory** is every on-screen window's buffer, at the compositor's charge:
  - ≈ 6.6 MiB per terminal window, as measured [M];
  - ≈ 8.8 MiB per full-screen window (1920 × 1200 × 4 B);
  - twice that during a resize;
  - bounded by the compositor's granted allowance, which replaces its RAM/8 window budget.
  
  Windows off screen swap as their clients' memory.
- **A returning window's delay** is the swap-in of its buffer. That is ≈ 2 250 pages for a full-screen window, at
  the swap device's 4 KiB read rate with up to 16 reads in flight (§3.1). The order is tens of milliseconds on
  NVMe [E]; P5 measures it.
- **Copy-shaped services** pay one syscall per copied span instead of a user-space copy. That is ≈ 0.1–0.5 µs a
  span [E], against spans of up to a ring or a window. P5 measures netstack's rate, which is already a recorded
  gap (`issues/netstack-sends-tcp-at-a-third-of-what-the-t14s-wired-link-carries.md`).
- **Owners.** The compositor track owns the wiring worker and the charging change. The netstack, storage
  (file-server window) and logkeeper owners own their copies. Each is a prerequisite of P3 (§10), because before
  P3 nothing can be swapped and no service can wait on swap.

### 5.2 What a swap-in needs in order to finish, and its bound

Figures are `committed + kernel` per job [M: #1057 round 3 at `c06cc695e`, QEMU q35, `Profile::Metal`, 4 GiB guest
(4001 MiB managed), `images/system.toml` with the desktop session and four terminal launches, through the scratch
patch `scratch-measure-r3.patch`; published at
`ToyOSOrg/evidence@db37c51e785164253479d4ee440e999abfb206da`, `r3/measure-2.log.gz`].

| Needed | Why | Bound |
|---|---|---|
| The faulting thread's waiter record | The request lives in it (memory §7.3) | none extra |
| Page tables holding swapped entries | Each entry holds its block | in `W`, about 0.2 % of the swapped span (one 4 KiB table per 2 MiB) [D] |
| The backing's per-block records | Claim, state and tag | 24 B per 4 KiB block, 0.59 % of `S`: 48 MiB at `S` = 8 GiB [D] |
| Reverse records | Finding frames to reclaim | 8 B per frame, 0.2 % of `R`: 32 MiB at 16 GiB [E: r4's 29+35-bit packing] |
| The memory service, whole | Read, open, supply. Its log ring is charged to its own job, so it is resident (§4) | unbuilt, ≈ 12 MiB like diskserver [E], plus its 2 MiB session region (lent, so resident by kind) and `M` ≤ 2 MiB |
| The storage driver, whole | The command | nvme 18.5 MiB [M], including its 2 MiB DMA grant [C, `system/nvme/src/nvme.rs:86,250`] |
| The session connection's ring | The doorbell | one 2 MiB run, taken at the first write and kept while the pipe lives [C, `kernel/src/pipe.rs:119-121,143-155`] |
| diskserver | Reopening the session after a driver or memory-service restart | 12.2 MiB [M] |
| The supervisor | Restarting any of these | 41.7 MiB [M] |
| A dead resident row's restart hold | Whole superframes for its next start | only while dead. It replaces that row's running charge, so it adds nothing to the steady state |

**Bound.**
- The swap chain holds ≈ 41.7 + 18.5 + 12.2 + 16 ≈ 88 MiB at today's stack sizes [M + E], or ≈ 53 MiB with
  declared stacks (§7) [D].
- On top of that come 0.59 % of `S` and 0.2 % of `R` in kernel records: ≈ 80 MiB with `S` = 8 GiB on a 16 GiB
  machine [D].
- Nothing in the chain grows with the number of processes or swapped pages, except those two kernel tables. They
  are committed when blocks are added and at boot.

**Not on the chain**, and checked: file servers (swap is a raw partition), logkeeper, netstack, soundserver, and
every app. Only nvme and usbd use blockserve, and swap is internal-only, so NVMe is the only swap path [C].

**The restart hold, not a floor** (r4, kept).
- When a resident process dies, its job keeps up to its row's `restart-hold` superframes, kept whole. They are
  released only to that job's next start, or when the supervisor closes the service.
- While held, the hold counts as that job's `W_j` in both rules. While the process runs the hold is zero.
- It is whole superframes because the chain's restart draws 2 MiB runs, for session regions and the NVMe DMA
  grant [C, `lib/blockserve/src/region.rs`, `nvme.rs:250`], and heap growth by superframes
  [C, `frames.rs:22-33`].

### 5.3 Wiring

Q-8 asks for bounded ordinary wiring with explicit authority for more. Q-15's helper rule is applied to it.

- **The rule.**
  - Each job has a wire allowance.
  - `vm_wire` counts against the wiring process's own job's allowance, and is refused `ENOMEM` past it or past
    either rule.
  - Helpers share their job, so they share its allowance. A new job needs a launcher's authority (Q-15).
- **Wiring another job's memory: charges are added, never moved.**
  - The charged job keeps its `A` charge, so its backing stays reserved.
  - The wirer adds a `W` charge for the frames the wired pages occupy, and its allowance counts them. The
    addition is made at the wirer's own `vm_wire`, which checks the wirer's allowance and both rules, and may be
    refused.
  - A page wired by two jobs is counted in both, which is conservative and rare.
  - `vm_unwire`, an unmap, or the wirer's end only removes that wirer's own charge. So no release can fail a
    rule. The page stays resident while any wirer's charge remains.
  - No mapper can spend another job's allowance or make another job's memory resident at that job's expense.
- **One grantor.** The permission service decides every larger allowance, and the supervisor applies it, through
  a `SysCap` call only the supervisor holds, beside `SYS_JOB_FLOOR`.
  - Signed rows' grants are that service's policy for the image's own programs: each file server's page-in and
    write-back working set (memory §7.4 rule 3), soundserver's slots, realtime stack and log lane, netstack's
    and logkeeper's header pages, and the compositor's on-screen windows.
  - An installed package's larger request goes to the same service.
- **Resident jobs and resident-by-kind charges** are not wiring and do not count against the allowance.
- **The floor-bounded alternative, rejected.**
  - Floors go only to programs that do no client work (memory §5).
  - Soundserver and the file servers would then need floors, so client-driven work would draw on protected
    capacity.
  - A floor is also a guarantee of use, not a ceiling on wiring.

**The default allowance is 8 MiB per job: a provisional engineering choice [E].**
- **Why that size.**
  - It must hold what an ordinary realtime app wires: a realtime thread's stack (up to std's 2 MiB default
    [C, `sdk/std/sys/thread.rs:44`]) and a few audio periods (a 10 ms stereo f32 period at 48 kHz is 3.75 KiB [D]),
    with room for a second realtime thread.
  - It must stay small beside RAM. 8 MiB is 0.05 % of a 16 GiB machine [D]. Jobs come only from authorized
    launchers (Q-15), so the ambient total is bounded by the job count: 100 jobs is ≈ 5 % [D].
  - Linux's default `RLIMIT_MEMLOCK` is reported as 8 MiB since 5.16 [E, to pin to the kernel's release notes].
- **How it is adjusted.**
  - P1 adds the wired total, the allowance and wire refusals to each job's ledger (§4).
  - P5 runs the bench workloads: audio, the desktop, a self-build.
  - The default rises if ordinary apps meet refusals there.
  - It falls if the sum of ambient wiring approaches the resident rule's headroom on the smallest supported
    machine.
  - The change is a constant in the supervisor's policy, not an ABI change.

**Swap-out progress needs no free frame.** Drops are I/O-free. Sealing writes into arena blocks of the session
region, within the caps of §3.1. Frames come back at `clean_end`.

**Allocation-free swap I/O (S0-b, storage track).** Today the session client allocates per request and per answer
[C, `system/diskserver/src/session.rs:191,204,215,324,329,337`, `lib/blockring/src/client.rs:279`]. The driver
side grows its in-flight list per entry [C, `lib/blockring/src/server.rs:96`].
- **Required:** fixed tables sized by `DEPTH`, and reads opened straight from the arena into the service's own
  buffer.
- **Check:** a host test under `DEPTH` traffic, with an allocator that fails after warm-up.
- The IOMMU side already allocates nothing per I/O [C, `kernel/src/pcidev/mod.rs:1482`, `nvme.rs:84-89`].
- **#1074 (draft)** would make a pipe take 4 KiB frames as it fills. The swap session's connections would then
  need to keep their first frame, or a doorbell after a drain would allocate.

**Why no cycle.** The chain is fault, then memory service, then driver, then device, with diskserver only to
reopen and the supervisor only to restart.
- Every link is resident, so none takes a swap fault.
- None maps a paged object (memory §7.4 rule 1, extended to the reclaimer).
- None touches a client's swappable memory except through `Pending` copies.
- None waits on a file server.
- None allocates per I/O.
- Swap-in draws only on `M`, and resident faults draw only on their held frames (§4).
- No kernel lock is held across any wait (§3).
- A file server's swappable part may wait on the swap chain, which never waits on it.

**Writeback, backpressure and waits** are r4's. File dirty data is bounded by `C − C_clean` and caps (memory
§7.5). The service raises `reclaim_pressure` on a pager and never waits on it. Waits on swap-in and frames join
memory §7.8's table:
- advanced by `mem_supply` or reclaim;
- failed only by `mem_fail`;
- ended by kill;
- reported overdue, with the service's progress times, whether it is running, and any backing deficit.

There is no automatic kill or suspension (Q-9).

## 6. Executable backing

Q-6 allows clean executable pages to [owner requirement, private] version, never substituted, with
essential recovery code resident.

**Today** [C]:
- Every `PT_LOAD` segment, text included, is a committed `Kind::Copy` range of the process
  (`kernel/src/loader/mod.rs:121`). Each page is copied from its source at first touch
  (`kernel/src/mm/space.rs:829-845,925-944`).
- The only sources the kernel knows to be immutable are boot images and their subranges
  (`kernel/src/object/shm.rs:177-183`, `SharedMemObject::immutable`).
- Other sources are writable objects. For those, "a change after the hand-off reaches only pages not yet read"
  (`kernel/src/file_backing.rs:38-48`).
- So under r4 a cold text page was `A`: it would have been encrypted, written to swap, and read back.

**The rule.** A copied page is never swapped when its range has never been writable, its source is immutable, and
its job is not resident. Such a page is dropped like a clean slack page. Its next touch copies it again from the
same source, with no I/O. That is Q-6's [owner requirement, private].
- **Never writable** is a flag on the range, set at creation and cleared by any `vm_protect` to `ReadWrite`.
  - It covers text and read-only data, which are 69–86 % of each service's image [E: `readelf -lW` of a
    2026-10-23 build in the primary checkout, revision not recorded].
  - RELRO pages are written before they are protected, so they are excluded. So is `.data`, which swaps as the
    program's own data.
  - A never-writable page cannot be stored to, and the kernel's fill writes only private ranges
    [C, `space.rs:871-912`]. So no dirty bit is needed.
- **Charging.** These pages stay in their job's `A`, as committed private memory is today.
  - The backing rule then guarantees that a refill finds a frame through reclaim.
  - They never take a swap block, so `S` is overcounted by their size: ≈ 1–1.6 MiB per running program
    [E, from the segment sizes]. That lasts until stage 6.
- **Resident jobs.** A resident job's ranges are `W`, held frames, and are never dropped (Q-6, essential recovery
  code). The fallback never takes a `W` frame (§4).
- **Holding the source.** A `Kind::Copy` range already holds an `Arc` to its source [C, `space.rs:39-41`]. It also
  counts as a mapping of the source for memory §7.2's `unmapped` notice and for stage 8's purge. So a sealed
  version is neither released nor purged while any copy range may refill from it, and no update can substitute
  contents (Q-6).
- **Prerequisite.** P3 follows memory stage 4, under which a spawner's image must be exec-sealed or the spawn is
  refused (memory §4). By then every copy source is immutable. After memory stage 6, text maps its sealed source
  directly, and the copies go, with this rule.

**The source stays resident.** Sealed versions remain committed RAM objects in the shared-files account (Q-12;
memory §7.6, §9.4, stage 8). Boot payloads remain resident for the boot.
- Droppable mapped versions, refetched from the file server, are not proposed. Q-6 permits them, but they would
  give up independence from the file server's death for capacity this plan does not need to claim.
- ROOT itself is wholly resident: 117 MiB for the `--build-only` image
  [M: `issues/root-in-memory-costs-its-whole-size.md`]. This plan does not change that.

## 7. The cost of whole-service residency

**Measured** [M: the run named in §5.2]. `committed + kernel` per job:

| Job | Total | Of which main stack [C, loader 8 MiB] | Std thread stacks [C, 2 MiB each] |
|---|---|---|---|
| supervisor | 41.7 MiB | 8 | `files` and `apps`: 4 [C, `system/supervisor/src/main.rs:697`, `sessions.rs:241`] |
| compositor, at its loop before the session | 36.4 MiB | 8 | `launcher`: 2 [C, `system/compositor/src/signout.rs:71`] |
| compositor, with the session and four terminal windows | 79.8 MiB | 8 | 2 |
| usbd | 19.2 MiB | 8 | 0 |
| nvme | 18.5 MiB | 8 | 0 |
| ps2server | 14.0 MiB | 8 | 0 |
| diskserver | 12.2 MiB | 8 | 0 |

Readings:
- The compositor's total climbs by 6.6 MiB per terminal window launched (60.0, 66.6, 73.2 and 79.8 MiB at its
  settled readings) [M]. Window buffers are created by the compositor, as #1076 kept, and today are charged to
  it [C, `session.rs:1357,2236`].
- The stacks are committed whole and populated as touched (memory §3; Q-14) [C]. How much of each is touched is
  unmeasured. The main stack's argv block and its first frames are a few pages [E].
- These readings predate #1070 and #1076. Neither changes stacks or who creates window buffers.

**The options**, for a 16 GiB machine with `S` = 8 GiB [D, from the table; the memory service estimated as in
§5.2]:

| | Resident | Grows with | One client's cold memory delays |
|---|---|---|---|
| **A. r4: every row wholly resident, window buffers charged to the compositor** | ≈ 185 MiB measured + ≈ 16 MiB memory service ≈ 201 MiB (1.2 %) | every window, ≈ 6.6 MiB each, up to RAM/8 (2 GiB) | nothing; window contents never swap, but netstack, file-server and log memory still could, stalling those services |
| **B. r6: declared stacks; window buffers charged to clients and unwired** | ≈ 106 MiB (0.65 %) | nothing | every app's drawing and input, behind C-overlay |
| **D. r7: declared stacks; window buffers charged to clients; on-screen windows wired by the compositor; copy-shaped services use `Pending` copies** | ≈ 106 MiB + the on-screen windows (≈ 6.6–8.8 MiB each [M, D]) + 4 KiB per stream region and per log ring header | on-screen windows only, within the compositor's granted allowance | only that client: its own faults, its returning window, its deferred copies |
| **C. Page the controls too; wire only sub-ranges** | swap chain only, ≈ 53 MiB with declared stacks | nothing | rejected: a shared heap cannot be wired in part (memory §5). It saves at most ≈ 20 MiB more [D: ps2server, usbd and the compositor at its loop, less their stacks and kernel parts; split from #1057's unpublished `mem-per-job/logs/measure-3.log` of 2026-10-24] |

Kernel tables are the same in all: ≈ 80 MiB at that size (§5.2).

**Proposal: D.**
- It costs B's figure plus the windows actually on screen. Ten on-screen terminal windows are ≈ 66 MiB [D], which
  is 0.4 % of 16 GiB.
- In exchange no service waits on one client's memory, and the stop path needs no special presentation machinery.
- **Declared stacks.** The kernel loader commits the main stack at the size of the program's `PT_GNU_STACK`
  segment where it is non-zero, and 8 MiB otherwise. A program sets the size at link time (GNU ld's
  `-z stack-size=` [P, GNU ld manual]) and sets its own thread stacks at its spawn sites
  (`std::thread::Builder::stack_size`). Sizes come from measured depth plus a margin, and the guard page makes an
  overflow loud (Q-14).

**Unmeasured, owed by P1:** each resident row's committed and populated totals on the current tree and on the
T14. A local image build was blocked by an unrelated edit to the shared `winit` checkout, which another agent
owns. The figures above are #1057's QEMU readings.

## 8. The swap area

- **Where.** A dedicated GPT partition of a new type, TOYOS-SWAP, on internal storage only (Q-2), granted by type
  to the memory service. Removable media are refused by name. A swap file is rejected, because it puts filesystem
  allocation, moves and journaling in the swap path, as btrfs's swapfile rules show [P].
- **Size: `S = clamp(RAM / 2, 4 GiB, 16 GiB)`, chosen at install. A provisional engineering choice [E].**
  - **Why RAM/2.**
    - The aim is inactive application memory (Q-9), not running beyond RAM. A working set beyond RAM thrashes
      whatever `S` is (Denning [P]).
    - Half of RAM gives 1.5× RAM of commitment, which covers committed-but-cold memory such as untouched stacks,
      idle apps and cold windows. On the measured guest, 8 MiB of each small service's 12–19 MiB commitment was
      its main stack [M, C], most of it untouched [E].
  - **Why the 4 GiB floor.** Small machines still get room for cold memory. 4 GiB of disk is small beside
    internal storage [E].
  - **Why the 16 GiB cap.** Records cost 0.59 % of `S` in kernel memory, so 96 MiB at 16 GiB [D]. Past that, more
    swap mostly serves thrashing.
  - **No partition means `S = 0`**, logged by name. Swap is required for the first release (Q-2), so the
    installer creates the partition.
  - **How it is adjusted.**
    - P1–P3 add `swapped`, `refaults`, the deficit and swap-in stalls to the ledgers.
    - P5 runs the bench workloads.
    - If `swapped` stays near `S` while refaults stay low, the default is too small. If `swapped` never exceeds a
      small fraction, it is too large.
    - Resizing a partition means repartitioning [E], so the default is changed for new installs, and an existing
      install is resized only by its installer.
- **Spare reserve: 0.1 % of the partition's blocks, not counted in `S`. A provisional engineering choice [E].**
  - NVMe drives remap failing media internally, so a host-visible write failure after the driver's recovery is
    rare [E].
  - 0.1 % of 8 GiB is 2 048 blocks (8 MiB) [D]. That covers any plausible number of retirements on a healthy
    drive, at a disk cost of 0.1 %.
  - **How it is adjusted.** Retirements are logged and counted. If any bench retires more than half its spares,
    the reserve grows; a drive retiring at that rate is reported as failing.
- **Blocks.** One block is one 4 KiB page. `backing_query` answers free runs. The service clusters a batch into
  sequential writes. The kernel claims at `clean_begin` (§2).
- **Metadata residency.** Records, claim numbers, the key and policy state are resident. Nothing but page
  contents is read from disk.
- **Storage §3.5's "there is no swap" is superseded** by encrypted, authenticated swap (Q-2). Swapped memory,
  secrets included, is written to the internal disk only as ciphertext under a boot key that never leaves RAM.

## 9. Interfaces (generic)

- **Roles:** `reclaimer` (one process) and `resident`, as spawn attributes from signed rows, refused in both
  orders.
- **`vm_wire(range)` / `vm_unwire`.**
  - `vm_wire` populates the range and keeps it resident. It counts against the wiring job's allowance, and for
    another job's object adds a `W` charge to the wirer while the owner keeps its `A`. It checks the wirer's
    allowance and both rules, and may be refused.
  - `vm_unwire`, an unmap and an end only remove the wirer's own charge, and are never refused.
  - libc `mlock` and `MAP_LOCKED` map to it.
  - The supervisor sets allowances through a `SysCap` call beside `SYS_JOB_FLOOR`.
- **The backing**, one per boot.
  - Every call requires the `reclaimer` role, so the supervisor's management handle cannot read the key or
    change `S`:
    - `backing_add(blocks)`: commits the records, charged to the reclaimer's job, which the supervisor keeps
      across restarts [C, #1057];
    - `backing_retire(block)`;
    - `backing_query(cursor, out)`;
    - `backing_attach() → (key, next claim number)`, refused while another live process is attached.
  - The backing is destroyed only at the boot's end.
- **`clean_begin(tokens, blocks) → claims`**: atomic claim; refused whole if any block is not free.
- **`clean_end(tokens, result, tags) → kept`**: only after the batch's durable flush, by the service's contract.
  On success the claims become references. On failure the claims are freed, or retired if the service says so.
- **`mem_supply(b, c, src)`** and **`mem_fail(b, c, cause)`**, the latter also over block ranges.
- **The `requested` notice** answers (b, c, tag).
- **`mem_scan`, `mem_reclaim`, watermarks and the level notices** are r4's (`below_low`, `frame_waiters`,
  `superframe_wanted`; a pager's `reclaim_pressure`). `mem_scan` tokens are opaque.
- **RAM objects** gain `mem_resize`.
- **`mem_read`/`mem_write` on any RAM object** (§2, §5.1) answer `Done`, `Pending(ticket)`, `Busy` or
  `Lost(cause)`, through a caller-created ticket table that raises `available`. They require `READ` or `WRITE`
  respectively.
- **Job rights:** `CHARGE`, required by `SHM_FOR_JOB` and accepted by no spawn, floor or allowance path.
- **Loader:** the main stack's committed size comes from `PT_GNU_STACK`.
- **Kernel records.**
  - A reverse record per frame, laid out at boot beside the pins: a 29-bit owner index and a 35-bit page index
    in 8 B [E].
  - RAM objects gain memory §1's weak reverse index, which today only paged objects and apertures have.
  - `move_leaves` keeps both current (§2).
  - A `Kind::Copy` range counts as a mapping of its source (§6).

## 10. Staged plan

| Stage | Content | Validation | Touches |
|---|---|---|---|
| **S0-a** | User copies fault or swap in before any kernel lock and pin after, for all user memory; a copy meeting a lost page ends its caller; the futex rule (§3). **Owner: memory track (kernel)**; already a stage 7 prerequisite | **H**: chunk model, including a lost page mid-copy that ends the caller with no partial result. **Q**: pipe and futex sites; a mutation that copies under the pipe lock goes red. Closes the two issues | stage 7 prerequisite |
| **S0-b** | Allocation-free session client and driver side (§5.3). A reopen refused `Held` by a closing session waits for its retirement (§3.2). Doorbells keep their ring if #1074 lands. **Owner: storage track** | **H**: `DEPTH` traffic with an allocator failing after warm-up, red on any per-I/O allocation. A reopen during a dead session's close is answered only after its last completion, red if the hold is released early | B1's async client, #1074 |
| **C-wire** | The compositor wires on-screen window buffers from a worker, never on its loop, and composes only wired windows; window buffers are created with `SHM_FOR_JOB` for the client; the client's handle is kept as `CHARGE` alone. **Owner: compositor track** | **H**: the visibility model, where on-screen windows are wired, an off-screen one is unwired, and a returning window is composed only after its wire, red if the loop composes an unwired buffer; the kept client handle carries `CHARGE` alone, red if it carries `TRANSFER` or `DUP`. **Q**: with one client's buffer held unresident by a parked swap-in, the other windows keep drawing and the stop control works | compositor; `budget.rs` |
| **S-copy** | netstack's stream data, the file server's client windows, and logkeeper's ring slots copied through `mem_read`/`mem_write`, deferring a `Pending` client; their header pages wired at the service's charge. **Owners: the netstack, storage and log tracks** | **H**: each service's model, where a `Pending` client is deferred while the others are served, red if the shared path waits. Each with its protocol's existing tests | netstack, fileserver, logkeeper |
| P0 | Memory stages 4 and 7, and storage W2, as designed | memory §8, storage W2 | stages 4, 7; W2 |
| P1 | Two rules and the frame rule in `frames.rs` on #1057; residency by charged job; the `CHARGE` job right that `SHM_FOR_JOB` requires, granted by a client as `CHARGE \| TRANSFER`; `vm_wire` and the per-job allowance, with additive charges paid by each wirer's job; `resident` and `restart-hold`; `PT_GNU_STACK` main stacks; resident by kind; unmovable frames in their own superframes; the ledger's new figures; `S = 0` | **H**: both rules at every `W` and `A` increase, red when a table build skips the backing rule; a resident fault never waits, red when a swappable fault may take a held frame; an object `SHM_FOR_JOB` to a resident job is `W`, and to an ordinary job `A`; wiring refused past the allowance; a helper sharing its job's allowance; a wire of another job's object adds to the wirer's `W` and allowance while the charged job keeps its `A`, red if the charged job pays; two jobs wire one object, the first unwires or exits, and the second keeps its residency with no check at the release, red if any release can be refused or leaves a rule exceeded; superframe invariants under wire and lend; a hold kept whole. **Q**: a handle narrowed to `CHARGE` creates an object `SHM_FOR_JOB` and is refused `PermissionDenied` as a spawn's job and at `SYS_JOB_FLOOR`, red if either accepts it; `mmap_stress`; P1 reports each resident row's committed and populated totals | #1057, stage 5 |
| P2 | Reverse records and the RAM-object reverse index, kept current by `move_leaves`; `mem_scan`; `mem_reclaim` for clean pages and never-writable copied pages of non-resident jobs (§6); a copy range as a holder of its source; non-faulting `mem_read`/`mem_write` on every RAM object; watermarks; the kept fallback; superframe evacuation; the `reclaimer` role; service v0 (plain CLOCK) | **H**: revalidation, floor protection, revoke order (memory §8's mutations), an evacuation case; a dropped copied page refilled byte-exact from its source, red if a range once `ReadWrite` is dropped or a resident range is dropped; a version not purged while a copy range holds it, red if the range is not counted; `mem_read` on a non-resident page answers `Pending` without waiting, red if it waits; the fallback with a stuck service; a remap between scan and reclaim. **Q**: a page-cache-heavy run with the controls usable | stage 8 (its kernel clock goes) |
| P3 | Swap: block states and claims, the spare reserve, the boot-lifetime backing, `backing_*`, cleaning of anonymous locations ended after durable, TOYOS-SWAP, the kernel records and attach, AEAD with `at`/`seal_at` and 2^26-page epochs, device-gone failure, the stopped-service and deficit reports; the memory format on resizable RAM objects (storage W3). After S0-a, S0-b, C-wire, S-copy and P0–P2 | **H**: `kept` exactness for private leaves (stores and write copies, not read copies); claims never repeat and are refused on referenced blocks; a stale supply or fail refused after reuse; a frame never freed before durable, red when `clean_end` follows the acknowledgement; a nonce oracle across retries, reissues, kills, restarts and epoch boundaries, red when a claim is sealed twice; a retirement taking a spare, and the deficit reported past the spares; a spent restart budget leaving every record and entry intact, red if any is failed. **Q** (q35, `virt`, small `-m`): commit beyond RAM and verify contents; a read error injected with QEMU's `blkdebug` and a ciphertext byte flipped through `qemu-io` from the monitor each end only the owner, and a `read()` of a lost `/tmp` page answers `EIO` while its server serves on; a driver reset loses nothing; a service kill during a batch loses nothing; a restart keeps data; a service stopped past its budget leaves waiters overdue, and a manual restart serves them with contents intact; `/tmp` swapped and read back through `read()` and a mapping, the server never blocking; killing its server ends a `/tmp` mapper with the invalid-mapping diagnostic | notices from P0; C3's probe ignores TOYOS-SWAP; storage W3 |
| P4 | Policy: CLOCK-Pro and generational on the same scan signals; file/anon balance by refault cost; write-ahead if refaults justify it | **H**: replay of recorded scan streams and synthetic loops, scans and Zipf. Lower refaults at equal cost wins, else the simpler | — |
| P5 | Metal (T14, AMD; `--metal-readback`) | swap throughput; flush cost on DATA; fault latency; a returning window's delay; netstack's rate with `Pending` copies; stop-control latency under thrash; audio without underruns; the ledgers that adjust §5.3's and §8's provisional sizes | bench layout |

Each guest row needs the guest because it crosses the fault path, the scheduler's waits, a real block session and
teardown. QEMU judges order, completion and contents only. Timing is P5's. Fault injection uses QEMU's own block
debugging and monitor, with no production machinery.

## 11. Remaining compromises, quantified

The architect has settled the guarantees (§0), wiring and the sizes (§5.3, §8). Changes to approved texts are
engineering where they preserve contracts:
- memory §3 and `object/shm.rs`'s header: anonymous memory and RAM objects may wait and be lost;
- memory §2's write-fault re-check extends to pages being cleaned;
- storage §2.5 S4: memory-format files become resizable anonymous objects;
- memory §5: restart holds;
- evacuation is eviction only;
- `sdk/toyos/src/log/stdio.rs`'s "never waits" holds for resident and wired rings only;
- storage §3.5 is superseded.

Each is recorded at its section. What remains is the cost of D, against the capacity Q-2 gives:

1. **On-screen windows stay resident**, at the compositor's charge.
   - ≈ 6.6 MiB per terminal window [M], or ≈ 8.8 MiB per full-screen window at 1920×1200 [D], twice that during a
     resize.
   - Ten on-screen windows cost ≈ 66 MiB, 0.4 % of a 16 GiB machine [D].
   - That memory is not available to swap. It is the visible working set, which swap would refault at once.
2. **A window returning from off screen appears only after its buffer is swapped in.** This is latency to that
   window alone, not degraded pixels: ≈ 2 250 page reads for a full-screen window, of the order of tens of
   milliseconds on NVMe [E, P5 measures].
3. **Copy-shaped services pay one syscall per copied span**: ≈ 0.1–0.5 µs each [E]. P5 measures netstack's rate,
   which is already a recorded gap.

None trades away a requirement. They are listed as the price of containing delay, and P5's measurements decide
whether any needs revisiting.

## 12. What remains uncertain

- **Clauses to pin.**
  - The NVMe Base 2.0 command-ordering clause, cited only for the negative: no ordering among outstanding
    commands.
  - The CFRG AEAD-limits figure for ChaCha20-Poly1305's integrity bound.
  - POSIX's `EFAULT`, `EIO` and `O_NONBLOCK` wording (§0.1).
  - Linux's `RLIMIT_MEMLOCK` default and `mlock(2)`'s `CAP_IPC_LOCK` rule.

  Each is to be cited at its site before implementation.
- **logkeeper's draining** was read only at its ring protocol [C, `ring.rs`]. Whether its reader serves rings on
  one thread or many is unchecked, and S-copy's owner confirms the copy shape there.
- **The `CHARGE` right's exact reach** is the kernel/memory track's call in P1: whether it also covers #1077's
  commit, and how it combines with `TRANSFER`.
- **Residency figures.** They are QEMU commitments at `c06cc695e` on a 4 GiB guest. The current tree, the T14 and
  the touched sizes are unmeasured, and the memory service's size is an estimate by analogy. The T14's panel size
  is assumed to be 1920×1200 [E].
- **Flush cost** on the T14's SSD, and its effect on DATA's write rate, is unmeasured (P5).
- **The provisional sizes** (8 MiB, RAM/2 within 4–16 GiB, 0.1 %) are estimates, adjusted as §5.3 and §8 say.
- **Policy history lost on restart** is an estimate.
- **#1074 and #1077 are drafts.** Their interplay here is against their PR text.

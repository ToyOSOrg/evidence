# Pager and swap: combined plan, revision 6

Design only. It builds on memory design revision 18 (§3, §5, §7, §8), storage design revision 12 (§2.5, §3.5, W2)
and the contracts on `main` at `717baf3ac`: #1057's per-job ledgers, floors and `SHM_FOR_JOB`, #1070's
`vm_remap`, and #1071/#1076's shared-memory rights. #1074 and #1077 (`SYS_SHM_COMMIT`) are still drafts, so this
plan cites them from their PR text.

The owner's requirements are quoted from `requirements/architecture.md` §Memory. That file is in the owner's
checkout and is excluded from git (`.git/info/exclude`), so it is not on `main`.

Revision 5 answered the planning architect's five evidence requests in §3.1, §3.2, §5, §6 and §7. Revision 6
answers review r5's eight required findings (R1–R8) and takes its suggestions 1–8.

**Labels.**
- **[P]**: published.
- **[C]**: read in code at `717baf3ac`, unless another revision is named.
- **[M]**: a recorded measurement, with its run named.
- **[D]**: arithmetic over [C] and [M] facts.
- **[E]**: an estimate or inference.

Unlabelled text is this plan's proposal.

## Changes from revision 5

- **R1.** The stop overlay's independent path is a named prerequisite, **C-overlay**, owned by the compositor
  track (§5). Its conditions are stated, and P3 waits on it. Until it lands, nothing a resident process maps is
  swappable.
- **R2.** Residency follows the job an object is charged to (§4), so the swappable creation flag is deleted.
  - Window buffers are charged to their client through #1057's `SHM_FOR_JOB`, as `budget.rs` names the real fix.
    That change is a dependency on the compositor track. The compositor keeps creating them, as #1076 decided.
  - The supervisor's log rings follow from the same rule.
- **R3.** A shrunken or lost swap device is stated in §0 and Q1.
  - A spare reserve keeps a retired block from creating a deficit.
  - Device loss leaves faults waiting, reported as overdue with the deficit named, and never ended.
- **R4.** Corrected:
  - the memory held between acknowledgement and flush;
  - what r5 deleted, which was freeing at acknowledgement and the restart `Lost` path. `Durable` still rests on
    the client's retention;
  - 447 and 48 are proposed caps, not code;
  - the segment-size share is [E];
  - the owner citation;
  - #1076's "still";
  - three state bits.
- **R5.** Never-writable copied pages are charged in `A`. Resident ranges are never dropped. A copy range holds
  its source against release and purge (§6).
- **R6.** The AEAD epoch is 2^26 pages per subkey, from RFC 8446 §5.5's published AES-GCM limit, and ChaCha20-
  Poly1305 is stated separately (§3.2).
- **R7.** Wiring is bounded by a per-job allowance, as the owner's requirements ask. Ambient wiring is withdrawn,
  and the floor-bounded alternative is shown (§5, Q2).
- **R8.** Storage §3.5's change is Q5(f).
- **Suggestions taken.**
  1. NVMe reset is [C] and ordering is host-enforced.
  2. The AAD is gone.
  3. Only write copies clear `CLEANING`.
  4. diskserver is also needed when the memory service restarts.
  5. The main stack size comes from the program's `PT_GNU_STACK`.
  6. P3 names its fault injection.
  7. Wording.
  8. Citations.

## 0. What changes for programs

The owner's rule: [owner requirement, private] (requirements §Memory). Committed anonymous memory is still never refused at a fault and never reads
invented contents. What is new:

- **It may wait on storage.** This covers a load, a store, and any syscall that copies it (`read`, `write`, IPC,
  futex).
- **It can be lost.** A swap read that fails after the driver's recovery, or that fails authentication, ends the
  process at its next load or store, naming the cause. A syscall touching that memory answers `EIO`. No
  anonymous memory could fail before.
- **Commitment can outlive the backing that covered it** (§3.2).
  - If the swap device leaves, or retired blocks exceed the spare reserve, the sum of commitments can exceed
    RAM plus what remains of swap.
  - New commitments are then refused.
  - A swappable fault that finds no frame waits. It is reported overdue, naming the backing deficit, and is never
    ended. It continues as frames return when processes end or are stopped.
  - Pages already swapped to a device that left are lost, as above.
- **After a stopped memory service** (§3.2), faults can wait indefinitely. They are reported overdue and never
  ended.
- **`mlock`/`vm_wire` is refused past the job's wire allowance** (`ENOMEM`) (§5).
- **Resident memory** (§5) keeps memory §3's old guarantee: no fault on it does I/O or waits.
- **Executable and read-only image pages never go to swap** (§6).
- **The compositor may stall on a cold window's buffer.** The stop overlay does not stall (§5, C-overlay).

## 1. Ownership

| Component | Owns |
|---|---|
| Kernel | Memory objects, mappings and protection. Faults and their waits; accessed and dirty harvesting; reverse records. **The backing object:** per-block state, claim number and tag, the swap key, the claim counter. Both commitment rules and the frame rule (§4). Safe replacement: revalidate, unmap, shootdown, futex revoke, free. The mechanical no-I/O fallback; invalidation when a server ends. No policy, filesystem or cryptography; encryption stays in userland, as the requirements say |
| Memory service (new; signed row; `reclaimer` role) | Watermarks and its declared reserve `M`; reclaim selection over file and anonymous pages; swap-out and swap-in; block placement; sealing and opening; pressure figures. It keeps nothing that a restart needs |
| File servers (pagers) | As memory §7 and storage §2.5, unchanged |
| Storage driver | The swap session's I/O. diskserver opens and reopens sessions, for a driver restart and a memory-service restart alike [C, `lib/blockring/src/lib.rs:31-34`] |
| Supervisor | Signed roles as spawn attributes (pager, reclaimer, resident); floors, restart holds and wire allowances; restart; holding the backing handle, which grants no read; the end state of swap |
| Compositor | Resident. Window buffers are charged to their clients (dependency, §4), so they are swappable. Its stop overlay runs on the independent path C-overlay (§5) |

The `reclaimer` role is a privilege beyond a device claim. Root `CLAUDE.md` puts such privileges only in the signed
image's `system.toml`. The requirements name the service: [owner requirement, private]. The role follows memory §7.3's signed-pager-role pattern.

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
- **The memory format** (`/tmp`, no-DATA boots) is r4's:
  - each file is one resizable anonymous object that the file server creates and owns;
  - `MAP_SHARED` and `read()`/`write()` share it;
  - `mem_read`/`mem_write` answer `Pending(ticket)` or `Busy` on a swapped page, through a ticket table the
    caller committed, which raises `available`;
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
  - **Futex:** the waiter's re-translation after it arms never waits. A swapped word returns as a spurious wake,
    and the user loop's re-read faults it in.
- **Permissions.** Handle rights bound `max_prot` (memory §2). Since #1076, `WRITE` is the right to map writable
  or lend to a device [C, `SYS_SHM_MAP`, `SYS_DEVICE_DMA_MAP`]. Lending moves a charge from `A` to `W` (§4). The
  reclaimer reads only pages it has begun.
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
  - r4 freed the frame at the acknowledgement. Its last copies were then the device's volatile cache and the
    service's arena, which goes with the service.
- **R-c. Swap-in installs before it frees.** The kernel copies the service's plaintext into a frame from `M`,
  installs it, and frees the block, all under the space lock. Until then the block is untouched, by R-a.

| State | Authoritative copy | Being written | Survives |
|---|---|---|---|
| Resident | frame | the frame, by its owner only | everything except the owner's exit |
| Cleaning: writes in flight or acknowledged, flush pending | frame (write-protected) | the claimed block, which nobody reads | service crash: the kernel fails the cleaning, so the page stays resident and dirty. Driver reset: the write is reissued or refused, and the frame is still authoritative |
| Durable, before `clean_end` | frame; the block is a durable replica | nothing | as above |
| Swapped | block | nothing (R-a) | service and driver restarts (§3.2) |
| Swap-in, read in flight | block | the arena block and then the service's buffer, which nobody else reads | a read refused or lost is issued again, since `requested` is level state |
| Supplied | frame | the frame, by its owner | — |

**What can still lose a page, each diagnosed.** These are the only cases:
- media corruption of a referenced block, which fails authentication;
- the device leaving (`gone`), when the service calls `mem_fail` over referenced blocks in batched ranges;
- the end state, where restarts stop and the backing is dropped.

In each, a later touch ends the owner with the cause named, and a syscall answers `EIO`.

**Cost of R-b.** The figures are [D] from [C]: the arena has 511 slots [C, `sdk/toyos/src/transport/arena.rs:27-30`]
and the ring has `DEPTH` 64 entries [C, `lib/blockring/src/layout.rs:22`].
- **Proposed caps, not in code today:** writes hold at most 447 arena blocks and 48 ring entries, which leaves 64
  blocks and 16 entries for swap-in reads. The service flushes once 223 acknowledged writes are held.
- **Memory.** Between acknowledgement and flush, each written page is held twice. Its frame stays allocated
  (R-b), and its ciphertext stays in the arena (the client's retention). The arena is inside the session's fixed
  2 MiB region, so it adds nothing to the commitment. The frames are 0.9–1.75 MiB of pages per batch that reclaim
  yields only at the flush, rather than at each acknowledgement. That is a delay in what reclaim yields, not a
  new charge.
- **Longer write protection.** A page stays write-protected in `CLEANING` for longer, so more stores land as
  `kept`.
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
 referenced ─mem_fail / device gone→ failed ─release→ free;   backing dropped: every reference fails on touch
```

- **Claim numbers are the generation and the nonce.** One counter in the backing object is advanced once per
  claim and never reused within a boot.
  - A stale `mem_supply` or `mem_fail` naming (b, c), after b was freed and claimed again as c′, is refused.
  - A stale ciphertext of b fails to open under c′.
  - Swap lives one boot; [owner requirement, private] (requirements §Memory).
- **AEAD.**
  - The key is 256 bits, drawn from the kernel RNG when the backing is created. It lives only in the backing
    object and is handed out only to the attached reclaimer. Sealing and opening are the service's.
  - The nonce is derived from the claim number: epoch e = c >> 26 and sequence s = c mod 2^26. The subkey is
    HKDF(key, e) [C, `lib/crypto/src/kdf.rs`]. A sequence stays far below the value `toyos-crypto` refuses for
    GCM [C, `lib/crypto/src/aead.rs:100`].
  - **Why 2^26 pages (256 GiB) per subkey.** RFC 8446 §5.5 allows 2^24.5 full-size records (2^14 B each) per
    AES-GCM key "while keeping a safety margin of approximately 2^-57" [P]. That is about 2^34.5 AES blocks. A
    4 KiB page is 2^8 blocks, so the limit is about 2^26.5 pages [D]. 2^26 stays under it.
  - **ChaCha20-Poly1305.** RFC 8446 §5.5 says that for ChaCha20/Poly1305 "the record sequence number would wrap
    before the safety limit is reached", so it has no confidentiality limit at this scale [P]. Its integrity
    bound in the CFRG's AEAD-limits work grows with forgery attempts [P, draft-irtf-cfrg-aead-limits; to pin at
    the site]. Here each forgery attempt is a failed authentication, which ends a process.
  - One epoch length for both keeps one code path, within both limits [E].
  - **No AAD.** The kernel ties each claim to one block, so the nonce already binds the place.
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
  3. Ordering between commands is the host's to enforce. Requests in flight are unordered, and a client that
     needs one to follow another waits for the first's answer [C, `lib/blockring/src/lib.rs:28-29`]. The NVMe
     specification orders nothing among outstanding commands [P, NVMe Base 2.0, command ordering; to pin at the
     site]. The hold makes the dead session's commands complete before the new ones are submitted.
  4. **A driver restart resets the controller first.** The driver clears `CC.EN`, waits for `CSTS.RDY` = 0, and
     only then answers what was aborted [C, `system/nvme/src/main.rs:234-243`, `system/nvme/src/nvme.rs:644-657`,
     citing Controller Level Reset §3.7.2 at `nvme.rs:25`]. A new driver does the same in `enable`
     [C, `nvme.rs:327-333`].
  5. **New prerequisite (S0-b).** Today a reopen while the dead session still has commands in flight is refused
     `Held` and fails. It must instead wait for that session's retirement. The device's protocol timeouts bound
     the wait (memory §7.8, "where each bound lives").

**What survives what.**

| State | Owner | Memory-service restart | Driver or diskserver restart |
|---|---|---|---|
| Block state, claim numbers, tags, key, counter | kernel backing object | kept | kept |
| Swapped entries | page tables | kept | kept |
| Requests | waiter records, level state | re-reported to the new process | kept; reads refused at the session's end are issued again |
| Begun cleanings | kernel | failed at teardown: pages resident and dirty, claims freed | the service ends them failed, or reissues the same ciphertext to the same claim |
| Acknowledged, unflushed writes | the block client in the service | lost with the process, harmlessly: by R-b no referenced block depends on them | reissued as identical bytes [C, `client.rs:10-19`] |
| Placement cursor | service | rebuilt from `backing_query` | kept |
| Policy history | service | lost [E: it costs refault accuracy for about one scan cycle] | kept |
| The session | service and driver | reopened through diskserver after the old hold retires | reopened |

The requirements ask that swapped memory survive [owner requirement, private]. The kernel's backing object is that state, and nothing in it depends
on what the dead process did last.

- **Restart.** The restarted reclaimer calls `backing_attach`, receives the key and the next claim number by copy,
  and starts. It needs no flush first and has no `Lost` path.
  - Attach requires the `reclaimer` role and is refused while another live process is attached.
  - The supervisor holds only the backing handle, which grants no read.
- **End state.** When the supervisor will not restart the service (budget spent, or a stop), it drops the backing.
  Every swapped entry then fails on touch with "swap data lost: memory service ended". This is lazy: no walk of
  every space.
- **Swap I/O failure.**
  - A failed write ends its cleaning with `kept`, and the service retires the block.
  - A failed or unauthenticated read becomes `mem_fail(b, c, cause)`. It never yields zeros.
- **Shrinking backing (R3).** `S` counts the partition less a spare reserve of 0.1 % of its blocks [E]. A retired
  block takes a spare, so `S` and every commitment it covers stand until the spares run out.
  - The device leaving, or retirements past the spares, makes `S` smaller than the commitments it covered.
  - New commitments are then refused at their call.
  - Existing commitments stand. A swappable fault that finds no frame takes the fallback, and otherwise waits.
  - The wait is reported overdue, as for a stopped service, and the report carries the deficit: committed minus
    `R + S`.
  - It is never ended; "pressure … alone does not authorize termination" (requirements §Memory). Frames return as
    processes end or are stopped from the controls.
  - The internal device that holds swap also holds DATA, so its departure is already the session's failure.

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

- **The frame rule is what makes "resident never waits" true**, for memory a resident job is charged with.
  - A resident fault draws its held frame, exactly as every fault does today
    [C, `kernel/pure/frames.rs:16-21`: "A promise is a frame no other allocation may take"].
  - A swappable fault takes a frame only from frames neither promised nor held back. With none free, it first
    takes memory §3's mechanical fallback: any clean, unpinned, unprotected slack page, preferring the service's
    latest candidates. The fallback never takes a `W` frame. Only if no slack page exists does the fault wait
    for reclaim.
  - With `S = 0`, no fault ever depends on the service, and the rules reduce to #1057's.
- **Residency follows the job an object is charged to (R2).** A charge is `W` when its job is a resident job, or
  when it is resident by kind (below). Otherwise it is `A`.
  - An object's charge is its creator's job, or the job a creator names with `SHM_FOR_JOB`
    [C, `kernel/src/syscall/ipc.rs:340-351`].
  - **Window buffers.** The compositor would create each with `SHM_FOR_JOB` for its client, so they become the
    client's `A`, and swappable.
    - `budget.rs` calls its RAM/8 cap "a mitigation" for a buffer that "is charged to nobody", and names a kernel
      memory limit as what should replace it [C, `system/compositor/desktop/src/budget.rs:41-49`].
    - Charging the client is this plan's reading of that fix, not the file's words. #1057's per-job accounting is
      the kernel side of it.
    - The compositor still creates them, as #1076 decided.
    - Doing so needs a client's job handle carrying `WRITE`, which the client grants at connect. That is
      explicit, as the requirements ask: [owner requirement, private].
    - **Dependency on the compositor track:** the charging change, the handle the client grants, and what then
      becomes of the RAM/8 window budget.
  - **Log rings.** The supervisor creates each child's ring for the child's job (#1057). So the memory service's
    ring is resident, and an app's ring is the app's `A`.
  - **No use was found that this rule cannot serve.** Soundserver's client slots are its own objects, charged to
    soundserver, which is not resident. It wires them within its granted allowance (§5).
- **Every increase of `W_j` checks both rules.** That covers page-table builds, heap charges, runs, `vm_wire`,
  floor sets, lending, and `vm_remap` growth of a resident range. An increase of `A_j` checks the backing rule.
  - #1070's `vm_remap` is already promised, charged and all or nothing [C].
  - #1077's `SYS_SHM_COMMIT` charges the object's job [PR text]. Under swap, its eager zeroing of an `A` charge
    may wait for frames, since it is a syscall holding no lock.
- **`W_j`** holds:
  - page tables (which also hold swapped entries), kernel-heap charges and runs;
  - wired ranges;
  - resident-by-kind objects;
  - a pager's `C`;
  - everything charged to a resident job.
- **`A_j`** holds the rest of a job's committed private pages and charged objects. That includes #1077 commits,
  private snapshots, and never-writable copied pages (§6).
- **Resident by kind**, charged in `W` whatever the job:
  - kernel-created objects the kernel writes from another context: inbox rings, TLS blocks, the clock page;
  - any object lent to a device (`dma_map`, `create_for_device`). Lending moves its charge from `A` to `W` and
    checks both rules; #1076 already gates lending on `WRITE`;
  - sealed immutable versions, in the shared-files account, as memory §7.6 and §9.4 approved;
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
  time, the wired total and the wire allowance join `SYS_ACCOUNT_INFO`. A swapped page stays its job's charge.
  Swap I/O CPU time is the service's.

## 5. Bounded progress and what stays resident

**`resident` processes** (whole-process, from a signed row). Everything charged to their jobs is `W`. Their
images come from objects the supervisor holds, never through a file server. Each row states its `restart-hold`
in superframes. Each program declares its stacks (§7).
- the stop, input and restart path: the supervisor, the input servers, usbd (it carries HID), and the compositor;
- the swap chain: the memory service, the storage driver, and diskserver, which reopens sessions after a driver
  or memory-service restart.

**C-overlay: the stop overlay's independent path** (prerequisite of P3; owner: the compositor track).

Under the charged-job rule, a resident compositor maps window buffers that are swappable. A fault on a cold one
stops the compositing loop until swap-in, or indefinitely if storage is stuck. On `main` the compositor has one
other thread, `launcher` [C, `system/compositor/src/signout.rs:71`]. Its one overlay, the volume overlay, is drawn
by the main loop into the back buffer [C, `system/compositor/src/session.rs:1986,1993`,
`system/compositor/src/render.rs:311`]. So today a stalled loop stops the stop control too.

C-overlay is the bounded emergency path #1057 named as the compositor's next step. It requires:
- **Its own thread**, drawing only from compositor-owned memory. That memory is `W`, because the compositor is
  resident. The thread never maps or touches a window buffer.
- **No lock that the compositing loop can hold while it waits.** The loop waits only while composing a window
  into its back buffer. That step must hold nothing the overlay takes.
- **Input for the stop chord** comes from the input servers on a connection of the overlay thread's own, not
  through the loop. Its data and the kill come from the supervisor over the overlay thread's own connection.
- **Presentation while the loop is stalled.** An atomic owner word decides who presents.
  - The loop's present copies only its resident back buffer to the scanout, so it never faults and is bounded.
  - The loop checks the owner word before each present and marks a present in progress.
  - The overlay takes the word, waits at most for one present in progress to finish, then draws and presents.
  - On a CPU-written scanout (GOP) the overlay writes the scanout itself.
  - On a device that needs a submission (virtio-gpu, a GPU driver), the overlay submits through the same handshake.
    The submission path is shared only around a present, which never waits on swap.
  - **Uncertain:** whether every display backend's present can be made bounded in this way. Its owner decides,
    per backend.

Until C-overlay lands, P3 does not ship. So no interim state exists in which the stop control waits on swap.
**Consequence once it lands:** a stall on a cold window freezes ordinary drawing and input routing to apps. The
stop overlay keeps working.

**What a swap-in needs in order to finish, and its bound.** Figures are `committed + kernel` per job [M: #1057
round 3 at `c06cc695e`, QEMU q35, `Profile::Metal`, 4 GiB guest (4001 MiB managed), `images/system.toml` with
the desktop session and four terminal launches, through the scratch patch `scratch-measure-r3.patch`; published
at `ToyOSOrg/evidence@db37c51e785164253479d4ee440e999abfb206da`, `r3/measure-2.log.gz`].

| Needed | Why | Bound |
|---|---|---|
| The faulting thread's waiter record | The request lives in it (memory §7.3) | none extra |
| Page tables holding swapped entries | Each entry holds its block | in `W`, about 0.2 % of the swapped span (one 4 KiB table per 2 MiB) [D] |
| The backing's per-block records | Claim, state and tag | 24 B per 4 KiB block, 0.59 % of `S`: 48 MiB at `S` = 8 GiB [D] |
| Reverse records | Finding frames to reclaim | 8 B per frame, 0.2 % of `R`: 32 MiB at 16 GiB [E: r4's 29+35-bit packing] |
| The memory service, whole | Read, open, supply. Its log ring is charged to its own job, so it is resident (§4), and a write to it never waits or allocates [C, `sdk/toyos/src/log/stdio.rs:14-17`] | unbuilt, ≈ 12 MiB like diskserver [E], plus its 2 MiB session region (lent, so resident by kind) and `M` ≤ 2 MiB |
| The storage driver, whole | The command | nvme 18.5 MiB [M], including its 2 MiB DMA grant [C, `system/nvme/src/nvme.rs:86,250`] |
| The session connection's ring | The doorbell | one 2 MiB run, taken at the first write and kept while the pipe lives [C, `kernel/src/pipe.rs:119-121,143-155`] |
| diskserver | Reopening the session after a driver or memory-service restart | 12.2 MiB [M] |
| The supervisor | Restarting any of these | 41.7 MiB [M] |
| A dead resident row's restart hold | Whole superframes for its next start | only while dead. It replaces that row's running charge, so it adds nothing to the steady state |

**Bound.** The swap chain holds ≈ 41.7 + 18.5 + 12.2 + 16 ≈ 88 MiB at today's stack sizes [M + E], or ≈ 53 MiB
with declared stacks (§7) [D].
- On top of that come 0.59 % of `S` and 0.2 % of `R` in kernel records: ≈ 80 MiB with `S` = 8 GiB on a 16 GiB
  machine [D].
- Nothing in the chain grows with the number of processes or swapped pages, except those two kernel tables. They
  are committed when blocks are added and at boot.

**Not on the chain**, and checked: file servers (swap is a raw partition), logkeeper (the ring never waits),
netstack, soundserver, and every app. Only nvme and usbd use blockserve, and swap is internal-only, so NVMe is
the only swap path [C].

**The restart hold, not a floor** (r4, kept).
- When a resident process dies, its job keeps up to its row's `restart-hold` superframes, kept whole. They are
  released only to that job's next start, or when the supervisor closes the service.
- While held, the hold counts as that job's `W_j` in both rules. While the process runs the hold is zero.
- It is whole superframes because the chain's restart draws 2 MiB runs, for session regions and the NVMe DMA
  grant [C, `lib/blockserve/src/region.rs`, `nvme.rs:250`], and heap growth by superframes
  [C, `frames.rs:22-33`].

**Wiring is bounded by a per-job allowance (R7).** The requirements: "[owner requirement, private] … [owner requirement, private]" And:
[owner requirement, private]
- **The rule.**
  - Each job has a wire allowance.
  - `vm_wire` counts against the allowance of the job it charges, and is refused `ENOMEM` past it or past either
    rule.
  - The supervisor sets every job's allowance as it sets floors, through a `SysCap` right only it holds.
  - Helpers share their job, so they share its allowance. A new job needs a launcher's authority.
- **Default and grants.**
  - The default is modest: 8 MiB [E]. Linux's default `RLIMIT_MEMLOCK` is also 8 MiB, since 5.16
    [P, as review r5 cites it; to confirm against the kernel's release notes].
  - A signed row may grant more: each file server's page-in and write-back working set (its arena, format
    metadata cache, executor and ticket table, memory §7.4 rule 3), and soundserver's client slots and realtime
    stack.
  - An installed package's larger request goes through the permission service, which is userland policy.
- **What it replaces.** Linux bounds `mlock` by that rlimit unless the caller has `CAP_IPC_LOCK`, and realtime
  audio gets its allowance through rlimits or rtkit [P, as review r5 cites]. So r5's claim that ambient wiring
  "is how `mlock` and realtime audio work unchanged" was false.
- **The alternative shown: wiring bounded by the job's floor.** Rejected.
  - Floors go only to programs that do no client work (memory §5).
  - Soundserver and the file servers would then need floors, so client-driven work would draw on protected
    capacity, which memory §5 forbids.
  - A floor is also a guarantee of use, not a ceiling on wiring.
- Resident jobs and resident-by-kind charges are not wiring and do not count against the allowance.

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
- Every link is resident, and charged to a resident job, so none takes a swap fault.
- None maps a paged object (memory §7.4 rule 1, extended to the reclaimer).
- None maps a client's swappable memory.
- None waits on a file server.
- None allocates per I/O.
- Swap-in draws only on `M`, and resident faults draw only on their held frames (§4).
- No kernel lock is held across any wait (§3).
- A file server's swappable part may wait on the swap chain, which never waits on it.
- The compositor is resident but maps client memory, so it can wait. That is why C-overlay exists, and it is off
  the chain.

**Writeback, backpressure and waits** are r4's. File dirty data is bounded by `C − C_clean` and caps (memory
§7.5). The service raises `reclaim_pressure` on a pager and never waits on it. Waits on swap-in and frames join
memory §7.8's table:
- advanced by `mem_supply` or reclaim;
- failed only by `mem_fail` or the backing's drop;
- ended by kill;
- reported overdue, with the service's progress times and any backing deficit.

There is no automatic kill or suspension.

## 6. Executable backing

The requirements: "[owner requirement, private] … essential recovery code
stays resident."

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
source, with no I/O.
- **Never writable** is a flag on the range, set at creation and cleared by any `vm_protect` to `ReadWrite`.
  - It covers text and read-only data, which are 69–86 % of each service's image [E: `readelf -lW` of a
    2026-10-23 build in the primary checkout, revision not recorded].
  - RELRO pages are written before they are protected, so they are excluded. So is `.data`, which swaps as the
    program's own data.
  - A never-writable page cannot be stored to, and the kernel's fill writes only private ranges
    [C, `space.rs:871-912`]. So no dirty bit is needed.
- **Charging (R5a).** These pages stay in their job's `A`, as committed private memory is today.
  - The backing rule then guarantees that a refill finds a frame through reclaim, as for any swappable fault.
  - They never take a swap block, so `S` is overcounted by their size: about 1–1.6 MiB per running program
    [E, from the segment sizes]. That lasts until stage 6.
- **Resident jobs (R5b).** A resident job's ranges are `W`, held frames, and are never dropped. Dropping them
  would free nothing, and the fallback never takes a `W` frame (§4).
- **Holding the source (R5c).** A `Kind::Copy` range already holds an `Arc` to its source
  [C, `space.rs:39-41`]. It also counts as a mapping of the source for memory §7.2's `unmapped` notice and for
  stage 8's purge. So a sealed version is neither released nor purged while any copy range may refill from it,
  and a running program survives its file server's death as approved.
- **Prerequisite.** P3 follows memory stage 4, under which a spawner's image must be exec-sealed or the spawn is
  refused (memory §4). By then every copy source is immutable, and swap never sees code. After memory stage 6,
  text maps its sealed source directly, and the copies go, with this rule.

**The source stays resident.** Sealed versions remain committed RAM objects in the shared-files account (memory
§7.6, §9.4, stage 8, as approved). Boot payloads remain resident for the boot.
- r4's question 6, droppable mapped versions refetched from the file server, stays withdrawn. The requirements
  allow it ([owner requirement, private]), but it would give up independence from the file server's death, for capacity
  this plan does not need to claim.
- ROOT itself is wholly resident: 117 MiB for the `--build-only` image
  [M: `issues/root-in-memory-costs-its-whole-size.md`]. This plan does not change that.

## 7. The cost of whole-service residency

**Measured** [M: the run named in §5]. `committed + kernel` per job:

| Job | Total | Of which main stack [C, loader 8 MiB] | Std thread stacks [C, 2 MiB each] |
|---|---|---|---|
| supervisor | 41.7 MiB | 8 | `files` and `apps`: 4 [C, `system/supervisor/src/main.rs:697`, `sessions.rs:241`] |
| compositor, at its loop before the session | 36.4 MiB | 8 | `launcher`: 2 [C, `signout.rs:71`] |
| compositor, with the session and four terminal windows | 79.8 MiB | 8 | 2 |
| usbd | 19.2 MiB | 8 | 0 |
| nvme | 18.5 MiB | 8 | 0 |
| ps2server | 14.0 MiB | 8 | 0 |
| diskserver | 12.2 MiB | 8 | 0 |

Readings:
- The compositor's total climbs by 6.6 MiB per terminal window launched (60.0, 66.6, 73.2 and 79.8 MiB at its
  settled readings) [M].
- Window buffers are created by the compositor, as #1076 kept ("The compositor still creates the buffers")
  [C, `session.rs:1357,2236`]. Today they are charged to it, capped at RAM/8 [C, `budget.rs:12,50-53`]: 500 MiB
  on that guest, 2 GiB on a 16 GiB machine [D].
- The stacks are committed whole and populated as touched (memory §3, Q15) [C]. How much of each is touched is
  unmeasured. The main stack's argv block and its first frames are a few pages [E].
- These readings predate #1070 and #1076. Neither changes stacks or who creates window buffers.

**The alternatives**, for a 16 GiB machine with `S` = 8 GiB [D, from the table; the memory service estimated as
in §5]:

| | Resident | Grows with | What it gives up |
|---|---|---|---|
| **A. r4: every row wholly resident, window buffers charged to the compositor** | ≈ 185 MiB measured + ≈ 16 MiB memory service ≈ 201 MiB (1.2 %) | each window, ≈ 6.6 MiB, up to RAM/8 (2 GiB, 12.5 %) | window contents can never swap. The controls never wait |
| **B. Proposed: programs declare stacks; window buffers charged to their clients; C-overlay** | ≈ 201 − 54 (stacks, replaced by ≈ 2.3 MiB of declared ones [E: 256 KiB each]) − 43 (the compositor's growth from its loop to four windows, an upper bound on the buffers) ≈ 106 MiB (0.65 %) | nothing; each window's buffer is its client's `A` | the compositing loop can wait on a cold window. The stop overlay does not, through C-overlay |
| **C. Page the controls too; wire only sub-ranges** | swap chain only, ≈ 53 MiB with declared stacks | nothing | the input servers' and compositor's heaps can swap, which memory §5 rejected (a shared heap cannot be wired in part). It saves at most ≈ 20 MiB more [D: ps2server, usbd and the compositor at its loop, less their stacks and their kernel parts, which never swap; the user/kernel split is #1057's earlier unpublished reading, `mem-per-job/logs/measure-3.log` of 2026-10-24: ps2server 10.8 + 2.5, usbd 11.3 + 6.5, compositor kernel ≈ 13 MiB]. The controls then wait on swap under thrash |

Kernel tables are the same in all three: ≈ 80 MiB at that size (§5).

**Proposal: B.**
- **The cost of A:** about 95 MiB more held frames, plus up to RAM/8 of window memory that swap is meant to
  serve. Cold windows are the clearest case of inactive application memory.
- **What B needs:**
  - the charging change (compositor track, §4);
  - C-overlay (compositor track, §5);
  - declared stacks. The kernel loader commits the main stack at the size of the program's `PT_GNU_STACK`
    segment where it is non-zero, and 8 MiB otherwise. A program sets the size at link time (GNU ld's
    `-z stack-size=` [P, GNU ld manual]) and sets its own thread stacks at its spawn sites
    (`std::thread::Builder::stack_size`). Sizes come from measured depth plus a margin, and the guard page makes
    an overflow loud.
- **No new kernel flag.** Residency follows charge (§4).

**Unmeasured, owed by P1:** each resident row's committed and populated totals on the current tree and on the
T14. This revision could not take them, because a local image build fails in an unrelated edit to the shared
`winit` checkout, which another agent owns. The figures above are #1057's QEMU readings.

## 8. The swap area

- **Where.** A dedicated GPT partition of a new type, TOYOS-SWAP, on internal storage only, granted by type to the
  memory service. Removable media are refused by name. A swap file is rejected, because it puts filesystem
  allocation, moves and journaling in the swap path, as btrfs's swapfile rules show [P]. The requirements ask
  for [owner requirement, private].
- **Sizing.** `S` adds directly to commitment capacity. It holds disk space for good (resizing means
  repartitioning [E]) and costs 0.59 % of `S` in kernel records [D].
  - A working set beyond RAM thrashes whatever `S` is (Denning [P]), and the product goal is inactive
    application memory.
  - Default `S = clamp(RAM / 2, 4 GiB, 16 GiB)` [E], chosen at install, less the 0.1 % spare reserve.
  - No partition means `S = 0`, logged by name. The requirements make swap [owner requirement, private].
- **Blocks.** One block is one 4 KiB page. `backing_query` answers free runs. The service clusters a batch into
  sequential writes. The kernel claims at `clean_begin` (§2).
- **Metadata residency.** Records, claim numbers, the key and policy state are resident. Nothing but page
  contents is read from disk.
- **Storage §3.5** says "there is no swap" and keeps the master key only in committed memory. Under this plan,
  swapped memory, secrets included, is encrypted under a boot key that never leaves RAM (Q5(f)).

## 9. Interfaces (generic)

- **Roles:** `reclaimer` (one process) and `resident`, as spawn attributes from signed rows, refused in both
  orders.
- **`vm_wire(range)` / `vm_unwire`**: populate and keep resident; counts against the job's wire allowance and
  checks both rules. libc `mlock` and `MAP_LOCKED` map to it. The supervisor sets allowances through a `SysCap`
  call beside `SYS_JOB_FLOOR`.
- **Backing calls.** Each requires the `reclaimer` role, so the supervisor's handle cannot read the key or
  change `S`.
  - `backing_add(blocks)`: commits the records, charged to the reclaimer's job, which the supervisor keeps across
    restarts [C, #1057];
  - `backing_retire(block)`;
  - `backing_query(cursor, out)`;
  - `backing_attach() → (key, next claim number)`, refused while another live process is attached.

  Dropping the backing fails every reference.
- **`clean_begin(tokens, blocks) → claims`**: atomic claim; refused whole if any block is not free.
- **`clean_end(tokens, result, tags) → kept`**: only after the batch's durable flush, by the service's contract.
  On success the claims become references. On failure the claims are freed, or retired if the service says so.
- **`mem_supply(b, c, src)`** and **`mem_fail(b, c, cause)`**, the latter also over block ranges.
- **The `requested` notice** answers (b, c, tag).
- **`mem_scan`, `mem_reclaim`, watermarks and the level notices** are r4's (`below_low`, `frame_waiters`,
  `superframe_wanted`; a pager's `reclaim_pressure`). `mem_scan` tokens are opaque.
- **RAM objects** gain `mem_resize`, and `Pending`/`Busy` `mem_read`/`mem_write` through a caller-created ticket
  table (§2). They gain no creation flag: residency follows charge.
- **Loader:** the main stack's committed size from `PT_GNU_STACK`.
- **Kernel records.**
  - A reverse record per frame, laid out at boot beside the pins: a 29-bit owner index and a 35-bit page index
    in 8 B [E].
  - RAM objects gain memory §1's weak reverse index, which today only paged objects and apertures have.
  - `move_leaves` keeps both current (§2).
  - A `Kind::Copy` range counts as a mapping of its source (§6).

## 10. Staged plan

| Stage | Content | Validation | Touches |
|---|---|---|---|
| **S0-a** | User copies fault or swap in before any kernel lock and pin after, for all user memory; the futex rule (§3). **Owner: memory track (kernel)**; already a stage 7 prerequisite | **H**: chunk model. **Q**: pipe and futex sites; a mutation that copies under the pipe lock goes red. Closes the two issues | stage 7 prerequisite |
| **S0-b** | Allocation-free session client and driver side (§5). A reopen refused `Held` by a closing session waits for its retirement (§3.2). Doorbells keep their ring if #1074 lands. **Owner: storage track** | **H**: `DEPTH` traffic with an allocator failing after warm-up, red on any per-I/O allocation. A reopen during a dead session's close is answered only after its last completion, red if the hold is released early | B1's async client, #1074 |
| **C-overlay** | The stop overlay's independent path (§5): its own thread and connections, no lock the loop holds while composing, the atomic present handshake per display backend. **Owner: compositor track**, together with charging window buffers to their clients (§4) | **H**: the handshake model, where the overlay presents within one present of taking the word whatever the loop is doing, red if the loop presents after the word is taken. **Q**: the overlay presents and the stop works with the compositing loop held at a parked fault | compositor; `budget.rs` |
| P0 | Memory stages 4 and 7, and storage W2, as designed | memory §8, storage W2 | stages 4, 7; W2 |
| P1 | Two rules and the frame rule in `frames.rs` on #1057; residency by charged job; `vm_wire` and the per-job allowance; `resident` and `restart-hold`; `PT_GNU_STACK` main stacks; resident by kind; unmovable frames in their own superframes; `S = 0` | **H**: both rules at every `W` and `A` increase, red when a table build skips the backing rule; a resident fault never waits, red when a swappable fault may take a held frame; an object `SHM_FOR_JOB` to a resident job is `W` and to an ordinary job `A`; wiring refused past the allowance, and a helper sharing its job's allowance; superframe invariants under wire and lend; a hold kept whole. **Q**: `mmap_stress`; P1 reports each resident row's committed and populated totals | #1057, stage 5 |
| P2 | Reverse records and the RAM-object reverse index, kept current by `move_leaves`; `mem_scan`; `mem_reclaim` for clean pages and never-writable copied pages of non-resident jobs (§6); a copy range as a holder of its source; watermarks; the kept fallback; superframe evacuation; the `reclaimer` role; service v0 (plain CLOCK) | **H**: revalidation, floor protection, revoke order (memory §8's mutations), an evacuation case; a dropped copied page refilled byte-exact from its source, red if a range once `ReadWrite` is dropped or a resident range is dropped; a version not purged while a copy range holds it, red if the range is not counted; the fallback with a stuck service; a remap between scan and reclaim. **Q**: a page-cache-heavy run with the controls usable | stage 8 (its kernel clock goes) |
| P3 | Swap: block states and claims, the spare reserve, `backing_*`, cleaning of anonymous locations ended after durable, TOYOS-SWAP, the kernel records and attach, AEAD with `at`/`seal_at` and 2^26-page epochs, the end state, device-gone failure and the deficit report; the memory format on resizable RAM objects (storage W3). After S0-a, S0-b, C-overlay and P0–P2 | **H**: `kept` exactness for private leaves (stores and write copies, not read copies); claims never repeat and are refused on referenced blocks; a stale supply or fail refused after reuse; a frame never freed before durable, red when `clean_end` follows the acknowledgement; a nonce oracle across retries, reissues, kills, restarts and epoch boundaries, red when a claim is sealed twice; a retirement taking a spare, and the deficit reported past the spares. **Q** (q35, `virt`, small `-m`): commit beyond RAM and verify contents; a read error injected with QEMU's `blkdebug` and a ciphertext byte flipped through `qemu-io` from the monitor each end only the owner; a driver reset loses nothing; a service kill during a batch loses nothing; a restart keeps data; a spent budget fails blocks by name; `/tmp` swapped and read back through `read()` and a mapping, the server never blocking; killing its server ends a `/tmp` mapper with the invalid-mapping diagnostic | notices from P0; C3's probe ignores TOYOS-SWAP; storage W3 |
| P4 | Policy: CLOCK-Pro and generational on the same scan signals; file/anon balance by refault cost; write-ahead if refaults justify it | **H**: replay of recorded scan streams and synthetic loops, scans and Zipf. Lower refaults at equal cost wins, else the simpler | — |
| P5 | Metal (T14, AMD; `--metal-readback`) | swap throughput; flush cost on DATA; fault latency; stop-control latency under thrash; a cold window's restore; audio without underruns | bench layout |

Each guest row needs the guest because it crosses the fault path, the scheduler's waits, a real block session and
teardown. QEMU judges order, completion and contents only. Timing is P5's. Fault injection uses QEMU's own block
debugging and monitor, with no production machinery.

## 11. Questions for the owner

1. **The guarantee change as §0 states it.**
   - Lost anonymous data ends a process, and syscalls touching it answer `EIO`.
   - After the swap device leaves, or retirements exhaust the spares, faults past the remaining backing wait,
     reported overdue with the deficit, and are never ended.
   - The compositor's ordinary drawing may stall on a cold window, while the stop overlay does not.
   - *Recommend accept.*
2. **Locked memory: a per-job wire allowance (§5).**
   - A modest default, 8 MiB proposed.
   - Larger grants from signed rows (file servers, soundserver) or through the permission service.
   - Helpers share their job's allowance.
   - The alternative, wiring bounded by the job's floor, is rejected because it would give floors to
     client-serving services.
   - *Recommend the allowance, and the default size.*
3. **The resident set and its cost (§7).**
   - The set: the supervisor, the input servers, usbd, the compositor, and the swap chain.
   - Programs declare their stacks.
   - Window buffers are charged to their clients and swap as theirs, with the stop overlay on its own path
     (C-overlay; both are compositor-track dependencies).
   - Measured and derived: ≈ 106 MiB, against ≈ 201 MiB plus every window's buffers up to RAM/8 with r4's whole
     residency.
   - *Recommend B.*
4. **Swap size** `clamp(RAM/2, 4, 16 GiB)` less a 0.1 % spare, and permission to repartition the benches.
   *Recommend that default.*
5. **Deviations from approved designs.**
   - (a) Memory §3 and `object/shm.rs`'s header: anonymous memory and RAM objects may wait and be lost (Q1); RAM
     objects gain a reverse index; the fallback is kept but ordered by policy.
   - (b) Memory §2: the present-page write-fault re-check extends to every anonymous page being cleaned. This is
     an engineering detail, listed because it changes approved text.
   - (c) Storage §2.5 S4: a memory-format file is one resizable anonymous object, invalidated with its server as
     §7.6 rules.
   - (d) Memory §5: resident rows gain a `restart-hold` in superframes, with no floor eligibility.
   - (e) Superframe evacuation is eviction only, and compaction stays deferred. This is an engineering detail,
     listed because it changes approved text.
   - (f) Storage §3.5: "there is no swap" is replaced. Swapped memory, secrets included, is written to the
     internal disk encrypted and authenticated under a boot key that never leaves RAM.

   Memory §6's snapshot, §7.3's futex revoke and §7.6's immutable versions are unchanged. *Recommend accept all
   six.*

r4's questions 2 (flush or no retention) and 3 (restart state) are engineering, each with one safe answer (§3.1,
§3.2). Its question 6 stays withdrawn (§6).

## 12. What remains uncertain

- **Clauses to pin.**
  - The NVMe Base 2.0 command-ordering clause, cited only for the negative: no ordering among outstanding
    commands.
  - The CFRG AEAD-limits figure for ChaCha20-Poly1305's integrity bound.
  - Linux's `RLIMIT_MEMLOCK` default, taken from review r5.

  Each is to be cited at its site before implementation.
- **C-overlay on every display backend.** The handshake is bounded only where a present touches only resident
  memory and a bounded device submission. Each backend's owner must confirm it.
- **The compositor charging change** needs a client-granted job handle. That handle may carry more than charging
  authority today; the compositor track decides whether a narrower right is needed.
- **Residency figures.** They are QEMU commitments at `c06cc695e` on a 4 GiB guest. The current tree, the T14 and
  the touched sizes are unmeasured, and the memory service's size is an estimate by analogy. B's window figure is
  an upper bound that includes compositor heap growth.
- **Flush cost** on the T14's SSD, and its effect on DATA's write rate, is unmeasured (P5).
- **Servers that map client-charged memory** wait on that client's swap. netstack maps each client's stream
  region, charged to the client under #1077. A swapped ring page then stalls netstack's loop for every client.
  This is not a progress dependency of the pager, but it is cross-client interference.
  - Options for the netstack track: wire a region while serving it, within netstack's granted allowance, or copy
    through `Pending` reads.
  - Not decided here.
- **Spare reserve size** (0.1 %) and **policy history lost on restart** are estimates.
- **#1074 and #1077 are drafts.** Their interplay here is against their PR text.

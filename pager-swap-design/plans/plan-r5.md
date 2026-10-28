# Pager and swap: combined plan, revision 5

Design only. It builds on memory design revision 18 (§3, §5, §7, §8), storage design revision 12 (§2.5, W2) and
the contracts on `main` at `717baf3ac`: #1057's per-job ledgers and floors, #1070's `vm_remap`, and #1071/#1076's
shared-memory rights. #1077 (`SYS_SHM_COMMIT`) is still a draft on `tcp-region`, so this plan cites it from its PR
text. Revision 4 and its reviews r1–r3 are the base. Revision 5 answers the planning architect's five evidence
requests of 2026-10-28 in §3.1, §3.2, §5, §6 and §7.

**Labels.**
- **[P]**: published.
- **[C]**: read in code at `717baf3ac`, unless another revision is named.
- **[M]**: a recorded measurement, with its run named.
- **[D]**: arithmetic over [C] and [M] facts.
- **[E]**: an estimate or inference.

Unlabelled text is this plan's proposal.

## Changes from revision 4

1. **A cleaning ends only after a flush that covers its write answers durable (§3.1).** Blocks are claimed at
   `clean_begin`, before any write. r4 instead had `clean_end` refuse a referenced block, which was after the
   overwrite, and r4 freed the frame while the only other copy was in a volatile cache.
   - **Deleted:** swap's reliance on the block client's retention, the restart flush and its `Lost` path, and
     r4's owner question 2.
2. **The kernel owns each block's claim number (§3.2).** One monotone counter supplies both the generation and
   the AEAD nonce. The kernel's backing object also holds the tags and the key.
   - **Deleted:** the mapped state object, the nonce high-water mark and its "advance before seal" ordering.
3. **Block reuse after a restart rests on the partition hold (§3.2).** It is argued from blockserve's one holder
   per partition [C] and NVMe's ordering of a command submitted after a completion [P]. A new prerequisite
   follows: an open refused because a dead session is closing waits for that session to retire.
4. **The frame rule is explicit (§4).** A resident promise stays a #1057 promise, a held frame. A swappable
   promise is a backing unit. r4 left this implicit, which let a resident fault wait on reclaim I/O.
5. **Executable pages never reach swap (§6).** A never-writable copied page is dropped and refilled from its
   sealed source, with no I/O.
   - Swap waits on memory stage 4, after which every spawn source is sealed.
   - r4's question 6 is withdrawn: immutable versions stay committed RAM, as memory §7.6 approved.
6. **Residency is costed (§7).** Since #1076 the compositor creates every window buffer
   [C, `system/compositor/src/session.rs:1357,2236`], so r4's "compositor wholly resident" pinned up to RAM/8 of
   window contents.
   - **Proposed:** window buffers are swappable objects of the compositor, and resident rows declare their stack
     sizes.
7. **Interplay with #1070, #1076, #1077 and #1074** is stated in §2, §4 and §5.

## 0. What changes for programs

The owner's rule is [owner requirement, private] (owner direction, 2026-10-24;
`requirements/architecture.md`). Committed anonymous memory is still never refused at a fault and never reads
invented contents. What is new:

- **It may wait on storage.** This covers a load, a store, and any syscall that copies it (`read`, `write`, IPC,
  futex).
- **It can be lost.** A swap read that fails after the driver's recovery, or that fails authentication, ends the
  process at its next load or store, naming the cause. A syscall touching that memory answers `EIO`. No
  anonymous memory could fail before.
- **`mlock`/`vm_wire` is a new refusal** (`ENOMEM`), under the resident rule (§4).
- **After a stopped memory service** (§3.2), faults can wait indefinitely. They are reported overdue and never
  ended.
- **Resident memory** (§5) keeps memory §3's old guarantee: no fault on it does I/O or waits.
- **Executable and read-only image pages never go to swap** (§6).

## 1. Ownership

| Component | Owns |
|---|---|
| Kernel | Memory objects, mappings and protection. Faults and their waits; accessed and dirty harvesting; reverse records. **The backing object:** per-block state, claim number and tag, the swap key, the claim counter. Both commitment rules and the frame rule (§4). Safe replacement: revalidate, unmap, shootdown, futex revoke, free. The mechanical no-I/O fallback; invalidation when a server ends. No policy, filesystem or cryptography |
| Memory service (new; signed row; `reclaimer` role) | Watermarks and its declared reserve `M`; reclaim selection over file and anonymous pages; swap-out and swap-in; block placement; sealing and opening; pressure figures. It keeps nothing that a restart needs |
| File servers (pagers) | As memory §7 and storage §2.5, unchanged |
| Storage driver | The swap session's I/O. diskserver only opens and reopens the session [C, `lib/blockring/src/lib.rs:31-34`] |
| Supervisor | Signed roles as spawn attributes (pager, reclaimer, resident); floors and restart holds; restart; holding the backing handle, which grants no read; the end state of swap |
| Compositor | Resident except the window buffers it creates for clients (§7). The overlay thread never touches a window buffer |

Deleted on the way [C]: the file server's data cache (`system/fileserver/src/cache.rs`) at W2, and
`kernel/src/file_cache.rs` behind kernel tmpfs at W3. No SDK cache.

## 2. Page lifecycle

```text
 file page: absent ─fault→ request ─mem_supply→ clean ─store/write→ dirty ─begin→ cleaning ─end→ clean
              ▲                                   │ dropped, no I/O (policy order, or the kernel's fallback)
              └───────────────────────────────────┘   truncate: mem_resize as memory §7.3

 anon page:  resident ─clean_begin(blocks)→ cleaning: block b claimed, claim number c
                ▲  ▲          │ store, pin since begin, or write failed: kept (b freed, or retired)
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
- **The memory format** (`/tmp`, no-DATA boots) is r4's, unchanged:
  - each file is one resizable anonymous object that the file server creates and owns;
  - `MAP_SHARED` and `read()`/`write()` share it;
  - `mem_read`/`mem_write` answer `Pending(ticket)` or `Busy` on a swapped page, through a ticket table the
    caller committed, which raises `available`;
  - growth and shrinking go through `mem_resize`;
  - the object carries a *served* mark: its creator's teardown invalidates every mapping through the RAM-object
    reverse index, as memory §7.6 does for paged objects.
- **Anonymous pages** are private memory, `mem_create` objects, #1077's committed parts of objects, and memory
  §6's private snapshots.
  - **`clean_begin`** names the blocks it will write, chosen by the service from `backing_query`. The kernel
    claims them atomically and refuses the whole call, changing nothing, if any is not free. Each claim gets the
    next claim number.
  - On a private page it marks the leaf with the software bit `CLEANING`, write-protects, shoots down and
    clears dirty, all under the space lock.
  - A store faults, re-dirties and clears `CLEANING`. A kernel copy takes its pin under the space lock
    [C, `kernel/src/user_ptr.rs:160-162`] and clears `CLEANING` there. A pinned page is never begun. So
    `CLEANING` still set at `clean_end` means exactly "not dirtied or pinned since begin".
  - Shared objects keep §7.3's per-page flag in their index.
- **`clean_end`** is called only after every write of the batch was acknowledged and a later flush answered
  durable (§3.1).
  - A still-`CLEANING` leaf becomes a non-present entry holding the block number. The claim number stays in the
    kernel's record for the block, so the entry needs only the block.
  - The encoding keeps the implied frame number clear of cacheable physical memory, as Intel's L1TF guidance asks
    of not-present entries [P].
  - Then come the shootdown, the futex revoke (memory §7.3, kept) and the free.
- **A fault on a swapped entry** records (b, c) in its waiter and raises `requested`. `mem_supply` names (b, c)
  and is refused unless b is referenced with claim c. v1 supplies only waiters, with no read-ahead.
- **#1070's `vm_remap`** moves every non-empty leaf [C, `kernel/src/mm/space.rs:684-697`].
  - A swapped entry and a `CLEANING` leaf move with their bits.
  - Reverse records follow the move: `move_leaves` rewrites each moved frame's page index under the space lock it
    already holds.
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
  or lend to a device [C, `SYS_SHM_MAP`, `SYS_DEVICE_DMA_MAP`]. Lending is where a charge moves from `A` to `W`
  (§4). The reclaimer reads only pages it has begun.
- **File-server failure**: memory §7.6, unchanged.

### 3.1 The last recoverable copy (evidence request 1)

**Invariant.** At every instant each live anonymous page has exactly one authoritative copy, and nothing writes
that copy except the page's owner, through stores or copies into its own memory. A copy becomes authoritative
before its predecessor stops being so, in one hold of the lock that orders them. Three rules carry it:

- **R-a. A referenced block is never written.** A block is claimed only from the free state, at `clean_begin`,
  before any write is issued. A referenced block leaves that state only by release (its page is gone) or by
  swap-in (in the same hold that installs the frame).
  - The service's write path takes the `Claim` that the begin answered and consumes it. So a write to an
    unclaimed block is not representable in the service's code.
  - The kernel cannot stop a buggy signed service from writing a wrong block, since it holds the partition. AEAD
    (§3.2) turns such a write into a diagnosed loss, never into wrong data.
- **R-b. A frame is freed only when the device has made its block survive a driver reset.** That is when a flush
  answers durable after every write of the batch was acknowledged.
  - The block protocol treats a reset as possibly losing acknowledged, unflushed writes
    [C, `lib/blockserve/src/sessions.rs:316-330` `reset` counts a loss; `lib/blockhold/src/lib.rs:1-22`].
  - r4 freed the frame at the acknowledgement. Its last copies were then the device's volatile cache and the
    service's own arena, which goes with the service.
- **R-c. Swap-in installs before it frees.** The kernel copies the service's plaintext into a frame from `M`,
  installs it, and frees the block, all under the space lock. Until then the block is untouched by R-a.

| State | Authoritative copy | Being written | Survives |
|---|---|---|---|
| Resident | frame | the frame, by its owner only | everything except the owner's exit |
| Cleaning, writes in flight or acknowledged, flush pending | frame (write-protected) | the claimed block, which nobody reads | service crash: the kernel fails the cleaning, so the page stays resident and dirty. Driver reset: the write is reissued or refused; the frame is still authoritative |
| Durable, before `clean_end` | frame, and the block | nothing | as above |
| Swapped | block | nothing (R-a) | service and driver restarts (§3.2) |
| Swap-in, read in flight | block | the frame from `M`, which nobody reads | a read refused or lost is issued again: `requested` is level state |
| Supplied | frame | the frame, by its owner | — |

**What can still lose a page, each diagnosed.** These are the only cases:
- media corruption of a referenced block, which fails authentication;
- the device leaving (`gone`), when the service calls `mem_fail` over referenced blocks in batched ranges;
- the end state, where restarts stop and the backing is dropped.

In each, a later touch ends the owner with the cause named, and a syscall answers `EIO`.

**Cost of R-b** [D]. It is the flush cadence r4 already paid: one flush per batch of at most 223 acknowledged
writes (half of the 447 arena blocks writes may hold, from a 511-block arena [C, `arena.rs:27-30`]). Writes take
at most 48 of the 64 ring entries [C, `layout.rs:22`]. The rest of the arena and ring stays for swap-in reads.
- **No extra memory.** r4 kept the same 4 KiB per unflushed write as retained ciphertext. R-b keeps it as the
  page itself.
- **What is longer** is the time a page stays write-protected in `CLEANING`, so more stores land as `kept`.
- **Flush on a shared device.** A flush is the device's, so it also flushes DATA's cache. A device with no
  volatile write cache answers at once [C, `sessions.rs:51-53` `submit_flush` answers `false`]. The T14's flush
  cost is unmeasured (P5).

**File pages** follow storage W2: a write-back ends at the write's acknowledgement, and durability is `fsync`'s.
Swap cannot adopt that rule, because a lost swapped page ends a process, whereas a file write without `fsync` was
never promised.

### 3.2 Interrupted writes, nonces, block ownership and restart (evidence request 2)

**Block state**, kernel-owned, one 8-byte record per block plus a 16-byte tag:

```text
 free ─clean_begin→ claimed(c) ─clean_end ok→ referenced(c) ─release / swap-in→ free
   ▲                    │ clean_end failed or kept, or the service ended → free
   │                    │ the service reports a device error → retired (S shrinks)
   └────────────────────┘
 referenced ─mem_fail / device gone→ failed ─release→ free;   backing dropped: every reference fails on touch
```

- **Claim numbers are the generation and the nonce.** One 62-bit counter in the backing object is advanced once
  per claim and never reused within a boot. The record holds the claim number and 2 state bits.
  - A stale `mem_supply` or `mem_fail` naming (b, c) after b was freed and claimed again as c′ is refused.
  - A stale ciphertext of b fails to open under c′ (below).
  - Swap lives one boot, so a reboot needs nothing; there is no hibernation.
- **AEAD.**
  - The key is 256 bits, drawn from the kernel RNG when the backing is created. It lives only in the backing
    object and is handed out only to the attached reclaimer.
  - The nonce is the claim number. Epoch e = c / (2^32 − 1) and sequence s = c mod (2^32 − 1), so s never
    reaches the value `toyos-crypto` refuses for GCM [C, `lib/crypto/src/aead.rs:100`]. The subkey is
    HKDF(key, e) [C, `lib/crypto/src/kdf.rs`].
  - The AAD is the block number, so a ciphertext opens only at its claimed place.
  - The tag goes to the kernel record through `clean_end`, and comes back to the service with each `requested`
    notice.
  - AES-256-GCM is used where the CPU has AES and carry-less multiply, which is x86-64 today. AArch64 uses
    ChaCha20-Poly1305 today, because the crate has no AArch64 AES path [C, `lib/crypto/src/arch/aarch64.rs`].
- **Uniqueness has two parts.**
  - The kernel never repeats a claim number. This is structural, and the P3 host model asserts it.
  - The service seals each claim at most once. The begin's `Claim` is consumed by the seal. A retry after a
    failed write is a new begin with a new claim. A reissue after a loss sends the same ciphertext and is not a
    seal.
  - `toyos-crypto` gains `SealingKey::at(key, next)` and `seal_at(sequence, ..)`, which refuses any sequence
    below `next` and advances past it. That is monotone with gaps, so a double seal of one claim is also refused
    by the crate. It is documented as the caller's uniqueness contract and lands with its pin.
  - r4's high-water mark and its "advance before seal" order are gone: nothing the dead process did last can
    repeat a nonce.
- **An interrupted write** can leave the claimed block holding anything. A block's last write after a reset or an
  abort is indeterminate [E]. The block becomes referenced only through R-b, after an acknowledged write and a
  later durable flush. So no reference names a block whose last write was interrupted. A torn block is
  unreferenced, and the next claim overwrites it.
- **Reuse of a dead incarnation's claims.** When the memory service ends, the kernel frees its claimed blocks.
  A write the dead process put on the wire may still be on the device. It cannot land after a write of the
  restarted service to the same block:
  1. A session holds its partition until each command it issued has been answered. A closing session ends only
     at `inflight == 0`, and only then is its hold released
     [C, `lib/blockserve/src/sessions.rs:296-315`]. An open over a held span is refused `Held`
     [C, `sessions.rs:97-118`, `lib/blockhold/src/lib.rs:3-5`].
  2. So every write of the restarted service is submitted after the dead session's commands completed.
  3. NVMe orders a command submitted after another's completion after it [P, NVMe Base Specification, command
     ordering requirements; the clause is to be cited at the site].
  4. A driver restart resets the controller first, which completes or aborts every outstanding command before
     the new driver serves [P, NVMe controller reset; verify the clause before P3].
  5. **New prerequisite (S0-b):** an open refused `Held` because the previous holder's session is closing waits
     for that session's retirement instead of failing. The device's protocol timeouts bound that wait (memory
     §7.8, "where each bound lives").

**What survives what.**

| State | Owner | Memory-service restart | Driver or diskserver restart |
|---|---|---|---|
| Block state, claim numbers, tags, key, counter | kernel backing object | kept | kept |
| Swapped entries | page tables | kept | kept |
| Requests | waiter records, level state | re-reported to the new process | kept; reads refused at the session's end are issued again |
| Begun cleanings | kernel | failed at teardown: pages resident and dirty, claims freed | the service ends them failed, or reissues the same ciphertext to the same claim |
| Acknowledged, unflushed writes | the block client in the service | lost with the process, harmlessly: by R-b no referenced block depends on them | reissued as identical bytes [C, `lib/blockring/src/client.rs:10-19`] |
| Placement cursor | service | rebuilt from `backing_query` | kept |
| Policy history | service | lost [E: it costs refault accuracy for about one scan cycle] | kept |
| The session | service and driver | reopened after the old hold retires (above) | reopened |

- **Restart.** The restarted reclaimer calls `backing_attach`, receives the key and the next claim number by copy,
  and starts. It needs no flush first, has no `Lost` path, and has no mapped object to read.
  - Attach requires the `reclaimer` role. It is refused while another live process is attached.
  - The supervisor holds only the backing handle, which grants no read.
- **End state.** When the supervisor will not restart the service (budget spent, or a stop), it drops the backing.
  Every swapped entry then fails on touch with "swap data lost: memory service ended". This is lazy: no walk of
  every space.
- **Swap I/O failure.**
  - A failed write ends its cleaning with `kept`, and the service retires the block.
  - A failed or unauthenticated read becomes `mem_fail(b, c, cause)`. It never yields zeros.
  - If retirement makes the backing rule fail, new commitments are refused until it holds, and existing ones
    stand.

## 4. Commitment accounting

Units are frames and #1057's superframes. The symbols:
- **R**: frames managed;
- **K**: the kept superframes;
- **F_j**: job *j*'s floor (`memory.min`: the first `F_j` of its use is guaranteed [P, cgroup v2]);
- **W_j**: its resident charges (below);
- **A_j**: its swappable commitment;
- **S**: swap blocks added and not retired;
- **M**: the reclaimer's reserve, at most one superframe.

```text
 resident rule:  Σ_j max(F_j, W_j)        + K + M ≤ R
 backing rule:   Σ_j max(F_j, W_j + A_j)  + K + M ≤ R + S
 frame rule:     a W promise is a #1057 promise: a frame held back, never taken by a swappable fault.
                 An A promise is a backing unit, which holds no frame.
```

- **The frame rule is what makes "resident never waits" true.**
  - A resident fault draws its held frame, exactly as every fault does today
    [C, `kernel/pure/frames.rs:16-21`: "A promise is a frame no other allocation may take"].
  - A swappable fault takes a frame only from frames neither promised nor held back. With none free, it first
    takes memory §3's mechanical fallback: any clean, unpinned, unprotected slack page, preferring the service's
    latest candidates. Only if none exists does it wait for reclaim.
  - With `S = 0`, no fault ever depends on the service, and the rules reduce to #1057's.
- **Every increase of `W_j` checks both rules.** That covers page-table builds, heap charges, runs, `vm_wire`,
  floor sets, lending and `vm_remap` growth of a resident range. An increase of `A_j` checks the backing rule.
  - #1070's `vm_remap` is already promised, charged and all or nothing [C]. Its growth is `A` or `W` by its range.
  - #1077's `SYS_SHM_COMMIT` charges the object's job [C, PR text]. Under swap that is the job's `A`, and its
    eager zeroing may wait for frames, since it is a syscall holding no lock.
- **`W_j`** holds:
  - page tables (which also hold swapped entries), kernel-heap charges and runs;
  - wired ranges;
  - resident-by-kind objects;
  - a pager's `C`;
  - a `resident` process's private memory, and the objects it creates without the swappable flag (§7).
- **`A_j`** holds committed private pages, swappable objects the job created, #1077 commits, private snapshots,
  and the window buffers a resident compositor creates swappable.
- **Resident by kind**, charged in `W`:
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
- **Shared backing is charged once**: to its creator, or inside the pager's `C`. Only reserved backing counts,
  with no ratio (unlike Linux overcommit mode 2 [P]).
- **Ledger.** #1057's `committed` splits into resident and swappable. `resident`, `swapped`, `refaults` and stall
  time join `SYS_ACCOUNT_INFO`. A swapped page stays its job's charge. Swap I/O CPU time is the service's.

## 5. Bounded progress and what stays resident (evidence request 3)

**`resident` processes** (whole-process, from a signed row). Their images come from objects the supervisor
holds, never through a file server. Each row states its `restart-hold` in superframes and its stack sizes (§7).
- the stop, input and restart path: the supervisor, the input servers, usbd (it carries HID), and the compositor
  except its client window buffers;
- the swap chain: the memory service, the storage driver, and diskserver (session reopen).

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
| The memory service, whole | Read, open, supply. Its log ring is its own job's [C, #1057 `SHM_FOR_JOB`], and a write to it never waits or allocates [C, `sdk/toyos/src/log/stdio.rs:14-17`] | unbuilt, ≈ 12 MiB like diskserver [E], plus its 2 MiB session region (lent, so resident by kind) and `M` ≤ 2 MiB |
| The storage driver, whole | The command | nvme 18.5 MiB [M], including its 2 MiB DMA grant [C, `system/nvme/src/nvme.rs:86,250`] |
| The session connection's ring | The doorbell | one 2 MiB run taken at the first write and kept while the pipe lives [C, `kernel/src/pipe.rs:119-121,143-155`] |
| diskserver | Reopening the session after a driver restart | 12.2 MiB [M] |
| The supervisor | Restarting any of these | 41.7 MiB [M] |
| A dead resident row's restart hold | Whole superframes for its next start | only while dead. It replaces that row's running charge, so it adds nothing to the steady state |

**Bound.** The swap chain holds ≈ 41.7 + 18.5 + 12.2 + 16 ≈ 88 MiB at today's stack sizes [M + E], or ≈ 53 MiB
with declared stacks (§7) [D]. On top of that come 0.59 % of `S` and 0.2 % of `R` in kernel records. With
`S = 8 GiB` on a 16 GiB machine that is ≈ 80 MiB [D]. Nothing in the chain grows with the number of processes or
swapped pages, except those two kernel tables, which are committed when blocks are added and at boot.

**Not on the chain**, and checked: file servers (swap is a raw partition), logkeeper (the ring never waits),
netstack, soundserver, and every app.

**The restart hold, not a floor** (r4, kept).
- When a resident process dies, its job keeps up to its row's `restart-hold` superframes, kept whole. They are
  released only to that job's next start, or when the supervisor closes the service.
- While held, the hold counts as that job's `W_j` in both rules. While the process runs the hold is zero.
- It is whole superframes because the chain's restart draws 2 MiB runs: session regions and the NVMe DMA grant
  [C, `lib/blockserve/src/region.rs`, `system/nvme/src/nvme.rs:250`], and heap growth by superframes
  [C, `frames.rs:22-33`].

**Wired ranges** (`vm_wire`):
- each file server's page-in and write-back working set: its arena, format metadata cache, executor and ticket
  table (memory §7.4 rule 3);
- soundserver's client slots and its realtime thread's stack (§7).

**Swap-out progress needs no free frame.** Drops are I/O-free. Sealing writes into arena blocks of the session
region. Writes hold at most 447 arena blocks and 48 ring entries, then a flush (§3.1). Frames come back at
`clean_end`.

**Allocation-free swap I/O (S0-b, storage track).** Today the session client allocates per request and per answer
[C, `system/diskserver/src/session.rs:191,204,215,324,329,337`, `lib/blockring/src/client.rs:279`], and so does
the driver side per in-flight entry [C, `lib/blockring/src/server.rs:96`, `lib/blockserve/src/sessions.rs:297`].
- **Required:** fixed tables sized by `DEPTH`, and reads opened straight from the arena into the service's own
  buffer.
- **Check:** a host test under `DEPTH` traffic, with an allocator that fails after warm-up.
- The IOMMU side already allocates nothing per I/O [C, `kernel/src/pcidev/mod.rs:1482`;
  `system/nvme/src/nvme.rs:84-89`].
- **#1074 (draft)** would make a pipe take 4 KiB frames as it fills. The swap session's connections would then
  need to keep their first frame, or a doorbell after a drain would allocate. This is a dependency on #1074's
  landing.

**Why no cycle.** The chain is fault, then memory service, then driver, then device, with diskserver only to
reopen and the supervisor only to restart.
- Every link is resident, so none takes a swap fault.
- None maps a paged object (memory §7.4 rule 1, extended to the reclaimer).
- None waits on a file server.
- None allocates per I/O.
- Swap-in draws only on `M`, and resident faults draw only on their held frames (§4).
- No kernel lock is held across any wait (§3).
- A file server's swappable part may wait on the swap chain, which never waits on it.

**Writeback, backpressure and waits** are r4's. File dirty data is bounded by `C − C_clean` and caps (memory
§7.5). The service raises `reclaim_pressure` on a pager and never waits on it. Waits on swap-in and frames join
memory §7.8's table:
- advanced by `mem_supply` or reclaim;
- failed only by `mem_fail` or the backing's drop;
- ended by kill;
- reported overdue, with the service's progress times.

There is no automatic kill or suspension.

## 6. Executable backing (evidence request 4)

**Today** [C]:
- Every `PT_LOAD` segment, text included, is a committed `Kind::Copy` range of the process
  (`kernel/src/loader/mod.rs:121`). Each page is copied from its source at first touch
  (`kernel/src/mm/space.rs:829-845,925-946`).
- The only sources the kernel knows to be immutable are boot images and their subranges
  (`kernel/src/object/shm.rs:175-180`, `SharedMemObject::immutable`). For a ROOT program that is SYSTEM's subrange
  of ROOT (`fs::IMAGE`).
- Other sources are writable objects: `Image::read_for` copies, `/tmp` snapshots. For those, "a change after the
  hand-off reaches only pages not yet read" (`kernel/src/file_backing.rs:38-48`).
- So under r4 a cold text page was `A`: it would have been encrypted and written to swap, and read back.

**The rule.** A copied page is never swapped when its range has never been writable and its source is
immutable. Such a page is dropped like a clean slack page, and its next touch copies it again from the source,
with no I/O.
- **Never writable** is a flag on the range, set at creation and cleared by any `vm_protect` to `ReadWrite`. It
  covers text and read-only data, which are 69–86 % of each service's image [M: `readelf -lW` of the primary
  checkout's 2026-10-23 build; supervisor RX 1153 KiB and R 388 KiB of 1829 KiB].
- RELRO pages are written before they are protected, so they are excluded. So is `.data`, which is the program's
  own data and swaps as such.
- The refill reads the source through `CopySource::read`, which already runs under the space lock and cannot fail
  [C, `space.rs:43-50`].
- This needs no new state beyond the flag, and no dirty bit, because a never-writable page cannot be stored to.
  The kernel's own fill of a range (`space.rs:871-905`) writes only private ranges, which are not copied ones.
- **Prerequisite:** P3 follows memory stage 4, under which a spawner's image must be exec-sealed or the spawn is
  refused (memory §4). By then every copy source is immutable, and swap never sees code.
- **After memory stage 6**, text maps its sealed source directly. The copies, and the drop rule with them, go.

**The source stays resident.** Sealed versions remain committed RAM objects in the shared-files account, released
at last unmap and purgeable only when unmapped (memory §7.6, stage 8, as approved). Boot payloads remain resident
for the boot.
- A running program's code is therefore never lost to a swap failure, and survives its file server's death as
  approved.
- r4's question 6, droppable mapped versions refetched from the file server, is withdrawn: it gave up that
  independence for capacity that this plan does not need to claim.
- ROOT itself is wholly resident (117 MiB for the `--build-only` image [M:
  `issues/root-in-memory-costs-its-whole-size.md`]). This plan does not change that, and swap cannot touch it.

## 7. The cost of whole-service residency (evidence request 5)

**Measured** [M: the run named in §5]. `committed + kernel` per job:

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
- The compositor's total climbs by 6.6 MiB per terminal window launched (60.0, 66.6, 73.2 and 79.8 MiB at its settled
  readings) [M].
- Its window buffers are its own objects [C, `session.rs:1357,2236` `ReadOnly::create`]. They are capped at RAM/8
  [C, `system/compositor/desktop/src/budget.rs:12,50-53`]: 500 MiB on that guest, 2 GiB on a 16 GiB machine
  [D], below the slot cap.
- The stacks are committed whole and populated as touched (memory §3, Q15) [C]. How much of each is touched is
  unmeasured. The main stack's argv block and the first frames are a few pages [E].
- These readings predate #1070 and #1076. Neither changes stacks. #1076 kept the compositor as the buffers'
  creator ("The compositor still creates the buffers"), so the readings already count them to it [C, #1076's
  PR text].

**The alternatives**, for a 16 GiB machine with `S` = 8 GiB [D, from the table; the memory service estimated as
in §5]:

| | Resident | Grows with | What it gives up |
|---|---|---|---|
| **A. r4: every row wholly resident** | ≈ 185 MiB measured + ≈ 16 MiB memory service ≈ 201 MiB (1.2 %) | each window, ≈ 6.6 MiB, up to RAM/8 (2 GiB, 12.5 %) | nothing for the controls; window contents can never swap |
| **B. Proposed: rows declare stacks; the compositor's window buffers swappable** | ≈ 201 − 54 (stacks, replaced by ≈ 2.3 MiB of declared ones [E: 256 KiB each]) − 43 (the compositor's growth from its loop to four windows, an upper bound on the buffers) ≈ 106 MiB (0.65 %) | nothing | the compositing loop can wait on a cold window's buffer. The overlay thread and its input path never touch one, so the stop control stays usable |
| **C. Page the controls too; wire only sub-ranges** | swap chain only, ≈ 53 MiB with declared stacks | nothing | the input servers' and compositor's heaps can swap, which memory §5 rejected (a shared heap cannot be wired in part). It saves at most ≈ 20 MiB more [D: ps2server, usbd and the compositor at its loop, less their stacks and their kernel parts, which never swap; the user/kernel split is #1057's earlier unpublished reading, `mem-per-job/logs/measure-3.log` of 2026-10-24: ps2server 10.8 + 2.5, usbd 11.3 + 6.5, compositor kernel ≈ 13 MiB], and the controls then wait on swap under thrash |

Kernel tables are the same in all three: ≈ 80 MiB at that size (§5).

**Proposal: B.**
- **The cost of A:** about 95 MiB more held frames, plus up to RAM/8 of window memory that swap is meant to
  serve. Cold windows are the clearest case of inactive application memory.
- **The cost of B:**
  - one flag at object creation: an object a resident process creates is `W` unless it is created swappable;
  - a stack size declaration. The main stack's committed size becomes a spawn parameter, which the supervisor
    passes from the row, with 8 MiB as the default. A program sets its own thread stacks at its spawn sites
    (`std::thread::Builder::stack_size`). A row's sizes come from its measured depth plus a margin, and the guard
    page makes an overflow loud;
  - the compositing loop may stall on a swapped window. That falls under "capacity, not guaranteed
    responsiveness".
- **Not proposed:** charging window buffers to their clients. #1076 kept them with the compositor for its budget,
  and that question is the compositor track's.

**Soundserver** creates its clients' audio slots itself [C, `system/soundserver/src/client.rs:174`]. It is not
resident, so it wires its slot mappings and its realtime thread's stack with `vm_wire` before realtime
execution.

**Unmeasured, owed by P1:** each resident row's committed and populated totals on the current tree and on the
T14. This revision could not take them: a local image build fails in an unrelated, uncommitted edit to the shared
`winit` checkout (handoff). The figures above are #1057's QEMU readings.

## 8. The swap area

- **Where.** A dedicated GPT partition of a new type, TOYOS-SWAP, on internal storage only, granted by type to the
  memory service. Removable media are refused by name. A swap file is rejected, because it puts filesystem
  allocation, moves and journaling in the swap path, as btrfs's swapfile rules show [P].
- **Sizing.** `S` adds directly to commitment capacity. It holds disk space for good (resizing means
  repartitioning [E]) and costs 0.59 % of `S` in kernel records [D].
  - A working set beyond RAM thrashes whatever `S` is (Denning [P]), and the product goal is inactive
    application memory.
  - Default `S = clamp(RAM / 2, 4 GiB, 16 GiB)` [E], chosen at install.
  - No partition means `S = 0`, logged by name.
- **Blocks.** One block is one 4 KiB page. `backing_query` answers free runs. The service clusters a batch into
  sequential writes. The kernel claims at `clean_begin` (§2).
- **Metadata residency.** Records, claim numbers, the key and policy state are resident. Nothing but page
  contents is read from disk.

Storage §3.5's "there is no swap" changes to: swapped secrets are encrypted under a boot key that never leaves
RAM.

## 9. Interfaces (generic)

- **Roles:** `reclaimer` (one process) and `resident`, as spawn attributes from signed rows, refused in both
  orders.
- **`vm_wire(range)` / `vm_unwire`**: populate and keep resident; checks both rules. libc `mlock` and
  `MAP_LOCKED` map to it.
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
  On success the claims become references; on failure the claims are freed, or retired if the service says so.
- **`mem_supply(b, c, src)`** and **`mem_fail(b, c, cause)`**, the latter also over block ranges.
- **The `requested` notice** answers (b, c, tag).
- **`mem_scan`, `mem_reclaim`, watermarks and the level notices** are r4's (`below_low`, `frame_waiters`,
  `superframe_wanted`; a pager's `reclaim_pressure`). `mem_scan` tokens are opaque.
- **RAM objects** gain `mem_resize`, the swappable creation flag, and `Pending`/`Busy` `mem_read`/`mem_write`
  through a caller-created ticket table (§2).
- **Deleted from r4:** the mapped state object, `clean_end`'s referenced-block refusal, and the nonce high-water
  mark.
- **Kernel records.**
  - A reverse record per frame, laid out at boot beside the pins: a 29-bit owner index and a 35-bit page index
    in 8 B [E].
  - RAM objects gain memory §1's weak reverse index, which today only paged objects and apertures have.
  - `move_leaves` keeps both current (§2).

## 10. Staged plan

| Stage | Content | Validation | Touches |
|---|---|---|---|
| **S0-a** | User copies fault or swap in before any kernel lock and pin after, for all user memory; the futex rule (§3). **Owner: memory track (kernel)**; already a stage 7 prerequisite | **H**: chunk model. **Q**: pipe and futex sites; a mutation that copies under the pipe lock goes red. Closes the two issues | stage 7 prerequisite |
| **S0-b** | Allocation-free session client and driver side (§5). An open refused `Held` by a closing session waits for its retirement (§3.2). Doorbells keep their ring if #1074 lands. **Owner: storage track** | **H**: `DEPTH` traffic with an allocator failing after warm-up, red on any per-I/O allocation. A reopen during a dead session's close is answered only after its last completion, red if the hold is released early | B1's async client, #1074 |
| P0 | Memory stages 4 and 7, and storage W2, as designed | memory §8, storage W2 | stages 4, 7; W2 |
| P1 | Two rules and the frame rule in `frames.rs` on #1057; `vm_wire`; `resident` and `restart-hold`; the swappable creation flag; stack sizes as a spawn parameter; resident by kind; unmovable frames in their own superframes; `S = 0` | **H**: both rules at every `W` and `A` increase, red when a table build skips the backing rule; a resident fault never waits, red when a swappable fault may take a held frame; superframe invariants under wire and lend; a hold kept whole. **Q**: `mmap_stress`; P1 reports each resident row's committed and populated totals | #1057, stage 5 |
| P2 | Reverse records and the RAM-object reverse index, kept current by `move_leaves`; `mem_scan`; `mem_reclaim` for clean pages and never-writable copied pages (§6); watermarks; the kept fallback; superframe evacuation; the `reclaimer` role; service v0 (plain CLOCK) | **H**: revalidation, floor protection, revoke order (memory §8's mutations), an evacuation case, a dropped copied page refilled byte-exact from its source, red if a `ReadWrite`-once range is dropped; the fallback with a stuck service; a remap between scan and reclaim. **Q**: a page-cache-heavy run with the controls usable | stage 8 (its kernel clock goes) |
| P3 | Swap: block states and claims, `backing_*`, cleaning of anonymous locations ended after durable, TOYOS-SWAP, the kernel records and attach, AEAD with `at`/`seal_at`, the end state and device-gone failure; the memory format on resizable RAM objects (storage W3) | **H**: `kept` exactness for private leaves; claims never repeat and are refused on referenced blocks; a stale supply or fail refused after reuse; a frame never freed before durable, red when `clean_end` follows the acknowledgement; a nonce oracle across retries, reissues, kills and restarts, red when a claim is sealed twice. **Q** (q35, `virt`, small `-m`): commit beyond RAM and verify contents; an injected read error and a flipped ciphertext bit each end only the owner; a driver reset loses nothing; a service kill during a batch loses nothing; a restart keeps data; a spent budget fails blocks by name; `/tmp` swapped and read back through `read()` and a mapping, the server never blocking; killing its server ends a `/tmp` mapper with the invalid-mapping diagnostic | notices from P0; C3's probe ignores TOYOS-SWAP; storage W3 |
| P4 | Policy: CLOCK-Pro and generational on the same scan signals; file/anon balance by refault cost; write-ahead if refaults justify it | **H**: replay of recorded scan streams and synthetic loops, scans and Zipf. Lower refaults at equal cost wins, else the simpler | — |
| P5 | Metal (T14, AMD; `--metal-readback`) | swap throughput; flush cost on DATA; fault latency; stop-control latency under thrash; a cold window's restore; audio without underruns | bench layout |

Each guest row needs the guest because it crosses the fault path, the scheduler's waits, a real block session and
teardown. QEMU judges order, completion and contents only. Timing is P5's.

## 11. Questions for the owner

1. **The guarantee change as §0 states it**, including lost anonymous data ending a process and syscalls
   answering `EIO`. *Recommend accept.*
2. **`vm_wire` ambient, with no per-app cap.** One app can wire almost all RAM and push the rest into thrash. It
   is refused only by the resident rule. *Recommend ambient*: it is how `mlock` and realtime audio work
   unchanged.
3. **The resident set and its cost (§7).**
   - The supervisor, the input servers, usbd, the compositor except its window buffers, and the swap chain.
   - Rows declare their stack sizes.
   - Measured and derived: ≈ 106 MiB with B, against ≈ 201 MiB plus every window's buffers up to RAM/8 with
     r4's A.
   - B lets the compositing loop wait on a cold window, while the stop overlay does not.
   - *Recommend B.*
4. **Swap size** `clamp(RAM/2, 4, 16 GiB)`, and permission to repartition the benches. *Recommend that default.*
5. **Deviations from approved designs.**
   - (a) Memory §3 and `object/shm.rs`'s header: anonymous memory and RAM objects may wait and be lost (Q1); RAM
     objects gain a reverse index; the fallback is kept but ordered by policy.
   - (b) Memory §2: the present-page write-fault re-check extends to every anonymous page being cleaned.
   - (c) Storage §2.5 S4: a memory-format file is one resizable anonymous object, invalidated with its server as
     §7.6 rules.
   - (d) Memory §5: resident rows gain a `restart-hold` in superframes, with no floor eligibility.
   - (e) Superframe evacuation is eviction only; compaction stays deferred.

   Memory §6's snapshot, §7.3's futex revoke and §7.6's immutable versions are unchanged. *Recommend accept all
   five.*

r4's questions 2 (flush or no retention) and 3 (restart state) are now engineering, each with one safe answer
(§3.1, §3.2). Its question 6 is withdrawn (§6).

## 12. What remains uncertain

- **NVMe clauses.** Ordering after completion, and a controller reset completing or aborting every outstanding
  command, are taken from the specification [P] but not yet pinned to clause numbers. P3 cites them at the site.
  Behind them sits each driver's own rule of answering a command before releasing a session, which is [C] for
  blockserve only.
- **Residency figures.** They are QEMU commitments at `c06cc695e` on a 4 GiB guest. The current tree, the T14 and
  the touched sizes are unmeasured, and the memory service's size is an estimate by analogy. B's window figure is
  an upper bound that includes compositor heap growth.
- **Flush cost** on the T14's SSD and its effect on DATA's write rate is unmeasured (P5). R-b makes it
  unavoidable, but it is not new against r4.
- **Servers mapping client-charged memory** wait on that client's swap. netstack maps each client's stream region,
  charged to the client under #1077. A swapped ring page then stalls netstack's loop for every client. This is
  not a progress dependency of the pager, but it is cross-client interference.
  - Options for the netstack track: wire a region while netstack serves it (`W` of the client), or copy through
    `Pending` reads.
  - Not decided here.
- **Policy history is lost on a service restart.** The refault cost is guessed [E].
- **#1074 and #1077 are drafts.** Their interplay here is against their PR text.
- **Stage ordering.** P3 now waits on memory stage 4 as well as stage 7. Stage 4 was already before stage 7 in
  memory §8, so no stage moves.

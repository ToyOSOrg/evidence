# Pager and swap: combined plan, revision 4

For owner review; design only. It builds on memory design revision 18 (§7 pager, stage 7; §8 stage 8), storage
design revision 12 (§2.5, W2) and #1057's per-job ledgers and floors. Labels: **[P]** published, **[C]** read in
code, **[E]** estimate or inference; unlabelled text is this plan's proposal. Reviews r1 and r2 are answered in
`notes.md` (R1–R16, S1–S11, N1–N3, S-a–S-d; r3 in plan §2, §3, §5, §7). Repository text restates these decisions in its own words, without item numbers or
private notes.

## 0. What changes for programs

The owner's rule is [owner requirement, private] (owner direction, 2026-10-24).
Committed anonymous memory is still never refused at a fault and never reads invented contents. What is new:

- **It may wait on storage**: in a load, a store, and **any syscall that copies it** (`read`, `write`, IPC, futex).
- **It can be lost.** A swap read that fails after the driver's recovery, or fails authentication, ends the
  process at its next load or store, naming the cause; a syscall touching it answers `EIO`. No anonymous memory
  could fail before. Q6 would extend the same to mapped app code.
- **`mlock`/`vm_wire` is a new refusal** (`ENOMEM`), under the resident rule (§4).
- **After a stopped memory service** (§3) faults can wait indefinitely: reported overdue, never ended.
- Memory that stays resident (§5) keeps memory §3's old guarantee: no fault on it does I/O or waits.

## 1. Ownership

| Component | Owns |
|---|---|
| Kernel | Memory objects, mappings, protection; faults and their waits; accessed/dirty harvesting; reverse records; the swap-block reference bitmap; both commitment rules (§4); safe replacement (revalidate, unmap, shootdown, futex revoke, free); the mechanical no-I/O fallback; invalidation on a server's end. No policy, filesystem or crypto |
| Memory service (new, signed row, `reclaimer` role) | Watermarks and its declared reserve `M`; reclaim selection over file and anonymous pages (§8 P4); swap-out and swap-in; swap-block placement, AEAD, key and records; pressure figures |
| File servers (pagers) | File identity, permissions, contents, `C`, dirty caps, writeback order and I/O, durability. One paged object per open, mapped or dirty mutable file is the only file-page cache |
| Storage driver | The swap session's I/O. diskserver only opens and reopens the session [C, `lib/blockring/src/lib.rs:31-34`] |
| Supervisor | Signed roles as spawn attributes (pager, reclaimer, resident); floors; restart; the end state of swap (§3) |
| Compositor | Wholly resident; its overlay thread never touches client memory (§5) |

Deleted on the way [C]: the file server's data cache (`system/fileserver/src/cache.rs`) at W2, and the kernel's
`file_cache.rs` behind kernel tmpfs at W3. No SDK cache.

## 2. Page lifecycle

```text
 file page: absent ─fault→ request ─mem_supply→ clean ─store/write→ dirty ─clean_begin→ cleaning ─clean_end→ clean
              ▲                                   │ dropped, no I/O (policy order, or the kernel's fallback)
              └───────────────────────────────────┘   truncate: mem_resize as memory §7.3
 anon page: committed ─touch→ resident ─clean_begin→ cleaning ─clean_end ok→ swapped(block, gen)
              ▲ discard/decommit/release from any state; a swapped entry clears its block bit │
              │                 ◀── kept: stored to or pinned since begin ──┘                  │
              └──────── resident ◀── mem_supply(block) from M ◀── fault records block in waiter ┘
```

- **One family of operations over a page location** (an object offset, or a private leaf): `clean_begin` and
  `clean_end` are memory §7.3's `mem_writeback_begin`/`end`, `mem_supply` and `mem_fail` generalised, with one
  host model. The ABI may split them by right (pager versus reclaimer). The begin/end contract, `kept` bitmap and
  range rules are §7.3's, unchanged.
- **File pages are never swapped.** Dirty ones are written to their file; clean ones are dropped. - **The memory format** (`/tmp`, no-DATA boots) has no store, so its files are not paged objects at all (N2). Each
  file's contents are one **resizable anonymous object** the file server creates and owns, charged as its `A`
  within the format's commitment cap; the server keeps names, sizes and permissions.
  - `MAP_SHARED` maps that object, so mappings and I/O share one copy. Faults on it are anonymous faults, routed
    to the memory service; no pager, no dirty admission, no `C`. Only the memory service ever cleans it.
  - `read()`/`write()` use `mem_read`/`mem_write` on the object. On a swapped page they take an entry in a
    *ticket table* the caller created and committed, record the request to the memory service there and answer
    `Pending(ticket)`, or `Busy` when the table is full. The table is the caller's own kernel object and reads ready
    (`OP_WATCH`) with an `available` notice once the page is supplied. The server parks the client, as with
    `Queued` tickets, so it never waits and nothing allocates.
  - Growth is `mem_resize` on the object, which commits the new pages (refusal: `NoSpace` at `write()`); shrinking
    frees frames and clears block bits, and ends waiters past the end.
  - The object carries a *served* mark set at creation. When its creating server ends, its teardown invalidates
    every mapping through the RAM-object reverse index, exactly as memory §7.6 does for paged objects: a later touch
    ends the mapper with "file server `<name>` ended; mapping of `<file>` is invalid", and no old mapping survives as
    a diverging view of the restarted server's empty `/tmp`.
  - This deletes the memory format's store and its paged-object path (Q8c).
- **Anonymous pages**: private memory, `mem_create` objects, and memory §6's private snapshots of mutable files
  (kept as decided, R10; a snapshot is the owner's anonymous memory).
  - `clean_begin` on a private page marks its leaf with a second software bit, `CLEANING`, write-protects, shoots
    down and clears dirty under the space lock. A store faults, re-dirties and clears `CLEANING`. A kernel copy
    takes its pin under the space lock [C, `user_ptr.rs:160-162`] and clears `CLEANING` there; a pinned page is
    never begun. So `CLEANING` still set at `clean_end` *is* "not dirtied or pinned since begin". Shared objects
    keep §7.3's per-page flag in their index.
  - `clean_end` replaces a still-`CLEANING` leaf with a non-present entry holding the block number and a
    generation (x86 P = 0 and AArch64 invalid descriptors leave the other bits to software [P]; the encoding keeps
    clear of physical-address bits below MAXPHYADDR, L1TF hygiene [E]). Then shootdown, futex revoke (memory
    §7.3's rule, kept), free.
  - A fault on a swapped entry records (block, gen) in its waiter and raises `requested`. `mem_supply` names
    (block, gen); a mismatch is refused, so a stale supply after reuse cannot install. v1 supplies only waiters:
    no read-ahead.
- **Releases** of a swapped entry clear its block bit, allocating nothing. A page removed while cleaning comes
  back clear in `kept` whatever the result, as truncation does in §7.3.

## 3. Correctness

- **Concurrent access.** One backing per mutable file (memory §7.2). Lock order object, then space.
- **No kernel lock across a wait, for all user memory (R3, stage 0).** Memory §7.4 rules 6–7 cover paged objects.
  Swap makes every anonymous page a possible wait, so every user copy faults in or swaps in its chunk before
  taking any kernel lock, then pins under a re-check; no pin is held across a wait. This closes
  `issues/a-user-copy-demand-pages-under-whatever-its-caller-holds.md` and
  `issues/a-pipes-lock-spans-a-user-copy-and-its-first-allocation.md`. **Futex:** the waiter's re-translation after
  it arms never waits; a swapped word returns as a spurious wake, and the user loop's re-read faults it in.
- **Size changes**: `mem_resize` as memory §7.3.
- **Dirty state during cleaning**: §2's marks; the host model and mutations of memory §8, for both locations.
- **Durability.** Only `fsync`/`fdatasync`/`msync(MS_SYNC)` promise it, from the file server. Swap needs no
  durability across boots, but **blockring retains every acknowledged write until a flush covers it** and reissues
  it after a driver loss [C, `lib/blockring/src/client.rs:10-19`]; a 2 MiB session holds 511 blocks
  [C, `arena.rs:27-30`]. So writes may hold at most 447 arena blocks and at most 48 of the 64
  ring entries (`DEPTH`), leaving the rest for swap-in reads, and
  the service **flushes when half of that is held by acknowledged writes** (≈ 0.9 MiB), keeping the ciphertext
  for reissue. A reissue sends identical bytes, so no nonce is reused. A driver reset then
  loses no swap. Cost: one device-wide flush per ≈ 0.9 MiB of swap-out, which also flushes DATA's cache; P5
  measures it (Q2).
- **Permissions.** Handle rights bound `max_prot` (memory §2). The reclaimer reads only pages it has begun.
- **File-server failure**: memory §7.6 unchanged.
- **Memory-service failure.** The kernel ends its begun cleanings as failed: pages stay resident and dirty. Its key,
  nonce high-water mark and block records live in one wired *state object* **owned by the kernel's backing
  object** (N1). The supervisor holds and endows only the backing handle, which grants no read. The restarted
  process, holding the `reclaimer` role, calls `backing_attach` and receives a mapped read-write handle to the state
  object; no other process can, and attach is refused while another live process holds it (a dying
  predecessor's mapping goes with its teardown). Its first request is a flush: a `Lost` answer means acknowledged, unflushed writes
  from before the crash may be gone, and those blocks then fail authentication on read, a diagnosed loss.
  Requests are level state and are reported again. **End state:** when
  the supervisor will not restart it (budget spent, or a stop), it drops the backing object, and the kernel fails
  every referenced block: a later touch ends that process with "swap data lost: memory service ended".
- **Swap I/O failure.** A failed write keeps the page (`kept`), and the service retires that block from `S`
  (§7). A failed or unauthenticated read becomes `mem_fail(block, cause)`. Never zeros.
- **Device gone.** When the driver answers `gone`, an established failure (memory §7.5), the service calls
  `mem_fail` over every referenced block in batched ranges, so their owners get a diagnosed end on touch instead of indefinite waits.
  Retirement of single blocks is what shrinks `S` otherwise; if the backing rule then fails, new commitments are
  refused until it holds, and existing ones stand.

## 4. Commitment accounting

Units are frames and #1057's superframes. **R** frames managed; **K** the kept superframes; **F_j** job *j*'s floor
(`memory.min`: the first `F_j` of its use guaranteed [P, cgroup v2]); **W_j** its resident charges (page tables,
heap charges, runs, wired ranges, resident-by-kind objects below, a pager's `C`, and a `resident` process's
everything); **A_j** its swappable commitment (committed private pages, swappable objects it created, private
snapshots); **S** swap blocks added and not retired; **M** the reclaimer reserve: frames for the in-flight
supplies the service declares, capped by the kernel (≤ one superframe [E], since the session's `DEPTH` is 64).

```text
 resident rule:  Σ_j max(F_j, W_j)        + K + M ≤ R
 backing rule:   Σ_j max(F_j, W_j + A_j)  + K + M ≤ R + S
```

- **Every increase of `W_j` checks both rules** (page-table build, heap charge, run, `vm_wire`, floor set, lend);
  an increase of `A_j` checks the backing rule (R4).
- **In #1057's terms** [C, `frames.rs:335-338`]: reserved, kept and floor-whole superframes stay whole and free and
  are never backing; unused floors are held as frames, as built. A floor also gives `memory.min`'s reclaim
  protection: a job is never reclaimed below `min(F_j, use_j)`.
- **Superframes under pressure (R5).** 4 KiB reclaim frees scattered frames. A run or a heap pool that needs a whole
  superframe the held-back ones cannot cover raises `superframe_wanted`; the service evacuates one superframe
  whose frames are all clean, swappable or free (the scan's reverse records find it) by drop and swap-out. This
  is eviction, never migration; compaction stays deferred (Q8). To make evacuable superframes common, unmovable
  4 KiB frames (page tables, resident and lent pages, kernel-written objects) are drawn from their own
  superframes, as #1057 already concentrates 4 KiB traffic. A request that can wait (a syscall, holding no lock) waits for it; if no superframe is evacuable it
  is refused, `ResourceExhausted`, and reported. Heap growth that cannot wait takes a kept superframe, and the
  next evacuation refills `K` before any ordinary waiter.
- **Resident by kind (R6), charged in `W`:** kernel-created objects the kernel writes from another context (inbox
  rings, TLS blocks, the clock page); any object lent to a device (`dma_map`, `create_for_device`): lending moves
  its charge from `A` to `W` and checks both rules; sealed immutable versions, in the shared-files account, until
  Q6.
- **Shared backing is charged once**: to the creator, or inside the pager's `C`. Mappers pay entries and tables.
  Clean file pages beyond `C` live in the slack, uncommitted.
- **Only reserved backing counts**; no ratio (unlike Linux mode 2 [P]).
- **Frames versus backing.** A promise becomes a backing unit and a frame is drawn at fault. Below the low
  watermark the service is woken; with no free frame, the fault first takes **memory §3's mechanical fallback,
  kept**: any clean, unpinned, unprotected slack page, preferring the service's latest candidates. Only if none
  exists does it wait for reclaim (R11). With `S = 0` no fault ever depends on the service.
- **Ledger**: #1057's `committed` splits into resident and swappable; `resident`, `swapped`, `refaults` and stall
  time join `SYS_ACCOUNT_INFO` (S9). A swapped page stays its job's charge; swap I/O CPU is the service's.

## 5. Bounded progress and what stays resident

**`resident` processes** (whole-process, from a signed row; images from objects the supervisor holds, never
through a file server; each row also states `restart-hold`, in superframes):
- the stop, input and restart path: the supervisor, the input servers, **usbd** (it carries HID), the compositor;
- the swap chain: the memory service, the storage driver, diskserver (session reopen).

**Held for restart, not a floor (N3).** When a resident process dies, its job keeps up to its row's
`restart-hold` superframes, kept **whole**, released only to that job's next start or when the supervisor closes
the service. The swap chain's restart draws 2 MiB runs (session regions, the NVMe DMA grant) and superframe heap
growth, so scattered frames would not guarantee it [C, `lib/blockserve/src/region.rs`, `system/nvme/src/nvme.rs:250`,
`frames.rs:22-33`]. While held, the hold counts as that job's `W_j` in both rules. While it runs the hold is zero: its live work charges ordinary capacity, with no floor eligibility, so
memory §5's rule (floors only from `system.toml`, none for a mixed service such as the compositor) is unchanged.
The hold is a new `system.toml` grant beside floors (Q8d).

**The compositor (R8)** is resident as a whole; a wired sub-path inside one shared heap cannot be enforced (memory
§5 rejected the same for floors). Client surfaces are the client's swappable memory, so the compositing loop may
wait on them; the stop overlay is drawn and presented by its own thread from compositor-owned memory, never
touching client memory or the compositing loop's locks. Cost: its whole commitment becomes unswappable (Q5).

**Wired ranges** (`vm_wire`): each file server's page-in and writeback working set (arena, format metadata cache,
executor, ticket table: memory §7.4 rule 3); realtime audio buffers and the realtime thread's stack, wired and
populated before realtime execution.

**Allocation-free swap I/O (R2, stage 0).** Today the session client allocates per request and per answer
[C, `system/diskserver/src/session.rs:191,204,215,324,329,337`, `lib/blockring/src/client.rs:279`] and the driver
side per in-flight entry [C, `lib/blockring/src/server.rs:96`, `lib/blockserve/src/sessions.rs:297`]. Required:
fixed tables sized by `DEPTH`; reads decrypted straight from the arena into the service's own buffer. The IOMMU
side already allocates nothing per I/O [C, regions lent at open, `kernel/src/pcidev/mod.rs:1482`; PRP lists in
the grant, `system/nvme/src/nvme.rs:84-89`]. Checked by a host test under `DEPTH` traffic with an allocator that
fails after warm-up.

**Why no cycle.** The chain is fault → memory service → driver → device, with diskserver only to reopen. Every link
is resident, so none takes a swap fault; none maps a paged object (memory §7.4 rule 1 extended to the reclaimer);
none waits on a file server, since swap is a raw partition. The swap path allocates nothing per I/O, and swap-in
draws only on `M`. Reclaim needs no free frame: drops are I/O-free and swap-out uses wired buffers. No kernel lock
is held across any wait (§3). File writeback's chain is unchanged. A file server's swappable part may wait on the
swap chain, which never waits on it. The service shares no userland lock with clients; its control port obeys
the receiver rule.

**Writeback and backpressure.** File dirty data stays bounded by `C − C_clean` and caps (memory §7.5); the service
raises `reclaim_pressure` on a pager, never waits on it. Anonymous reclaim runs from the low to the high watermark;
the free-frame wait is the backpressure. Waits on swap-in and frames join memory §7.8's table: advanced by
`mem_supply` or reclaim, failed only by `mem_fail` or the backing's drop, ended by kill, reported overdue with the
service's progress times. No automatic kill or suspension.

## 6. The swap area

- **Where.** A dedicated GPT partition of a new type, TOYOS-SWAP, on internal storage only, granted by type to the
  memory service. Removable media refused by name. A swap file is rejected: it puts filesystem allocation, moves
  and journaling in the swap path, as btrfs's swapfile rules show [P].
- **Sizing.** `S` adds directly to commitment capacity. It costs disk space held for good (resizing means
  repartitioning [E]) and 24 B per block resident, ≈ 0.6 % of `S` (16 GiB ≈ 96 MiB of RAM). A working set beyond
  RAM thrashes whatever `S` is (Denning [P]), and the product goal is inactive application memory. Default
  `S = clamp(RAM / 2, 4 GiB, 16 GiB)` [E], chosen at install (Q7). No partition ⇒ `S = 0`, logged by name.
- **Blocks.** One block is one 4 KiB page. The kernel holds the reference bitmap (committed when blocks are added);
  `backing_query` answers free runs; the service clusters a batch for sequential writes; the kernel refuses a
  `clean_end` naming a referenced block.
- **AEAD and nonces (R9).**
  - A fresh 256-bit boot key from the kernel RNG, kept only in the state object; no hibernation.
  - The nonce is a 64-bit counter. The service **advances the high-water mark in the state object before each
    seal**, so a restart resumes above every value used. Every new seal takes a new value; a reissue of
    acknowledged bytes is not a seal.
  - Epochs of 2^32 seals each use a subkey derived from the boot key and the epoch (HMAC, `toyos-crypto`'s
    `kdf.rs`). The counter maps to (epoch = c >> 32, sequence = c mod 2^32), and the service skips sequence
    2^32 − 1, because the crate refuses a GCM seal at `next ≥ u32::MAX` [C, `aead.rs:100`].
  - `toyos-crypto`'s `SealingKey` always starts at 0 [C, `aead.rs:36-112`]. It gains a constructor that takes the
    epoch's subkey and starts at a caller-supplied per-epoch sequence, documented as the caller's uniqueness contract, landed with its pin.
  - AES-256-GCM where the CPU has AES and carry-less multiply (x86-64 today), else ChaCha20-Poly1305; AArch64
    takes ChaCha today, since the crate has no AArch64 AES path [C, S8].
  - AAD is the block number. The record per block is (counter 8 B, tag 16 B), committed in the state object
    before `clean_end`; a moved, replayed or corrupted block fails authentication.
- **Metadata residency.** Records, bitmap, high-water mark and policy state are resident; nothing but page
  contents is read from disk.

## 7. Interfaces (generic)

- **Roles:** `reclaimer` (one process), `resident`; spawn attributes from signed rows, refused in both orders.
- `vm_wire(range)` / `vm_unwire`: populate and keep resident; checks both rules. libc `mlock`/`MAP_LOCKED`.
- `backing_add`, `backing_retire(block)`, `backing_query(cursor, out)` and `backing_attach` (each requires the
  `reclaimer` role, so the supervisor's handle cannot change `S`; attach returns the mapped state object); the backing owns the state object, and dropping it fails every referenced
  block.
- RAM objects gain `mem_resize`, and `mem_read`/`mem_write` on them answer `Pending(ticket)` or `Busy` for a swapped page,
  through a caller-created ticket-table object that raises `available` (§2's memory format; usable by any server holding client data).
- `mem_scan(filter, cursor, out[≤512])`: harvests and clears accessed bits in physical order, optionally per job
  or object. Each record: an opaque token, kind, job, accessed, dirty, pinned or resident, population epoch. On x86
  a cleared A bit may stay cached until invalidation [P, SDM]; P2's model decides on a batched flush.
- `mem_reclaim(tokens[≤512])`: revalidates; drops clean pages; begins cleaning dirty anonymous pages; skips pinned,
  resident, floor-protected and already-cleaning pages.
- `clean_begin`/`clean_end`, `mem_supply`, `mem_fail` over page locations (§2); `mem_set_watermarks`; level notices
  `below_low`, `frame_waiters`, `requested`, `superframe_wanted`; a pager gains `reclaim_pressure`.

The kernel keeps a reverse record per frame, laid out at boot beside the pins: a 29-bit owner index (space or
object) and a 35-bit page index in 8 B [E]. RAM objects gain memory §1's weak reverse index, which only paged
objects and apertures have today, so their pages can be found and swapped (Q8).

## 8. Staged plan

| Stage | Content | Validation | Touches |
|---|---|---|---|
| **S0-a** | User copies fault or swap in before any kernel lock, pin after, for all user memory; the futex rule (§3). **Owner: memory track (kernel)**; it is already a stage 7 prerequisite | **H**: chunk model. **Q**: pipe and futex sites; mutation copying under the pipe lock red. Closes the two issues | stage 7 prereq |
| **S0-b** | Allocation-free blockring session client and driver side (§5). **Owner: storage track (blockring, diskserver client library, blockserve)** | **H**: `DEPTH` traffic with an allocator failing after warm-up, red on any per-I/O allocation | B1's async client |
| P0 | Memory stage 7 and storage W2 as designed | memory §8, storage W2 | stage 7, W2 |
| P1 | Two rules in `frames.rs` on #1057; `vm_wire`; `resident` and `restart-hold` (whole superframes); resident by kind; unmovable frames in their own superframes; `S = 0` | **H**: both rules at every `W` and `A` increase, red when a table build skips the backing rule; superframe invariants under wire and lend; a hold kept whole, counted in both rules, released only to its job's restart. **Q**: `mmap_stress`; P1 reports each resident row's committed total | #1057, stage 5 |
| P2 | Reverse records and the RAM-object reverse index; `mem_scan`, `mem_reclaim` for clean pages; watermarks; the kept fallback; superframe evacuation; `reclaimer` role; service v0 (plain CLOCK) | **H**: revalidation, floor protection, revoke order (memory §8's mutations), an evacuation case, fallback with a stuck service. **Q**: page-cache-heavy run with controls usable | stage 8 (its kernel clock goes) |
| P3 | Swap: entries with generation, bitmap, `backing_*`, cleaning of anonymous locations, TOYOS-SWAP, the state object and `backing_attach`, AEAD with the crate constructor, flush cadence with the read reserve, the end state and device-gone failure; the memory format on resizable RAM objects with `Pending` I/O (storage W3) | **H**: `kept` exactness for private leaves (`CLEANING` and pin), stale-supply refusal, nonce oracle across retries, reissues and restarts (as storage B7's), red when the mark advances after the seal. **Q** (q35, `virt`, small `-m`): commit beyond RAM and verify contents; an injected read error and a flipped ciphertext bit each end only the owner; a driver reset loses nothing; service kill and restart keeps data; budget spent fails blocks by name; a `/tmp` file swapped out and read back with `read()` and through a mapping, the server never blocking; a truncate frees its blocks; killing the server ends a `/tmp` mapper that touches its mapping, with the invalid-mapping diagnostic | notices from P0; C3's probe ignores TOYOS-SWAP; storage W3 |
| P4 | Policy: CLOCK-Pro and generational on the same scan signals; file/anon balance by refault cost; write-ahead (a page kept clean in RAM with its block held) if refaults justify it (S5) | **H**: replay of recorded scan streams (a ToyOS self-build, SQLite, a large copy beside an interactive app, an idle desktop) and synthetic loops, scans and Zipf: refaults, scan cost, scan resistance. Lower refaults at equal cost wins, else the simpler. First question: whether physical order with population epochs keeps CLOCK-Pro's scan resistance | — |
| P5 | Metal (T14, AMD; `--metal-readback`) | swap throughput, flush cost on DATA, fault latency, stop-control latency under thrash, audio without underruns | bench layout |

Storage §3.5's "there is no swap" changes to: swapped secrets are encrypted under the boot key (S2; no extra wiring).

## 9. Questions for the owner

1. **The guarantee change as §0 states it**, including lost anonymous data ending a process and syscalls
   answering `EIO`. *Recommend accept.*
2. **Driver resets.** Flush every ≈ 0.9 MiB of swap-out so a reset loses nothing (costs flushes shared with DATA), or
   no retention, so a reset ends processes on touch. *Recommend flushing.*
3. **Memory-service restart.** Key and records survive in a state object owned by the kernel's backing object,
   readable only by a `reclaimer` that attaches; the supervisor holds no read right. When restarts stop, the
   backing drops and swapped data fails by name. *Recommend both.*
4. **`vm_wire` ambient with no per-app cap.** One app can wire almost all RAM and push the rest into thrash; it is
   refused only by the resident rule. *Recommend ambient*: it is how `mlock` and realtime audio work unchanged.
5. **Resident set**: supervisor, input servers, usbd, compositor wholly, and the swap chain. The cost is everything
   they *commit*, not what they touch: every thread's selected stack whole (8 MiB main, 2 MiB per std thread by
   default), heaps at their committed size, the compositor's scanout and overlay buffers. Unmeasured; P1 reports
   each row's committed total, and a row may select smaller stacks. *Recommend accept.*
6. **Mapped immutable app code becomes droppable** and is refetched from its file server, except resident
   programs' images. This gives up memory §7.6's "unaffected by the server's death". *Recommend accept.*
7. **Swap size** `clamp(RAM/2, 4, 16 GiB)`, and permission to repartition the benches. *Recommend that default.*
8. **Deviations from approved designs.** (a) Memory §3: anonymous memory may wait and be lost (Q1), RAM objects gain
   a reverse index, and the fallback is kept but ordered by policy. (b) Memory §2: the present-page write-fault
   re-check extends from paged writable mappings to every anonymous page being cleaned. (c) Storage §2.5 S4: a
   memory-format file is one resizable anonymous object, not a paged object over the format's store, so `/tmp`
   holds one copy; RAM objects gain `mem_resize` and `Pending` reads and writes (§2). When its server ends, its
   mappings are invalidated as memory §7.6 rules for paged objects, so `/tmp` mappings end like other file mappings. (d) Memory §5: resident rows
   gain a `restart-hold` grant in superframes, a hold kept whole across death for the restart only, with no floor eligibility, so
   the floor rule is unchanged. (e) Superframe evacuation is eviction only; compaction stays deferred. Memory §6's snapshot and §7.3's futex revoke are
   unchanged. *Recommend accept all five.* Separately, keying futexes by (space, address) and (object, offset)
   would delete revoke-on-departure everywhere; it is not proposed here and would be its own proposal.

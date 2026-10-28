# Pager and swap: combined plan, revision 1

For owner review; design only, nothing implemented. It builds on memory design revision 18 (§7 pager, stage 7;
§8 stage 8) and storage design revision 12 (§2.5, W2), and on #1057's per-job ledgers and floors. Labels:
**[P]** published, **[C]** read in code, **[E]** estimate or inference. Unlabelled text is this plan's proposal.
Provenance is in `notes.md`. Anything that enters the repository restates these decisions in its own words, with
no item numbers and no reference to private notes.

**The one change of guarantee.** Memory design §3 says no fault on committed memory does I/O or waits on a pager.
With swap that holds only for **resident** memory (wired ranges, floors, the kernel). A fault on swappable
committed memory is never refused and never invents contents, but it may wait for swap-in or for reclaim. This
is the owner's "commitment promises capacity, not speed".

## 1. Ownership

| Component | Owns |
|---|---|
| Kernel | Memory objects, mappings, protection; faults and their waits; accessed/dirty harvesting; the reverse record per frame; the slot-reference bitmap; both commitment rules (§4) and their refusals; safe replacement (revalidate, unmap, shootdown, futex revoke, free); invalidation on a server's end. No policy, no filesystem or crypto knowledge |
| Memory service (new userland program, signed row) | Commitment *policy* (watermarks, the overhead it declares); reclaim selection over file and anonymous pages (CLOCK-Pro or generational, §7); swap-out and swap-in; the swap area: slot placement, AEAD, key, slot records; pressure reports |
| File servers (pagers, memory §7) | File identity, permissions, contents, `C`, dirty caps, writeback order and I/O, durability, `fsync`. One paged object per open, mapped or dirty mutable file is the only file-page cache |
| diskserver + storage driver | The swap partition's session and its I/O, as for any partition. No swap knowledge |
| Supervisor | Signed roles as spawn attributes (pager, reclaimer, resident); floors from `system.toml`; restart policy; the controls' data |
| Compositor | A wired emergency path (overlay, input routing, its thread); ordinary rendering is swappable |

**Deleted on the way** [C]: the file server's block cache for file data (`system/fileserver/src/cache.rs`,
64 MiB clean / 32 MiB dirty) at W2, and the kernel's `file_cache.rs` behind kernel tmpfs at W3. No SDK cache is
built (item 82's direction).

## 2. Page lifecycle

```text
 file page:  absent ─fault/read→ request ─mem_supply→ clean ─store/write→ dirty(slot) ─wb_begin→ under-wb
               ▲                                ▲  │drop (no I/O)            ▲ re-dirty: kept │wb_end ok
               └──── reclaim (clean, unpinned) ─┘  └─────────────── clean ◀──────────────────┘
             truncate (mem_resize): unmap, shootdown, revoke, free, release slot, wake waiters
 anon page:  committed ─touch→ resident ─reclaim_begin→ swapping-out ─swap_end ok→ swapped(slot)
               ▲ discard/decommit/release from any state; a swapped slot's bit clears, no I/O │
               │            ◀── kept (stored or pinned in the window) ──┘                     │
               └──────── resident ◀─ swap_supply (frame from the reclaimer reserve) ◀─ fault: request
```

- **File pages** follow memory §7.3–7.5 unchanged: faults record requests in their waiters, level notices,
  `mem_supply`, write-fault dirty tracking under the object lock, two-stage admission, writeback begin/end with
  the `kept` bitmap, `mem_resize`. File pages are **never swapped**: dirty ones are written back to their file;
  clean ones are dropped. A `MAP_PRIVATE` copy of a file page is anonymous.
- **Anonymous pages** (private memory, `mem_create` objects, private copies) gain three states:
  - **swapping-out**: `mem_reclaim` write-protects the page, shoots down and clears dirty, all under the space
    lock (private) or the object lock (shared); the service reads it with `mem_swap_read`. A store in the window
    takes the write fault, re-dirties and proceeds, exactly as during file writeback (Fuchsia RFC 0226's
    writeback begin/end has the same shape [P]);
  - **swapped(slot)**: `mem_swap_end` replaces the leaf with a non-present leaf carrying the slot (x86: P=0
    leaves the other bits to software; AArch64: an invalid descriptor's other bits are ignored [P]), or sets the
    object's index entry. Then shootdown, futex revoke, free;
  - **swap-in**: a fault on a swapped leaf records the slot in its waiter and raises `requested` on the service.
    `mem_swap_supply(slot, src, keep_slot)` installs a frame and wakes. With `keep_slot` the page is installed
    read-only so its first store frees the slot (a clean swap-cached page, droppable without I/O).
- **Truncate's analogue** for anonymous memory is `vm_discard`/`vm_decommit`/`vm_release`: a swapped leaf just
  clears its slot bit; a page removed while swapping-out comes back clear in `kept` whatever the result, as
  truncation does in memory §7.3.

## 3. Correctness (item 82's list, plus swap)

- **Concurrent access.** One backing per mutable file; `read`, `write` and `MAP_SHARED` share its frames (memory
  §7.2). Lock order stays object, then space; no kernel lock is held across any pager, swap or frame wait
  (memory §7.4 rule 6). Every install re-checks a generation.
- **Size changes.** `mem_resize` as memory §7.3: pages past the end unmapped, freed, slots released, waiters woken
  to re-check; a load past the end ends the process with "access past end of mapped file". Growth leaves pages
  absent. The server serializes resize against its own page-in.
- **Dirty tracking during writeback or swap-out.** Begin holds the object (or space) lock from write-protect
  through dirty clear; a store's mark and leaf upgrade are one hold of that lock; a kernel copy's write pin keeps
  the page dirty. `kept` reports exactly the pages still dirty, so newer state is never marked clean or freed.
  Same host model, same mutations as memory §8, applied to both kinds.
- **Durability.** Only `fsync`/`fdatasync`/`msync(MS_SYNC)` promise it, from the file server (storage §2.5).
  Swap promises none and needs none: no flush is issued for swap, since a read returns the last completed write
  whatever the device's volatile cache [P, NVMe]. Swap writes therefore never queue behind or force an `fsync`.
- **Permissions on mapping.** Handle rights bound `max_prot` (memory §2); the file server decides rights at open.
  The memory service's role reads only pages it has put in swapping-out; it cannot map, write or read other memory.
- **File-server failure.** Memory §7.6 unchanged: invalidate, report, old descriptors answer `gone`.
- **Memory-service failure.** Its key and slot records live in one wired object that outlives the process: the
  supervisor holds a handle without `MAP`/`READ` and endows the restart with it (rights only narrow). Swap-outs
  without an end were never committed, so those pages stay resident; outstanding swap-in requests are level
  state and are reported again. If the object is gone (recommended against, §9 Q2), every swapped page is
  invalid and a touch ends its process with "swap data lost: memory service ended".
- **Swap I/O failure.** A failed write leaves the page resident (`kept`); the service retires that slot (it holds
  no reference) and retries another. A read that fails after the driver's own recovery, or fails authentication,
  becomes `mem_swap_fail(slot, cause)`: a later load or store ends that process naming the cause ("swap data
  lost: storage read failed" or "…authentication failed"); a syscall touching it answers `EIO`. **Never zeros.**
  A device that leaves withdraws its free slots (§4); referenced slots fail on touch.
- **Futex words.** A swapped frame leaves its owner, so its waits are revoked after unmap and shootdown, before
  the free (memory §7.3's rule). Reclaim skips frames with futex waiters, so an idle condvar page is not swapped
  only to be faulted back by its own revoke (§9 Q7).

## 4. Commitment accounting

Units are 4 KiB. **R** frames the allocator manages; **K** the kernel's kept superframes [C, `frames.rs`];
**F_j** job *j*'s floor (#1057, `memory.min`: the first `F_j` of the job's use is guaranteed [P, cgroup v2]);
**W_j** job *j*'s resident charges: page tables, kernel-heap charges, runs, wired ranges, and for a pager its `C`;
**A_j** its swappable commitment: committed private pages, objects it created, and the whole writable length of
each `MAP_PRIVATE` writable mapping (a potential private copy, as Linux charges private writable mappings [P]);
**S** slots the service has added (on a present partition, with their records committed); **M** the reclaimer
reserve, the frames swap-in and swap-out need free at once. The service's own metadata is its own `W`.

```text
 resident rule  (checked at a page-table build, heap charge, run, vm_wire, floor set):
     Σ_j max(F_j, W_j)        + K + M ≤ R
 backing rule   (checked at vm_reserve/vm_protect commit, mem_create, writable MAP_PRIVATE):
     Σ_j max(F_j, W_j + A_j)  + K + M ≤ R + S
```

- **Composition with #1057.** A floor reserves `F_j` of RAM whether used or not, as built (unused floor held as
  free frames). New with swap: a job's resident set is never reclaimed below `min(F_j, use_j)`, which is
  `memory.min`'s reclaim protection [P]. Floor jobs therefore never wait for reclaim inside their floor.
- **Shared backing is charged once**: to the object's creator, or inside the pager's `C`. Mappers pay entries and
  tables (in `W`). Read-only and `MAP_SHARED` mappings add no backing charge. Clean file pages beyond `C` live in
  the slack and are uncommitted. Which ones go is the service's choice, weighed against cold anonymous pages; the
  kernel's no-I/O fallback in a fault (memory §3) drops only from the service's latest candidate batch.
- **Only reserved backing counts.** No ratio, no compression, no future growth (unlike Linux mode 2's
  `RAM × ratio + swap` [P]). The service adds slots only after their records are committed, and withdraws only
  free slots. If a device loss leaves `Σ … > R + S`, the kernel records the deficit, refuses every new
  commitment, and existing commitments stand; faults then wait (reported overdue, §5), nothing is killed.
- **Ledger changes** to #1057's `Ledger` [C]: `committed` splits into resident and swappable; add `resident`,
  `swapped` and `refaults` counters to `SYS_ACCOUNT_INFO`. Job ownership is unchanged: a swapped page stays
  charged to its job; swap I/O CPU is the service's.
- **Frames versus backing.** Today a promise is a frame [C]. After this change a promise is a backing unit, and a
  frame is drawn at fault. A draw below the low watermark wakes the service; below `K + M` an ordinary fault
  waits, holding no lock, for reclaim. A resident charge that can wait (at its syscall, before any lock) waits the
  same way; heap growth that cannot wait draws on `K`, which reclaim refills before any ordinary waiter.

## 5. Bounded progress and what stays resident

**Resident by role** (a `resident` spawn attribute from a signed row wires the whole process; nothing else is
wired by default):
1. the kernel (never paged), `K` and `M`;
2. the memory service: code (boot payload or a sealed object never purged), stacks, heap, I/O buffers, its
   per-frame policy array and ghost table sized at start to `R` and `S`, the slot records;
3. the swap path: diskserver and the internal-storage driver, with blockring sessions and IOMMU mappings set up at
   connect, so an I/O allocates nothing [E: to verify per driver];
4. `keyholder`, and the DATA server's key pages, so no secret reaches swap even encrypted.

**Resident by range** (`vm_wire`, charged to the job under the resident rule):
5. each file server's page-in and writeback working set: arena, format metadata cache, executor, ticket table
   (memory §7.4 rule 3, now wired rather than merely committed); the rest of the server is swappable;
6. the compositor's emergency path; supervisor and input servers are covered by their floors;
7. realtime audio: buffers and the realtime thread's stack are wired and populated before realtime execution.

**Why no cycle.** The swap chain is fault → memory service → diskserver → driver → device. Every link is wholly
resident, so none takes a swap fault; none maps a paged object (memory §7.4 rule 1 extended to the reclaimer);
none waits on a file server or anything above it, since swap is a raw partition (the rule-2 DAG gains the
memory service just above diskserver). Reclaim needs no free frame to progress: drops are I/O-free, and
swap-out uses wired buffers; swap-in's frame comes from `M`. File writeback's chain is unchanged and needs no
free frame. A file server's swappable memory may wait on the swap chain, which never waits on it. The service
shares no userland lock with any client; its control port obeys the receiver rule. No kernel lock is held
across any of these waits.

**Writeback and backpressure.** File dirty data stays bounded by each pager's `C − C_clean` and per-object caps
(memory §7.5); the service raises a `reclaim_pressure` notice on a pager to ask for earlier writeback, never
waits on it. Anonymous reclaim starts at the low watermark and runs to the high one; the free-frame wait at the
minimum is the backpressure on allocating faults. The service may write cold pages ahead with `keep_slot`, so a
later reclaim is a drop.

**Exhaustion.** New commitments are refused (`ENOMEM`, `try_reserve` `Err`, failed thread spawn). A fault never
fails for capacity. Waits on swap-in and on frames join memory §7.8's table: advanced by `mem_swap_supply` or
reclaim, failed only by `mem_swap_fail` or the service's end, ended by kill; overdue waits are reported with the
service's progress times. Pressure (stall time, refaults, swap used per job) is readable by the supervisor and
the compositor's overlay. No automatic kill or suspension.

## 6. The swap area

- **Where.** A dedicated GPT partition of a new type, TOYOS-SWAP (new GUID beside `lib/gpt/src/guid.rs`'s
  ToyOS types [C]), on internal storage only, granted by type to the memory service. Swap on removable media is
  refused by name. A swap file is rejected: it puts filesystem allocation, copygc moves and journaling in the
  swap path; btrfs's own swapfile rules (no COW, no compression, one device, no snapshot while active) show the
  policy it drags in [P].
- **Sizing.** `S` adds directly to commitment capacity; its costs are disk space held for good (resizing means
  repartitioning DATA, which the engine does not shrink [E]) and resident records of about 20 B per slot,
  ≈ 0.5 % of `S` (16 GiB of swap ≈ 80 MiB of RAM). The product goal is inactive application memory, and a working
  set beyond RAM thrashes whatever `S` is (Denning [P]). Recommended default
  `S = clamp(RAM / 2, 4 GiB, 16 GiB)` [E], chosen at install; QEMU images get a small swap disk. No partition ⇒
  `S = 0`, logged by name.
- **Slots.** One slot is one 4 KiB page. The kernel holds the **reference bitmap** (1 bit per slot, committed when
  slots are added): a leaf or index entry referencing a slot sets it, and a free clears it with no allocation and
  no message. The service places slots (clustering a batch for sequential writes) from its view of the bitmap,
  and the kernel refuses an end that names a referenced slot (a bug fence). The service delivers or drops every
  read of a slot before it writes that slot again, so no stale supply can follow a reuse.
- **AEAD and nonces.** A fresh 256-bit key per boot from the kernel RNG, held only in the service's wired state
  object; no hibernation, so it is never stored. AES-256-GCM where the CPU has AES and carry-less multiply,
  else ChaCha20-Poly1305; both exist in `toyos-crypto` [C], selected per machine. Nonce = a 64-bit
  never-reused write counter in 96 bits [P, SP 800-38D's deterministic construction]; every write, a retry
  included, takes a new counter. AAD = slot index. The resident record per slot is (counter, tag), so a moved,
  replayed or corrupted block fails authentication. Decryption is into the service's own buffer, then
  `mem_swap_supply` copies (GCM's unauthenticated plaintext never sits in shared memory [C, `aead.rs`]).
- **Metadata residency.** Records, bitmap, policy arrays and ghost table are all resident; nothing about swap is
  read from disk except page contents.

## 7. Interfaces (generic; no filesystem or crypto in the kernel)

- **Roles (spawn attributes, signed rows, refused in both orders like the pager role):** `reclaimer` (one
  process); `resident` (whole-process wiring).
- **`vm_wire(range)` / `vm_unwire`**: populate now and keep resident; resident-rule charge; refusal `ENOMEM`.
  libc `mlock`/`MAP_LOCKED` map to it.
- **`backing_add(h, slots)` / `backing_withdraw(h, slots)`**: the reclaimer's backing object; adds or removes free
  slots from `S` and commits the bitmap.
- **`mem_scan(filter, cursor, out[≤512])`**: harvest and clear accessed bits for the next frames in physical
  order (optionally one job or object). Each record: frame token (frame, generation), kind, job, accessed, dirty,
  pinned or wired, population epoch. On x86 a cleared A bit may stay cached until invalidation [P, SDM]; the scan
  batches one shootdown per call or accepts the approximation (host model decides).
- **`mem_reclaim(tokens[≤512]) → results`**: revalidates each token; drops clean file and clean swap-cached pages;
  begins swap-out of dirty anonymous pages; skips pinned, wired, floor-protected, futex-waited and under-writeback
  pages.
- **`mem_swap_read(token, dst)`**, **`mem_swap_end(range, slots, result, kept)`**: as file writeback's contract.
- **`mem_swap_supply(slot, src, keep_slot)`**, **`mem_swap_fail(slot, len, cause)`**.
- **`mem_set_watermarks(min, low, high)`**; **notices** on the reclaimer through the existing level-notice
  mechanism (`below_low`, `frame_waiters`, `requested(slot)`); a pager gains `reclaim_pressure`.
- **`mem_pressure()`**: machine and per-job stall time, refaults, swap used; readable with the roster right.

The kernel keeps an 8-byte reverse record per frame (owner space or object, page index) [E], laid out at boot
beside the pins, so a token resolves without walking; the service keeps ≤ 8 B per frame of policy state [E].
Both are counted in the overhead.

## 8. Staged plan

| Stage | Content | Validation | Touches |
|---|---|---|---|
| P0 | Memory stage 7 and storage W2 as already designed (pager, notices, requests in waiters, begin/end, `kept`) | memory §8, storage W2 | stage 7, W2 |
| P1 | Two ledgers in `kernel/pure/frames.rs` on #1057; `vm_wire`; the `resident` attribute; `S = 0` | **H**: both rules under charge, free, pin, floor, wire; mutation: wired charged to the backing rule only. **Q**: `mmap_stress` unchanged | #1057, stage 5 |
| P2 | Reverse records, `mem_scan`, `mem_reclaim` for clean pages, watermarks, frame waits, `reclaimer` role; service v0 with plain CLOCK. Replaces stage 8's kernel clock | **H**: revalidation, floor protection, futex revoke order (memory §8's mutations). **Q**: a page-cache-heavy run reclaims, controls stay usable | stage 8 |
| P3 | Swap: swapped leaves, bitmap, `backing_*`, swap-out/in ops, TOYOS-SWAP partition, diskserver grant, AEAD, state object | **H**: slot reuse, nonce never reused across retries and restarts (oracle as storage B7's), `kept` exactness, tamper and replay refused. **Q** (q35, `virt`, small `-m`): commit `R + S/2`, touch all, verify contents; injected read error and a flipped ciphertext bit each end only the owner with the right diagnostic; service kill and restart keeps swapped data; device loss refuses new commitments | stage 7's notices; storage C3's probe ignores TOYOS-SWAP |
| P4 | Policy: CLOCK-Pro and generational (MGLRU-style) on the same `mem_scan` signals; file/anon balance by refault cost | **H**: replay recorded traces (P2's scan stream from a ToyOS self-build, SQLite, a large copy beside an interactive app, an idle desktop) and synthetic loops, scans and Zipf. Measure refaults, scan cost, scan resistance. Pick the lower refaults at equal cost, else the simpler | — |
| P5 | Metal | **M** (T14, AMD; prepared with `--metal-readback`): swap throughput, fault latency, stop-control latency under thrash, audio without underruns under pressure | bench layout (needs a partition) |

P1 and P2 can start beside P0; P3 needs P0's notice and request machinery. Bench layouts change (storage §7,
open with the owner): a TOYOS-SWAP partition needs the owner's permission to erase.

## 9. Risks and open questions (each with a recommendation)

1. **Q1, the guarantee change** (top of page). *Recommend accept*; resident memory and floors keep the old one.
2. **Q2, service restart.** Keep key and records in an object that outlives the process, versus losing all
   swapped data on a crash. *Recommend keep*; the object is wired, unmappable by its holder, and authenticated.
3. **Q3, `vm_wire` for ordinary apps.** *Recommend ambient*, charged under the resident rule, no per-app cap; it
   is how realtime audio and `mlock` work unchanged.
4. **Q4, swap size and placement.** *Recommend* `clamp(RAM/2, 4, 16 GiB)` [E], dedicated partition after the
   ToyOS area; bench repartitioning needs your permission.
5. **Q5, per-page tags** (≈ 0.5 % of `S` resident) versus clustered tags (smaller, coarser swap-out). *Recommend
   per-page* in v1.
6. **Q6, mapped immutable app images.** Memory design keeps them resident. Under swap that wastes RAM on cold
   code. *Recommend* clean, droppable pages refetched from their file server, except recovery and swap-path
   images; the cost is that an app whose dropped code page meets a dead file server ends on touch.
7. **Q7, futex-waited pages skipped by reclaim.** *Recommend skip*; the check rides the revoke's bucket walk.
8. **CLOCK-Pro over physical order.** CLOCK-Pro assumes a list in residency order [P]; the scan gives physical
   order plus a population epoch. Whether that keeps its scan resistance is P4's first question.
9. **Name clash.** `lib/swap` (`toyos-swap`) means replacing a running service's binary [C]. *Recommend renaming
   it* (to "replace") before swap lands.
10. **Storage design §3.5 says "there is no swap"** [C]; it changes to: key pages are wired (§5 item 4).
11. **Unmeasured** [E]: reverse-record and policy-array overhead (≈ 0.4 % of RAM), scan cost, shootdown cost of
    write-protecting at swap-out, AEAD throughput against NVMe rates, SSD wear from swap writes.

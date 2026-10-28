# Review r1: pager and swap combined plan, revision 1

Reviewed: `plan.md` r1 and `notes.md`, against memory design r18 (§3, §5–§8), storage design r12 (§2.5, §2.7,
§3.5), `requirements/architecture.md` §Memory, `main` at `eba9e8eac`, and #1057's `kernel/pure/frames.rs`
(`wt/mem-per-job`, `38f3c282b`). Read only; nothing run.

## Architectural assessment

The split is right and follows the owner: the kernel holds mechanics (leaves, the slot bitmap, both rules,
revalidation, safe replacement) and the memory service holds selection, placement, crypto and I/O. The kernel
learns no filesystem or crypto, and selection crosses the boundary in batches of 512, not per page. Keeping file
pages out of swap matches [owner requirement, private]. A raw partition is the right call: it keeps
filesystem policy off the swap chain.

The plan is not ready for the owner yet. Its two load-bearing claims fail against the code. The swap I/O path it
marks [E] does not work as described: `toyos-blockring` holds every acknowledged write's arena blocks until a
flush covers it, and the plan issues no flush. The plan also never extends memory §7.4's no-lock-across-a-wait
rules from paged objects to every anonymous page, although every user copy now becomes a possible swap wait. The
accounting is close to right but misses a check site and #1057's superframe structure. The crypto scheme has a
nonce-reuse hole on service restart in the crate it names. Several "resident" claims rest on floors, which
reserve memory but do not wire it.

## Required findings

**R1. plan.md §3 "Durability", §6: "no flush is issued for swap" contradicts the block protocol, and swap-out
stops after about 2 MiB.** `lib/blockring/src/client.rs:10-19` says "An acknowledged write is kept until a flush
covers it. Its arena blocks stay pinned". `system/diskserver/src/session.rs:72-76` answers `Unsent::ArenaFull`,
"a flush releases what acknowledged writes hold". The arena is one 2 MiB session less its 4 KiB ring page
(`sdk/toyos/src/transport/arena.rs:27-30`), so 511 blocks. Without flushes, the 512th swap write is refused
forever. The premise is also wrong for ToyOS: the protocol treats a driver reset as losing acknowledged,
unflushed writes (`lib/blockserve/src/sessions.rs:318-319` `losses += 1`; `lib/blockhold` "a disk that lost
writes it had reported complete"). The NVMe read-after-write fact holds only while the controller keeps its cache.
**Fix:** choose one and state it. (a) Swap flushes when the arena fills, keeping the ciphertext for reissue. Its
cost is one device-wide flush per 511 blocks, which also flushes DATA's cache; measure it in P5. (b) Add a
session mode with no retention, accepted for swap only. A reset then becomes "swap data lost" kills on touch, and
the owner should be told that a driver restart can end processes. (a) keeps the owner's "lost swap data is a
diagnosed failure" as a rare event. Remove the line saying swap never forces a flush.

**R2. §5 item 3: "an I/O allocates nothing [E: to verify per driver]" is false today, and the chain is
misdescribed.** [C] The client library allocates per request and per answer:
- `session.rs:191,204,215` `pending.insert` into a `BTreeMap`;
- `session.rs:329` a fresh `vec![0u8; len]` for every read's data;
- `session.rs:324,337` `collect()` into Vecs;
- `client.rs:279` an `attempts` `BTreeMap` entry.

The driver side pushes `inflight` (`lib/blockring/src/server.rs:96`) and collects in `sessions.rs:297`. In
steady state these are bounded by `DEPTH` = 64, but a `resident` process that must grow its heap needs a new
commitment under the resident rule. A refusal there aborts the swap path. The IOMMU half is fine: session regions
are lent once at open (`SYS_DEVICE_DMA_MAP`, `kernel/src/pcidev/mod.rs:1482`), and the NVMe PRP lists are
preallocated in the driver's grant (`system/nvme/src/nvme.rs:84-89`). So the IOMMU allocates nothing per I/O; the
userland code above it does.

diskserver is not on the per-I/O path: data moves between the client's region and the driver
(`lib/blockring/src/lib.rs:31-34`). diskserver is needed only to open or reopen a session.

**Fix:** state the chain as memory service, then driver, with diskserver for session reopen. Require a session
client with no per-I/O allocation (fixed tables sized by `DEPTH`, reads decrypted straight from the arena into the
service's private buffer). Make "a wholly resident process never grows its heap on the swap path" a checked
property: a host test of the client under `DEPTH` traffic, with an allocator that fails after warm-up.

**R3. §3 "Concurrent access", §5 "Why no cycle": "no kernel lock is held across any pager, swap or frame wait"
is not true of today's kernel, and the plan does not take on the work.** Memory §7.4 rules 6 and 7 cover only
paged objects. Today an anonymous page is always reachable without waiting, so copies run under kernel locks:
- `issues/a-pipes-lock-spans-a-user-copy-and-its-first-allocation.md`: the pipe's spinning lock spans the whole
  user copy, with preemption off.
- `issues/a-user-copy-demand-pages-under-whatever-its-caller-holds.md`: `translate_user` faults under
  `PROCESS_TABLE`, `process_data` and the space lock.

With swap, any `read`, `write`, IPC send or futex word on a swapped page waits for swap-in under such a lock, which
is a deadlock or a spinning stall. The futex path has a specific trap: the waiter arms on its bucket and then
re-translates (memory §7.3). That re-translation must never wait, so a swapped word there must return as
spurious. **Fix:** P3's prerequisites must name the work. Every user copy faults in or swaps in before taking any
kernel lock, and pins only after its pages are in. This is rule 7's chunking applied to all user memory, and it
closes both issues. Name the futex rule. Add the pipe and futex sites to P3's validation, with a mutation that
copies under the pipe lock.

**R4. §4: the backing rule is not checked where `W` grows.** `W_j` appears in both inequalities, but the resident
check sites (page-table build, heap charge, run, `vm_wire`, floor set) do not re-check the backing rule. With
`S = 0`, as in P1, a page-table build that passes the resident rule can push `Σ max(F, W+A) + K + M` above `R`. The
committed anonymous pages then no longer fit anywhere, and a fault waits forever with nothing to reclaim. **Fix:**
every increase of `W_j` checks both rules, and the P1 host model needs a mutation that drops the backing check at
a table build.

**R5. §4 "Frames versus backing" and §5: the frame-unit rules drop #1057's superframe structure, and reclaim
cannot refill it.** #1057's invariant is `promised + PER_SUPER × (reserved + kept) + floors.held ≤ free` with
`PER_SUPER × floors.whole ≤ floors.held` (`frames.rs:335-338`). The kernel heap grows by whole superframes
(`frames.rs:22-33`), and runs and device regions need whole 2 MiB superframes (`Region::create` →
`create_for_device(SESSION_BYTES)`). The plan says heap growth "draws on `K`, which reclaim refills". But 4 KiB
reclaim frees scattered frames, not whole superframes, and compaction is deferred. **Fix:** state the resident rule
in #1057's terms: the reserved, kept and floor-whole superframes stay whole and are never promised as backing. For
a later run or heap superframe, say how one is obtained under pressure. The cheapest answer is reclaim targeted at
one superframe's movable frames, which the physical-order scan and reverse records already allow. Otherwise
accept that a run request can be refused under swap pressure and say so. A host-model case belongs in P1 and P2.

**R6. §2, §4, §7: memory that must stay resident by kind is unclassified, so `A_j` "objects it created" makes it
swappable.**
- Kernel-created objects the kernel writes from another context: inbox rings, through a `DirectMap`
  (`kernel/src/inbox/mod.rs`, memory §7.4 rule 13), plus TLS blocks and the clock page.
- Any object lent to a device (`create_for_device`, `dma_map`): swapping a DMA target is corruption.
- Sealed immutable versions charged to the shared-files account. The plan does not place them in either rule.

Memory §1 also says committed RAM objects have no reverse index. Swapping `mem_create` objects needs a mapper
reverse index for every RAM object, which is a kernel addition the plan does not state. **Fix:** add a
resident-by-kind list charged in `W`, with refusal of `dma_map` on swappable objects (or lending makes the object
resident). Name the reverse index for RAM objects, and say where immutable versions are charged.

**R7. §5 "Resident by role/range": floors do not wire, so the stop and restart chain can wait on swap.** §4 gives
a floor only `memory.min` protection of `min(F_j, use_j)`. Yet §5 item 6 says the "supervisor and input servers
are covered by their floors". Once their use exceeds the floor, part of them is swappable:
- The supervisor restarts the memory service, diskserver and the driver, and runs the kill. A swap fault there
  while the swap chain is down is a cycle.
- `usbd` has no floor in #1057, so USB keyboard and mouse input can stall under thrash, which breaks R-21's
  usable controls.
- Restarting a swap-chain component needs a spawn under the resident rule. That spawn can be refused
  (`issues/a-service-refused-its-restart-for-memory-stays-down.md`), leaving every swap-in waiting indefinitely.
- When the supervisor stops restarting the memory service (budget spent), swapped data neither returns nor is
  declared lost.

**Fix:** make every process on the stop, input and restart path `resident`: the supervisor, the input servers
including usbd's HID path, the memory service, diskserver and the storage driver. Keep their resident charge
reserved across death, as a floor equal to it, so a restart is never refused. Images come from objects the
supervisor holds, never through a file server. Define the end state: when the memory service will not be
restarted, dropping its backing object fails every referenced slot ("swap data lost: memory service ended").

**R8. §1 Compositor and §5 item 6: a "wired emergency path" inside a process with one shared heap is not
enforceable, and compositing reads client memory that can be swapped.** Memory §5 rejected a per-thread control
mode because "a shared heap would pass floor memory to ordinary threads". Wiring a code path has the same
problem, since any allocator or `FrameRx` touch can land on a swapped page. The compositor also maps
client-created surface objects (`system/compositor/src/client.rs:137-140` `CopyRegion(SharedMemory)`), which are
the client's `A`. The compositing loop therefore takes swap waits on client pages, which is what memory §7.4
rule 4 exists to prevent. **Fix:** either make the compositor `resident` as a whole, with client surfaces read
only off the overlay's thread so that the overlay presents without the compositing loop, or specify the
mechanism (separate allocator, wired ranges, no shared structures) and how it is checked. Whole-process residency
is simpler. The owner should see its RAM cost.

**R9. §6 AEAD: nonce reuse after a service restart, the crate's limits, and record width.**
- `toyos-crypto`'s `SealingKey` starts its sequence at 0 and cannot be set (`lib/crypto/src/aead.rs:36-112`). The
  key survives a restart in the state object (§3), so a restarted service building a `SealingKey` from it repeats
  every nonce. For GCM that exposes the GHASH key and allows forgeries; for ChaCha it reuses keystream.
- The same type refuses a GCM seal once `next ≥ u32::MAX` (`aead.rs:100`): 2^32 × 4 KiB = 16 TiB of writes per boot.
  The plan claims a 64-bit counter and does not say what happens at exhaustion.
- `notes.md` sizes the record at "16 B tag + ≥4 B counter ref". Authenticating a replay needs the slot's full
  64-bit counter, so 24 B/slot (≈ 0.6 % of `S`, 96 MiB for 16 GiB), not 20 B.
- The order of state updates is unspecified.

**Fix:** keep the counter's high-water mark in the wired state object and advance it there before every seal. Add
a seal-at-counter constructor or API to the crate with that contract, together with its pin. Specify exhaustion:
rekey for new writes with an epoch in the record, or refuse further swap-out by name. Commit a slot's
(counter, tag) record before `mem_swap_end`. Correct the overhead figures.

**R10. §2: `MAP_PRIVATE` semantics change without saying so.** Memory §6 (decided for stage 4) makes a private
mapping of a mutable file "a snapshot charged to its owner", read-only or writable. The plan says "A `MAP_PRIVATE`
copy of a file page is anonymous". It charges "the whole writable length … (a potential private copy, as Linux)"
and says read-only mappings add no backing charge. That is copy-on-write over the coherent object, a different
design. It conflicts with memory §7.5, where paged entries own their tables exclusively and table eviction
assumes no `OWNED` private leaves. It also conflicts with rule 1 (pagers) and rule 4 (recovery programs never
map paged objects). **Fix:** keep the snapshot, which is anonymous and swappable and so already fits, or list the
change as a deviation with the mechanism it needs.

**R11. §4 "fault's no-I/O fallback drops only from the service's latest candidate batch": anonymous faults depend
on the memory service even with `S = 0`.** Memory §3 lets an anonymous fault reclaim a clean slack page itself,
as bounded kernel work. The plan makes it wait whenever the batch is empty or stale, so a stuck service stalls
every allocating fault, with no swap involved. **Fix:** keep the mechanical fallback (any clean, unpinned,
unprotected page in the slack). Policy only orders candidates. List this as a change to memory §3/§8 stage 8.

**R12. Top of plan, §9 Q1: "the one change of guarantee" understates it.** The owner should be told plainly that:
- anonymous committed memory may wait on storage I/O in a load, a store **and any syscall that copies it**;
- anonymous memory **can now be lost** to storage failure, ending the process on touch, and syscalls touching it
  answer `EIO`, which no anonymous memory could do before;
- mapped immutable code becomes the same if Q6 is accepted;
- `mlock`/`vm_wire` is a new refusal;
- after a swap-device loss or a stopped memory service, faults can wait indefinitely, reported but never ended.

The quotation "commitment promises capacity, not speed" is not the owner's wording. `requirements/architecture.md`
says [owner requirement, private]; quote that.

**R13. §2–§3 use "slot" for two things.** It names the dirty-admission slot (memory §7.5; `kept` means "still
dirty and holds its slot") and the swap slot (§6). The diagram's `dirty(slot)`, §3's "slots released" on resize
and `mem_swap_end(range, slots, result, kept)` read either way. One concept needs another name before it reaches
the ABI. "Swap block" is one option.

**R14. §3 Futex / §9 Q7: skipping futex-waited pages contradicts memory §7.3, and those pages are outside both
rules.** Memory §7.3 says reclaim "does not inspect futex waiters; it revokes like every other departure". A
skipped page is counted in `A` (swappable) but cannot leave RAM. Its count is bounded only by parked threads, and
the resident rule reserves nothing for it, so reclaim can run short of frames that the backing rule promised.
**Fix:** keep memory's revoke rule, whose cost is one spurious wake and one refault for an idle condvar page.
Alternatively, the simplification worth a separate proposal: key futexes by (space, address) for private memory
and (object, offset) for shared memory. A key that is not a frame survives reclaim and swap, which deletes revoke
on departure from reclaim, truncation and invalidation altogether. That crosses into the built futex code, so it
is the owner's decision if pursued.

**R15. Memory format and "one authoritative set of file pages".** Storage §2.5 S4 makes a memory-format file's
writeback target "the format's committed store", that is, file-server anonymous memory, so `/tmp` and no-DATA
boots hold a page twice while it is resident and stored. Under this plan the store is swappable, so a dirty
`/tmp` page is copied into the store and then swapped from there. That is two copies, one extra memcpy per
writeback, and pages charged in both `C` and `A`. **Fix:** say it explicitly. Either the memory format's paged
objects are backed by swap directly, with the server as pager of an object whose dirty pages the memory service
may swap (one copy, no store), or record the duplication as a known cost against the owner's direction.

**R16. Interface gaps (§7).**
- The service "places slots … from its view of the bitmap" but has no call to read which slots are free.
- `mem_swap_supply(slot,…)` installs only into waiters' records, so read-ahead and prefetch are impossible. That
  is fine for v1, but say so.
- Retired slots after a failed write (§3) must be withdrawn from `S`, or `S` overstates capacity. Only device loss
  is mentioned.
- Kernel cleanup of begun swap-outs at the service's death is unstated. They must end as failed, with pages left
  dirty and resident.
- §7's private dirty tracking needs the present-page write-fault re-check for **all** anonymous writable memory,
  for swapping-out pages and for `keep_slot` read-only installs. Memory §2 confines it to paged writable mappings,
  so this is a scope change.
- A kernel write copy into a swapping-out page must keep it, by "pinned since begin" per page, as §7.3 does for
  write pins. Where that flag lives for an `OWNED` leaf is unspecified.

## Suggestions

- **S1. One op family, not two.** `mem_swap_read/end/supply/fail` restate `mem_writeback_begin/end`,
  `mem_supply` and `mem_fail` ("as file writeback's contract"). One kernel implementation over a page location
  (object offset or private leaf), with one host model, halves the mutations to keep. The ABI can stay split if
  rights differ.
- **S2. Drop §5 item 4 (wiring keyholder's and DATA's key pages) or justify it.** Swap is encrypted under a
  boot-lifetime key that never leaves RAM, so a secret in swap is as protected as in RAM. If a threat remains, the
  passphrase also crosses the compositor's unlock surface and the input servers, which item 4 does not cover.
- **S3. Simplify device loss.** Swap lives on the internal device that holds DATA, so losing it is already fatal
  to the session. The "deficit" machinery serves one degenerate case; retired-slot withdrawal (R16) is the case
  that matters.
- **S4. Put a generation in the swapped leaf.** Bits are spare beyond a 32-bit slot. Fence `mem_swap_supply`
  against it, as the plan already fences `end` on referenced slots. That catches a stale supply after slot reuse,
  which otherwise relies only on the service's ordering. Keep the slot encoding clear of physical-address bits
  below MAXPHYADDR as cheap L1TF hygiene [inference; 2020+ parts are reported unaffected, to check against Intel's
  advisory].
- **S5. Defer `keep_slot` write-ahead to P4.** It adds a read-only install and slot-release-on-store path, which is
  an optimisation P4 can justify by refaults.
- **S6. Make `mem_scan` tokens opaque.** Physical frame numbers are not needed by the service.
- **S7.** The 8 B reverse record cannot hold an owner and a private page index of up to 2^35 without packing an
  owner ID into 29 bits. Say how, or re-estimate.
- **S8.** `toyos-crypto` has no AArch64 AES/PMULL path (`lib/crypto/src/arch/aarch64.rs` has SHA only), so
  AArch64 always selects ChaCha20-Poly1305 today. That is fine; state it next to P5's throughput question.
- **S9.** Fold `mem_pressure`'s per-job figures into `SYS_ACCOUNT_INFO`, which §4 already extends, rather than
  adding a second query.
- **S10.** Size and owner of `M` (the service's maximum in-flight supply, capped by the kernel) are unstated.
- **S11.** Q5 (per-page versus clustered tags), Q7, Q9 (rename `lib/swap`) and item 10 are implementation
  choices. Remove them from the owner's list.

## Deviations from the owner's direction

1. "Keep the kernel generic": met, except Q7's futex skip, which puts selection policy in `mem_reclaim` (R14).
2. "One authoritative set of file pages": the memory format holds a second copy (R15).
3. "Bounded resident resources and no dependency cycles": not established (R1, R2, R3, R5, R7, R8).
4. "Background reclaim": met, but the plan adds a new dependency of every fault on the service (R11).
5. "Correct nonces": broken across restart with the named crate (R9).
6. "Preserve Rust and libc contracts": the `MAP_PRIVATE` semantics change is unflagged (R10).
7. Approved designs it changes without listing: memory §3's in-fault reclaim (R11); §6 snapshot (R10); §7.3 futex
   rule (R14); §7.6 immutable-version independence (Q6, flagged); storage §3.5 "no swap" (flagged).

The deferrals (compression, deduplication, compaction, multiple algorithms) are respected, though R5 may force a
narrow, targeted form of superframe reclaim. No automatic killing is respected. CLOCK-Pro is compared with
generational aging in P4.

## Verdict

**REVISE.**

## Questions the owner must decide (after revision)

1. Accept the guarantee change as fully stated in R12, including anonymous data loss ending a process and
   syscalls answering `EIO`.
2. A driver reset that loses unflushed swap writes: pay periodic flushes, so swap survives resets (recommended),
   or accept kills on touch (R1).
3. Memory-service restart: keep the key and records in a surviving object (Q2), and what ends swapped data when
   restarts stop (R7).
4. `mlock`/`vm_wire` ambient with no cap (Q3). The consequence to state: one app can wire almost all RAM and push
   everything else into thrash.
5. Compositor wholly resident versus a wired sub-path, with the RAM cost (R8).
6. Q6: mapped immutable app code becomes droppable, giving up memory §7.6's "unaffected by the server's death".
7. Swap size default and permission to repartition the benches (Q4).
8. If proposed: re-keying futexes off frames (R14).

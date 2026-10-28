# Working notes: pager and swap plan r1

## Read
- Root `CLAUDE.md`, `kernel/CLAUDE.md`.
- `agents/memory/memory-design.md` (revision 18; r17 differs only in §7.3 begin's lock hold and the range
  contract) and `handoff.md`. Relevant: §3 ("no fault on committed memory does I/O or waits on a pager" — the
  guarantee swap changes), §5 floors, §7.2–7.8 pager, §8 stages 7–8.
- `agents/storage/design-r12.md` §0, §1, §2.1, §2.4–2.7, §3.5 (says "There is no swap"; master key only in
  committed memory), §4.3, §5 (B1–B8, C1–C3, W1–W3), §7 bench layouts (open with owner, erase needs permission).
- `requirements/architecture.md:64-100` (Memory section already carries swap: encrypted, authenticated,
  boot-lifetime keys, preallocated internal storage, commitment = usable RAM + reserved swap, refault feedback,
  no automatic suspension or kill); `requirements/product.md:159`; `requirements/open.md:14`.

## Code facts [C]
- Stages 1–3 and #1045 (refusable kernel-heap charges, `kernel/src/mm/charge.rs`) are on `main`; the memory
  design's "#1010 held on item 52" is stale.
- `kernel/pure/frames.rs` on `wt/mem-per-job` (#1057, open): `Ledger` per job (floor, committed, tables, runs,
  heap, own, entitled, wanted, refusals, peak); invariant at line 335: promised + held-back ≤ free. A promise is a
  frame today. Floors from `memory-floor-mib` (`images/system.toml`: supervisor 96, ps2server 24). PR body: floor =
  `memory.min` contract; compositor no floor; usbd no floor.
- `kernel/src/mm/space.rs:683` `fault`; private frames only in OWNED leaves; `kernel/pure/vm.rs:29` `around`
  populates a 64 KiB run.
- `kernel/src/arch/x86_64/paging.rs:31` defines `PAGE_ACCESSED`; nothing harvests accessed bits today.
- `kernel/src/file_cache.rs` serves kernel tmpfs/vfs (`tmpfs.rs`, `vfs.rs`, `object/file.rs`): a second file-data
  cache, to go with W3 / the tmpfs migration.
- `system/fileserver/src/cache.rs:48,51`: `CLEAN_LIMIT` 16 Ki blocks (64 MiB), `DIRTY_LIMIT` 8 Ki (32 MiB); W2
  deletes the data part.
- `lib/gpt/src/guid.rs`: TOYOS_ROOT, TOYOS_DATA, TOYOS_SLOTS, TOYOS_BOOT; no swap type.
- `lib/crypto/src/{aead,gcm,chacha,poly1305,aes}.rs` + `arch/x86_64`: AES-GCM with a CLMUL path and
  ChaCha20-Poly1305; `aead.rs` header: GCM's buffer holds unauthenticated plaintext during open, must not be
  memory another process maps.
- `lib/swap` = `toyos-swap`: replacing a running service's binary. Name clash.
- No paged objects, no reverse records, no swap code exist.

## Published references [P] (design references only)
- Linux `Documentation/mm/overcommit-accounting.rst`: mode 2 CommitLimit = swap + RAM × ratio (or kbytes);
  private writable mappings charged, shared/read-only not. ToyOS differs: no ratio, only reserved backing.
- cgroup v2 `memory.min`: hard protection; usage within the effective min is not reclaimed.
- Fuchsia RFC 0226 (Zircon pager writeback): dirty tracking on pager-backed VMOs, writeback begin/end so a write
  during writeback re-dirties, dirty-range query. Memory §7.3 already mirrors it.
- CLOCK-Pro (Jiang, Chen, Zhang, USENIX ATC 2005): hot/cold with test period, three clock hands over one circular
  list, non-resident test entries, adaptive cold allocation; approximates LIRS.
- Linux multigen LRU docs: generations, page-table walks for accessed bits, refault-feedback (PID) between tiers
  and file/anon, `min_ttl` against thrashing.
- btrfs swapfile docs: nodatacow, no compression, single device, no snapshot of the subvolume while active,
  preallocated. Evidence for "a swap file drags in filesystem policy".
- Denning, working set model (1968): thrashing when working sets exceed memory; supports modest swap and
  pressure reporting.
- Intel SDM vol. 3 ch. 4: P = 0 leaves other bits for software; a cleared A bit may not be set again until the
  cached translation is invalidated. Arm ARM: invalid descriptor bits [63:1] ignored.
- NVMe base spec: reads return completed writes regardless of volatile write cache; Flush is for durability.
- NIST SP 800-38D: deterministic (counter) IV construction, unique per key.

## Estimates [E] and arithmetic
- Slot records: 16 B tag + ≥4 B counter ref ≈ 20 B/slot; 16 GiB swap = 4 Mi slots ≈ 80 MiB (0.5 %).
- Reverse record 8 B/frame + policy 8 B/frame on 16 GiB RAM ≈ 32 + 32 MiB (0.4 %).
- Swap size default clamp(RAM/2, 4, 16 GiB): judgement from product goal (inactive app memory) and Denning.

## Decisions taken in the plan (proposals)
- File pages never go to swap; anonymous pages (incl. private COW of file pages and memory-format /tmp data,
  which is file-server anonymous memory) do.
- Kernel owns slot-reference bitmap (free paths may not allocate or message); service owns placement, crypto,
  I/O. Kernel refuses an end naming a referenced slot (bug fence).
- Selection in the service over batched `mem_scan` records; kernel only revalidates and executes.
- Floors gain memory.min's reclaim protection; resident and backing rules (plan §4).
- Service state (key, records) in a wired object surviving restart; recommendation, owner Q2.
- Pages with futex waiters skipped by reclaim (Q7) — differs from memory §7.3's "reclaim does not inspect futex
  waiters" for file pages.

## Not checked
- Whether diskserver/nvme/IOMMU paths allocate per I/O (plan §5 item 3 marks it [E]).
- AArch64 accessed-flag hardware management availability (memory §7.5 already flags `FEAT_HAFDBS`/`FEAT_HAFT`).
- Machine RAM sizes of T14 and AMD benches.

## Revision 2: review r1 answered

Spot-checked before revising [C]: `lib/blockring/src/client.rs:10-19` (acknowledged writes retained until a
flush), `sdk/toyos/src/transport/arena.rs:27-30` (2 MiB region, 4 KiB header), `lib/crypto/src/aead.rs:36-112`
(`SealingKey.next` starts at 0; GCM refused at `next ≥ u32::MAX`), `lib/crypto/src/arch/aarch64.rs` (SHA only),
both issue files exist. Other review citations taken as given.

| Finding | Where answered in plan r2 |
|---|---|
| R1 flush/arena | §3 Durability: flush at half arena, ciphertext retained, reissue is identical bytes; Q2 |
| R2 per-I/O allocation | §5 + stage S0-b, owner storage track; chain corrected (diskserver only reopens) |
| R3 copies under locks | §3 + stage S0-a, owner memory track; futex re-translation returns spurious |
| R4 backing check at W growth | §4 first bullet; P1 mutation |
| R5 superframes | §4 "In #1057's terms" and "Superframes under pressure" (targeted evacuation, refusal otherwise) |
| R6 resident by kind, RAM-object reverse index, immutable versions | §4 resident-by-kind; §7 last para; Q8a |
| R7 floors don't wire; restart refusal; end state | §5 `resident` list incl. usbd, reserved across death; §3 end state; Q3, Q5 |
| R8 compositor | §5: wholly resident, overlay thread off client memory; Q5 |
| R9 nonce restart, GCM cap, record width, order | §6 AEAD bullets; record 24 B, 0.6 % |
| R10 MAP_PRIVATE | §2: memory §6 snapshot kept |
| R11 fallback | §4 Frames versus backing: memory §3 fallback kept |
| R12 guarantee | §0 with the owner's quotation; Q1 |
| R13 slot | swap "block" throughout; "slot" only for dirty admission |
| R14 futex skip | dropped; §7.3 revoke kept; re-keying named as a separate non-proposal in Q8 |
| R15 memory format | §2 exception, swap-backed paged objects; Q8c |
| R16 interface gaps | `backing_query`, no read-ahead in v1, `backing_retire`, cleanup at service death (§3), write-fault re-check scope (Q8b), `CLEANING` leaf bit as pinned/dirtied-since-begin (§2) |

Suggestions taken: S1 (one op family), S2 (no extra wiring of key pages), S3 (no device-loss machinery), S4
(generation in entry, L1TF hygiene), S5 (write-ahead deferred to P4), S6 (opaque tokens), S7 (29+35-bit packing),
S8 (AArch64 ChaCha), S9 (ACCOUNT_INFO), S10 (`M` ≤ one superframe, service-declared, kernel-capped), S11 (owner
list trimmed to 8).

Arithmetic: 16 GiB / 4 KiB = 4 Mi blocks × 24 B = 96 MiB. Half arena = 255 blocks ≈ 1 MiB.

## Revision 3: review r2 answered

| Finding | Answer in plan r3 |
|---|---|
| N1 state object unreadable after restart | §3: the backing object owns the state object; `backing_attach` (reclaimer role) returns it mapped; supervisor holds only the backing handle. §7, Q3 |
| N2 swap-backed memory-format objects | Chose the simpler design on merit: memory-format files are resizable anonymous RAM objects owned by the file server (not by the memory service, so charges follow the server/session as storage S4 and W3 say). No paged-object kind, no admission or `C`, faults are anonymous and route to the reclaimer, only the reclaimer cleans, `mem_resize` frees blocks, `mem_read`/`mem_write` answer `Pending` with an `available` notice so the server never waits. One copy. §2, §7, P3, Q8c |
| N3 floor equal to resident charge | §5: `restart-hold-mib` per resident row, held only while dead and only for that job's restart, no floor eligibility; floor rule unchanged; Q8d. Q5 restated as committed cost, stacks whole |
| S-a | §3: 64 arena blocks kept for reads (writes ≤ 447, flush at half); first request after restart is a flush, `Lost` ⇒ diagnosed auth failures |
| S-b | §6: epoch = c >> 32, sequence = c mod 2^32, sequence 2^32 − 1 skipped; constructor takes subkey + per-epoch sequence |
| S-c | §4: unmovable 4 KiB frames in their own superframes; evacuation is eviction (Q8e) |
| S-d | §3: device `gone` ⇒ `mem_fail` every referenced block |

## Revision 4: review r3 answered
- N2-a: §2 *served* mark; creator's teardown invalidates mappings via the RAM-object reverse index (memory §7.6); Q8c.
- N3-a/b: §5 hold in whole superframes (`restart-hold`), counted as `W_j` in both rules while held.
- N1-a/b, N2-b/c, ring cap (48 of 64 entries), batched `mem_fail`: §2, §3, §7 wording.

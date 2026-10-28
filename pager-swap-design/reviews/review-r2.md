# Review r2: pager and swap combined plan, revision 2

Checked `plan.md` r2 against review r1, `notes.md`'s map, memory design r18 §1, §5, §7.2–7.6, storage r12 §2.5,
and the code cited in r1 (`main` `eba9e8eac`, #1057 `38f3c282b`). Read only.

## Assessment

R2 makes real progress:
- the guarantee section (§0) is now honest and quotes the owner correctly;
- swap I/O follows the block protocol;
- the two stage-0 prerequisites have owners and red checks;
- the accounting checks both rules at every `W` increase, in #1057's superframe terms;
- the MAP_PRIVATE snapshot and futex revoke are restored as approved;
- the owner list is focused.

R1, R2, R3, R4, R6, R9, R10, R11, R12, R13, R14 and R16 are resolved. R5 is resolved with one suggestion
(S-c). R1's retention and R9's mark and epochs introduce no defect, apart from a boundary note (S-b).

Three new defects remain. Each sits where r2 answered an r1 finding with a new mechanism:
- the state object cannot be read by the restart it exists for (N1);
- R15's swap-backed memory-format objects leave the file server no way to read its own swapped data (N2);
- the `resident` attribute's "floor equal to it" contradicts memory §5's approved floor rule and understates the
  cost in Q5 (N3).

## r1 findings

| r1 | r2 | Verdict |
|---|---|---|
| R1 flush/arena | §3: flush at half the arena, ciphertext kept, a reissue sends identical bytes, so no nonce repeats; Q2 | Resolved (S-a) |
| R2 per-I/O allocation | §5 and S0-b, owner the storage track, with a red check; chain corrected | Resolved, stage-0 prerequisite with an owner |
| R3 copies under locks | §3 and S0-a, owner the memory track; futex re-translation returns spurious | Resolved, stage-0 prerequisite with an owner |
| R4 | §4 first bullet; P1 mutation | Resolved |
| R5 superframes | §4: targeted evacuation, refusal otherwise | Resolved (S-c) |
| R6 resident by kind | §4; RAM-object reverse index §7; Q8a | Resolved |
| R7 floors, restart, end state | §5 resident list incl. usbd; §3 end state | End state resolved; the mechanism adds N1 and N3 |
| R8 compositor | wholly resident; overlay thread off client memory | Resolved; cost and floor see N3 |
| R9 AEAD | mark before seal; epochs; constructor; 24 B record; record before `clean_end` | Resolved (S-b) |
| R10 | snapshot kept | Resolved |
| R11 | fallback kept; `S = 0` never depends on the service | Resolved |
| R12 | §0 | Resolved |
| R13 | "block" for swap; "slot" no longer appears in the plan | Resolved |
| R14 | skip dropped; revoke kept; re-keying not proposed | Resolved |
| R15 memory format | swap-backed paged objects | Mechanism incomplete: N2 |
| R16 | `backing_query`, no read-ahead, `backing_retire`, cleanup at death, Q8b, `CLEANING` | Resolved. `CLEANING` checked: the pin is taken under the space lock, a pinned page is never begun, and a store faults and clears it, so a set bit at `clean_end` is exact |

## Required findings

**N1. plan.md §3 "Memory-service failure": the restarted service cannot read its state object.** The supervisor
holds the state object "without `MAP`/`READ` and endows the restart with it (rights only narrow)". The restart then
receives a handle it can neither map nor read. It cannot recover the key, the high-water mark or the records, and
every swapped page becomes unreadable. Rights cannot be widened (root `CLAUDE.md`, "Authority is explicit"). This
was already present in r1 and is my miss. **Fix:** make the kernel's backing object own the state object. A
process holding the `reclaimer` role attaches to the backing (`backing_attach`) and receives a mapped handle. The
supervisor endows only the backing handle, which carries no right to read. The alternative is for the supervisor
to hold full rights, which puts the key within its authority; that alternative needs stating, not implying.

**N2. §2, Q8c: a swap-backed memory-format object has no read path for its own server.** The file server serves
`read()`/`write()` through `mem_read`/`mem_write`. These copy present pages only, "answer absent otherwise and never
wait" (memory §7.3). Normally an absent page is paged in from the format's store with `mem_supply`. A swap-backed
object has no store. A swapped `/tmp` page is therefore unreadable through `read()`, because only a fault (a
waiter) raises `requested` to the memory service, and a pager never faults on paged objects (rule 1).

The same design leaves four more points unspecified:
- whose `requested` notice a mapper's fault on a swapped page raises (the memory service's, not the pager's);
- that admission slots, `C − C_clean` and per-object caps do not apply to pages charged as `A`;
- that `mem_resize` releases blocks;
- that two parties now clean one object. The file server must never call writeback on it.

**Fix:** specify the object kind completely. `mem_read`/`mem_write` on a swapped page record a request to the
memory service and answer `Pending` with a notice when supplied. The pager parks the client, as with `Queued`
tickets, so the pager still never waits. Fault notices route to the reclaimer. Admission is bypassed. `mem_resize`
releases blocks. Only the reclaimer cleans. Q8c should name this new paged-object kind. Otherwise keep storage S4's
second copy for v1 and record it, which is the smaller design.

**N3. §5 "resident processes … kept reserved across death as a floor equal to it": three problems.**
- **It contradicts an approved decision.** Memory §1 says "the floor is set only from `system.toml`". Memory §5
  says "A mixed service gets no floor. The compositor, for example", because a floor's eligibility belongs to the
  whole account, so the compositor's client-driven growth would draw on protected capacity. #1057 gives the
  compositor and usbd no floor. Q8 does not list this change.
- **It is undefined for a growing process.** A floor "equal to" a charge that grows has no `system.toml` value.
- **Q5 states the cost unfairly.** It says "their full footprint". The resident rule charges commitment, so every
  thread's selected stack (8 MiB main, 2 MiB per std thread) counts whole, touched or not. The heap counts at its
  committed size.

**Fix:** separate "kept across death" from "floor". A dead resident process's charge stays held for its restart,
without floor eligibility for its live work, under a `system.toml` bound on the row. Otherwise list the floor
change to memory §5 as Q8d. State Q5's cost as the commitment held under the resident rule, and have P1 report the
committed, not the touched, total.

## Suggestions

- **S-a. Reserve arena blocks for reads.** With half the arena held for a flush and the rest filling with new
  writes, a swap-in read meets `ArenaFull` and waits for the flush. That is latency on the critical path, not a
  deadlock. Two further points: on restart, the service's first request should be a flush. A `Lost` answer then
  means unflushed writes from before the crash may be gone, and they surface as authentication failures on read,
  which is diagnosed. State it.
- **S-b. Pin the counter-to-(epoch, sequence) mapping to the crate's boundary.** `aead.rs:100` refuses a GCM seal
  at `next ≥ u32::MAX`, so one subkey takes 2^32 − 1 seals, not 2^32. The constructor takes the per-epoch
  sequence, not the 64-bit counter, or every epoch after the first is refused.
- **S-c. Segregate unmovable 4 KiB frames by superframe.** Page tables and resident frames mixed into swappable
  superframes make "a superframe whose frames are all clean, swappable or free" rare. Keeping unmovable 4 KiB
  allocations in their own superframes, as #1057 already concentrates 4 KiB traffic, makes evacuation likely. The
  owner deferred compaction; say in Q8 that evacuation is eviction, not migration, so the owner sees the boundary.
- **S-d.** When the device answers `gone`, the service should `mem_fail` every referenced block. That is an
  established failure (memory §7.5) and gives a diagnosed end instead of indefinite waits. §3 says device loss "is
  not special-cased" but does not say this.

## Owner questions

The eight are the right ones and mostly fair. Two changes:
- Q5's cost must be the commitment held, not the footprint (N3).
- Q8 must add the floor or retained-charge change to memory §5 (N3), and Q8c must name the new swap-backed object
  kind or fall back to the store (N2).

Q3's recommendation depends on N1 being fixed.

## Verdict

**REVISE.** N1–N3 are bounded edits to §3, §2/Q8c and §5/Q5/Q8. No other blocker remains.

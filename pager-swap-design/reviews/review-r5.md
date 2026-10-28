# Review r5: pager and swap plan, revision 5 — SEND BACK (8 required)

(Saved by the orchestrator from the reviewer's report; the reviewer ran nothing and read origin/main 717baf3ac.)

## Architectural assessment

The five evidence answers are mostly sound.

- **One recoverable copy (§3.1).** Holds in every state traced: crash of the memory service, diskserver or the driver, and a controller reset. A claim is taken at `clean_begin`, so a referenced block is never written. The frame is freed only after a flush answers `Durable`, and the blockring client only gives that answer after it has reissued every lost write (`lib/blockring/src/client.rs:10-19, 263-276`). If the service crashes, its cleanings fail and the page stays resident and dirty. Swap-in installs the new frame and frees the block in one hold of the space lock.
- **Nonces (§3.2).** No way found for a nonce to repeat under one key: the kernel's claim counter outlives the service, `seal_at` is monotone with gaps, a reissue sends identical bytes, a retry takes a new claim, a new backing gets a new key.
- **Restart reuse.** Holds against the code: `place` hears every hang-up and retires closing sessions before judging an open (`sessions.rs:112-116`); `retire` releases a hold only when nothing is in flight (`sessions.rs:298-313`); overlapping open refused `Held` (`sessions.rs:121`); NVMe driver clears `CC.EN` and waits for `CSTS.RDY`=0 before answering aborted commands (`system/nvme/src/main.rs:234-243`, `nvme.rs:644-657`); a new driver does the same in `enable` (`nvme.rs:327-333`). S0-b is a real prerequisite: today a reopen while the dead session still has commands in flight is refused `Held` and fails.
- **Resident faults (§4/§5).** W promise as held frame does what it claims for memory a resident process owns. But a resident process that maps a swappable object can still wait on swap — under option B the compositor — and the claim that its stop control keeps working rests on code that does not exist (R1).

Open architectural question: whether the new "swappable creation flag" is needed, given #1057's `SHM_FOR_JOB` (R2).

## Required

**R1. `plan.md:70` (§1), `:494` (option B), `:600` (Q3): there is no compositor overlay thread.**
- On main the compositor has one other thread, `launcher` (`system/compositor/src/signout.rs:71`). Its only overlay is the volume overlay, drawn by the main loop into the back buffer (`session.rs:1986,1993`, `render.rs:311`).
- Under B a fault on a cold window buffer stops everything the compositor draws and presents, including whatever the "stop control" is.
- r4 proposed the thread ("drawn and presented by its own thread from compositor-owned memory, never touching … the compositing loop's locks", plan-r4.md:183); r5 states it as fact and drops the lock condition. No stage builds it; no presentation path while the main loop is stalled mid-frame (own plane, or ownership of present). Q3 asks the owner to choose B on this premise.
- Fix: make the separate overlay thread a named prerequisite (owner, shares no lock with the compositing loop, presentation path), or withdraw the claim.

**R2. `plan.md:503`, `:510`: the swappable creation flag duplicates an existing mechanism.**
- #1057's `SHM_FOR_JOB` (`kernel/src/syscall/ipc.rs:340-351`) lets a creator charge an object to another job. If an object's residency followed the job it is charged to, no flag is needed: window buffers created `SHM_FOR_JOB` for the client become that client's `A`; the supervisor's per-program log rings fall out correctly (under the plan's rule every app's ring defaults to resident unless flagged, while §5:359 needs the memory service's own ring resident).
- `budget.rs:41-49` calls compositor-charged buffers "a mitigation" and names charging the client as the real fix. Creation stays with the compositor (#1076); who is charged is separate.
- Fix: add as an option in §7 and adopt it or name a use the charged-job rule cannot serve; the compositor track owns the charging change (dependency); Q3 shows the option.

**R3. `plan.md:279-280` and §0: overcommitment after retirement or device loss is a hidden guarantee change.**
- "new commitments are refused until it holds, and existing ones stand": if `S` shrinks (retired blocks) or reaches 0 (device gone), Σ max(F_j, W_j + A_j) can exceed R + S, and a committed page touched later waits indefinitely for a frame no rule guarantees. §0 lists only the stopped-service case.
- Fix: state the outcome in §0 and Q1, or define handling (overdue reporting as for a stopped service, or a named failure).

**R4. Evidence and labels that are false or wrong.**
- `:186-188` "No extra memory" is false: the blockring client keeps every acknowledged write's ciphertext in the arena until a flush covers it, not optional (`client.rs:10-19`, `diskserver/src/session.rs:6-8`); R-b also keeps the frame, so between ack and flush both are held (≈0.9–1.75 MiB of frames per batch on top of the arena).
- `:23` "Deleted: swap's reliance on the block client's retention" contradicts `:264` ("reissued as identical bytes"); `Durable` exists only because of that retention. What was deleted is r4's freeing at ack and the restart `Lost` path.
- `:184-186` labels 447 blocks / 48 entries as [C, `arena.rs:27-30`] / [C, `layout.rs:22`]; code gives 511 slots and `DEPTH` 64. 447/48 are r4's proposed caps (plan-r4.md:100), not enforced.
- `:440` labels 69–86 % as [M] but the handoff says "revision not recorded": record it or label [E].
- `:46` cites `requirements/architecture.md`, absent on origin/main: cite where the owner's direction is recorded.
- `:38` "Since #1076 the compositor creates every window buffer" is wrong: #1076 says it "still" creates them. Conclusion at `:484-486` is right.
- `:211` "2 state bits" vs five states at `:203-207` (free, claimed, referenced, failed, retired): fix encoding (e.g. sentinel claim for retired) or count.

**R5. §6 drop rule: charging, residency, purge.**
- (a) §4 does not say where never-writable copied pages are charged. They need no swap block and hold no frame once dropped; charging to `A` wastes `S`; charging nowhere needs a progress argument for the refill.
- (b) For a resident process dropping text frees nothing (held promises). If the mechanical fallback (`:303-305`) takes a resident process's text frame, the refill must draw from its promise. Simplest: resident ranges are never dropped.
- (c) The rule depends on the copy source staying present for the life of the range. Today a `Kind::Copy` range holds `Arc<dyn CopySource>` (`space.rs:39-41`, `shm.rs:7-8`), but `:452` says sealed versions are "purgeable only when unmapped", and a copy range is not a mapping. Otherwise the refill reads a purged version, breaking survival of the file server's death. Fix: a copy range counts as a holder for release and purge.

**R6. `:218-220`: AEAD epoch length comes from the crate's TLS cap, not a published limit.**
- `aead.rs:100` refuses GCM sequences ≥ 2^32−1; with 4 KiB pages that is ≈2^40 AES blocks per subkey, confidentiality advantage ≈2^-49 vs the 2^-57 margin of RFC 8446 §5.5 and the CFRG AEAD-limits work. 2^28 pages ≈ 1 TiB per subkey. HKDF per epoch already exists, so a shorter epoch is free.
- Fix: epoch length from a cited published limit, separately for AES-GCM and ChaCha20-Poly1305.

**R7. `:592-594` (Q2): the justification for ambient `vm_wire` is false.**
- Linux `mlock` is capped by `RLIMIT_MEMLOCK` (8 MiB default since 5.16) unless `CAP_IPC_LOCK`; realtime audio gets its allowance via rlimits or rtkit, not ambiently. Ambient wiring cuts against "Authority is explicit".
- Fix: correct the reason; show the alternative of bounding wiring by the job's #1057 floor or a granted allowance.

**R8. `:537-538` (§8): a change to an approved design is missing from Q5.**
- "Storage §3.5's 'there is no swap' changes to …" changes an approved design; add it as Q5(f). Q5(b)/(e) are engineering details, kept only because they deviate from approved text.

## Suggestions

1. NVMe clauses (`:250-251`, §12): item 4 can become [C] (driver cites Controller Level Reset §3.7.2 at `nvme.rs:644`, resets on start `nvme.rs:327-333`); ordering is blockring's [C] contract (`lib/blockring/src/lib.rs:28-29`). The spec's Command Ordering Requirements clause gives no positive ordering — the host enforces ordering by waiting for completion; phrase item 3 that way (check the clause number against the revision the driver cites).
2. AAD (`:221`): binding the block number is redundant (nonce = claim, kernel ties each claim to its block); a small deletion.
3. Read pins (`:114`): only a kernel write copy needs to clear `CLEANING`; read copies cannot dirty the page and pinned frees are deferred (`frames.rs:10-14`); clearing on reads causes needless `kept`.
4. diskserver's role (`:362`): also needed when the memory service restarts (every open goes through the block service).
5. Main stack size: consider the program's own `PT_GNU_STACK` size instead of a supervisor spawn parameter.
6. P3 fault injection: name how errors/corruption are injected without production machinery (QEMU `blkdebug` read errors; `qemu-io` from the monitor to flip a ciphertext byte).
7. Wording: `:172` "frame, and the block" vs "exactly one authoritative copy" (frame authoritative, block a durable replica); `:174` during swap-in read the arena and service buffer are written, not a frame from `M`.
8. Citations: cite the memory-design approval for the `reclaimer` row's privilege; `sessions.rs:297` now points at `retire`.

## Checked and accurate

`space.rs:43-50, 677-698, 829-845, 871-912, 925-944`; `loader/mod.rs:121`; `shm.rs:177-183`; `file_backing.rs:38-48`; `user_ptr.rs:156-162`; `frames.rs:16-33, 335-338`; `pipe.rs:119-155`; `stdio.rs:14-17`; `nvme.rs:86, 250`; `budget.rs:12, 50-53`; `session.rs:1357, 2236`; `soundserver/src/client.rs:174`; supervisor threads (`main.rs:697`, `sessions.rs:241`); `kdf.rs` HKDF; `arch/aarch64.rs` SHA only, no AES. §7/§5 arithmetic (185.4 / 201 / 106, 88 / 53, 48 + 32 = 80 MiB, 0.59 %, 0.2 %). Only nvme and usbd use blockserve, so NVMe is the only internal swap path.

## Owner questions

Q1, Q4, Q5 owner-level (Q1 needs R3's case, Q5 needs R8's). Q2 and Q3 owner-level but rest on false premises (R7, R1/R2). Moving r4's Q2/Q3 into engineering is correct. Hidden in engineering sections: R3's guarantee change and R8's change to storage §3.5.

**SEND BACK**

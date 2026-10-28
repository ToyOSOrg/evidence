# Review r3: pager and swap combined plan, revision 3

Scope as asked: N1–N3, the five suggestions taken, and the owner questions. I read the diff from `plan-r2.md`, the
r3 table in `notes.md`, memory design r18 §7.6, and `lib/crypto/src/kdf.rs` (HMAC and HKDF exist; the plan's
"HMAC, `kdf.rs`" holds). Read only.

## N1: `backing_attach`

**Sound, and it widens no rights.** The supervisor holds only the backing handle, which carries no read right. The
mapped state object comes from the kernel, which owns it, and only to a process holding the signed `reclaimer`
attribute. That is the same pattern as `mem_create_paged` requiring the pager attribute: authority from a signed
role, not from widening a held handle. Notes:
- **N1-a.** State that `backing_attach` is refused while another live process holds the attachment. It is one
  reclaimer, and a dying predecessor's mapping goes with its teardown.
- **N1-b.** `backing_add`/`retire`/`query` should require the `reclaimer` attribute too. Otherwise the supervisor,
  which holds the handle, can retire blocks or shrink `S`. This is wording in §7.

## N2: the memory format as resizable anonymous objects

**Non-blocking and one copy.** `MAP_SHARED`, `read()` and `write()` share one object. Faults are anonymous and go
to the reclaimer. `mem_read` and `mem_write` answer `Pending` and never wait, and the server parks the client. The
paged-object path and the store are gone. This is simpler than r2. Truncation is covered: `mem_resize` on a RAM
object unmaps through the new reverse index and gives the past-end report.

**One required gap, N2-a: server death leaves a diverging view.** A RAM object lives while any mapping holds it
(memory §1: "A mapping holds an `Arc` to the object"). When the file server dies, its paged objects are
invalidated (memory §7.6), but these anonymous objects are not. A mapper of a `/tmp` file keeps reading and writing
its old contents. Meanwhile the restarted server, which kept the memory format only in its own process, starts
`/tmp` empty and serves a fresh file under the same name. Memory §7.6 (Q22, owner-ruled) says "no old mapping stays
usable as a diverging view".

**Fix:** pick one and state it in §2 and Q8c.
- (a) An object the server creates for file contents carries a "served" mark at creation. The creator's teardown
  invalidates its mappings through the RAM-object reverse index, exactly as §7.6 does for paged objects, with the
  same "mapping invalid" diagnostic. This is cheap: the reverse index and the invalidation path already exist in
  the plan.
- (b) List the divergence as a deviation for the owner.

(a) keeps the ruling.

**Notes (wording):**
- **N2-b.** A `Pending` request cannot live in a waiter record, because nobody waits. Say it comes from a ticket
  table committed by the caller, answering `Busy` when full, as with `Queued`. Otherwise the request path
  allocates.
- **N2-c.** Name where `available` is raised: the caller's pager object, or a notice handle passed at the call.
  §7 says "usable by any server holding client data", and a non-pager has no notice object today.

## N3: `restart-hold-mib`

**Right in shape.** It is held only while the process is dead, released only to that job's restart, with no floor
eligibility while running, so memory §5's floor rule stands. Q8d lists it. One required point and one note:
- **N3-a (required): a hold of scattered frames does not guarantee the restart.** The swap chain's restart needs
  whole 2 MiB units:
  - every session region is `create_for_device(SESSION_BYTES)`, a 2 MiB run (`lib/blockserve/src/region.rs`);
  - the NVMe driver takes a DMA grant with `dma_alloc(GRANT_BYTES)` (`system/nvme/src/nvme.rs:250`);
  - each restarted process's heap pool grows by superframes (`frames.rs:22-33`).

  "Keeps up to its row's `restart-hold-mib` of the frames it held" lets those come back as 4 KiB frames, so the
  restart can still be refused when no superframe is evacuable. **Fix:** the hold keeps the runs and whole
  superframes the process held as whole superframes, so a restart's run and heap draws are met from them. Size
  the hold in superframes.
- **N3-b (wording).** Say the hold counts as that job's `W_j` in both rules while held. Otherwise a held hold is
  invisible to the accounting.

## Suggestions taken

- **Read reserve.** The arithmetic holds: 511 − 64 = 447, and half of 447 is about 223 blocks ≈ 0.9 MiB. No defect.
  Note: the reserve is in arena blocks, but ring entries (`DEPTH` = 64) are shared, so swap-outs in flight can
  still hold every request slot. Cap in-flight writes below `DEPTH` too. This is one clause.
- **Flush first on restart.** Correct. A `Lost` answer reaches the new holder (blockhold: "a loss belongs to the
  blocks"), and unknown lost blocks surface as authentication failures. No defect.
- **GCM epoch split.** Correct: epoch = c >> 32 with a per-epoch HKDF subkey, a sequence below 2^32 − 1, and a
  constructor taking the subkey and starting sequence. Nonces are unique per key, and the mark is advanced before
  the seal. Skipping 2^32 − 1 on the ChaCha path is harmless. No defect.
- **Unmovable 4 KiB frames in their own superframes.** No defect. It is a heuristic: a page made resident later
  (`vm_wire` of an already-populated page, or lending an existing object) stays in a movable superframe, since
  there is no migration. Say "makes evacuation common", which the plan already does, and leave it at that.
- **Device gone fails every referenced block.** Correct, and properly limited to the driver answering `gone`, not
  a driver crash, which reissues. Use batched `mem_fail` ranges; 4 Mi blocks one call at a time is needless. Note
  only.

## Owner questions

The eight questions are now worded fairly:
- Q3 states who can read the state object;
- Q5 states the committed cost, with stacks whole;
- Q8 lists (a)–(e), including the hold and eviction-only evacuation.

Q8c must also state the memory format's behaviour on file-server death, whichever of N2-a's options is chosen.

## Verdict

**REVISE.** Two bounded required edits remain:
- N2-a, `/tmp` mappings after a server's death;
- N3-a, the restart hold kept as whole superframes.

The rest is wording (N1-a, N1-b, N2-b, N2-c, N3-b, and the ring-slot cap).

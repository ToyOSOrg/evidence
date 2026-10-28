# Review r6 follow-up: pager and swap plan, revision 6

Focused follow-up on `plan.md` r6 against `origin/main` `717baf3ac` and the owner's
`<primary-checkout>/requirements/architecture.md` (read in the primary checkout, outside git). Nothing run.

## R1–R8

- **R1 resolved.** C-overlay is a named prerequisite with an owner (compositor track), its conditions (own thread,
  own connections, no lock the loop holds while composing, a present handshake per backend), host and guest checks,
  and P3 gated on it. It matches the owner's direction recorded in #1057 ("a bounded emergency path in the existing
  compositor ... A separate control-view process is not assumed necessary") and the requirement [owner requirement, private]. The `main` facts (`signout.rs:71`, `session.rs:1986,1993`,
  `render.rs:311`) are right.
- **R2 resolved**, with the new finding N1 on the handle's authority. `SHM_FOR_JOB` is as cited (`ipc.rs:343-350`).
  The supervisor already creates child rings with it (`system/supervisor/src/main.rs:325`, `sdk/toyos/src/process.rs:152-155`),
  so the log-ring consequence holds. The requirement "Prefer client-owned bulk buffers ... [owner requirement, private]" supports charging the client. The flag is gone from §9.
- **R3 resolved.** §0, §3.2 and Q1 state the deficit case. The spare reserve is arithmetic on `S` rather than a new
  mechanism, and it agrees with [owner requirement, private]. Overdue reporting reuses
  memory §7.8, and "never ended" matches [owner requirement, private].
- **R4 resolved.** The double holding is stated and `Durable` rests on retention. 447/48 are labelled proposed,
  the segment share is [E], #1076's "still" is fixed, and 3 state bits plus a 61-bit claim fit five states.
- **R5 resolved.** (a) Charged in `A`, with the overcount stated. (b) Resident ranges are never dropped, and the
  fallback never takes `W`. (c) A copy range counts as a mapping for the `unmapped` notice and the purge, which keeps
  the approved survival of a file server's death.
- **R6 resolved.** 2^24.5 records × 2^14 B = 2^38.5 B = 2^34.5 AES blocks; ÷ 2^8 blocks per page = 2^26.5 pages,
  so 2^26 (256 GiB) per subkey is under RFC 8446 §5.5's AES-GCM margin. ChaCha20-Poly1305's sentence is quoted
  correctly. `e = c >> 26` over a 61-bit claim leaves 35 epoch bits, and `s < 2^26` stays well below
  `aead.rs:100`'s refusal. Nonce uniqueness is unchanged. Dropping the AAD is sound because the kernel binds a
  claim to one block.
- **R7 resolved**, with the new finding N2. The allowance follows the requirement text: "modest, bounded ... [owner requirement, private] ... [owner requirement, private] ... [owner requirement, private]". The floor alternative is shown and its rejection is reasoned from
  memory §5.
- **R8 resolved.** Q5(f).

Quotes checked against `requirements/architecture.md` §Memory: all accurate, except that [owner requirement, private] is from §Scheduling (a CPU allowance). §5 applies it
to wiring, which is reasonable but should be attributed there (S3).

## Required

**N1. `plan.md:380-383`, `:785-786`: the client's job handle with `WRITE` grants far more than charging, and the
plan hands the narrowing to the wrong owner.** On `main`, `WRITE` on a job is also:
- the right to place a spawned child in that job (`kernel/src/loader/start.rs:186`);
- with a `FLOOR` SysCap, the right to set its floor (`kernel/src/syscall/proc.rs:283-292`, `object/job.rs:36-40`);
- under this plan, presumably the job half of setting a wire allowance (§9, "beside `SYS_JOB_FLOOR`").

So every client would hand the resident compositor the power to run programs on the client's CPU and memory
account. That breaks "Authority is explicit ... Rights can be narrowed", and the plan's own claim that this is
explicit, charge-only authority.
- The right is a kernel object right in `toyos-abi`. Whether to add it is the kernel/memory track's call, not the
  compositor track's.
- Fix: specify a charge-only job right (for example `CHARGE`), required by `SHM_FOR_JOB` (`ipc.rs:346`) and by no
  spawn or floor path, so a client grants `dup_narrowed(job, CHARGE)`.
- Put it in P1, with a host or guest check that the narrowed handle cannot place a child or set a floor.

**N2. `plan.md:503` vs `:794-795`: whose allowance and whose `W` a wire of another job's memory spends is
undefined, and the two passages disagree.**
- §5 says `vm_wire` "counts against the allowance of the job it charges". §12 has netstack wiring a client-charged
  stream region "within netstack's granted allowance". The compositor maps every client's buffer too.
- If the charged job pays, any mapper can spend another job's allowance and turn its `A` into `W` without that
  job's authority. That is the [owner requirement, private] the requirements forbid.
- Fix: state the rule. Either the wirer's own job pays both the allowance and the `W` charge for what it wires
  of another job's object, with the move and both rule checks stated as for lending, or wiring another job's
  object is refused. Add a P1 host case for it.

## Suggestions

1. **C-overlay handshake (`:446-449`).** As written, the loop "checks the owner word ... and marks a present in
   progress" in two steps. The overlay can take the word between them, see nothing in progress, and be presented
   over. Make it one atomic state (loop: CAS `Free → LoopPresenting`; overlay: CAS to `Overlay`, waiting only while
   `LoopPresenting`). The planned host test would catch this, but the text should not describe the race.
2. **A backend whose present cannot be bounded (`:453-454`, `:783-784`).** State the consequence, for example that
   on that backend window buffers stay resident, or swap waits. Otherwise the stop-control requirement has no
   stated answer there.
3. **Labels.**
   - `:508-509`, `:514-515`: a review is not a published source. Label the Linux `RLIMIT_MEMLOCK` facts [E] until
     they are pinned (the 5.16 change to an 8 MiB default; `CAP_IPC_LOCK` in `mlock(2)`).
   - `:341`: "the internal device that holds swap also holds DATA" is [E]; a machine can have two internal disks.
4. **Who grants (`:505`, `:513`).** "A SysCap right only [the supervisor] holds" and "the permission service" grants
   read as two grantors. Say the permission service decides and the supervisor applies it.

## §11 scoping

The owner questions are now correctly scoped.
- Q1 carries the deficit case and the compositor stall. Q3 carries the compositor-track dependencies. Q4 is
  operational permission. Q5(a)–(f) are the deviations from approved text, with (b) and (e) honestly marked as
  engineering detail.
- Q2: the requirements already settle the allowance mechanism. What remains for the owner is the default size,
  and confirming that the floor alternative is rejected. That is still a legitimate question.
- N1 and N2 are engineering and belong in the body, not in §11.
- Nothing owner-level is left hidden in the engineering sections, except suggestion 2's backend consequence, which
  becomes owner-level only if some backend cannot be bounded.

**SEND BACK.** N1 and N2 are small text fixes. Once they are made the plan is ready for the owner questions.

---

# Review r6.1: final check of N1, N2 and the suggestions

Read from the diff of `plan-r6.md` to `plan.md` (r6.1), against `origin/main` `717baf3ac`. Nothing run.

## N1: resolved

- `SHM_FOR_JOB` requires `CHARGE`, and no spawn, floor or allowance path accepts it (§4, §9). The cited facts are
  right: `ipc.rs:346`, `start.rs:186`, `proc.rs:283-292`, `job.rs:36-40`.
- The rights the kernel mints to a job gain `CHARGE`, so the supervisor's `create_for` of child rings
  (`main.rs:325`, and `process.rs:152-155` for images) keeps working.
- The P1 guest check (a narrowed handle creates an object `SHM_FOR_JOB`, and is refused as a spawn's job and at
  `SYS_JOB_FLOOR`) is the right claim, and like #1076's `shm_read_only` it needs the guest because the rights are
  the kernel's.
- The owner is now the kernel/memory track.
- Remaining detail, correctly left to P1 (§12): a handle is sent only with `TRANSFER`
  (`object/ops.rs:29`, `start.rs:190`). So the client actually grants `CHARGE | TRANSFER`, and P1 decides
  whether the received handle may travel further.

## N2: one hole in the handoff between wirers (required)

The base rule is right: the wirer's own job pays, the charged job's allowance is untouched, and the P1 host case
goes red if the charged job pays. But the *moving* of a charge between jobs makes some releases depend on a check
that a release cannot refuse.

**N3. `plan.md:529-537`: a charge that moves between jobs can fail at a release that cannot be refused.**

1. **Handoff when the first wirer unwires.** "Move to the next wirer at the first's unwire, checked the same
   way" has no answer for a failed check. The first wirer's unwire, unmap or exit cannot be refused. The second
   wirer may by then be at its allowance, or the move may break the resident rule:
   - with floors, moving `x` of `W` from a job under its floor to a job over its floor raises
     Σ max(F_j, W_j) by `x`;
   - so the move can push the resident rule over `R`.

   The plan leaves two outcomes open, and both are defects. Either the second job's wire silently stops being
   resident, which voids a realtime or page-in guarantee it was granted, or the second job's allowance or the
   resident rule is exceeded with no refusal.
2. **Return to the charged job at unwire, unmap or end.** Moving pages back from the wirer's `W` to the charged
   job's `A` re-adds them to that job's backing term. With floors the backing rule can be pushed over `R + S` by
   an operation that cannot be refused (the wirer's exit), which creates the deficit state of §3.2 from an
   ordinary exit.
3. **A job ending mid-wire** is otherwise safe. The charged job outlives its objects (`job.rs:6-8`). A wirer's
   end is its unmap. The defect is only that this release is one of the unrefusable moves above.

**Fix (simpler, with no handoff):** add charges instead of moving them.
- The charged job keeps its `A` charge, and its backing stays reserved.
- Each wirer pays its own `W` and allowance at its own `vm_wire`, where a refusal is allowed. A page wired by
  two jobs is counted in both, which is conservative and rare.
- Every unwire, unmap or end then only decreases a charge, so no release can fail a rule, and there is no
  "first wirer" state.
- The P1 case becomes: two wirers, the first unwires or exits, and the second keeps its residency with no check
  at the release, red if any release can be refused or leaves a rule exceeded.

This is the same shape as same-job lending, where a release only lowers the job's own `W` (settled, not reopened).
Only the cross-job move is new.

## Suggestions as taken: all five resolved

1. **The CAS handshake** is now one atomic state: the loop does `Free → LoopPresenting`, and the overlay does
   `Free → Overlay`, retrying only while `LoopPresenting`. No present can start after the overlay takes the word.
   This is correct.
2. **An unbounded backend** has a stated answer: the compositor wires the buffers at its own charge and
   allowance, and pays option A's cost there. That is coherent, given N3's additive charge (the client's `A`
   stands and the compositor pays `W`).
3. **Labels:** the RLIMIT and `mlock` facts are [E] until pinned, and the second internal disk is noted.
4. **One grantor:** the permission service decides and the supervisor applies.
5. **The helpers quote** is attributed to §Scheduling.

## Verdict

§11 remains correctly scoped. Q2's added "a wirer's job pays for what it wires of another's" is accurate under
either the move or the add rule.

**SEND BACK** for N3 only. It is a short text change in §5, §9 and the P1 row. With the additive rule the plan
is ready for the owner questions, and I would expect to land it on that change without another full round.

---

# Review r6.2: N3 only

Read `plan.md` r6.2, §5 (`:537-548`), §9 (`:730-733`) and the P1 row (`:770`). Nothing run.

**N3 resolved.** Charges are now added, never moved.
- The charged job keeps its `A` charge throughout, so its backing stays reserved and its backing term never
  changes on any wire or release.
- Each wirer adds its own `W` charge and allowance at its own `vm_wire`, where both rules are checked and a
  refusal is allowed. A second wirer is charged at its own wire. Nothing is checked or moved when the first
  releases, and no "first wirer" state remains.
- Every `vm_unwire`, unmap or end removes only that wirer's charge. A release therefore only lowers Σ max(F_j, W_j)
  and the backing sum, and cannot exceed either rule. Floors cannot turn a release into an increase, because
  nothing is added to another job.
- A job ending mid-wire is covered. A wirer's end removes its own charge. The charged job outlives its object while
  any mapping holds it (`job.rs:6-8`, `shm.rs:7-8`), so its `A` charge stays valid.
- A page wired by several jobs holds one frame but is counted in each wirer's `W`. That over-reserves frames, which
  is conservative, and the plan states it.
- The P1 host case targets the defect: the first of two wirers unwires or exits, and the second keeps its
  residency with no check at the release. It goes red if a release can be refused or leaves a rule exceeded.

The `CHARGE | TRANSFER` grant, narrowed to `CHARGE` alone at receipt, is the compositor's contract, with its own
test in the C-overlay row. P1 leaves open whether the kernel should strip `TRANSFER` itself (§12). This is
consistent, and no blocker.

**LAND** (ready for the owner questions).

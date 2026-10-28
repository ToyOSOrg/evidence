# Review r7: pager and swap plan, revision 7

I read `plan.md` (r7) in full and diffed it against `plan-r6.2.md`. I checked code at `origin/main` `717baf3ac` and
`requirements/architecture.md`, which is in the primary checkout and not in git. I also read memory design r18's
§5, §7.4 and §7.8 (`agents/memory/memory-design.md`). Nothing was run. This is design only, so there is no PR to
comment on.

## Architectural assessment

Option D has the right owner for the delay. When a client's memory is cold, the wait falls on that client. A
service either copies without faulting and defers that one client, or pays at its own charge to keep what it
shows resident. This also matches a requirement r7 does not cite: [owner requirement, private] (§Scheduling, audio). Deleting C-overlay is a real simplification. §0.1's split is sound:
the caller's own memory ends the caller, served data keeps its I/O contract, and waits never become errors. Ending
the caller follows from the loss rule. The boot-lifetime backing matches [owner requirement, private] and §7.8's manual path.

D's guarantee does not yet hold, though. Its one blocking primitive, `vm_wire` of another job's memory, is
unspecified in exactly the cases D depends on. Deleting C-overlay also makes the stop control depend on a
compositor loop that still makes blocking file calls. A few owner-visible costs are missing from §11.

## Answers to the questions put

- **§0.1 against POSIX and std.** The approach is consistent. POSIX itself permits a signal in place of `EFAULT`
  (see suggestion 1), and std promises no errno for memory loss. Ending the caller follows from Q-4: the kernel's
  copy runs on the caller's thread, over the caller's memory, so it is the caller's touch. The table has gaps,
  and one rationale is wrong (R7-5).
- **Does D guarantee that no shared path waits on one client's swap?**
  - The compositor's compose path, clipboard, paste and input routing are fine. I checked every read of a window
    buffer (`render.rs:194` only). The clipboard and paste regions are compositor-created
    (`session.rs:1438,2113`), so they are its resident `W`. Input goes out by `try_send` into kernel-resident
    inboxes.
  - The gaps are in the wire: R7-1 and R7-3. The loop's file I/O is R7-2. logkeeper's copy order is R7-4.
- **D's labels.** Mostly honest, but the returning-window figure rests on a mechanism the plan does not have
  (R7-7). The 6.6 MiB [M] figure lost r6.2's caveat (suggestion 6).
- **Boot-lifetime backing.** It is consistent with the bounded restarts, the manual path and [owner requirement, private]. It leaves the management handle with no function
  (R7-9).
- **Regressions.** R1's property, a stop control that works while storage is stuck, regresses (R7-2). N1–N3, R2–R8
  and the CHARGE contract are intact.
- **§11.** No. Audio (R7-6) and the refused-wire behaviour (R7-3) are owner-visible and missing. §11 also
  overstates what the architect settled (R7-11).

## Required

**R7-1. `plan.md:565-574`, `:557-558`, `:654-666`, `:868-873`: `vm_wire` of another job's memory is D's one
blocking primitive, and its waits, failures and cancellation are undefined. As written, D does not contain the
delay.**

1. **Lost pages.** A wire that meets an already lost page has no outcome. Under §0.1's row 2, a syscall touching
   memory the caller maps ends the caller. So a client's lost window page would end the compositor, and with it
   the session. A lost header page would end netstack or logkeeper. Q-4 ends [owner requirement, private], and the
   requirements allow [owner requirement, private]. A wire is a residency
   request whose contents nobody consumes, so it can answer `Lost` to the wirer. The wirer then drops that client.
2. **Serialization.** "Wiring happens on a worker thread" means one thread. A wire parked on a stalled swap-in
   blocks every later window's restore behind it. That is one client's delay landing on others, which §5.1
   forbids.
3. **Cancellation.** A window closed or resized while its wire is parked must unmap without waiting for that
   wire. Nothing says an unmap cancels a pending wire, and nothing says the loop never takes a lock the worker
   holds across `vm_wire`. That covers the kernel side: the space lock while the wire populates, which S0-a states
   only for copies (`:252-253`). It also covers userland: the channel between loop and worker must never block the
   loop.
4. **Header wires run on the loops.** netstack wires the header at `lend` (`serve.rs:198`) and logkeeper at ring
   receipt (`origin.rs:167`). On a restart, logkeeper re-wires every program's header, and those pages swapped
   while nothing wired them. Each wire can wait on one client's swap in a path that serves everyone.

*Cheapest fix (proposal):* make a wire of memory charged to another job non-blocking, using P2's ticket table:
`Done`, `Pending(ticket)` or `Lost`. On `Pending`, every non-resident page in the range is requested at once, and
`available` is raised when the whole range is resident and wired. An unmap cancels the ticket. The compositor's
loop then issues wires itself with no worker, and netstack and logkeeper wire headers on their loops. That removes
points 2–4 in one mechanism.

If a worker is kept instead, state points 1–4 as contracts. Then add host cases to C-wire for a parked wire that
does not delay another window's restore, a lost page that leaves the compositor running, and a close during a
parked wire. Add the same cases to S-copy for the header wire.

**R7-2. `plan.md:585-591`: deleting C-overlay makes the stop control depend on a loop that still blocks on file
I/O, and the loop does wait on swap transitively.**
- On `main`, the loop calls `std::fs` at `main.rs:100,105` (`launcher_apps`, read on every launcher open) and at
  `session.rs:195,1685-1686` (the scale).
- §5.3 says "a file server's swappable part may wait on the swap chain". In §3.2's stopped-service case it waits
  indefinitely, and that is exactly when the user needs the stop control (`:129-130`).
- So the claim "the compositing loop no longer waits on swap" is false. Memory §8 records the move off the loop
  only as needed "before the controls are relied on while storage is stuck".
- r6's C-overlay made that dependency irrelevant. r7 makes it load-bearing.
- *Fix:* put "the compositor's file I/O moves off its loop" in the C-wire row as a P3 prerequisite, with a guest or
  host check that a parked file call leaves the loop drawing. Correct the sentence at `:586`.

**R7-3. `plan.md:565-574`, `:598`, C-wire row `:910`: C-wire leaves two client-visible cases undefined.**
1. **A new or resized buffer becomes shown at the client's present** (`Buffers::presented`,
   `desktop/src/window.rs:206-219`; `session.rs:1203-1214`), not when it returns on screen.
   - "Composes only wired windows" is per window. It does not stop the swap to an unwired given buffer whose
     client's drawn pages were swapped before the wire.
   - *State:* a given buffer is wired before it can become `shown`. Until then the window keeps drawing its old
     buffer, as "nothing flashes" already does.
   - Put the resize case in C-wire's model.
2. **A refused wire has no outcome.** The wire can be refused by the compositor's allowance or by the resident
   rule. As written, a restored window "appears only once its wire has completed", so a refused wire means it
   never appears. Meanwhile `input.rs:377-386` has already raised and focused it, and `hit.rs` routes clicks to
   it.
   - *State the refusal points:* creation answers `REFUSED_NO_MEMORY` as today, a resize keeps the old buffer as
     `rebuffer` does, and a restore past the allowance keeps the window minimized with a visible reason.
   - Focus and hit-testing follow what is composed.
   - Give the allowance's proposed size, which replaces RAM/8.
   - If a restore can now be refused where it never could before, list that in §11.

**R7-4. `plan.md:562-564`: logkeeper's copy shape as stated can accept torn records, and the justification given
is false.**
- The shared ring's protocol is: the writer writes the body, then stores `published` with `Release`. The reader
  loads `published` with `Acquire` before it reads the body (`sdk/toyos/src/log/ring.rs:121-122,197-201`). The
  slot is `published` (16 B) followed by the body (`log/region.rs:37-44,243`).
- One copy of the whole slot orders nothing between that word and the body. The copy can read the old body and the
  new `published`, and the slot is then accepted.
- "A reader trusts nothing it reads beyond the equality and bound tests" (`ring.rs:24-28`) is about a lying
  writer. It is not about ordering against an honest one.
- *Fix:* specify two reads: first the `published` word, then the body. The kernel's copy must order the first
  before the second; name that ordering in `mem_read`'s contract. Lanes are fine, because `head` lives in the
  wired header.
- Add the torn-record case to S-copy's logkeeper model, red when the word and the body are copied in one read.
- The same check resolves §12's open question at `:961-962`. logkeeper drains every ring on one loop
  (`system/logkeeper/src/main.rs`, "A round reads every ring"), so the copy shape is needed.

**R7-5. `plan.md:137-168`: §0.1's table leaves cases open that the owner asked about, and one rationale is
wrong.**
- **No row for `vm_wire`/`mlock`.** Add two:
  - the caller's own memory ends the caller, as row 2;
  - another job's object answers `Lost` to the wirer (R7-1).
- **A syscall whose buffer lies in a mapping of a served file.**
  - Memory §7.8's approved table answers `EIO` for "page-in for a user copy". Row 2 here would end the caller.
  - A `/tmp` mapping used as a `write()` buffer falls between rows 2 and 6.
  - State which applies, and if it is row 2, say that it reopens §7.8.
- **Row 4 stops at the service.** Say what the client sees when a service's copy answers `Lost` on the client's
  memory. The service ends that client's session with its protocol's ordinary failure, and the client ends at its
  own touch. No service answers `EIO` for a client's own memory, or the blanket `EIO` the owner rejected comes
  back through the services.
- **The second rationale bullet (`:152-154`) is wrong.** An errno would not make a program "run on memory that no
  longer holds its contents". The page stays failed, and its next load ends the process (row 1), so nothing is
  invented. The real reasons are the other three bullets:
  - no POSIX error means this;
  - partial results would be lost silently;
  - the copy is Q-4's touch.

  Delete the bullet, or replace it with the actual hazard: a program that treats the errno as a failure of the
  descriptor and carries on.

**R7-6. `plan.md:525-530`, `:671`, §11: the audio path is swappable apart from its slots, realtime stack and log
lane. That weakens audio under pressure without the owner's agreement.**
- Requirements, §Scheduling, audio: [owner requirement, private]. Root `CLAUDE.md`: never weaken
  audible quality without the owner's explicit agreement.
- soundserver's mix path touches heap state every period: the resampler, `accum`, `period` and the stream list
  (`system/soundserver/src/client.rs:30-37,95-121`). Its text is refilled through a frame allocation (§6). Neither
  is wired, and soundserver and `hda` (`syscap = ["rt"]`) are not resident rows.
- §7 rejects partial wiring of a shared heap for exactly this reason (`:807`).
- *Fix (proposal):* add soundserver and the audio drivers to the resident rows, with P1 reporting their totals.
  The slot, stack and lane grants then go. Otherwise list audio dropouts under pressure in §11 as an owner
  question.

**R7-7. `plan.md:601-603`, `:942-944`: the returning-window estimate assumes 16 reads in flight, but v1 "supplies
only waiters, with no read-ahead" (`:243`).**
- A wire that populates page by page has one waiter at a time. That is about 2 250 serial round trips, each a
  read, an open and a supply. The result is of the order of hundreds of milliseconds [E], not tens.
- Either specify that a wire (and a `Pending` copy of a span) raises requests for every non-resident page of its
  range at once, which R7-1's fix does, or restate the estimate in both places.

**R7-8. `plan.md:228-235`, `:268-270`, P3 `:915`: `mem_write` is now the main write path of three services into
client objects being cleaned, and nothing makes it re-dirty them.**
- A store through a mapping faults on the write-protected page. A kernel write copy into a private leaf clears
  `CLEANING`. `mem_write` reaches neither, because it writes the object's page directly.
- If it does not clear the object index's cleaning flag under the object lock, `clean_end` frees the frame and the
  write is lost. That breaks Q-7: "No concurrent write is lost during write-back".
- State the rule in §2. Extend P3's `kept`-exactness host case to shared objects written by `mem_write`.
- §3.1's "nothing writes that copy except the page's owner" also needs to read as "any holder of `WRITE`".

**R7-9. `plan.md:178`, `:405`, `:876-877`: the backing's management handle no longer does anything.**
- In r6.2 it existed to drop the backing at the end state (`plan-r6.2.md:335`).
- In r7 no close destroys the backing, and every backing call needs the `reclaimer` role.
- Delete it from §1, §3.2 and §9, or name the one operation it serves, such as the overdue report.

**R7-10. `plan.md:30-94`: the self-contained brief omits requirements the plan's decisions rest on.**
- §[owner requirement, private]";
  - "[owner requirement, private]…";
  - "[owner requirement, private]… Manual action remains available";
  - [owner requirement, private].

  These govern §0.1's wait column and §3.2.
- §Memory: "[owner requirement, private]… [owner requirement, private]". This governs rows 5 and 6.
- §Boundaries: [owner requirement, private]. This governs §5.2.
- §Scheduling, audio: the late-client rule and the starvation rule (R7-6).
- Clauses dropped from paraphrases:
  - Q-6 omits [owner requirement, private], which §6 answers.
  - Q-10 omits [owner requirement, private].

Add them as Q-16 onward and cite them where they decide something. The current paraphrases Q-1 to Q-15 are
accurate.

**R7-11. `plan.md:8-16`, `:925-926`: the plan overstates what the architect decided.**
- As relayed to me, the architect accepted storage waits and ending on established loss, rejected blanket `EIO`,
  called the sizes provisional engineering, and asked for a *comparison* of containment against freezing.
- "The architect has settled the guarantees (§0)" is not that: §0.1's table is r7's proposal. "It is resolved in
  §5" presents D as decided.
- I cannot find "Changes to approved texts are engineering" (`:16`) in the relayed answer. Keep it only if the
  architect said it; otherwise label it as the plan's position.
- *Fix:* present §0.1 and D as recommendations for the owner. Keep §11's costs as the price of that
  recommendation.

## Suggestions

1. **`:149-151`.** POSIX §2.3's `[EFAULT]` entry says that undetected cases "may result in the generation of a
   signal … sent to the process". That supports ending the caller more directly than the current wording does.
   Pin it with the rest of §12's clauses.
2. **`:166-168`.** Cite [owner requirement, private]. Say that a caller's own timeout bounds the
   event it waits for (`SO_RCVTIMEO`-like), not the swap-in of its own buffer. That keeps "waits are never errors"
   from reading as a contradiction of the requirement.
3. **S-copy's cost (`:604-606`).** List the change to `toyos_net_tcp`'s `Lent::put`/`take`, which become
   fallible. A placement that answers `Pending` must not be ACKed. The drop and the peer's retransmit then do the
   deferral.
   - Also note that netstack's `SYS_SHM_COMMIT` of receive growth on its loop (`:492-493`, #1077) waits on global
     frames, as netstack's own allocations do. It is not a per-client wait. Alternatively, make it `Pending` too.
4. **§10 ordering.** C-wire needs P1's `vm_wire` and `CHARGE`, and S-copy needs P2's `mem_read`. Say so in their
   rows.
5. **§3.2.** State that the memory service's restart hold and job are kept while its backing is, so that a manual
   restart after a spent budget is not refused for want of superframes. Also state that with no service running,
   loss cannot be established: a departed device leaves waits overdue rather than failed.
6. **`:595`, `:806`.** The 6.6 MiB per terminal window is the compositor's total climb. r6.2 rightly called it an
   upper bound that includes compositor heap; keep that caveat. In §8, 0.1 % of 8 GiB is 2 097 blocks, not
   2 048.
7. **`:567`.** "Or on another workspace": the compositor has no workspaces on `main`. Drop it, or label it as
   future.
8. **`handoff.md`.** "netstack mapping client-charged regions" is still listed as unresolved, but r7 answers it.

## Verdict

**SEND BACK.** R7-1 to R7-3 are the substance: D's blocking wire, the loop's file I/O, and C-wire's resize and
refusal cases. R7-4 and R7-8 are correctness rules missing from the text. R7-6 is an owner-visible compromise that
is not listed. R7-5, R7-7 and R7-9 to R7-11 are text fixes. R7-1's non-blocking wire would also settle R7-7 and
most of R7-3, and would remove the worker thread.

---

# Review r8: follow-up on R7-1 to R7-11 and the suggestions taken

I read `plan.md` (r8) in full and diffed it against `plan-r7.md`, at `origin/main` `717baf3ac`. Nothing was run.
Settled points are not reopened.

## R7-1 to R7-11

- **R7-1: resolved in design.** `vm_wire_ticket` is the only wire of another job's memory (§5.1 `:638-647`, §9).
  - It answers `Done`, `Pending(ticket)` or `Lost` at once, and requests the whole range.
  - The charge is added at the call, so refusal happens at the call.
  - An unmap or `vm_unwire` cancels the ticket without waiting.
  - `Lost` removes the wirer's charge and the wirer drops that client.
  - A blocking `vm_wire` of another job's range is refused `InvalidArgument`, so no service can block on a client by
    mistake.
  - The worker thread is gone. That also removes the lock and channel question.
  - netstack and logkeeper wire their header pages on their loops with the same call. S-copy now tests logkeeper's
    restart re-wire.
  - One staging gap remains (R8-1).
- **R7-2: resolved.** The loop's file I/O (`main.rs:100,105`, `session.rs:195,1685`) is in C-wire as a P3
  prerequisite. Its Q check goes red when the call is made on the loop. `:705-714` states the dependency truthfully.
- **R7-3: resolved.**
  - A given buffer is shown only once wired, and the old one keeps showing meanwhile (`:657-661`). C-wire tests it,
    red on an early swap.
  - A minimized window returns only once wired. Focus and hit-testing follow what is composed.
  - The refusal points are stated: creation answers `REFUSED_NO_MEMORY`, a resize keeps the old buffer, and a
    restore keeps the window minimized with the reason shown.
  - The allowance is RAM/8 of on-screen buffers. The new refusal by the resident rule is listed in §11.2.
- **R7-4: resolved.** logkeeper reads the `published` word and then the body, in two `mem_read`s. `mem_read`'s
  contract names the ordering (`:635-637`, §9). S-copy has the torn-record case, red on a single read.
  - I confirmed logkeeper's single loop at `system/logkeeper/src/main.rs` ("A round reads every ring").
- **R7-5: resolved in §0.1, with one inconsistency elsewhere (R8-2).**
  - The wire rows are added: the caller's own memory ends the caller, and another job's object answers `Lost`.
  - A buffer inside a file mapping answers `EIO`, as memory §7.8 rules.
  - After `Lost`, the service ends the client's session and the client ends at its own next touch. No service
    answers `EIO` for a client's own memory.
  - The wrong rationale is replaced with the true hazard, a wrong diagnosis of the descriptor.
- **R7-6: resolved.** soundserver and the audio drivers are resident rows (`:605-610`), and their grants are gone.
  - soundserver's 15.2 MiB checks against the evidence log: `r3/measure-2.log:607`, "now=15519K".
  - `hda` is labelled [E].
  - §11.3 states the price and the rejected alternative.
- **R7-7: resolved.** The figure is re-derived from whole-range requests and the read reserve.
  - 2 250 / 64 gives ≈ 36 rounds.
  - Opening 256 KiB takes ≈ 0.1–0.2 ms at 1–2 GB/s.
  - The result is ≈ 10–30 ms [E].
  - The page-at-a-time alternative is stated as hundreds of milliseconds.
- **R7-8: resolved.** `mem_write` into a page being cleaned sets the dirtied-since-begin flag under the object lock
  (`:302-304`, §9). P3's `kept` case covers shared objects, red if `clean_end` frees a page `mem_write` wrote. §3.1's
  invariant now reads "a holder of `WRITE`".
- **R7-9: resolved.** The management handle is gone from §1, §3.2 and §9. The backing is "held by no process's
  handle".
- **R7-10: resolved.** Q-16 to Q-21 quote the requirements text accurately, and Q-6 and Q-10 are whole again.
- **R7-11: resolved.** The architect's answers are quoted as relayed. §0.1, D and the sizes are labelled as
  proposals. §11 is recommendations with prices. The wording-boundary ruling is quoted rather than inferred.

All eight suggestions were taken: the POSIX signal clause, timeouts, `[tcp]` fallibility and commit, staging, the
hold and a departed device, the upper-bound caveat and 2 097 blocks, workspaces, and handoff.

## Required

**R8-1. `vm_wire_ticket` has no stage that builds or tests it.**
- C-wire and S-copy say they come "after P1 (`vm_wire_ticket`, `CHARGE`) and P2 (the ticket table)".
- P1's row lists only `vm_wire` and the allowance. P2's row lists only `mem_read`/`mem_write` on the ticket table.
- The ticket table arrives in P2, so the call cannot be P1's. And neither row tests the kernel half of R7-1.
- *Fix:* put `vm_wire_ticket` in P2. Give it host cases:
  - `Pending` without waiting, with every non-resident page of the range requested at once;
  - an unmap cancels a parked ticket and removes the charge without waiting;
  - `Lost` removes the wirer's charge;
  - a blocking `vm_wire` of another job's range is refused `InvalidArgument`.

  Each should go red under its obvious mutation. Point C-wire and S-copy at P2.

**R8-2. `plan.md:326-327` (§3) and the S0-a row: "a copy that meets a lost page ... ends its caller" contradicts
§0.1's new row 3.** Row 3 says a buffer inside a file mapping answers `EIO`. S0-a is the stage the kernel copy is
built from, and its host case tests only the ending.
- *Fix:* say "a lost page of the caller's anonymous memory ends it; a lost page of a file mapping (paged, or a
  served `/tmp` object) answers `EIO`".
- Add the `EIO` branch to S0-a's chunk model, red if a file-mapping loss ends the caller.

**R8-3. `plan.md:680`, `:1116` (§12): `[tcp]` is cited "as review r7 names them, in the `[tcp]` fork",
and listed as "not read". Both are wrong.**
- It is an in-repository crate, `toyos-net-tcp` at `system/netstack/shard/tcp`
  (`system/netstack/Cargo.toml:24`), not a fork. The trait is at `system/netstack/shard/tcp/src/ring.rs:13-19`
  (`fn put(&mut self, at, data)`, `fn take(&self, at, out)`), and netstack implements it at `lent.rs:56-69`.
- A review is not a source. Calling it a fork would wrongly bring in the implementer's fork rules.
- *Fix:* cite the trait [C], and delete the §12 entry.

## Suggestions

1. **`:635-637`.** On AArch64 the syscall return (ERET) synchronizes context but is not a memory barrier. Say that
   `mem_read` ends with a load-acquire barrier (`DMB ISHLD`), and that x86-64's TSO already gives the order, so the
   contract has a named mechanism in each architecture module.
2. **`:147-165`.** The "Changes from revision 6.2" list still says "from a worker off its loop" and "the compositing
   loop no longer waits on swap", both superseded in r8. Delete that list, since history belongs in the reviews, or
   mark it as superseded.

## Verdict

**SEND BACK.** All of R7-1 to R7-11 are resolved in substance. R8-1 to R8-3 are small text fixes: a staging row
with its host cases, one sentence and a test branch, and a citation. I expect to land on those without another full
round.

---

# Review r8.1: R8-1 to R8-3 and the two suggestions

I read the diff of `plan-r8.md` to `plan.md` (r8.1). Nothing was run.

- **R8-1: resolved.**
  - `vm_wire_ticket` is in P2, on the same ticket table.
  - P2's host cases are the four asked for, each with a mutation that turns it red:
    - `Pending` without waiting, with the whole range requested;
    - an unmap cancels the ticket and removes the charge without waiting;
    - `Lost` removes the charge;
    - a blocking `vm_wire` of another job's range is refused `InvalidArgument`.
  - C-wire and S-copy now depend on P1 for `CHARGE` and the allowance, and on P2 for the ticket calls.
- **R8-2: resolved.**
  - §3 splits the outcome: a lost page of the caller's anonymous memory ends the caller, with no partial result. A
    lost page of a file mapping, paged or a served `/tmp` object, answers `EIO`, as memory §7.8 rules.
  - The S0-a row matches. Its chunk model covers both branches, red if either takes the other's outcome.
- **R8-3: resolved.** The `Lent` trait is cited at `system/netstack/shard/tcp/src/ring.rs:13-19`, and netstack's
  implementation at `lent.rs:56-69`. I checked both on `main`. The §12 entry is deleted.
- **Suggestion 1: taken.** `mem_read`'s ordering has a named mechanism per architecture module: `DMB ISHLD` on
  AArch64, TSO on x86-64. Confirm the Intel SDM section number ("vol. 3 §9.2") against the current SDM's memory
  ordering section when the citation is placed at the site. This does not block landing.
- **Suggestion 2: taken.** The stale r6.2 change list is deleted.

**LAND.**

**Owner-visible quantified compromises remaining in §11.**
The first compromise is error behaviour. A program cannot recover from a syscall over its own lost anonymous
memory, because it ends at that touch, while file data keeps `EIO`. The second is option D's price:
- every on-screen window's buffer stays resident at the compositor's charge, up to ≈ 6.6 MiB per terminal window
  [M, an upper bound including compositor heap] and ≈ 8.8 MiB per full-screen 1920×1200 window [D], twice that
  during a resize, so ten on-screen windows cost ≈ 66 MiB, or 0.4 % of 16 GiB [D];
- a minimized window reappears only after its buffer is swapped back in, ≈ 10–30 ms on NVMe [E, measured in P5];
- a restore can now be refused, which never happens today, when machine-wide resident charges reach `R − K − M`;
  the window then stays minimized with the reason shown;
- netstack, the file server and logkeeper pay one syscall per copied span, ≈ 0.1–0.5 µs each [E], against
  netstack's already recorded throughput gap.

The audio path is resident at ≈ 14–30 MiB, depending on declared stacks [M, E]. The rest of whole-service
residency costs ≈ 106 MiB with declared stacks, against ≈ 201 MiB for r4's whole residency [M, D].

The kernel's swap tables (≈ 80 MiB at `S` = 8 GiB on 16 GiB [D]) are common to every option. The architect has
already ruled the 8 MiB wire allowance, `clamp(RAM/2, 4, 16 GiB)` and the 0.1 % spare to be provisional
engineering. Waits for a stopped memory service until its manual restart follow the architect's end-state ruling.
None of these three is an open owner question.

# Round 6, ToyOS head f183499e332b53f288ef13886bbfdb412f88f006

Review r5's blocker and suggestion, comments and the TLB record only (`Tags::resume`, `tlb::resume`, one "Owed on
metal" list). The code is 9b7d6d949's, so round 5's checks (`../r5/`) and guest run 43125192691 at 9b7d6d949 stand.

## Guest run 43125192691 at 9b7d6d949 (`guest-43125192691-at-9b7d6d949.log`)
Seven rows passed: `vector_state_survives_a_switch` (16 trips), `std_threads_count_the_cpus_and_give_back_ended_threads`,
`affinity_pins_hold_on_every_cpu`, `libc_children`, `virt_fp_isolation`, `virt_jobs_at_el2`, `virt_smp`.
`virt_mask_windows` failed: `panic at kernel/src/windows.rs:79:5: data abort from a lower EL`, `DOUBLE PANIC: the cpu
was already in PageFault`, after `unmap_touch`'s line. That is the signature `issues/virt-mask-windows-finds-a-mask-
with-no-hook-in-a-lower-el-data-abort.md` records on main (red at 422915e2c, before this branch). The run's `serial`
artifact holds only four x86 lanes, whose UART ends where the log moves to logkeeper, so it has no AArch64 trace and
no stop's census (`tlb:` with `retire=`): no guest row here reaches the machine's stop.
Control: `virt_mask_windows` alone on main 36ed75b5a (branch `switchwake-control-main`), run 43129662179, and again
at the head, run 43130090881: pending.

# r7: #1077's r5 regressions examined; the window check made O(1) at 2798d7fa2

The kernels and osbench binaries were carved from the r5 AMD benchcase images, base 058bea2d3 and head 549f1c44d, with carve.py and carve2.py. They were disassembled with binutils objdump, and every function was compared with its addresses masked (fndiff.py).

- **mem.anon.map (AMD +84%).** reserve-path-compare.txt covers `sys_vm_reserve`, `AddressSpace::private`, `place`, `put`, `UserTables::build`, `alloc_table_frame`'s `alloc_held` and `with`, `promise`'s `with`, and `memset` (`rep stos`). Each is instruction-identical in the two kernels; only their addresses differ.
  - kernel-fndiff.txt lists the 139 functions that differ. None is on the reserve path, except that `Lock<Frames>::lock` differs in its contended spin path, where it inlines `IrqGuard::close`. Its uncontended path is identical.
  - QEMU (TCG, x86-64): `osbench system` was run alone through diag-system-group.patch, which is not committed. Three sequential runs per arm, alternating, after one concurrent pair (qemu-diag-summary.txt): mem.anon.map p50 was 2437, 2312 and 1875 at base against 1656, 2468 and 1937 at head. That is no difference.
- **mem.memcpy rows.** osbench-fndiff.txt shows that `memcpy` (`rep movsb`), `memmove` and every memcpy_sweep function are instruction-identical; only addresses differ. The only functions that differ in code are toyos::net / transport functions.
- **pipe.throughput.64 (AMD).** The per-boot modes match #1151's same-LLC and cross-LLC readings: boots 2 and 6 read 4096 at about 5.2 GB/s and 65536 at about 10.2 GB/s, against about 2.0 and 4.8 GB/s in the other boots. Within single boots of both arms, rounds mix the two modes (min against p50).
- **process.spawn_wait (QEMU)**, same runs: 15.9, 15.3 and 14.6 ms at base against 15.5, 15.2 and 14.3 ms at head.
- **Fix, 2798d7fa2.** An object counts its uncommitted pages, so `allows` asks one word of an object committed whole. Before, it looked at every page of each window, for example a program image read into its region at each spawn.
  - logs/host.log: `cargo run -- --ci host`, exit 0, 111 steps.
  - logs/qemu.log: shm_commit_alone, stream_holders, kernel_objects_refused_alone and netstack_holders_exported_to_children, exit 0.

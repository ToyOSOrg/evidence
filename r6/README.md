# r6: #1077's r5 benchcase A/B read (base 058bea2d3, head 549f1c44d), and the rebase onto #1147 at 1ff5a6ff5

- **benchcase-ab-549f1c44d.txt** (from `ab.py`, 4 against 4, exact two-sided Mann-Whitney):
  - **The fs regression is gone.** On the T14, 8 fs rows resolved better at head, and on the AMD bench none resolved either way.
  - **The 2% rule fails on four rows:**
    - T14 `mem.memcpy.256`: -3.6%. Every run's minimum is 27505 in both arms.
    - AMD `mem.memcpy.262144`: -22.9%. Base alone spans 28.6k to 38.6k.
    - AMD `mem.anon.map`: +84%. Every head boot read 379 to 394 against base's 210 to 217. At 342ecc142 the head did not differ.
    - AMD `pipe.throughput.64`: -32%. The head boots split, at 48, 120, 53 and 122, against base's 125 to 129.
  - **Resolved worse outside the rule's groups (T14):** `persist.*` +8 to +10% and `proc.spawn_wait.tiny` +17%.
  - **Per-run values:** `rows.py`.
- **logs/host2.log:** `cargo run -- --ci host` at 1ff5a6ff5, exit 0, 111 steps.
- **logs/qemu.log:** `shm_commit_alone stream_holders libc_children netstack_holders_exported_to_children` at the rebase before the one-line test fix, exit 0, 4 of 4.

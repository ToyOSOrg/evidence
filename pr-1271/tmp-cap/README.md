# `/tmp`'s object cap refused readdir_bound's 3,465th empty file

This is a development run, not guest-runner evidence: the `testcases_members_exit_0` row at `edb33219f`, an x86-64 guest under TCG with 2 vCPUs and `-m 4G` (`Profile::Headless`). At that head, `readdir_bound` created 6,000 empty files in `/tmp`. The refusal follows from the guest's memory size alone.

- The kernel manages 3,905,302,528 bytes, which is 953,443 frames.
- The file server sizes the memory role's pager like DATA's:
  - share = 953,443 / 8 = 119,180 pages
  - capacity = (119,180 − 2 × 4,096) / 2 = 55,494 pages
  - objects = capacity / 16 = 3,468
- Anonymous objects are never dropped to make room, so `/tmp` holds at most 3,468 objects whatever they hold. The member was refused at file index 3464, with its directory and `/tmp`'s other objects making up the rest.
- That is one `/tmp` file per 3,905,302,528 / 3,468 = 1,126,096 bytes (about 1.07 MiB) of the machine's memory.

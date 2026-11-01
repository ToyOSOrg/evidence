# PR #1131 r4: the T14's idle excursions and a wake's cost

These are diagnostic boots at `e996bcab4`, plus the patches in `patches/`:

1. B at 50×, energy;
2. B at 500×, disk;
3. A, energy.

All three ended with EXIT=0 and passed their judges. The rules are in
`request-rule.txt`.

- **E (excursions, `h1.md` from `h1.py`):** no candidate coincides.
  - Each candidate was checked: task wakes, timer fires, idle entries, each CPU's C0, NVMe commands, PC2.
  - Boot 1 had 22 excursion seconds, and NVMe commands fell in 9% of them. Boot 3 had 3.
  - So the excursions follow no software-visible event.
- **W (wake):** the fallback condition is not met (1 of 8 samples). The "one wake" reading does not fit either.
  - The write that finds PS4 completes in 80-715 µs.
  - The sample's ~12 ms extra lies between it and the first flush, which finds PS0. The probe did not log the commands in that gap.
  - The PS4 readings at 12 ms are a later command, in that one sample: a flush at +12 ms reported PS4 and took 37 ms.
- **H (HMB):** HMPRE 0 and HMMIN 0. Feature 0Dh and Feature 11h (NOPPME) are both refused with 0x2 (Invalid Field).
  - The drive uses no Host Memory Buffer, and supports no permissive mode.
- **L (link, `linux/t14-lspci.txt` against r7's ToyOS dump):** the LTR max (15,728,640 ns), T_PwrOn (50 µs) and T_CommonMode match.
  - LTR_L1.2_THRESHOLD differs: Linux 101,376 ns, ToyOS 107,520 ns (as firmware left it).

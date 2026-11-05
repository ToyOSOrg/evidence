# #1193 round 1: storm mask, checks and the T14 A/B

A = c96f73d5d (39cbe735d with the kernel commits reverted, the storm test kept);
B = 39cbe735d. Machines: the T14 and the AMD bench, run by the coordinator.

- ab/rules.md: the A/B rules, written before any reading, with the amendment
  to R1's bounds applied before judging.
- ab/verdict.md: the verdict per rule. R1 holds; R2 is breached (+33 us median
  per I219 interrupt); R3 holds; R4's premise was not met.
- ab/files.txt: osbench files group, B against A.
- t14/: excerpts of each arm's kernel log (i219_msi lines, windows lines,
  osbench files results) and the boot verdicts.
- amd/: B-testcases AMD-Vi lines and verdict.
- logs/: judging, loom and control, host CI at 39cbe735d, guest rows at
  f21ae3381 (runs 42035956491, 42035960983), and the staging of A and B.

Local paths, user, host, machine model and firmware strings, MACs, serial
numbers and private addresses are masked.

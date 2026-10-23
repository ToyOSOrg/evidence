# P-256 round 1 on the benches' Linux

`linux/`: unit tests of 5f9bca079 pass on both (kernels admitted); mutants m1 and m2 fail on both. Probe builds (exploratory): ECDH whole at 0.78 (AMD) and 0.82 (T14) of portable with CIOS, 0.77 and 0.84 with the separated product. An out-of-line field call costs about as much as the kernel, which round 2 (inlining) addresses.

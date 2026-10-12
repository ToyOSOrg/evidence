# Dispatch-boundary benchmark profile

The comparator's optional `edges` profile covers 0, 63, 64, 65, 127, 128, 129,
255, 256, 257, 511, 512, 513, 1024 and 16384 bytes. The original default size
inventory is unchanged, preserving historical comparisons. The new profile is
needed because the standard inventory omits the 128-byte dispatch boundary.

The local ARM smoke run uses 2000 iterations (1024 at 16 KiB), seven samples per
backend/workload, and all 1,932 rows validate with --runs 1 --profile edges.
It is an uncontrolled-clock single run, verifying the harness and independent
ring correctness comparisons, not a VAES performance measurement. Native paired
edge-size measurements will determine setup costs and dispatch threshold tuning.

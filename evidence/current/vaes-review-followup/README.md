# Automated review E follow-up

Review E examined production source 3985c25 and found no blocker, with six notes.
It is a model review, not an external audit. Its software-model and Rosetta probe
claims are recorded in the report but raw model/probe artifacts were not supplied.

Changes after the test-byte-width repair:
- Split admission masks, host detection, CTR equivalence, counter-pair
  serialization, GHASH basis lanes, and GHASH state/tails into six named tests.
- Describe the high counter-pair check as helper serialization, not execution
  of the last message counters (which belong to the scalar tail).
- Add negative controls that swap H^8/H^7 lanes and offset the CTR tail counter.
- Compile the x86 test module with metadata-only cross-checks; execution of the
  split tests and new controls is requested separately (56 tests expected;
  18 controls on t14, 14 on amd, with feature-specific skips).
- Close x86 Rust 1.89 compilation: see ../vaes-msrv/ for both core/provider.

Production instructions are unchanged from the reviewed candidate. Wider
register/spill residue remains explicitly outside the wiping claim. CPUID
register selection and OSXSAVE-before-XGETBV still rely on assembly review for
hardware instruction ordering. H powers remain recomputed per call; performance
measurements, especially small records, determine whether precomputation or a
higher dispatch threshold is warranted. No raw tests or results are discarded.

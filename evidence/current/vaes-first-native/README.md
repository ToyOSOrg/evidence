# First VAES native attempt: test fixture failure, retained

Source 3985c25568194d0ccf4c042bf029a7092b20ff01. t14 r0068 fails its baseline:
26 library tests pass and the new lane/boundary test fails before the remaining
suites and mutations. Therefore no performance or timing run is accepted on
t14. The separate portable run r0069 passes all 52 tests.

Diagnosis: the test-local `let mut iv = [0xff; 16]` inferred i32 because its only
consumer was a pointer cast. A 16-byte vector load read four 32-bit values,
producing ff 00 00 00 repeatedly instead of a 12-byte all-ff nonce. The fixture
now explicitly uses u8. Production CTR initializes its buffer from a &[u8;12],
which already fixes its element type to u8. No production code changed in this
repair. Native baseline and controls must be rerun; a test-fixture diagnosis
is not acceptance of the candidate.

# #1193 round 2: mask from the second unread message

- r1's A arm (c96f73d5d) is a revert: 39cbe735d with its kernel commits
  reverted, the storm test kept. Its numbers come from a real boot of that
  kernel, and the harness wrote them into the bench's machine record.
- Citation correction: the APIC rule behind the storm bound is Intel SDM
  Vol. 3A, order 325384-093US, §13.8.4, verified against Intel's PDF (sha256
  77919be320f35da2782771ef2cb65a868cf68e62c8f8279f2ca61199cb70d1f8). r1's
  "§11.8.4" was cited from memory.
- ab/rules.md: the round 2 section (new trigger, R1 bound 1..=3, A2 > 3) was
  written before any reading of the round 2 arms.
- logs/: loom and its control under the new trigger, host CI and the x86
  build at 5e6049293, kernel clippy at 3dc7e7bbb, staging of A2 (d0dac12cf,
  local: kernel/ restored to 83ddb42f4, storm test kept) and B2 (3dc7e7bbb).
- vsound/: the two drop-in options (branches storm-vsound-a f6895eee3,
  storm-vsound-b ebee4a61d): host tests, and the control patch that
  restores today's accounting and reds the new test with [0, 0, 0].

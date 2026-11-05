# Round 12 judged (binding): B b76abc3bd, H 3e491cf83, N 63a75cb40 (AVX off), S 799334e09 (base, memcpy at H's address)

Twenty boots in five rotated blocks (B H N S | H N S B | N S B H | S B H N | B N H S), all verdict passed,
copyat and mem exit 0. judge.txt is judge12.py, written before the run, against rule.txt.

- Premise holds: H drops (regresses in 5 of 5 blocks; Q_H/Q_B 0.930, 0.928, 0.798, 0.935, 0.922).
- A fails:
  - N, the AVX-off head, also drops (5 of 5; 0.939, 0.935, 0.892, 0.887, 0.928).
  - N's 8 KiB routed rows read 140 ns against the 127 ns bound (90 x 1.3 + 10). Its 256 B-2 KiB rows pass.
- P fails: S clears (0 of 5; 1.025-1.034 of B). Base code at the head's address does not drop.
- Outcome by the rule: close #1133 and record the measured stall and the 256 KiB cost as a finding.

Reported:
- mem.memcpy.262144: B 39407-42085, H 33489-36084, N 39437-41816, S 40321-42803. So this round,
  unlike round 10, the shifted base reads base's level, and N does too.
- Small rows: N reads 0.94-0.97 of B at 64 B-4 KiB; H 0.98-0.99.
- The placement-row drop follows the head's routing code, with or without the AVX loop, and not
  memcpy's address. Its mechanism is not established.

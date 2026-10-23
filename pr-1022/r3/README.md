# Round 3: the landing code on the T14, and the rebase

- `t14-e476e8eac/`: the T14 `cryptocase` boot of probe e476e8eac, which is d9dd4b991's tree plus
  probe rows only (additive). Verdict passed, `agrees_with_ring_at_every_length` included. Seal
  against ring: 1 B 1.098, 64 B 1.096, 80 B 1.106, 128 B 1.119, 192 B 1.147.
- `ci-host-734c1ef66.log`: `cargo run -- --ci host` at 734c1ef66, the change rebased onto main
  89138e35c (#1013's P-256 work and #1014's RSA kernel among main's new commits; ChaCha code
  unchanged by the rebase). Exit code on the last line.

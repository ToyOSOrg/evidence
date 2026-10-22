# Metal at ffd3be52b, run by the orchestrator

- t14-judge.log: crypto_instrument on the T14 (LENOVO 20W0003AMZ), passed. The T14 takes VAES-512 for GCM above 224 B, so G3 moves only its short path there.
- The AMD boot passed (orchestrator's report); its judge log is not in this directory.
- amd-judge.log: crypto_instrument on the AMD bench (LENOVO 82A2, BIOS DMCN38WW), passed.
